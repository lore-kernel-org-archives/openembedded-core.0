Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 205CF78A1B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 02:31:21 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v18so18699077wrv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 18:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cR22H5FePXwBpUaAfvzP5w+70uRty7aQb5N2AE5Oq9E=;
	b=VH/cKYkGTYPOLaFTId6WgDDE9HW96JycZmHHNGZlvqS2E1yHvEpQ1Rmoa9FAzCo+u0
	sEEU7l/Fq7Of1IyjpBc4VkibPK++xcegPaLxRFV9Sibn09a9b1ng1Ge29LoB+n3EwP1s
	qIof+EEAYoTiecyWK8i6tY528mVA1ZaUGLfel3ix13xShcwocgRFutyTq1LJypRFECmv
	wcdw04vZkkdikx1RSnqxOuUkBbsgLI7fNdwZaQ47Fu++i60TkBK/6bQMv9I3UeWWHg40
	IdcAjJit8j2ju+3IVgN3/KVNN32Eo2DTk2JM7csBnQ2W/JDjBgYVuHEdQw9BgmVTaCLx
	NsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cR22H5FePXwBpUaAfvzP5w+70uRty7aQb5N2AE5Oq9E=;
	b=Cmry2UNwpjjlSPNf7TmcoxOrtdH95xW51hW1eDm+sMwwl8VhPf5jQW+r7gaWjobLBc
	VHT+LQ/YuixFbUIHBNf8QYuAW1FPO8ZdBb4jenDUHbdmks2AYgBrb3zHJ9bUxQUdRPjr
	EzA6n1fTF+7qn7NtXGbO9Q/BTEpS6DEIAUHJ1/JVCkdf3363yH9Sd5+BmZnKB+oAqWTQ
	8Wdl+yDXCs0dzcKbYYFn8gL3nNWFJFALzYwiHIhG8E8EQ+Tz/WsWat0dK7TO8H0YM86E
	xBIWJM79N0/Ea9BSZvm7WitEnGQqHdVgzKjVsp537gvuWYKU8zwbqJ8wToAENYMImJZ4
	9Exg==
X-Gm-Message-State: APf1xPCA8hO5CZPv9wXHlRjRf/y3KU5LWrPpms8L82nbBZG+O6Pm4QQa
	lZPzY1WOBJzMPs9cdAHcYHrdh6gPaK/MKbbO83Y=
X-Google-Smtp-Source: AG47ELuI4aPZYUPn9vorajMAZf10US/YtNbvmlsT4SClXWOTUebzHyxZFYpW3aTehtMZ+062H5gAr6cF8ZkfX7nqrc4=
X-Received: by 10.223.182.156 with SMTP id j28mr14102590wre.66.1520303482982; 
	Mon, 05 Mar 2018 18:31:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.193 with HTTP; Mon, 5 Mar 2018 18:31:22 -0800 (PST)
In-Reply-To: <20180305104506.GA19075@jama>
References: <1520162492-29839-1-git-send-email-richard.purdie@linuxfoundation.org>
	<20180304141538.GB1370@jama> <20180304162216.GC1370@jama>
	<CAJ86T=VPkRT06Jg7i7CK=mZBWZM_Ssn4a0-8+zf9RQyu-NXQLA@mail.gmail.com>
	<CA+chaQf3SPQZ3UequDT7BOzUGUx0ZcSyow_pgzw-MQwFXnFHLg@mail.gmail.com>
	<CAJ86T=VFg7cfFhUJYssODc5KwdfnBLG9VLbENU+j8ExKmkB57w@mail.gmail.com>
	<20180305104506.GA19075@jama>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 5 Mar 2018 18:31:22 -0800
Message-ID: <CAJ86T=XzZApGtgrW4SvXBgEkNx5Z4d=Wyzndyb+vGx-+2tGa8Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][morty] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Tue, 06 Mar 2018 02:31:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 5, 2018 at 2:45 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Mar 05, 2018 at 01:51:59AM -0800, Andre McCurdy wrote:
>> On Mon, Mar 5, 2018 at 1:19 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Thanks Andre!
>> >
>> > I've seen another failure probably caused by this gcc upgrade in morty-next:
>> >
>> > python-matplotlib triggers ICE:
>> >
>> > src/_png.cpp: In function 'void init_png()':
>> > src/_png.cpp:497:25: warning: variable '_png' set but not used
>> > [-Wunused-but-set-variable]
>> >      static _png_module* _png = NULL;
>> >                          ^~~~
>> > src/_png.cpp: In member function 'Py::Object _png_module::read_png(const
>> > Py::Tuple&)':
>> > src/_png.cpp:272:1: internal compiler error: Segmentation fault
>> >  _png_module::read_png(const Py::Tuple& args)
>> >  ^~~~~~~~~~~
>> > Please submit a full bug report,
>> > with preprocessed source if appropriate.
>> > See <http://gcc.gnu.org/bugs.html> for instructions.
>> > error: command 'i586-oe-linux-gcc' failed with exit status 1
>> > ERROR: Function failed: do_compile (log file is located at
>> > python-matplotlib/1.1.0-r1/temp/log.do_compile.15213)
>> >
>> > I'll try to build it with Khem's and Andre's patches only to eliminate
>> > hjl/indirect/gcc-6-branch/master changes.
>> >
>>
>> FWIW, I see the same error with my OE 2.2 + gcc 6.4.0 based distro.
>> The ICE only happens if I build with -O2 though (the build is clean
>> with -Os, which I use by default).
>>
>> In case it's useful to anyone, my branch of morty with a gcc 6.4.0 backport is:
>>
>>   git clone https://github.com/lgirdk/openembedded-core.git --branch oe22b
>
> You're right with 14 cherry-picks from your branch instead of 6.4
> upgrade from Juro
>
> 8e6e2e3 gcc6: enable FL_LPAE flag for armv7ve cores
> 756e8f2 gcc6: Fix unaligned STRD issue on ARM
> 33e717b tcmode-default.inc: update GCCVERSION 6.3 -> 6.4
> bb03bfd gcc6: Upgrade to 6.4
> cf3be39 gcc-runtime: Disable libitm on riscv
> 8e0fa79 gcc-6.3: Backport patch to fix ICE on ARM
> a77c5c4 gcc-6.3.inc: Use ucontext_t not struct ucontext.
> c5376cb gcc-6.3: backport fix of check for empty string in ubsan.c
> 322dd7f gcc: Remove unused patch
> 07e888e gcc: Fix CVE-2016-6131 in libiberty
> 8c5205d gcc-6: Add fix for missing no-PIE flags
> cf3da73 gcc-6: Sync gcc stddef.h with musl stddef.h
> 953f3e2 gcc6: Upgrade to 6.3.0
> 60ded51 Revert "gcc-6.2: backport fix of check for empty string in ubsan.c"
>
> I can still reproduce it with -O2 and doesn't fail with -Os.

Already seems to have been reported in gcc bugzilla:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82492
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82264

