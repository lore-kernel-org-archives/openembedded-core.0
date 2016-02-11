Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B981A731C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 21:07:08 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p63so85462937wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 13:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Glbvl9kmPuLZtimJTUfNqqA7oX5Di+XB00TOOuzSsEE=;
	b=CShUna49oP7U/W4v+Q00DWqUnC+7O0mh95O6aiSjOsq3R97xeAmjMUGOrzRC7ieI1o
	++rQRbt6KxRLDZ/nDfBm4QuofgDTf4VNZddFn355F5yERo0vdFeiuqJCzW2IUkBnOaLv
	sXp5FC9FukYqYHkQqn0GdBF9dXevEQ+eORG31+KXA6SWaysqN0IAfUQSMclYhymsYIf6
	n+/3aNI73EaHlcy7os1yMJfRIFgTT5MWET2Z99xbfX7sNBav6fcmEdNXk7vYbj27WOjD
	SR/lGzkbocY0Xd0knnBl4XiiG406KrvJs8p46gHlgvStouvtRmZWdm8BFad2BYOyR0CR
	fsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Glbvl9kmPuLZtimJTUfNqqA7oX5Di+XB00TOOuzSsEE=;
	b=k1CVYkD//7Qmpz59FcdSsBfWwsnqJBSrckhaiZm9/xQJn92kHspyypBSwVONvO0tRG
	4mxR0mPAmizw9HpJMR2E1/WDbCd6yoEeoIm1YCL3TS9wLaZQJqv4YZ+nsT1WXNIaDmrg
	hCsqRYnXsDVHxvmYed5Ac/LT5L0Dw5yorztEps6Bb9eOTpvABOu/FpOPXmO9H5jDznN+
	rOXPKAYau8McG+N29Dt/s2zE1fi63+NGROAph3NJeW5puukc9hSDiskT7a4GlLOp57X5
	pjCV1475dMEkhLCd+WF0OU+UJZPq5hungIuo/1MRbh/H+LDG4XPNTRruDOyXZpTHHjEI
	WVhA==
X-Gm-Message-State: AG10YORHSJaRSqwHsjVC/MHRXeGfQIGCIXVZm4eEEWXBDpdRwYAIKBNx/wiLY0EKQgrFiFjuYhzbcRHwQQkRzQ==
MIME-Version: 1.0
X-Received: by 10.194.158.100 with SMTP id wt4mr13769539wjb.43.1455224828637; 
	Thu, 11 Feb 2016 13:07:08 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 11 Feb 2016 13:07:08 -0800 (PST)
In-Reply-To: <1B0E749C-F6AB-4D7A-9A0C-C4D3E349794A@nathan.to>
References: <1B0E749C-F6AB-4D7A-9A0C-C4D3E349794A@nathan.to>
Date: Thu, 11 Feb 2016 13:07:08 -0800
Message-ID: <CAJ86T=VoQM1-b+UJWWd4grjuyiJEtjRQa12FVJru6R=MGsnxZQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Nathan Sowatskey <nathan@nathan.to>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: util-linux_2.26.2.bb, do_patch failed with exit code '1
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
X-List-Received-Date: Thu, 11 Feb 2016 21:07:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2016 at 8:29 AM, Nathan Sowatskey <nathan@nathan.to> wrote:
> Hi
>
> I am using the Jethro branch of oe-core, and my build is failing with the=
 error below.
>
> This has started happening in the last few days. This build worked as exp=
ected last week.
>
> Has anyone else seen anything like this please?

There's no patch named "nsenter-to-be-more-flexible.patch" in oe-core.

Running "bitbake -e util-linux > env.txt" will show you how SRC_URI is
derived and where the patch is actually coming from.

> I have removed the contents of the tmp, downloads and caches a few times =
to test.
>
> Many thanks
>
> Nathan
>
> ERROR: Command Error: exit status: 1  Output:
> Applying patch nsenter-to-be-more-flexible.patch
> patching file sys-utils/nsenter.c
> Hunk #1 succeeded at 28 with fuzz 1.
> Hunk #2 succeeded at 38 (offset -4 lines).
> Hunk #3 succeeded at 72 (offset -4 lines).
> Hunk #4 FAILED at 94.
> Hunk #5 succeeded at 96 (offset -7 lines).
> Hunk #6 succeeded at 106 (offset -7 lines).
> Hunk #7 succeeded at 196 (offset -10 lines).
> Hunk #8 FAILED at 214.
> Hunk #9 succeeded at 217 (offset -13 lines).
> Hunk #10 FAILED at 309.
> Hunk #11 succeeded at 374 (offset -32 lines).
> 3 out of 11 hunks FAILED -- rejects in file sys-utils/nsenter.c
> Patch nsenter-to-be-more-flexible.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in: /home/builder/git/iox-yocto-build/tm=
p/work/core2-64-poky-linux/util-linux/2.26.2-r0/temp/log.do_patch.116544
> ERROR: Task 2897 (/home/builder/git/oe-core/meta/recipes-core/util-linux/=
util-linux_2.26.2.bb, do_patch) failed with exit code '1'
>
> =E2=80=94
> Nathan John Sowatskey
> Consulting Engineer - Programmable Infrastructure, DevOps, IoT and SDN
> nathan@nathan.to
> www.linkedin.com/in/nathandevops
> XMPP: nathandotto@im.koderoot.net
> Google: nathanjohnsowatskey@gmail.com
> Skype: nathan_sowatskey
> Twitter: NathanDotTo
> GitHub: https://github.com/DevOps4Networks
> http://www.kipling.org.uk/poems_if.htm
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

