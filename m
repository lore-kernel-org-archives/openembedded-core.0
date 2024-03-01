Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54151C54EB7
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.36640.1709330717358521387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=H6z+IcMZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HwNWgZzl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dfc0cd810-1e0618ac-6684-401e-803a-8d883480ad90-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dtvxyVqdv3we88UJFvyvqFPD4myg0JD8XkGPTIp4N+Y=;
	b=H6z+IcMZTz50b2r7522i3JmNhCuwSNsWoVBhVaxkPgS8oCPtO/gKdRi9H7Pd1NpV
	8BfPnpToBupeKPw9DOcV2qfFgKaOkjctL3dA171U/VuEsyZKZnUKHkqz2RsGkJSUzQg
	HthqozQxtlDTgVvfYygWzjqDMOJDkH76CQ3Sdx9E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dtvxyVqdv3we88UJFvyvqFPD4myg0JD8XkGPTIp4N+Y=;
	b=HwNWgZzl3IrmCthd1wcCgHf9FjT9h0VEN/a21QXA1wH52PGuMsJOqSfQQgBVP0Ns
	KZ8noujREvmqqEhsh5blLDUGyrkpszdot6pScYq32UnlH1tEtBC3+dIh3Xx2cYkRLtp
	ojQxp0PAhBKUt662N/gcgomqAh2GZtmx2W3JV7Mg=
Content-Type: multipart/mixed; boundary="===============5937458295406402934=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] texinfo: upgrading to 7.1 FAILED
Message-ID: <0101018dfc0cd810-1e0618ac-6684-401e-803a-8d883480ad90-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196513

