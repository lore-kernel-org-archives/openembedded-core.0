Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4412EC7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 11:44:14 +0000 (UTC)
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
 by mx.groups.io with SMTP id smtpd.web11.12607.1750333452715786832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 04:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=PkNRw5uk;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=PkNRw5uk;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.189, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([178.143.45.236])
	by cmgsmtp with ESMTPSA
	id SDgguYCfJ75drSDggueejl; Thu, 19 Jun 2025 13:44:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750333451; bh=i40YZWdMYdF+JGKmrDkLSdQncmTRTH1biWw4YaUmAI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=PkNRw5uk2TcK0i7DXMa84Xc8k72bhOzH0lbIEe7BpHPpgiEFRC0N80Co7V0Ecsi0d
	 fXRvDZle4wY2Ih4sgv2SvQzpgHycCVlt3DK7uhwnb84YYe+8ljRxhXvrDSUKJy4TsI
	 3OyPUnQWct+K5OVG8LHHXkTN2XAm5VRBuT1r7Zr1mu0dSFeiXOi71mwvkbbsifK36w
	 GMLiaLg+ZaDgCzCvQWXCVeZuYmZb2utvMfeYdwGVXZjTam3dusMSnBCtO7Q1rdl5fB
	 YmMSU0ArGeu1l+NbUFUyQQwCOvyGpt9LyR6E11ytneLIUm1431wdsKIl4gTmsAHyu2
	 j0msL6Z1EBXaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750333451; bh=i40YZWdMYdF+JGKmrDkLSdQncmTRTH1biWw4YaUmAI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=PkNRw5uk2TcK0i7DXMa84Xc8k72bhOzH0lbIEe7BpHPpgiEFRC0N80Co7V0Ecsi0d
	 fXRvDZle4wY2Ih4sgv2SvQzpgHycCVlt3DK7uhwnb84YYe+8ljRxhXvrDSUKJy4TsI
	 3OyPUnQWct+K5OVG8LHHXkTN2XAm5VRBuT1r7Zr1mu0dSFeiXOi71mwvkbbsifK36w
	 GMLiaLg+ZaDgCzCvQWXCVeZuYmZb2utvMfeYdwGVXZjTam3dusMSnBCtO7Q1rdl5fB
	 YmMSU0ArGeu1l+NbUFUyQQwCOvyGpt9LyR6E11ytneLIUm1431wdsKIl4gTmsAHyu2
	 j0msL6Z1EBXaA==
Message-ID: <3647d65b-e79b-46e4-83e9-46b17762934b@skyrain.eu>
Date: Thu, 19 Jun 2025 13:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] perf: nativesdk
To: richard.purdie@linuxfoundation.org
References: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
 <dcf64e281e9fd6a81d3e3ec9fc7088c1cd09d06c.camel@linuxfoundation.org>
Content-Language: en-US
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <dcf64e281e9fd6a81d3e3ec9fc7088c1cd09d06c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKHYwOqNNv1oY6DeJBYyJqoZghYK/ZuuJP0T6PrmLgoEXc83FTPLshUxLddQRlCmBgS94FiScYcDMeMmpIH571oDZMTCSwkPnvYgOU11MChg9JS13io0
 dboHEuq1brJYT0yo8wFpqFv/hUYlQU7RwlCpc1c4pIvHWqaoWsy287RB/L30H8zW8QGX1joikH7q6fv8BnAUCdNClAT7xMIKhgaoIpUTi9DjjU7M+P8aYpSc
 B0wcG/hKGsLlDkJqe0MoTxw3fAfy54UZ/zLXsuYzHaU=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 11:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219071

Hi Richard,

Yes I know, that is bad, but I solved it already with other way.

On the other hand, maybe the lines in kernel-yocto.bbclass should be 
target specific.

do_kernel_configme[depends] += 
"virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
do_kernel_configme[depends] += 
"virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"

I think, that dependency to gcc-cross was done like:

linux[do_kernel_configme] -> gcc-cross-aarch64 -> linux-libc-headers.

BR,
Andy


On 19.06.2025 13:21, Richard Purdie via lists.openembedded.org wrote:
> On Thu, 2025-06-19 at 09:53 +0200, Andrej Valek via lists.openembedded.org wrote:
>> I know, that what I'm doing is not fully supported way, but... . I
>> wanted to build the perf for target device (aarch64), record the data
>> and analyze them on the host. So I extended the recipe by adding
>> BBCLASSEXTEND = "native nativesdk".
>>
>> After that I have compilation failure do to missing manifest.
>>
>> ERROR: nativesdk-perf-1.0-r0 do_configure: The sstate manifest for task
>> 'linux-libc-headers:populate_sysroot' (multilib variant '') could not be
>> found.
>> The pkgarchs considered were: machineA, cortexa53, cortexa53, cortexa53,
>> armv8a-crc, armv8a, aarch64, allarch, x86_64_x86_64-nativesdk.
>> But none of these manifests exists:
>> /home/build/tmp/sstate-control/manifest-machineA-linux-libc-headers.populate_sysroot
>> /home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.populate_sysroot
>> /home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.populate_sysroot
>> /home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.populate_sysroot
>> /home/build/tmp/sstate-control/manifest-armv8a-crc-linux-libc-headers.populate_sysroot
>> /home/build/tmp/sstate-control/manifest-armv8a-linux-libc-headers.populate_sysroot
>> /home/build/tmp/sstate-control/manifest-aarch64-linux-libc-headers.populate_sysroot
>> /home/build/tmp/sstate-control/manifest-allarch-linux-libc-headers.populate_sysroot
>> /home/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-linux-libc-headers.populate_sysroot
>>
>> The "linux-libc-headers" dependency is coming from "gcc-cross-aarch64".
>>
>> EXTRADEPENDS = ""
>> DEPENDS = "virtual/${TARGET_PREFIX}binutils ${EXTRADEPENDS} ${NATIVEDEPS}"
>> PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
>> python () {
>>       if d.getVar("TARGET_OS").startswith("linux"):
>>           d.setVar("EXTRADEPENDS", "linux-libc-headers")
>> }
>>
>> This function adds the dependency without respecting any
>> native/nativesdk variant.
>>
>> I know touching the "PACKAGE_EXTRA_ARCHS" or removing this function
>> above it's not right way to fix it.
>>
>> How to deal with something like that?
> Ignoring this is all a bad idea, something which is nativesdk should be
> using gcc-crosssdk, not gcc-cross. gcc-cross quite correctly depends on
> linux-libc-headers, gcc-crosssdk will depend on nativesdk-linux-libc-
> headers.
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219068): https://lists.openembedded.org/g/openembedded-core/message/219068
> Mute This Topic: https://lists.openembedded.org/mt/113722107/3619876
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>


