Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A712C64E65
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.5193.1668517535851856650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kOoBGKar;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101847b652107-e2b5cbfa-a89d-4839-9702-c1d4bd5d365a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kj5/VOeaDj5eMzCN3N8iav6oZ7H5m1CFfuIlTiWjSjc=;
	b=kOoBGKarQK8/znZVCySomlLDgxb0NwL35GL1BP5JA7kVJm6jtrf6VI3BpVvGtdlR
	vgUvuCZaQ/zb0D3b5J9dAEt5p8BkfhuBkZZnPabOsMhk8PYO2Yi9WYXTXe/L/sst9/M
	gm54AUybOFp58mi01rAYIM45eyhrFaW9luhGZKD4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kj5/VOeaDj5eMzCN3N8iav6oZ7H5m1CFfuIlTiWjSjc=;
	b=DnQ4DwV06+UJUhIfVkoxXPuUcgNOFjh3+KSoTXDkAMLqnMxAxEF3Dfk3BmcmBMAp
	1YnPshQtPuhRhkCdl+SZTbQZn5aUpDTbHFh3UINATR2xGQkc5jhnaNeBLaSsYnrlHVd
	xy1j3vpnXvZw4mRFm/jZtlWDy0ULFCQy3Wn8c4gk=
Content-Type: multipart/mixed; boundary="===============5006527500259643983=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] texinfo: upgrading to 7.0 FAILED
Message-ID: <010101847b652107-e2b5cbfa-a89d-4839-9702-c1d4bd5d365a-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173307

