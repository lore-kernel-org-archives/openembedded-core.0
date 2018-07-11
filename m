Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8CEFA7719F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 16:10:48 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id l10-v6so3549583oii.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 09:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zAmYgF6SN7tVt+fohuvmpNrfWG30RAZqeaiOJI2muhQ=;
	b=B+Hf69df+83zof0Nr0gyS4RNNvmGiq53+xx+HME5b+o/laf2Dixd5qoZOi2pMuiXz8
	DOZeGlQ/8zWGhLxKJ+w8q7H1wCBmNTJn2/JkIGRKbK5f4BrQ5fxxGX+wwcZeNYYaGElq
	xukdwNmEq3apDHF1v7qTW5ATMt1tutMZ4gFkKsP76/oV376vsU4jqAy2BDJHgaeHT9g+
	/OKwK+DOAzqJQFUmM949eRqdj80cq7EeFiZ3fi14T77QvMOu+0aE3wSvVLY6pGVQ+dIo
	otoPVLLnvM212wghy5My/zZ7XNwuKeqHswM11XAeS1zqKltbakfJe/TeRZyvsFXJaGYt
	BrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zAmYgF6SN7tVt+fohuvmpNrfWG30RAZqeaiOJI2muhQ=;
	b=IGYZlm3KyJLVuWF7mDqNp1GVtWsENk325Rccf+IliIKmtePZN5TGMQn5JDCSlxU6aP
	+izkWaC056G67B2la1b/Jb3g6Wraul/15+yEHPxdxHMnW2Xb2ox0Ka7FDEq7v788v1N+
	/dWowKkrObThYDiKbHDx6mBMffUFFq74DAyv59AHdBHiPIDAtPUDtgS+sGgF4O4xz0/F
	L16J7Ft0lCSCdX3RFkW+F3QoJ92m29N2e2c7Jl+Uouraug3vY/SnXD2U8UT/Rs9D1MLa
	YkWFIKM7LHyte6ClZ0h/sQVOPdFzLx756mukwfMu/L6O2fGXS1QAeoGXfsfnlG3GJg9y
	9KVw==
X-Gm-Message-State: APt69E3J8FoifpTEKxzH2tYUIEyVT7Kf0jOwcYx0kp3ZmRusSGfWYia5
	pFWMdKPV7afwTd/9OPqsiV23Z8wCqAXamIvihpoq+Q==
X-Google-Smtp-Source: AAOMgpeCnAd+Gq1j+pLey2OOL85UkYJAi+hHPHdfKJqcEQuX4uYbLJ7LPH7q1o3vGY/+7aPnZedy9CtaXTRYjgUeHnA=
X-Received: by 2002:aca:e185:: with SMTP id
	y127-v6mr35463507oig.245.1531325449653; 
	Wed, 11 Jul 2018 09:10:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 11 Jul 2018 09:10:29
	-0700 (PDT)
In-Reply-To: <20180711150308.30275-1-marex@denx.de>
References: <20180711150308.30275-1-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jul 2018 17:10:29 +0100
Message-ID: <CAJTo0Latp_c1LVzzObR+FPYosVDuohbRwnGfOGruxaoHLSr8Uw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Add missing dependency on swig
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
X-List-Received-Date: Wed, 11 Jul 2018 16:10:48 -0000
Content-Type: text/plain; charset="UTF-8"

On 11 July 2018 at 16:03, Marek Vasut <marex@denx.de> wrote:
> The U-Boot build, in particular the pylibfdt, depends on swig-native.
> Add the missing dependency.

If pylibfdt isn't usually needed (which it cant be, if swig is an
optional build dependency which isn't on my machines, or the
autobuilders, right?) can we just disable the building of pylibfdt
instead?

Ross