--===============5937458295406402934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *texinfo* to *7.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade texinfo -V 7.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1865 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3a2b49ab3d9167b9b6bd3780b82dd35949e673b1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3a2b49ab3d9167b9b6bd3780b82dd35949e673b1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1865 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (915 cached, 2 parsed). 1864 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3a2b49ab3d9167b9b6bd3780b82dd35949e673b1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3a2b49ab3d9167b9b6bd3780b82dd35949e673b1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:09
Adding changed files:   3% |#                                   | ETA:  0:00:06
Adding changed files:   5% |##                                  | ETA:  0:00:05
Adding changed files:   7% |##                                  | ETA:  0:00:04
Adding changed files:   9% |###                                 | ETA:  0:00:04
Adding changed files:  11% |####                                | ETA:  0:00:04
Adding changed files:  13% |####                                | ETA:  0:00:04
Adding changed files:  14% |#####                               | ETA:  0:00:03
Adding changed files:  16% |######                              | ETA:  0:00:03
Adding changed files:  18% |######                              | ETA:  0:00:03
Adding changed files:  20% |#######                             | ETA:  0:00:03
Adding changed files:  22% |########                            | ETA:  0:00:03
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/texinfo/texinfo-7.1.tar.gz...
ERROR: Execution of 'git add -f -A "tp/tests/customization/res_parser/sectioning_directions_split_chapter/First-node.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/Last-node-no-description.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/Second-node.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/Third-node-unnumbered.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/between-node.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/index.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/numbered-sub.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/numbered-sub2.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/numbered-sub3.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/numbered.html" "tp/tests/customization/res_parser/sectioning_directio
 ns_split_chapter/sectioning.1" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/sectioning.2" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/sectioning_abt.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/sectioning_toc.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/unnumbered-sub.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/unnumbered-sub2.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/unnumbered.html" "tp/tests/customization/res_parser/sectioning_directions_split_chapter/unnumbered2.html" "tp/tests/customization/res_parser/sectioning_without_anchors/sectioning.1" "tp/tests/customization/res_parser/sectioning_without_anchors/sectioning.2" "tp/tests/customization/res_parser/sectioning_without_anchors/sectioning.html" "tp/tests/customization/res_parser/test_redefine_need/test_need.1" "tp/tests/customization/res_parser/te
 st_redefine_need/test_need.2" "tp/tests/customization/res_parser/test_redefine_need/test_need.html" "tp/tests/customization/res_parser/texi_ignore_and_comments/ignore_and_comments.1" "tp/tests/customization/res_parser/texi_ignore_and_comments/ignore_and_comments.2" "tp/tests/customization/res_parser/texi_ignore_and_comments/ignore_and_comments.texi" "tp/tests/customization/sectioning.texi" "tp/tests/customization/test_need.texi" "tp/tests/encoded/Makefile.am" "tp/tests/encoded/Makefile.in" ""tp/tests/encoded/an_\303\257mage.png"" ""tp/tests/encoded/c\303\252ss.css"" "tp/tests/encoded/list-of-tests" "tp/tests/encoded/manual_include_accented_file_name_latin1.texi" ""tp/tests/encoded/os\303\251_utf8.texi"" ""tp/tests/encoded/os\303\251_utf8_no_setfilename.texi"" "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1/manual_include_accented_file_name_latin1.1" "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1/manual_include_accented_file_name_latin1.2"
  "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1/manual_include_accented_file_name_latin1.info" "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1_explicit_encoding/manual_include_accented_file_name_latin1.1" "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1_explicit_encoding/manual_include_accented_file_name_latin1.2" "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1_explicit_encoding/manual_include_accented_file_name_latin1.info" "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1_use_locale_encoding/manual_include_accented_file_name_latin1.1" "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1_use_locale_encoding/manual_include_accented_file_name_latin1.2" "tp/tests/encoded/res_parser/manual_include_accented_file_name_latin1_use_locale_encoding/manual_include_accented_file_name_latin1.info" "tp/tests/encoded/res_parser/non_ascii_command_line/Chapteur.html" "tp/test
 s/encoded/res_parser/non_ascii_command_line/index.html" ""tp/tests/encoded/res_parser/non_ascii_command_line/int\303\251rnal.txt"" ""tp/tests/encoded/res_parser/non_ascii_command_line/os\303\251-texinfo.texi"" ""tp/tests/encoded/res_parser/non_ascii_command_line/os\303\251_utf8.1"" ""tp/tests/encoded/res_parser/non_ascii_command_line/os\303\251_utf8.2"" ""tp/tests/encoded/res_parser/non_ascii_command_line/os\303\251_utf8_abt.html"" ""tp/tests/encoded/res_parser/non_ascii_no_setfilename_test_rawtext/os\303\251_utf8_no_setfilename.1"" ""tp/tests/encoded/res_parser/non_ascii_no_setfilename_test_rawtext/os\303\251_utf8_no_setfilename.2"" ""tp/tests/encoded/res_parser/non_ascii_no_setfilename_test_rawtext/os\303\251_utf8_no_setfilename.txt"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8.1"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8.2"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/images/1-an_image.png"" ""
 tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/images/2-an_image.png"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/os\303\251_utf8.opf"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/xhtml/Chapteur.xhtml"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/xhtml/nav_toc.xhtml"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/EPUB/xhtml/os\303\251_utf8.xhtml"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/META-INF/container.xml"" ""tp/tests/encoded/res_parser/non_ascii_test_epub/os\303\251_utf8_epub_package/mimetype"" ""tp/tests/encoded/res_parser/non_ascii_test_info/os\303\251_utf8.1"" ""tp/tests/encoded/res_parser/non_ascii_test_info/os\303\251_utf8.2"" ""tp/tests/encoded/res_parser/non_ascii_test_info/os\303\251_utf8.info"" ""tp/tests/encoded/res_parser/non_ascii_test_latex/
 os\303\251_utf8.1"" ""tp/tests/encoded/res_parser/non_ascii_test_latex/os\303\251_utf8.2"" ""tp/tests/encoded/res_parser/non_ascii_test_latex/os\303\251_utf8.tex"" ""tp/tests/encoded/res_parser/non_ascii_test_rawtext/os\303\251_utf8.1"" ""tp/tests/encoded/res_parser/non_ascii_test_rawtext/os\303\251_utf8.2"" ""tp/tests/encoded/res_parser/non_ascii_test_rawtext/os\303\251_utf8.txt"" "tp/tests/encoded/test_latin1_no_documentencoding.texi" ""tp/tests/encoded/txt_\303\247image.txt"" ""tp/tests/encoded/\303\247ss.css"" "tp/tests/formatting/defxcond.texi" "tp/tests/formatting/index_entries_relate_to_item.texi" "tp/tests/formatting/indices_in_begin_tables_lists.texi" "tp/tests/formatting/no_content.texi" "tp/tests/formatting/res_parser/defcondx_Dbar/defxcond.1" "tp/tests/formatting/res_parser/defcondx_Dbar/defxcond.2" "tp/tests/formatting/res_parser/defcondx_Dbar/defxcond.html" "tp/tests/formatting/res_parser/defcondx_Ubar/defxcond.1" "tp/tests/formatting/res_parser/defcondx_Ubar/defxcond.
 2" "tp/tests/formatting/res_parser/defcondx_Ubar/defxcond.html" "tp/tests/formatting/res_parser/index_entries_relate_to_item/index_entries_relate_to_item.1" "tp/tests/formatting/res_parser/index_entries_relate_to_item/index_entries_relate_to_item.2" "tp/tests/formatting/res_parser/index_entries_relate_to_item/index_entries_relate_to_item.html" "tp/tests/formatting/res_parser/indices_in_begin_tables_lists/indices_in_begin_tables_lists.1" "tp/tests/formatting/res_parser/indices_in_begin_tables_lists/indices_in_begin_tables_lists.2" "tp/tests/formatting/res_parser/indices_in_begin_tables_lists/indices_in_begin_tables_lists.html" "tp/tests/formatting/res_parser/indices_in_begin_tables_lists_latex/indices_in_begin_tables_lists.1" "tp/tests/formatting/res_parser/indices_in_begin_tables_lists_latex/indices_in_begin_tables_lists.2" "tp/tests/formatting/res_parser/indices_in_begin_tables_lists_latex/indices_in_begin_tables_lists.tex" "tp/tests/formatting/res_parser/info_extension_warning/foo
 .info.1" "tp/tests/formatting/res_parser/info_extension_warning/foo.info.2" "tp/tests/formatting/res_parser/no_content/no_content.1"' failed with exit code 128:
fatal: pathspec 'tp/tests/encoded/an_303257mage.png' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5937458295406402934==--

