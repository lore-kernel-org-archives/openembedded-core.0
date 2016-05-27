Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB6776651
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 16:29:21 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id p81so5068885itd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=3gSfYdp59Aw37OIKMI0Q6tlY8PMcddYzCa9Yh9EeOFo=;
	b=jGPq/VT6x4tjY533ohqtz/wqaQqUOTJR0tvp7sJoFALPDBJRG2d5tAHpr6ZOLb3Gsg
	NpNgFDJslI5Lo7ywv3o2/ulwN96dLfqI+kVfrNc9DK+ZHfe2OwRZMLI3/0kn9pZKhI47
	N0N9imNHP7vYnkhr03NPXDx2SvdoOsNIeqzGIi5UxvXD8d57+vmVx59VMyInbBgGsU2v
	WwjQ+bR77KXGqNsREfrXVrWkpJytEHAyJki0ieX9OgDfcuwBuImdve9Bg8Zt0/kaOLFW
	EEs5QpTRDnt9Lvl5hDpJmqQwBAOeBpLoWRWT3R5XsL5GC0eNnXpP482nL3/AS+ccX9fp
	XgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=3gSfYdp59Aw37OIKMI0Q6tlY8PMcddYzCa9Yh9EeOFo=;
	b=R9+otuZJhCK3KLBBYuJstqXBEoGOqYVyI13xgwxKJaaI1/F8fDX24iMfxlIvCMXpew
	MIVA0V6Tv+dJ8bseBbINvzk3o3F3W4/cSUO2ASMdCNTCar66F5fK5LGN2x8zdxqn6zXk
	HuV2+5z8DAUSl/dozQT3x+g7kCqMay2T3dR8WazbOyoF3LRBdqBOmuGQGS6WA3kBU55l
	evmZ36PGS0SYzqagcm9upOkQXq75ivXrO6ho43YkMvWq8XCKXvO81/MHUYhCjcHDiYBG
	3fjq6g2zkcAsNWl/8K1ujXd5lnAi4IyCKpru1se4m1xLhtSajw8tMYhwCfff14DUVTnp
	F/9w==
X-Gm-Message-State: ALyK8tIAQtC0ibTe9mBDJxT84tS6vt4PdPVBOv+weWjavcnBJCTyQfKCqeI1hCY1BzA6TEuFDYa2Qi+Z3SN5vw==
MIME-Version: 1.0
X-Received: by 10.36.6.73 with SMTP id 70mr9311318itv.1.1464366561653; Fri, 27
	May 2016 09:29:21 -0700 (PDT)
Received: by 10.36.81.212 with HTTP; Fri, 27 May 2016 09:29:21 -0700 (PDT)
In-Reply-To: <574874E4.8080408@gmail.com>
References: <1464365915-8522-1-git-send-email-bruce.ashfield@windriver.com>
	<574874E4.8080408@gmail.com>
Date: Fri, 27 May 2016 11:29:21 -0500
Message-ID: <CAFSKS=MdcQ37TAzNK5_FzUb=gq1tTN7OEQyHpRX1O7BONFikTQ@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto/4.1: fix musb compilation error
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
X-List-Received-Date: Fri, 27 May 2016 16:29:21 -0000
Content-Type: text/plain; charset=UTF-8

Yes, I found the issue on krogoth.

-George

On Fri, May 27, 2016 at 11:25 AM, akuster808 <akuster808@gmail.com> wrote:
> does this affect krogoth?
>
> - armin
>
> On 05/27/2016 09:18 AM, Bruce Ashfield wrote:
>> We had a partial musb change merged into the 4.1 tree, which resulted in:
>>
>>   | kernel-source/drivers/usb/musb/musb_dsps.c:
>>   In function 'dsps_create_musb_pdev':
>>   | kernel-source/drivers/usb/musb/musb_dsps.c:750:8:
>>   error: 'struct musb_hdrc_config' has no member named 'maximum_speed'
>>   |   config->maximum_speed = usb_get_maximum_speed(&parent->dev);
>>   |         ^~
>>
>> By backporting commit:
>>
>>   9b7537642cb6a [usb: musb: set the controller speed based on the config setting]
>>
>> We get our missing structure field, and we can once again build musb.
>>
>> [YOCTO: #9680]
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
>>  meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
>>  3 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
>> index 1d4c404ef0ca..24cc0ac07703 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
>> @@ -11,7 +11,7 @@ python () {
>>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>  }
>>
>> -SRCREV_machine ?= "320892013ad33ab41f530ad321939aec07d09d22"
>> +SRCREV_machine ?= "e22280e8c2905d96c7cc5917df202b6ed904d042"
>>  SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
>>
>>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
>> index 9757c4d02067..bf7d6c5959e1 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
>> @@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.24"
>>  KMETA = "kernel-meta"
>>  KCONF_BSP_AUDIT_LEVEL = "2"
>>
>> -SRCREV_machine ?= "ecc983477682203619da0e456fa4a8689ac41097"
>> +SRCREV_machine ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
>>  SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
>>
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
>> index e0d288b6e93c..c325bc59c6c8 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
>> @@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
>>  KBRANCH_qemux86-64 ?= "standard/base"
>>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>>
>> -SRCREV_machine_qemuarm ?= "d11c336b38ab0d4e55eb683aca5ca9c6b6cd8b42"
>> -SRCREV_machine_qemuarm64 ?= "ecc983477682203619da0e456fa4a8689ac41097"
>> -SRCREV_machine_qemumips ?= "f8e363f638b283738369155b4a9990b5d0f902a7"
>> -SRCREV_machine_qemuppc ?= "ecc983477682203619da0e456fa4a8689ac41097"
>> -SRCREV_machine_qemux86 ?= "ecc983477682203619da0e456fa4a8689ac41097"
>> -SRCREV_machine_qemux86-64 ?= "ecc983477682203619da0e456fa4a8689ac41097"
>> -SRCREV_machine_qemumips64 ?= "1db47ec6c39071b29f82a040b9b9a81584f50461"
>> -SRCREV_machine ?= "ecc983477682203619da0e456fa4a8689ac41097"
>> +SRCREV_machine_qemuarm ?= "cadb80aa4bcee282f1b0798ef35ad8b96ec44931"
>> +SRCREV_machine_qemuarm64 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
>> +SRCREV_machine_qemumips ?= "737eda6388a529d0937e9d91daa3644b11f322dc"
>> +SRCREV_machine_qemuppc ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
>> +SRCREV_machine_qemux86 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
>> +SRCREV_machine_qemux86-64 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
>> +SRCREV_machine_qemumips64 ?= "f276d128428b031521d766bfbfe84f9f9f992930"
>> +SRCREV_machine ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
>>  SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
>>
>>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

