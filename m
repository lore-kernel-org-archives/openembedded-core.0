Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5E1C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 19:04:28 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web11.12401.1737820789546403140
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 07:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=mo17+xdg;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To
	:Cc:Content-ID:Content-Description;
	bh=tQfor/hfacv1U+zr+mqtnlfNwUj75BSw572ZR72p5W0=; b=mo17+xdgPTdsa7F44thIc3TYVo
	hBPUzk5oFJnTLmHsARs4uKDbHcbUXc81PCEg6plxnMk4aFkBeYKV3gszIcHRZIUelrz8Jc9Qw86TL
	TUdym09G2arswBzgiADQ/ryoXMigU2+wAYccAUFX3VSsAJGeDAK/25/ktkzy2MuazYBjmQxMOartm
	QRwSLo/gOjqCFyT7mYYML4dIk8Et35JrMA84NzqlHH13dbaqE9iKWU0reFsRtpGQmLSeT1E1nyYhm
	jvcPZpOj0p588nCY6CEyM1tZN8dMy2JxjVGOdCc8BbpZna06TMVpW2J5L1VXjR2kpj8Vm1lCnY1FM
	+e2XBUjQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tbiZW-00AJM2-7t; Sat, 25 Jan 2025 15:59:46 +0000
Message-ID: <429578c5-e2e2-455c-b22a-b9917e578a3b@debian.org>
Date: Sat, 25 Jan 2025 16:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] busybox: Correct SPDX license reference
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20250124200723.14829-1-bage@debian.org>
 <d714b64c8771314895ee07ef3fa8adaafb2024d7.camel@linuxfoundation.org>
From: Bastian Germann <bage@debian.org>
In-Reply-To: <d714b64c8771314895ee07ef3fa8adaafb2024d7.camel@linuxfoundation.org>
X-Debian-User: bage
Content-Language: de-DE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 19:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210269

Am 25.01.25 um 16:14 schrieb Richard Purdie:
> On Fri, 2025-01-24 at 21:07 +0100, Bastian Germann via lists.openembedded.org wrote:
>> Commit 6238ee3ecd (recipes-core/busybox: fixup licensing information)
>> claims that there is no applicable license identifier in SPDX, so a
>> bzip2-1.0.4 is made up.
>>
>> There is no bzip2-1.0.4 license defined in SPDX. However, bzip2-1.0.6 is
>> the same license.
>>
>> License-Update: wrong SPDX identifier
>>
>> Signed-off-by: Bastian Germann <bage@debian.org>
>> ---
>>   meta/recipes-core/busybox/busybox.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
>> index f778cff0f4..cebfd3c48c 100644
>> --- a/meta/recipes-core/busybox/busybox.inc
>> +++ b/meta/recipes-core/busybox/busybox.inc
>> @@ -7,7 +7,7 @@ DEPENDS += "kern-tools-native virtual/crypt"
>>   
>>   # bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 source
>>   # the GPL is version 2 only
>> -LICENSE = "GPL-2.0-only & bzip2-1.0.4"
>> +LICENSE = "GPL-2.0-only & bzip2-1.0.6"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
>>                       file://archival/libarchive/bz/LICENSE;md5=28e3301eae987e8cfe19988e98383dae"
> 
> There is a bit of confusion here:
> 
> https://git.yoctoproject.org/poky/commit/meta/recipes-core/busybox/busybox.inc?h=master&id=0776bf6600c42cec2961d3f6d33c8c9c09cbb1ce
> 
> Is the 1.0.4 and 1.0.6 license different or not?

They are not. You can simply diff the LICENSE FILE and will only find differences in the SPDX-optional copyright 
statements: 
https://github.com/libarchive/bzip2/compare/bzip2-1.0.4...bzip2-1.0.6#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7

SPDX should have done a better naming job...

