Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id EBFBD607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 03:03:04 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 9so5083463iom.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 19:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:to:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=upKr03NpYMmbk7lP5HpvkvdHJM6WWA3Iyh5b0AlDbc4=;
	b=o1tjaC0vNun5SXYntHteEW858dQcCSmW7W3ky6CZf9ECyuFefrWg+5okFNrZeV88mT
	jrauWGgEjEac6jmn6NnS8trGeLrBXQAmYMQXY9IIE6xSM9wB2pV/sdtlPU3ydTbrrw5Y
	fUs0pATS4ketA3cZe2NReNZ7yTlEcdaM2DxD9cUJW8tccq/9Thv3asnffuT7hsjGQdug
	XLXeQoIQMzDN239RV3gAU/wUv6xFEnHwnfReuStt1lmQXETzpSdMsqjLc7ifmcvenME/
	WRad8tM7SDahZkGMeM2zrwDmaBYCE/RtyMphn4YOKsKBaVjxK0NXi8IP+33VeeUy6AUc
	290w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:to:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=upKr03NpYMmbk7lP5HpvkvdHJM6WWA3Iyh5b0AlDbc4=;
	b=OnmIO8KMJskwQAILotpI/u4udlqUBYIrvc5UlyrBi3itnQLR27Qq4p6fDUba3tAggP
	BVq7FUMMTQVQRKQoewuAcm6uRG1Ef4gtbFx4n/IVrBnUQkgKHAYogvRx/yCXSPiA5Tut
	sjOrt8ELxGY5Iuyw5RsxiHSDP21iJrEgR2wq/eorg2P1DwqoQQfof3wuIzD6rByAhedu
	LVdc57k8OePIx7tlyb7fCZlVIXW2rytZMEzDBndjFXVoy9hZZzRsljMqNJgDriH/gQ3f
	H6CrOziFLFrMVovsdruGfaMHr8mlQfoxv3+B+FUiUNgFh4ddnEHD40publ2DyG0LmSU3
	i1zA==
X-Gm-Message-State: AG10YOS8bwSDUvEVQL3u0xMGbimL5sKqT4aQV3lN9gZ1p7cVj0xTS5hN4+7EAMgxShp28Q==
X-Received: by 10.107.132.142 with SMTP id o14mr30403919ioi.75.1454986985309; 
	Mon, 08 Feb 2016 19:03:05 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	s38sm10521885ioe.33.2016.02.08.19.03.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 19:03:04 -0800 (PST)
References: <56B922B3.9070604@gmail.com>
	<CAMKF1soeyQwt+jDkiLWxgh+7BqnbABHa7f=iFyEmZf8O-BBBYw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56B956EA.9000404@gmail.com>
Date: Mon, 8 Feb 2016 22:03:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soeyQwt+jDkiLWxgh+7BqnbABHa7f=iFyEmZf8O-BBBYw@mail.gmail.com>
Subject: Re: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Tue, 09 Feb 2016 03:03:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/16 21:25, Khem Raj wrote:
> On Mon, Feb 8, 2016 at 3:20 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>> This is more of a "FYI", but I've noticed that the build time of my chromium
>> recipe has gone from ~45 minutes to ~2h15m when the only thing that changes
>> is to move openembedded-core from the commit just before upgrading binutils
>> to version 2.26 ([fd75637] native.bbclass: Set CXXFLAGS from BUILD_CXXFLAGS
>> not BUILD_CFLAGS) to the one immediately after ([86ade2c] binutils: Upgrade
>> to 2.26).
> Is it using gold linker ? if not can you try both bfd and gold

A week or so ago, as part of something else (but before the binutils 
update to 2.26), I tried performing a clean build using the gold linker. 
Unfortunately that image was not able to boot:

https://lists.yoctoproject.org/pipermail/meta-intel/2016-January/003697.html
(but there were no replies)

It dies somewhere between the EFI bootloader and grub2 (or perhaps just 
after grub starts). There's no grub output.

I'll try doing the build with the gold linker, but the results of that 
build might not be useful to me.

