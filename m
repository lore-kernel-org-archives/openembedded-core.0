Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3D5E77194
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11501.1735723954537043661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hvdyRN9Q;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=K6cVY0TJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101942135ad5f-dc67bf14-935b-4b4c-95eb-a1aff5fc97ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723953;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nodMeBTjVg2iIpZc52KJsnGNrJ50HOwIeDwBneQ1wec=;
	b=hvdyRN9QCHnGWWzgR2Ss1JyyNqNa56PvHHgz/mQdLAizpe8U5nwj1aqyR6tl6D2b
	CEJg6J5E6u1zhi3A9P8MFhy+nOj7nYyUaHEe2gjlhqTsgFVDLQOqaW2/hnptS/tHbe1
	pEVvw+SVDWlVJd3L64b7SkZxi9pBybu4jWrTORBo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723953;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nodMeBTjVg2iIpZc52KJsnGNrJ50HOwIeDwBneQ1wec=;
	b=K6cVY0TJYd0UikXLA8mBZZch8nI5oeGljWjsudmfFCW1P9aZGdmX7DCs7vNF1Hk1
	9wUsQBXVbnRfgDsOvTPV49JM0BS7MrGYxer7orvHcoRMJ8YtYDtPRW4jEm7l3d2lWYw
	4/fL4yDPU+z5JeMwEltUjJA7cqlRkV38M3ec2QT4=
Content-Type: multipart/mixed; boundary="===============6262609936819741463=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] texinfo: upgrading to 7.2 FAILED
Message-ID: <010101942135ad5f-dc67bf14-935b-4b4c-95eb-a1aff5fc97ee-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209238

