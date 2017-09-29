Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4C87260110
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 10:54:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f4so889934wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4W8uDTLRdOMm20bhLkQLFBKJyHgAWL0Dc7BPoHqdN6U=;
	b=C7o3eOvxpRDHbQwsaS/k6G1hVDejieRKXhYoh+IKqIwEgUoTsl3tvKbzK3vJ9pV7jd
	FFJwnf86kFTNCRxwU/3XU6HsJw5rwJscl5ikFx7IlXbbEe5baKIXrP7y1EQ04rG34Beg
	8aGDxfn6QpAxWfTxPE3yR+3pbIXrAowgpQC/q3iT67ZIo4dZc6Wu7Cxo7EoGPodSSyGq
	Iz2uEKt6NIVvWQ353uoVOcOLYOR+PAk+p4UFWcYivvThr360LyjTqxvoWsHHtUidUhKS
	1F8nfYwubLPP2/hTIYHMaNaHzQHf5O1+fv7sqQR/L7JGhb4AJMUpivSZYD/Q4E5outbH
	1GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4W8uDTLRdOMm20bhLkQLFBKJyHgAWL0Dc7BPoHqdN6U=;
	b=JYA5j6njIHAUpHdXuK6UEDuqxAHlwXEdCMd84OTJMm71sStFtPDiZarqjfUuJnZ+1M
	0RT/y2YstQLikmcGulAVNK3IOsPBMJXtGVPKpk+iKfrpVYqpctIqFGYkFhhwJeLjhAAL
	uResyK5ZVywyW+aOPzCHhR0N7kOnJMo7/oq8SKdrOUWnxt+VsGH1KF0iou6qrMYuwr9Y
	Tqq1SvCsWOYKsuMsPk5wOm4jTn4DDyPs2Y/bmvK+Kngo0IZzkb+Uc+oWS/T980HgsNFC
	a8Jxo4xdjHLNyYZVSvsu3CfTlo5oK52hRKw6YszXHapowwFa/66aZ+5/kB5zjXT9plGV
	OFSw==
X-Gm-Message-State: AHPjjUiC9ROsZbXtVAq4nCOSnaBKd66vvh8iDkNxVpjknXagDfXuirqz
	8KiqbmQW9eBpE/8Yz5aj74QPXTneAUZxfWY5yGI=
X-Google-Smtp-Source: AOwi7QB5HbSKTRtGuWI6LW4fC7pz6aT0XNmlayyv8m/I3xLolR3lczKbfkW2mpEluQmrEe7ax5DHy2BxF9lzkPsHIac=
X-Received: by 10.80.182.195 with SMTP id f3mr9236333ede.127.1506682494951;
	Fri, 29 Sep 2017 03:54:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.142.236 with HTTP; Fri, 29 Sep 2017 03:54:54 -0700 (PDT)
In-Reply-To: <CAEQ58sgLXBEc4k=E2A2=SoG360_8zva-w+Y+Q9P_QauTK0uznw@mail.gmail.com>
References: <20170929094702.5334-1-francescogiancane8@gmail.com>
	<CAJTo0LZTrRnhgFRhK3=GxVfzrT5H7p-k=Untwq9T+KWTrpyMQA@mail.gmail.com>
	<CAEQ58siT6Lw_W9Oe60v125ZZak2UXQ0L-R4PvaHAz6NKRi_-vA@mail.gmail.com>
	<CAJTo0LYaN8SapMtgpQhNkPz7TKR9JgOMhroxWp4Q1+BDkcucMQ@mail.gmail.com>
	<CAEQ58sgLXBEc4k=E2A2=SoG360_8zva-w+Y+Q9P_QauTK0uznw@mail.gmail.com>
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Fri, 29 Sep 2017 12:54:54 +0200
Message-ID: <CAEQ58sh2WoS01ktF=2yVVXuyoYu3+dHpTB6UbqaQBcUeGA-6WQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [openembedded-core][PATCH] xorg-xserver: fix building of the package when different virtual/egl provider are selected
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
X-List-Received-Date: Fri, 29 Sep 2017 10:54:55 -0000
Content-Type: text/plain; charset="UTF-8"

Hi again Ross,
sorry to still bother but grepping inside poky recipes I did found no
references to 'libegl'. Every (virtual) dependency is built upon
virtual/egl; Maybe folks at meta-raspberrypi where not wrong... The
same apply for Freescale GPU recipes: they do not provide libegl, only
egl.
Francesco Giancane

Via Paolo Braccini 46, 10141 Torino (TO)
+393933920466
https://it.linkedin.com/in/francesco-giancane-aa7213117



2017-09-29 12:37 GMT+02:00 Francesco Giancane <francescogiancane8@gmail.com>:
> Yes, in fact Mesa rprovides both egl and libegl.
> So the patch is to be issued to the userland recipe of raspberrypi in the
> end. Would you confirm that?
>
> Francesco Giancane
>
> Via Paolo Braccini 46, 10141 Torino (TO)
>
> +393933920466
>
> Il 29 set 2017 12:16, "Burton, Ross" <ross.burton@intel.com> ha scritto:
>>
>> On 29 September 2017 at 11:14, Francesco Giancane
>> <francescogiancane8@gmail.com> wrote:
>>>
>>> Hi Ross,
>>> Thank you for your clarification. I double checked the recipes before
>>> asking for the patch,  and I found out that Mesa provides both virtual/egl
>>> and virtual/libegl; searching through the layers I did not find any recipe
>>> depending on libegl but only on egl. Incidentally, userland from
>>> meta-raspberrypi provided only egl, and that was the final confirmation.
>>
>>
>> Note that virtual/* are build-time dependencies, this dependency is a
>> runtime dependency.
>>
>> Ross

