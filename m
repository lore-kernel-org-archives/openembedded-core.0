Return-Path: <akuster808@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 43381719A8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 08:42:07 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u132so6464686wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=9L89S6+0razofZOyQHF6nnn5iGu+lE9araoR5XqB5iM=;
	b=C04RNv8EDryziewLrT5Ppqn5yEDYYQNiIetd2iRuWmGGie2Mi6IbJGgq4IMlD4wGCz
	bvaSPx8FJlx5Zq9BSlRpl82pTLLWcKGP0r/H5jY301KD9CET/ca7XkmDsHoGjKin5CqY
	DyHT7AtuQtFhKvacCWaX/SJ6B0+IvGgkssJ594x1kVK4K4cPEG08nzZauqzLpyu6vmej
	AcuAI8N1gGkR7meDI0x1dc/8ypDgtlxVCKd10v0Em8zUKO1onitT15ExAUklKGh8a1oX
	r9AaCl86ELjqyH9le9UHTEQWD59UXxTFowk86wSueVOtXeS/mMZfDCvhra1ULBN8EwUD
	cUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9L89S6+0razofZOyQHF6nnn5iGu+lE9araoR5XqB5iM=;
	b=sasDQOFsQMlvKdy2FuZM9Nn0/3KZQN6fPcAU4UY4ZJGoPSdN6ClBal4IHoP99iKm3Y
	h2q9ANpobgvBVA10XDNtylPHtblHhMX+NfYxcw3vfAspYUHKSA54zNIDBd1PUDowcyxG
	K/Bpia5UQVgvnKgBg0XVR6Zcg3UBOX9sZ2Imi+GcJpb9qlX9N6CziP1ky2eBEBbwCQ8o
	fM+wl8w9DMG08hLcVdCJ+Zx0KdeHt5Quzc2kQ/W27z9dCeBLgMaU6bJYMrDdjXCitwJe
	vXAn8Nk/1vgfcN+2u/qG3h2QgLWGLpDLt5zlW6Jc1uGH5PUBRPxwyM/xH/DL2/Qnss9e
	Y3WA==
X-Gm-Message-State: AFeK/H1uVwwn2DsH6q1aGXYnGupj7uvJ5OT79pL6kDhHqN+AgsdCWKHTXG9KWgrE2Up8hA==
X-Received: by 10.28.14.69 with SMTP id 66mr1752809wmo.27.1489826528485;
	Sat, 18 Mar 2017 01:42:08 -0700 (PDT)
Received: from [172.16.56.71] ([37.205.61.206])
	by smtp.gmail.com with ESMTPSA id
	60sm12749817wrg.60.2017.03.18.01.42.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Mar 2017 01:42:07 -0700 (PDT)
To: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
References: <20170317195515.35729bb7@danielf.thecshore.com>
	<3a6a7bd6-a5e5-b139-bc2a-53d3b6b41da5@mlbassoc.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <bdebc471-dded-69fb-1ae1-d27e1ec751ed@gmail.com>
Date: Sat, 18 Mar 2017 01:42:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <3a6a7bd6-a5e5-b139-bc2a-53d3b6b41da5@mlbassoc.com>
Subject: Re: Hints on submitting to OE-Core
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
X-List-Received-Date: Sat, 18 Mar 2017 08:42:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 03/17/2017 06:21 PM, Gary Thomas wrote:
> On 2017-03-18 00:55, Daniel Dickinson wrote:
>> Hi all,
>>
>> I've got a pre-alpha 'distro' and some layers I think that could get to
>> an interesting state.  The intent is to work them up to where they are
>> suitable to be submitted as patches to oe-core rather than the
>> current .bbappend and related files.
>>
>> There's rather a lot of reading (which is good in the sense that I like
>> actually have documentation, although that's definitely an area I need
>> to improve on for the layers I've got in the works), and I haven't
>> nearly got through it all yet, but I was hoping for pointers on the
>> most important bits to read for prepping patches submission.
>
> Have you read this?
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

To be honest, OE-core does not even comply to the basic standard of a 
README. It missing patch submission info like many other layers do nor 
does in include the Maintainer.

- armin
>
>>
>> Also, in the layers list I'll be asking about some build issues that I
>> don't see with a manual bitbake, that look like missing preqs on a build
>> server, unless the layer should be requesting installation of host files
>> somewhere.
>
> Some tools required by ${HOSTTOOLS} are missing:
>   cpio chrpath gawk diffstat makeinfo
>