--===============5006527500259643983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *texinfo* to *7.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade texinfo -V 7.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ce6507462d5ccdbf47ebcc1bcb1ff3532d4ecd57"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (886 cached, 2 parsed). 1666 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ce6507462d5ccdbf47ebcc1bcb1ff3532d4ecd57"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:06
Adding changed files:   4% |#                                   | ETA:  0:00:04
Adding changed files:   7% |##                                  | ETA:  0:00:03
Adding changed files:   9% |###                                 | ETA:  0:00:03
Adding changed files:  11% |####                                | ETA:  0:00:03
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.tar.gz...
ERROR: Execution of 'git add -f -A "tp/t/results/xtable/inter_item_commands_in_table_in_example/res_latex/inter_item_commands_in_table_in_example.tex" "tp/t/test_parse_texi_line.t" "tp/t/test_parser_registrar.t" "tp/t/test_protect_contents.t" "tp/t/transformations.t" "tp/tests/contents/res_parser/double_contents_after_title_book_chapter/double_contents_1.html" "tp/tests/contents/res_parser/double_contents_after_title_book_chapter/double_contents_top.html" ""tp/tests/formatting/an_\303\257mage.png"" ""tp/tests/formatting/c\303\252ss.css"" "tp/tests/formatting/documentlanguage.texi" "tp/tests/formatting/manual_include_accented_file_name_latin1.texi" ""tp/tests/formatting/os\303\251_utf8.texi"" ""tp/tests/formatting/os\303\251_utf8_no_setfilename.texi"" "tp/tests/formatting/res_parser/cpp_lines/cpp_lines.1" "tp/tests/formatting/res_parser/cpp_lines/cpp_lines.2" "tp/tests/formatting/res_parser/cpp_lines/cpp_lines.html" "tp/tests/formatting/res_parser/documentlanguage_cmdline/documentlang
 uage.1" "tp/tests/formatting/res_parser/documentlanguage_cmdline/documentlanguage.2" "tp/tests/formatting/res_parser/documentlanguage_cmdline/documentlanguage.html" "tp/tests/formatting/res_parser/manual_include_accented_file_name_latin1/manual_include_accented_file_name_latin1.1" "tp/tests/formatting/res_parser/manual_include_accented_file_name_latin1/manual_include_accented_file_name_latin1.2" "tp/tests/formatting/res_parser/manual_include_accented_file_name_latin1/manual_include_accented_file_name_latin1.info" "tp/tests/formatting/res_parser/manual_include_accented_file_name_latin1_explicit_encoding/manual_include_accented_file_name_latin1.1" "tp/tests/formatting/res_parser/manual_include_accented_file_name_latin1_explicit_encoding/manual_include_accented_file_name_latin1.2" "tp/tests/formatting/res_parser/manual_include_accented_file_name_latin1_explicit_encoding/manual_include_accented_file_name_latin1.info" "tp/tests/formatting/res_parser/manual_include_accented_file_name_lati
 n1_use_locale_encoding/manual_include_accented_file_name_latin1.1" "tp/tests/formatting/res_parser/manual_include_accented_file_name_latin1_use_locale_encoding/manual_include_accented_file_name_latin1.2" "tp/tests/formatting/res_parser/manual_include_accented_file_name_latin1_use_locale_encoding/manual_include_accented_file_name_latin1.info" "tp/tests/formatting/res_parser/non_ascii_command_line/Chapteur.html" "tp/tests/formatting/res_parser/non_ascii_command_line/index.html" ""tp/tests/formatting/res_parser/non_ascii_command_line/int\303\251rnal.txt"" ""tp/tests/formatting/res_parser/non_ascii_command_line/os\303\251-texinfo.texi"" ""tp/tests/formatting/res_parser/non_ascii_command_line/os\303\251_utf8.1"" ""tp/tests/formatting/res_parser/non_ascii_command_line/os\303\251_utf8.2"" ""tp/tests/formatting/res_parser/non_ascii_command_line/os\303\251_utf8_abt.html"" ""tp/tests/formatting/res_parser/non_ascii_no_setfilename_test_rawtext/os\303\251_utf8_no_setfilename.1"" ""tp/tests/form
 atting/res_parser/non_ascii_no_setfilename_test_rawtext/os\303\251_utf8_no_setfilename.2"" ""tp/tests/formatting/res_parser/non_ascii_no_setfilename_test_rawtext/os\303\251_utf8_no_setfilename.txt"" ""tp/tests/formatting/res_parser/non_ascii_test_epub/os\303\251_utf8.1"" ""tp/tests/formatting/res_parser/non_ascii_test_epub/os\303\251_utf8.2"" ""tp/tests/formatting/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/images/1-an_image.png"" ""tp/tests/formatting/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/images/2-an_image.png"" ""tp/tests/formatting/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/os\303\251_utf8.opf"" ""tp/tests/formatting/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/xhtml/Chapteur.xhtml"" ""tp/tests/formatting/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/xhtml/nav_toc.xhtml"" ""tp/tests/formatting/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/xhtml/os\303\25
 1_utf8.xhtml"" ""tp/tests/formatting/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/xhtml/os\303\251_utf8_abt.xhtml"" ""tp/tests/formatting/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/META-INF/container.xml"" ""tp/tests/formatting/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/mimetype"" ""tp/tests/formatting/res_parser/non_ascii_test_latex/os\303\251_utf8.1"" ""tp/tests/formatting/res_parser/non_ascii_test_latex/os\303\251_utf8.2"" ""tp/tests/formatting/res_parser/non_ascii_test_latex/os\303\251_utf8.tex"" ""tp/tests/formatting/res_parser/non_ascii_test_rawtext/os\303\251_utf8.1"" ""tp/tests/formatting/res_parser/non_ascii_test_rawtext/os\303\251_utf8.2"" ""tp/tests/formatting/res_parser/non_ascii_test_rawtext/os\303\251_utf8.txt"" "tp/tests/formatting/res_parser/texi_ignore_and_comments/ignore_and_comments.texi" ""tp/tests/formatting/\303\247ss.css"" ""tp/tests/included_ak\303\247ent\303\252d.texi"" "tp/tests/indices/indices_in_begin_
 tables_lists.texi" "tp/tests/indices/res_parser/indices_in_begin_tables_lists/indices_in_begin_tables_lists.1" "tp/tests/indices/res_parser/indices_in_begin_tables_lists/indices_in_begin_tables_lists.2" "tp/tests/indices/res_parser/indices_in_begin_tables_lists/indices_in_begin_tables_lists.html" "tp/tests/indices/res_parser/indices_in_begin_tables_lists_latex/indices_in_begin_tables_lists.1" "tp/tests/indices/res_parser/indices_in_begin_tables_lists_latex/indices_in_begin_tables_lists.2" "tp/tests/indices/res_parser/indices_in_begin_tables_lists_latex/indices_in_begin_tables_lists.tex" "tp/tests/indices/res_parser_info/indices_in_begin_tables_lists/indices_in_begin_tables_lists.1" "tp/tests/indices/res_parser_info/indices_in_begin_tables_lists/indices_in_begin_tables_lists.2" "tp/tests/indices/res_parser_info/indices_in_begin_tables_lists/indices_in_begin_tables_lists.info" "tp/tests/indices/res_parser_info/indices_in_begin_tables_lists_latex/indices_in_begin_tables_lists.1" "tp/te
 sts/indices/res_parser_info/indices_in_begin_tables_lists_latex/indices_in_begin_tables_lists.2" "tp/tests/indices/res_parser_info/indices_in_begin_tables_lists_latex/indices_in_begin_tables_lists.tex" "tp/tests/input/included_latin1.texi" "tp/tests/layout/res_parser/formatting_enable_encoding/formatting.1" "tp/tests/layout/res_parser/formatting_enable_encoding/formatting.2" "tp/tests/layout/res_parser/formatting_enable_encoding/formatting.html" "tp/tests/layout/res_parser/formatting_epub/formatting.1" "tp/tests/layout/res_parser/formatting_epub/formatting.2" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/formatting.opf" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/10-f--ile.e--xt" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/14-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/15-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_
 epub_package/EPUB/images/16-f--ile.e--xt" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/17-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/18-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/19-f--ile.e--xt" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/21-f--ile.e--xt" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/25-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/26-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/27-f--ile.e--xt" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/28-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/29-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/3-f--ile.png" 
 "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/30-f--ile.e--xt" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/32-f--ile.e--xt" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/36-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/37-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/38-f--ile.e--xt" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/39-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/4-f--ile.png" "tp/tests/layout/res_parser/formatting_epub/formatting_epub_package/EPUB/images/40-f--ile.png"' failed with exit code 128:
fatal: pathspec 'tp/tests/formatting/an_303257mage.png' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5006527500259643983==--

