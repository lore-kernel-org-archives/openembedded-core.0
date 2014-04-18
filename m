Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 32C4265D52
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 20:16:21 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id h18so1296458igc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=porU9UQ5/goyrIHjLd6lX1eWwRMMBifTThZ/NZBfGPg=;
	b=Nbjb1nxO1QnWh5SbF0978k091FRtGRloGyCBsdZCY4LWdau5SBCDzm8adS2J455Bbs
	AWocPmP8lEqH9R3f24w4Wf6P8kHCSESS7fswZBPUQs6rrkxy7LrhAZd1dY22db+Do3LB
	ptWQalQLAWX1sOCUtz4EdWKjlLaCMsRSSzYYBYSY5l/1gjt4mG6Tl9/TwRY5o1GWQGd1
	B4HG/Ufje8qM5tzjpaoK1Aff/4hPu7O1RThwpoIfHcOBTE7e7llgNXEUyGa15mlBnDfE
	77VdWtyEt/sBFICWes+BJRAre8rErAK1Fbhl79yG8JaajBvRbRsaVpL9/YU6lkaAlbHR
	y+9w==
X-Received: by 10.42.20.6 with SMTP id e6mr16373585icb.29.1397852182327; Fri,
	18 Apr 2014 13:16:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Fri, 18 Apr 2014 13:15:52 -0700 (PDT)
In-Reply-To: <1397851967-24110-2-git-send-email-gary.robertson@linaro.org>
References: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
	<1397851967-24110-2-git-send-email-gary.robertson@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Apr 2014 13:15:52 -0700
Message-ID: <CAMKF1spmaH9vcqHXtcXzXFsOT0UUJtQTY3M+EdR=W8unB2gDyw@mail.gmail.com>
To: gary.robertson@linaro.org
Cc: mike.holmes@linaro.org, clark.williams@gmail.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rt-tests: bump version 0.87 => 0.89
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
X-List-Received-Date: Fri, 18 Apr 2014 20:16:22 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 18, 2014 at 1:12 PM,  <gary.robertson@linaro.org> wrote:
> -           file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
> -           file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
> -           file://added-missing-dependencies.patch \

these patches arent needed anymore  I assume. then they should be
deleted from metadata too

