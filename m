Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2064E77197
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.33345.1734254982740857394
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Tood5BV3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dUhWwCWV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010193c9a6f2e7-5bb5abd8-4f53-49cc-94fc-6735bfa183b7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ilKDhiC5Wug9M/KtngcV7ZJlrNsXRBIY7l3wUcqCH+8=;
	b=Tood5BV3U+QQd7xQJPXbL52DY7+dTRY5+fOnzHR46m6TFm7pY0MrPEuN0znwFRHx
	emUxP89zASM/uUeS9PD8eGwMTDqJcKRe5L2PWhwlkbwg0gQgEG2LUR0UJuLfqJjt+Vo
	xc8og2qUPtLpE4RpJxiGR9n8ovNkaCsAKbfXnPE0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ilKDhiC5Wug9M/KtngcV7ZJlrNsXRBIY7l3wUcqCH+8=;
	b=dUhWwCWVXUe0oUq8uwolmgUHwbvPKrOQRJn/Zb7eedJV0ehewKhlnZT8LULf//wn
	ZeIyfrbua7hoqC7a6z+CGCcU8BIMaZpjH/pzgKXYQTPmFDNQe5Usy57D4GAb2QD2UZp
	PFzcFxfwNITTC0ZMDATZ0KXyIgTurJEo2TM8Ba5M=
Content-Type: multipart/mixed; boundary="===============1099876919798535031=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kbd: upgrading to 2.7 FAILED
Message-ID: <01010193c9a6f2e7-5bb5abd8-4f53-49cc-94fc-6735bfa183b7-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208716

--===============1099876919798535031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kbd* to *2.7* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade kbd -V 2.7
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7a5cf81d6d0c7e61e6b4d4e3fc24348e086ec943"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7a5cf81d6d0c7e61e6b4d4e3fc24348e086ec943"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-ovkerft7: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-x_rhyvzk/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-x_rhyvzk/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.7.tar.xz...
ERROR: Execution of 'git add -f -A "docs/doc/kbd.FAQ-9.html" "docs/doc/kbd.FAQ.html" "docs/doc/kbd.FAQ.sgml" "docs/doc/kbd.FAQ.txt" "docs/doc/n474.doc" "docs/doc/repeat/set_kbd_repeat-1" "docs/doc/repeat/set_kbd_repeat-2" "docs/doc/scancodes/README" "docs/doc/utf/README" "docs/doc/utf/ethiopic" "docs/doc/utf/utfdemo" "docs/doc/utf/utflist" ""docs/doc/utf/\342\231\252\342\231\254"" "docs/man/Makefile" "docs/man/Makefile.in" "docs/man/man1/Makefile" "docs/man/man1/Makefile.am" "docs/man/man1/Makefile.in" "docs/man/man1/chvt.1" "docs/man/man1/deallocvt.1" "docs/man/man1/dumpkeys.1" "docs/man/man1/dumpkeys.1.in" "docs/man/man1/fgconsole.1" "docs/man/man1/kbd_mode.1" "docs/man/man1/kbdinfo.1" "docs/man/man1/loadkeys.1" "docs/man/man1/loadkeys.1.in" "docs/man/man1/openvt.1" "docs/man/man1/setleds.1" "docs/man/man1/setmetamode.1" "docs/man/man1/showkey.1" "docs/man/man1/unicode_start.1" "docs/man/man1/unicode_stop.1" "docs/man/man1/vlock.1" "docs/man/man1misc/Makefile" "docs/man/man1misc/Ma
 kefile.in" "docs/man/man1misc/codepage.1" "docs/man/man1misc/screendump.1" "docs/man/man5/Makefile" "docs/man/man5/Makefile.in" "docs/man/man5/keymaps.5" "docs/man/man8/Makefile" "docs/man/man8/Makefile.am" "docs/man/man8/Makefile.in" "docs/man/man8/getkeycodes.8" "docs/man/man8/loadunimap.8" "docs/man/man8/loadunimap.8.in" "docs/man/man8/mapscrn.8" "docs/man/man8/mapscrn.8.in" "docs/man/man8/setfont.8" "docs/man/man8/setfont.8.in" "docs/man/man8/setkeycodes.8" "docs/man/man8/setvtrgb.8" "docs/man/man8/showconsolefont.8" "docs/man/man8misc/Makefile" "docs/man/man8misc/Makefile.in" "docs/man/man8misc/clrunimap.8" "docs/man/man8misc/getunimap.8" "docs/man/man8misc/mk_modmap.8" "docs/man/man8misc/setlogcons.8" "docs/man/man8misc/setvesablank.8" "docs/man/man8misc/vcstime.8" "docs/process/howto-contribute.md" "docs/reference/Makefile" "docs/reference/Makefile.in" "docs/reference/libkeymap/Makefile" "docs/reference/libkeymap/Makefile.in" "m4/libtool.m4" "m4/ltoptions.m4" "m4/ltsugar.m4" 
 "m4/ltversion.m4" "m4/lt~obsolete.m4" "po/POTFILES.in" "po/cs.gmo" "po/cs.po" "po/da.gmo" "po/da.po" "po/de.gmo" "po/de.po" "po/el.gmo" "po/el.po" "po/eo.gmo" "po/eo.po" "po/es.gmo" "po/es.po" "po/fr.gmo" "po/fr.po" "po/gr.gmo" "po/gr.po" "po/id.gmo" "po/id.po" "po/it.gmo" "po/it.po" "po/kbd.pot" "po/nl.gmo" "po/nl.po" "po/pl.gmo" "po/pl.po" "po/pt.gmo" "po/pt.po"' failed with exit code 128:
fatal: pathspec 'docs/doc/utf/342231252342231254' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1099876919798535031==--

