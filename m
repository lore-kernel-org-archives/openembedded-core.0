Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2EDFA788A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 13:45:07 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id e5-v6so6208688lfb.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yMuQuZRvZ+gCAhAEDlHsSVR6JIapzm/a5Gnk0nXJqtQ=;
	b=nfK7DD//1th9FOnJ0GObBSDK+bpe+ls//tpl1fUC8wS/zqLGKfuSwFRB6u45sQq+Il
	SGAgjsDZ0uhYGVm1Qz42wwypeXJ4Fi/PYOtdhvqXtHWa8q/5V1pvCL2vpbNAPfA/+VOe
	w9DVAusdzFHS7fvO2HJuKBXP4+xPnJpN0aIcW/tNCTyNehKlFbLLC77OBV/x8No7B4Cv
	dStMSpH8ju+wltNKu2k0mVBvAd28e9woGaExXffs4QT2QjKLb9LpFu2Z66l3+Bz9po3R
	RwhHM8mvV8kYPtkZLaU8/i3bKiZ8oiPuuHUKf6ObmueScaYKD93oHRz8iCASuhuXAMF+
	gTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yMuQuZRvZ+gCAhAEDlHsSVR6JIapzm/a5Gnk0nXJqtQ=;
	b=QpnZExU891+B5PtV3E8rwGmFFzH3LxsiWkTEITugPZWohntZRf9EM5S9kakTwy0msc
	awcT4eeCl+EVUfpq5p4KSI/smM3EHCOXT1ITu/GBz244Vxqf5PakdVKFM9fHCxHcdmwv
	5cndAoVYhUB0cQO7mLhJD4z1R4902/C0szqQdrClwxGp4bakEdDt5m+SFAhzcIckoAoh
	6t0hDL0A5G+27EZqMDk1i83wzeV3/9mVHa69c3AdofJfiOUA2lljDGxITb0FoTlaJI1t
	k6Vo8juvmlAW37rYMVYwOZw1g/23RC2snjiCEWhJ/Yv+zRMQ4i1hCH3KV8YzQ3uLHqXS
	Weqw==
X-Gm-Message-State: AElRT7FuuhUh6r3q5r2OVM1FBEfANBANBO84U27P5+6dm0rSEaZSjd10
	H7cLpLedqnCrPrqJ/i38/+jWtkUs5yP6Kuvn1Tc=
X-Google-Smtp-Source: AG47ELvJ9KRIqoxWJuRTDVEtbjf0DbkURMQBr/Mvnf4kqVv6OSlj+1BH7ajsTezYgMgehQ1gJSYGCwjbdqg/afFCr7s=
X-Received: by 10.46.42.67 with SMTP id q64mr1405894ljq.133.1521121508699;
	Thu, 15 Mar 2018 06:45:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 15 Mar 2018 06:45:08 -0700 (PDT)
In-Reply-To: <CAJTo0Lbf=-TOV2ctvcE1pu+wR_8dsSt=AbUwUpvSq+miJUkBHA@mail.gmail.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<28b9ee1263d7a5343c2e8246ff0b5f57454b054c.1520359364.git.bruce.ashfield@windriver.com>
	<CAJTo0Lbf=-TOV2ctvcE1pu+wR_8dsSt=AbUwUpvSq+miJUkBHA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 15 Mar 2018 09:45:08 -0400
Message-ID: <CADkTA4MGW3B_R-Y1oAi7BNa8CqxKbRx6ben3F3hXDz-F9vj0CA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9 v3] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 15 Mar 2018 13:45:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 7, 2018 at 3:40 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 6 March 2018 at 18:11, Bruce Ashfield <bruce.ashfield@windriver.com>
> wrote:
>>
>> +RDEPENDS_${PN} = "bc python ${TCLIBC}-utils"
>> +# 4.15+ needs these next two RDEPENDS
>> +RDEPENDS_${PN} += "openssl-dev util-linux"
>> +# and x86 needs a bit more for 4.15+
>> +RDEPENDS_${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils', '',
>> d)}"
>
>
> Annoyingly this is breaking our multilib test case:
>
> https://autobuilder.yocto.io/builders/nightly-multilib/builds/852/steps/BuildImages_4/logs/stdio
>
> It's entirely possible that the test is broken in some way but it's far too
> early for me right now to comprehend the multilib matrix...

I was trying to reproduce this here, and couldn't make any sense out
of the configuration.

Is there somewhere that I can read to figure out what to put in my
local.conf to reproduce
that configuration ?

Bruce

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

