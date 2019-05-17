Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 746427DF0B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 09:30:32 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id r136so4680623oie.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 02:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=igBIQJkO323fxNJ37eAczF6qHs4jswtVVb9VBoRew8I=;
	b=JBUSCUIQMXSKpz9oprM9OEezJ9i6KM545cEqswVMN3xI4J/115xk8ZjQR31Bwvy9IH
	h68itT7z9poKHWr4JbDiKSosnjj3aGnEu9SdJTmTo5hp03lOq2dw3SQgeNfGhzFuwXvX
	Wm1Ug6Ih/TsYlfRnuBxGrq/Th3F2ih/uBUJG6Bjj87bNo0T2in2GGArZRAwMPvSlzzcq
	8U2iv6zIDObFCTxP7c/kLRTsSoFCItsT79Tiye8ez05QbE6WGw/R9sG+1PVhksB6s8CR
	CT/ESj9E3eaYP2vyBW5SJjbgtxp0/wJllESSLg4neTkkkmL8f8ecnrL6sx/LZ+LKHx5W
	lKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=igBIQJkO323fxNJ37eAczF6qHs4jswtVVb9VBoRew8I=;
	b=AnspIuPE/SB/5VteI9aR6ySoukdg2f3D/EMKfIpbn9wuOJ+hUHV7XUQ207mOPo9ezW
	sqBVHHpUSrQMNLIlvuUEETDRcTuvapYGuvAQ4hKjY6nGOo7KczfZ2ccU3MB0xEvHi0sJ
	CXX4fhhwMu9l+QWAaFJGOkLcIvOmMUhZ33b172jwPjOwzwP07rkjurgoapYbOJr7uXuq
	/VT7dDispw/hQHfJzYNL+eSWr8L77wi1U8EHpnXUNst7M6sZu2dCVj2QzJSQ/hrTooJG
	08xrS/QoddXbx/adgip9g3vWvAna0dAkmv5/ULsTGBk2UeXZfurzZ5gdBx519fx1VJYS
	SO8Q==
X-Gm-Message-State: APjAAAWP9sqK79yiljh5FCdMiE5x8T3qoz/+zgBSkM2SgtwUNWuIJGJw
	RLDSFSOncs59p2hEuA/JvgvbNwOYXY5GrjaqymSqsQ==
X-Google-Smtp-Source: APXvYqyf+ue0gjgDVwPKJEd1NpkwAWA6ilGNviLRxNqc9+hMrK+tMTwNtaCkQg5PGYulojBNM4HWhkcqeXZ/+51HT6k=
X-Received: by 2002:aca:dfc4:: with SMTP id w187mr13378508oig.70.1558085433315;
	Fri, 17 May 2019 02:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <1558076631-17503-1-git-send-email-ee.peng.yeoh@intel.com>
In-Reply-To: <1558076631-17503-1-git-send-email-ee.peng.yeoh@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 May 2019 11:30:22 +0200
Message-ID: <CANNYZj--jEMQ6v_4u0hRmGSA2X6S6xrYD3gGe15=9WH9m=mBPw@mail.gmail.com>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2 v4] oeqa/runtime/cases/rpm.py: Enable rpm install dependency testing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2019 09:30:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 May 2019 at 09:04, Yeoh Ee Peng <ee.peng.yeoh@intel.com> wrote:
> +        for rpm in rpm_tests:
> +            if not rpm_tests[rpm]:
> +                self.skipTest('No %s on host machine' % os.path.join(rpmdir, rpm))

Apologies, but this does not look correct. For the other rpm and dnf
tests we are able to ensure that the packages they need are available,
and the same should happen here.

Alex

