Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF44753F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 09:53:34 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id b15-v6so12774178oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 02:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8COOlEFXD4antxREFfkLjUUNMqL5KW1a8yRWuWl/+z4=;
	b=vm9m5cGAHFu8Qf0u1D92lPvAgkljgEnt506a1KrSzPme083eUddh09AQi+Zy32cCe9
	46cwsUPyV6hfdJ5xnT/FYPJ8yhJefVKiz1mha1IxQdY2DMlATfFTj8v8WiNp8A9sf8Mp
	U+9eoBC5BqT7LE+fSMKtvIFRPMwbFC5LhyjEQI6pWbOX/TP602Hd8jlsUF5KVC6oxUHz
	o4uMa37mBVwPgpbH0dmA7K+NloxLJV8XoBLPWyLKFjZlCTObcwmlKTrgnRIqo4fyPf7B
	sNzqY9mz/fgiMXba5camqq+PTuhSLj+D60z5saNxBYSxLAEl62TZGSJr+c00F2KjC9IA
	7P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8COOlEFXD4antxREFfkLjUUNMqL5KW1a8yRWuWl/+z4=;
	b=MLfiDv8i6uIsC6PxNkhXYMPL+s4XGXiJPyY6nHmZLEzirahloTzX1EP+uwueg8Brim
	wluJI7HZB6OmffAZ6YtsSduMk6PRpvGxUyXQagNBy6GhJQgDDeNEwk6kgmmI73Esoj+p
	nTZMP1RbLbm+mtIkaj/BCxzJNWQRDRwq1WJx0fY7rG5xXgcOXbaDmKAL9NTGlo/siJSn
	aXTIOhUFZRiaATAzhTsR6E0ykY+IKzLCeu+y9c3x4AI7ZCL1/O6QP6SbOyi57d3XGaBx
	pUFEAdcAPqAuNhaLtyzibDZFzfGKjnqa5k8ZygzFSqPyRS+x4ZvkejupBh/Ah9pQyhL2
	/vYw==
X-Gm-Message-State: AOUpUlHGoxDSsTWC/QgHUJRErlR6qt3m8SIEHFDX55bdgTNn9NLk9t/9
	8+p1tSiHNiuHtSLeECssMyaVj9DxK/LqDUQRPgekfpON
X-Google-Smtp-Source: AAOMgpeJXbJ4bHZTo7Clqmhmwp2nB9QtIGlq5tCVleIaea3Lm8tuuUmPcXrYxDuu+qORQr8bEQ60fnXmTcUO2fYwH5c=
X-Received: by 2002:aca:b256:: with SMTP id
	b83-v6mr2733529oif.235.1532512415637; 
	Wed, 25 Jul 2018 02:53:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:53:14
	-0700 (PDT)
In-Reply-To: <1532505359-3185-1-git-send-email-hongxu.jia@windriver.com>
References: <1532505359-3185-1-git-send-email-hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2018 10:53:14 +0100
Message-ID: <CAJTo0La7u5xz_m4J1bbtW2F-14-jBzCd5W7fMZ4FrWrOEQo33Q@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: fix compile failure on beaglebone
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
X-List-Received-Date: Wed, 25 Jul 2018 09:53:35 -0000
Content-Type: text/plain; charset="UTF-8"

On 25 July 2018 at 08:55, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> +Upstream-Status: Pending

You'll be submitting this upstream right?

Ross

