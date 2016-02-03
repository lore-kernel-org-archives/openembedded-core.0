Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 01A2577371
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:51:23 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 9so70456876iom.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=uUpP2rnXeU5F8aNRWGkiigjzQ1di0NL3icfb3SCAjLA=;
	b=IZznf42gaiFOvj5pZ5AwIk0gDo1RSmBI1ot2f7t+vz9MDkuVm4a/h4EXThuZYLBjOe
	dhGAF/Ave8GSWftH3PppHzGgWoQlM6wU+cvlm+TvRsyzBzFfSCvtOae5NzQcXG7RCdS5
	Z+rwfSUMYfil3aCXLiNAAINBv0dOjlA17O1ttZpUfoVeSFsULfvXNK2UpsF2ZSZPr6sP
	HbbTgLsztISZwyloFgJlmM2/SkR6bYWHirFP+rFlLYFNWN3iasNCzwea5zIoVw9CA8ub
	2J86uTfmsiKjrmd6wfQwPGwsHB0Np36Da4+9RiaucL8FdB6LTMZdHWX+Q1m/gyDOAfaf
	gqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=uUpP2rnXeU5F8aNRWGkiigjzQ1di0NL3icfb3SCAjLA=;
	b=d/DwPibLpokE0Q2oXV+WM9ZPoYxmF3lCbL7VaKjAeXT5GT6pkBNbPRzScixWReqhMk
	Z1qCxhMRlSQrF8q6beo6QqeTlnLFPk9VVgWAzQeMr13mcqFdC46JN6MdkMnS3DVbqpj7
	cpdLCy5cd1Kj5cLNyVJQUY9VPTWnpI/9HJacntOb37ZAf8m6hFMQN6xSbDARlSoSu4ys
	cwPO+ZcDF5w9YUGxLpdAnaXPzx6LKVYY+uQxYjcc/NygwK7jXxWWl0kb2otXLgDxcV+1
	mgP7BVprdLna0WCPAcyEF2oG+NkLT935/8J5Ob2V1WA3pVlxmPaKI8kqo9hxZlWxiT3r
	nRkA==
X-Gm-Message-State: AG10YOQchEhyf/IlMoqcjugjm3w3gcbHqaZK3J3PDEOA4xwRsfwKJ2quvrGNQJpegrljrRfnlhmfrYZwppunYQ==
X-Received: by 10.107.9.211 with SMTP id 80mr5263943ioj.112.1454532684148;
	Wed, 03 Feb 2016 12:51:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Wed, 3 Feb 2016 12:50:54 -0800 (PST)
In-Reply-To: <CA+chaQd2Cdzpo0_LP2mJUoYe8UtwmOK3DCpE-yXk_s80t41QSA@mail.gmail.com>
References: <56B25500.7030402@gmail.com>
	<34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
	<1478930.Uaq5cohNMu@peggleto-mobl.ger.corp.intel.com>
	<56E071BC-9E02-44DD-8236-9697A647F8F7@gmail.com>
	<CA+chaQd2Cdzpo0_LP2mJUoYe8UtwmOK3DCpE-yXk_s80t41QSA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Feb 2016 12:50:54 -0800
Message-ID: <CAMKF1sqSW=U2aKs-xwqu=dMaJ=W_68o+XJEq3AnNhtdt=sT=Bw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Wed, 03 Feb 2016 20:51:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 3, 2016 at 12:32 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> This could be caused by chromium using own bundled binutils where the
> version doesn't match, I've solved it in our recipe by:
> +GYP_DEFINES_append =3D " linux_use_bundled_gold=3D0"
> +GYP_DEFINES_append =3D " linux_use_bundled_binutils=3D0"
>

there we go. chromium has world of its own but then they should really
insulate themselves.


>
> In my cases it was failing while building native libvpx (also bundled in
> chromium sources) when I've upgraded host binutils to
> (GNU gold (GNU Binutils for Ubuntu 2.25.90.20160101) 1.11) included in
> Ubuntu-16.04 Alpha
>
>
> On Wed, Feb 3, 2016 at 9:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> > On Feb 3, 2016, at 12:09 PM, Paul Eggleton
>> > <paul.eggleton@linux.intel.com> wrote:
>> >
>> > On Wed, 03 Feb 2016 11:56:45 Khem Raj wrote:
>> >>> On Feb 3, 2016, at 11:29 AM, Trevor Woerner <twoerner@gmail.com>
>> >>> wrote:
>> >>>
>> >>> My chromium build is now failing due to:
>> >>>   commit 86ade2cc2553c942d9526c5323a11ae151653505
>> >>>
>> >>>       binutils: Upgrade to 2.26
>> >>> |
>> >>> | FAILED: x86_64-oe-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7
>> >>> | -mfpmath=3Dsse -msse4.2
>> >>> | --sysroot=3D/z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-6=
4
>> >>> | -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,now -Wl,-z,r=
elro
>> >>> | -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC
>> >>> |
>> >>> -B/z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49=
.0.
>> >>> |
>> >>> 2612.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Releas=
e/bi
>> >>> | n -Wl,--disable-new-dtags -m64 -Wl,-O1 -Wl,--as-needed
>> >>> -Wl,--gc-sections
>> >>> | -o chrome_sandbox -Wl,--start-group
>> >>> | obj/sandbox/linux/suid/chrome_sandbox.process_util_linux.o
>> >>> | obj/sandbox/linux/suid/chrome_sandbox.sandbox.o -Wl,--end-group
>> >>> |
>> >>> /z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0=
.26
>> >>> |
>> >>> 12.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/=
bin/
>> >>> | ld: error:
>> >>> |
>> >>> /z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64/usr/lib/../l=
ib/
>> >>> | crti.o: unsupported reloc 42 against global symbol __gmon_start__
>> >>> | ../sysdeps/x86_64/crti.S:66: error: unsupported reloc 42
>> >>>
>> >>> Any suggestions on how to approach this?
>> >>
>> >> do a clean build. Its mixing objects
>> >
>> > Should we have bumped PR somewhere to avoid this?
>>
>> Don=E2=80=99t think so. this could happen due to new relocs appearing in=
 glibc due
>> to the fact
>> thats its now compiled with newer binutils but we are still using old
>> linker
>> to link the app which does not understand these relocations. Why would
>> that happen
>> don=E2=80=99t know.
>>
>> >
>> > Cheers,
>> > Paul
>> >
>> > --
>> >
>> > Paul Eggleton
>> > Intel Open Source Technology Centre
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

