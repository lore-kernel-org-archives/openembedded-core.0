Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213D1C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 08:07:53 +0000 (UTC)
Received: from h4.cmg1.smtp.forpsi.com (h4.cmg1.smtp.forpsi.com [185.129.138.163])
 by mx.groups.io with SMTP id smtpd.web11.9433.1750320465370218357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 01:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=Gv6G6nFJ;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=Gv6G6nFJ;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.163, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([178.143.45.236])
	by cmgsmtp with ESMTPSA
	id SAJCuPNSiwQNXSAJCuZAD0; Thu, 19 Jun 2025 10:07:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750320463; bh=c16Kv4aOOR9+1SaubSGh4jVrlMCGNODyJDhOg+ZaLM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=Gv6G6nFJtJKNBFKNpf8YzXMofWBJlgKa3OjPkwYlIGdrBJ6yLq5dawydjTBQ35qw3
	 qm5k/raMCG1IjmWF9JrItNsO2amIDUnLdN4vxjBCELrE6XnSPDaDECUjIcvawb+z7S
	 fRBjwa1zGM/IwY2q+V1RDKswkKWCT0Vx4bfvgfdoBJ/ZzK5Nz0pgsX5xc2sAm4R+15
	 GZR03tfGsw9zRzS/s1U0A3WFOVymtmcXjqOeK/L9dm53t4e6tNY7n+PlzeY4CikwJC
	 wFQKe0xC6Ss+Y4z1G+xgEm/TIY3Qyoj33ED/r0cl1TktWwCMY1KwJ+VnGMdO8qa5a2
	 hbBS9kiby9juA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750320463; bh=c16Kv4aOOR9+1SaubSGh4jVrlMCGNODyJDhOg+ZaLM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=Gv6G6nFJtJKNBFKNpf8YzXMofWBJlgKa3OjPkwYlIGdrBJ6yLq5dawydjTBQ35qw3
	 qm5k/raMCG1IjmWF9JrItNsO2amIDUnLdN4vxjBCELrE6XnSPDaDECUjIcvawb+z7S
	 fRBjwa1zGM/IwY2q+V1RDKswkKWCT0Vx4bfvgfdoBJ/ZzK5Nz0pgsX5xc2sAm4R+15
	 GZR03tfGsw9zRzS/s1U0A3WFOVymtmcXjqOeK/L9dm53t4e6tNY7n+PlzeY4CikwJC
	 wFQKe0xC6Ss+Y4z1G+xgEm/TIY3Qyoj33ED/r0cl1TktWwCMY1KwJ+VnGMdO8qa5a2
	 hbBS9kiby9juA==
Message-ID: <5a82dfcd-f526-4da7-a39b-081d7b689f57@skyrain.eu>
Date: Thu, 19 Jun 2025 10:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] perf: nativesdk
To: alex.kanavin@gmail.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
 <CANNYZj91bFZAMB0XiLyEewy6t0RnrtNAZGEsiV+znM5xSY7S0Q@mail.gmail.com>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <CANNYZj91bFZAMB0XiLyEewy6t0RnrtNAZGEsiV+znM5xSY7S0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfK8UnM0o+f/ee7xO2DPUpXp49EIL4w67UU0CcxMBIQrVt1nlnCBajSvk2eSi3CJsUFgavq4CHnCP15PScFCfxrImcIbeVsYIDuq+Ptm66t60oxDCY2Uj
 WecrjLo5RV6w2y5Sc7dnB2WkKJ94LJ9yqt0O+kpJZM4z0KtSDvORM+rSytbiplyKqBAgJyNv9HjYkwp+qVT9ll8PnGbJB7GdfFEsnTUvw0vhAV/WrJV6DgZg
 3POXw3LyEfeaYzLjWiLnNw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 08:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219057

Hi Alex,

maybe I have to do some more tuning, but what I did:
BBCLASSEXTEND = "native nativesdk"
DEPENDS:remove:class-native = "virtual/${MLPREFIX}libc"

then I run: "bitbake perf-native" and I have the same issue:

ERROR: perf-native-1.0-r0 do_configure: The sstate manifest for task 
'linux-libc-headers:populate_sysroot' (multilib variant '') could not be 
found.
The pkgarchs considered were: machineA, cortexa53, cortexa53, 
armv8a-crc, armv8a, aarch64, allarch, x86_64_x86_64-nativesdk.
But none of these manifests exists:
     
/home/build/tmp/sstate-control/manifest-machineA-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-armv8a-crc-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-armv8a-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-aarch64-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-allarch-linux-libc-headers.populate_sysroot
/home/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-linux-libc-headers.populate_sysroot

So nope, it's not working.

Other option is to use perf from host system, but not sure if it's while 
it has completely different options.

BR,
Andy

On 19.06.2025 09:56, Alexander Kanavin via lists.openembedded.org wrote:
> On Thu, 19 Jun 2025 at 09:53, Andrej Valek via lists.openembedded.org
> <andrej.v=skyrain.eu@lists.openembedded.org> wrote:
>> I know, that what I'm doing is not fully supported way, but... . I
>> wanted to build the perf for target device (aarch64), record the data
>> and analyze them on the host. So I extended the recipe by adding
>> BBCLASSEXTEND = "native nativesdk".
> If you want to run perf natively, just 'native' should be enough for a
> start, no?
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219056): https://lists.openembedded.org/g/openembedded-core/message/219056
> Mute This Topic: https://lists.openembedded.org/mt/113722107/3619876
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>