--===============6262609936819741463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *texinfo* to *7.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade texinfo -V 7.2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:68ccf2aacd0db7e6e9fb3e3307d52814284ef8d6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
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
workspace            = "tmp-auh-upgrades:68ccf2aacd0db7e6e9fb3e3307d52814284ef8d6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-g17dz8aj: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-0tbwf58g/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-0tbwf58g/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:06
Adding changed files:   4% |#                                   | ETA:  0:00:04
Adding changed files:   6% |##                                  | ETA:  0:00:03
Adding changed files:   8% |###                                 | ETA:  0:00:03
Adding changed files:  10% |###                                 | ETA:  0:00:03
Adding changed files:  13% |####                                | ETA:  0:00:02
Adding changed files:  15% |#####                               | ETA:  0:00:02
Adding changed files:  17% |######                              | ETA:  0:00:02
Adding changed files:  19% |#######                             | ETA:  0:00:02
Adding changed files:  21% |#######                             | ETA:  0:00:02
Adding changed files:  23% |########                            | ETA:  0:00:02
Adding changed files:  26% |#########                           | ETA:  0:00:02
Adding changed files:  28% |##########                          | ETA:  0:00:02
Adding changed files:  30% |##########                          | ETA:  0:00:02
Adding changed files:  32% |###########                         | ETA:  0:00:02
Adding changed files:  34% |############                        | ETA:  0:00:02
Adding changed files:  37% |#############                       | ETA:  0:00:02
Adding changed files:  39% |##############                      | ETA:  0:00:02
Adding changed files:  41% |##############                      | ETA:  0:00:02
Adding changed files:  43% |###############                     | ETA:  0:00:01
Adding changed files:  45% |################                    | ETA:  0:00:01
Adding changed files:  47% |#################                   | ETA:  0:00:01
Adding changed files:  50% |##################                  | ETA:  0:00:01
Adding changed files:  52% |##################                  | ETA:  0:00:01
Adding changed files:  54% |###################                 | ETA:  0:00:01
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  58% |#####################               | ETA:  0:00:01
Adding changed files:  60% |#####################               | ETA:  0:00:01
Adding changed files:  63% |######################              | ETA:  0:00:01
Adding changed files:  65% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:01
Adding changed files:  69% |#########################           | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/texinfo/texinfo-7.2.tar.gz...
ERROR: Execution of 'git add -f -A "tp/tests/encoded/Makefile.in" ""tp/tests/encoded/an_\303\257mage.png"" ""tp/tests/encoded/c\303\252ss.css"" "tp/tests/encoded/list-of-tests" ""tp/tests/encoded/os\303\251_utf8.texi"" ""tp/tests/encoded/os\303\251_utf8_no_setfilename.texi"" "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1/manual_include_accented_file_name_latin1.info" "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1_explicit_encoding/manual_include_accented_file_name_latin1.info" "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1_use_locale_encoding/manual_include_accented_file_name_latin1.info" "tp/tests/encoded/res_parser/non_ascii_command_line/Chapteur.html" "tp/tests/encoded/res_parser/non_ascii_command_line/index.html" ""tp/tests/encoded/res_parser/non_ascii_command_line/int\303\251rnal.txt"" ""tp/tests/encoded/res_parser/non_ascii_command_line/os\303\251-texinfo.texi"" ""tp/tests/encoded/res_parser/non_ascii_command_
 line/os\303\251_utf8.1"" ""tp/tests/encoded/res_parser/non_ascii_command_line/os\303\251_utf8.2"" ""tp/tests/encoded/res_parser/non_ascii_command_line/os\303\251_utf8_abt.html"" ""tp/tests/encoded/res_parser/non_ascii_no_setfilename_test_rawtext/os\303\251_utf8_no_setfilename.1"" ""tp/tests/encoded/res_parser/non_ascii_no_setfilename_test_rawtext/os\303\251_utf8_no_setfilename.2"" ""tp/tests/encoded/res_parser/non_ascii_no_setfilename_test_rawtext/os\303\251_utf8_no_setfilename.txt"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8.1"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8.2"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/images/1-an_image.png"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/images/2-an_image.png"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/os\303\251_utf8.opf"" ""tp/tests/encoded/res_parser/non_ascii_test_e
 pub/os\303\251_utf8_epub_package/EPUB/xhtml/Chapteur.xhtml"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/xhtml/nav_toc.xhtml"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/xhtml/os\303\251_utf8.xhtml"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/META-INF/container.xml"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/mimetype"" ""tp/tests/encoded/res_parser/non_ascii_test_info/os\303\251_utf8.1"" ""tp/tests/encoded/res_parser/non_ascii_test_info/os\303\251_utf8.2"" ""tp/tests/encoded/res_parser/non_ascii_test_info/os\303\251_utf8.info"" ""tp/tests/encoded/res_parser/non_ascii_test_latex/os\303\251_utf8.1"" ""tp/tests/encoded/res_parser/non_ascii_test_latex/os\303\251_utf8.2"" ""tp/tests/encoded/res_parser/non_ascii_test_latex/os\303\251_utf8.tex"" ""tp/tests/encoded/res_parser/non_ascii_test_rawtext/os\303\251_utf8.1"" ""tp/tests/encoded/re
 s_parser/non_ascii_test_rawtext/os\303\251_utf8.2"" ""tp/tests/encoded/res_parser/non_ascii_test_rawtext/os\303\251_utf8.txt"" ""tp/tests/encoded/txt_\303\247image.txt"" ""tp/tests/encoded/\303\247ss.css"" "tp/tests/formatting/Makefile.in" "tp/tests/formatting/list-of-tests" "tp/tests/formatting/res_parser/cpp_lines/cpp_lines.html" "tp/tests/formatting/res_parser/defcondx_Dbar/defxcond.html" "tp/tests/formatting/res_parser/defcondx_Ubar/defxcond.html" "tp/tests/formatting/res_parser/documentlanguage_cmdline/documentlanguage.html" "tp/tests/formatting/res_parser/index_entries_relate_to_item/index_entries_relate_to_item.html" "tp/tests/formatting/res_parser/indices_in_begin_tables_lists/indices_in_begin_tables_lists.2" "tp/tests/formatting/res_parser/indices_in_begin_tables_lists/indices_in_begin_tables_lists.html" "tp/tests/formatting/res_parser/indices_in_begin_tables_lists_latex/indices_in_begin_tables_lists.2" "tp/tests/formatting/res_parser/no_content/no_content.html" "tp/tests/f
 ormatting/res_parser/no_content_do_contents/no_content.html" "tp/tests/formatting/res_parser/no_content_do_contents_inline/no_content.html" "tp/tests/formatting/res_parser/no_content_do_contents_separate/no_content.html" "tp/tests/formatting/res_parser/no_content_inline/no_content.html" "tp/tests/formatting/res_parser/no_content_separate/no_content.html" "tp/tests/formatting/res_parser/simplest_test_css/simplest.html" ""tp/tests/included_ak\303\247ent\303\252d.texi"" "tp/tests/layout/Makefile.in" "tp/tests/layout/res_parser/formatting_enable_encoding/formatting.2" "tp/tests/layout/res_parser/formatting_enable_encoding/formatting.html" "tp/tests/layout/res_parser/formatting_epub_nodes/formatting.2" "tp/tests/layout/res_parser/formatting_epub_nodes/formatting_epub_package/EPUB/formatting.opf" "tp/tests/layout/res_parser/formatting_epub_nodes/formatting_epub_package/EPUB/xhtml/chapter.xhtml" "tp/tests/layout/res_parser/formatting_epub_nodes/formatting_epub_package/EPUB/xhtml/chapter2.x
 html" "tp/tests/layout/res_parser/formatting_epub_nodes/formatting_epub_package/EPUB/xhtml/formatting.xhtml" "tp/tests/layout/res_parser/formatting_epub_nodes/formatting_epub_package/EPUB/xhtml/formatting_fot.xhtml" "tp/tests/layout/res_parser/formatting_epub_nodes/formatting_epub_package/EPUB/xhtml/s_002d_002dect_002cion.xhtml" "tp/tests/layout/res_parser/formatting_epub_nodes/formatting_epub_package/EPUB/xhtml/subsection.xhtml" "tp/tests/layout/res_parser/formatting_epub_nodes/formatting_epub_package/EPUB/xhtml/subsubsection-_0060_0060simple_002ddouble_002d_002d.xhtml" "tp/tests/layout/res_parser/formatting_epub_nodes/formatting_epub_package/EPUB/xhtml/subsubsection-three_002d_002d_002dfour_002d_002d_002d_002d_0027_0027.xhtml" "tp/tests/layout/res_parser/formatting_epub_nodes/formatting_epub_package/META-INF/container.xml" "tp/tests/layout/res_parser/formatting_exotic/anchor.html" "tp/tests/layout/res_parser/formatting_exotic/chapter.html" "tp/tests/layout/res_parser/formatting_ex
 otic/chapter2.html" "tp/tests/layout/res_parser/formatting_exotic/formatting.2" "tp/tests/layout/res_parser/formatting_exotic/formatting_abt.html" "tp/tests/layout/res_parser/formatting_exotic/formatting_ovr.html" "tp/tests/layout/res_parser/formatting_exotic/formatting_toc.html" "tp/tests/layout/res_parser/formatting_exotic/index.html" "tp/tests/layout/res_parser/formatting_exotic/s_002d_002dect_002cion.html" "tp/tests/layout/res_parser/formatting_exotic/subsection.html" "tp/tests/layout/res_parser/formatting_exotic/subsubsection-_0060_0060simple_002ddouble_002d_002d.html" "tp/tests/layout/res_parser/formatting_exotic/subsubsection-three_002d_002d_002dfour_002d_002d_002d_002d_0027_0027.html" "tp/tests/layout/res_parser/formatting_fr/formatting.2" "tp/tests/layout/res_parser/formatting_fr/formatting.html" "tp/tests/layout/res_parser/formatting_fr_icons/formatting.2" "tp/tests/layout/res_parser/formatting_fr_icons/formatting.html" "tp/tests/layout/res_parser/formatting_fr_info/format
 ting.2" "tp/tests/layout/res_parser/formatting_fr_info/formatting.info" "tp/tests/layout/res_parser/formatting_info_ascii_punctuation/formatting.2" "tp/tests/layout/res_parser/formatting_info_ascii_punctuation/formatting.info" "tp/tests/layout/res_parser/formatting_info_disable_encoding/formatting.2" "tp/tests/layout/res_parser/formatting_info_disable_encoding/formatting.info" "tp/tests/layout/res_parser/formatting_inline_css/formatting.2" "tp/tests/layout/res_parser/formatting_inline_css/formatting.html" "tp/tests/layout/res_parser/formatting_mathjax/formatting.2" "tp/tests/layout/res_parser/formatting_mathjax/formatting.html" "tp/tests/layout/res_parser/formatting_numerical_entities/formatting.2" "tp/tests/layout/res_parser/formatting_numerical_entities/formatting.html"' failed with exit code 128:
fatal: pathspec 'tp/tests/encoded/an_303257mage.png' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6262609936819741463==--

