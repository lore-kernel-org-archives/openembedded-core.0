Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B0AC77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 14:41:10 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.24912.1684852862257788129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 07:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mAU/GVHp;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ae50da739dso48715805ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 07:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684852861; x=1687444861;
        h=thread-index:content-language:mime-version:message-id:date:subject
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=thPCzFEg8JqF+W831HC01axCAIGiJGNnzgZTXjwLeYw=;
        b=mAU/GVHpR4Ayr2jysoHaOu9Nz+CIb7+GJJ4lkH+WxAgg6spYOcXNkDD0yVOuD4qdAS
         EbKGYIlLyA3PUIbpwd17MtxW8Yr/5mu2jt5jfiDCCa31by4+tXsqvzaeMs9V8uYhYqsv
         CNVbBn1b3pRSv1QOi8Z6Ltf7/9TVHDKKdWr2/FLPs9S6R4AfYHAHR/kZYSKx2uiw7YN3
         0xfI4/Qpj9bLPFvX/Uo3Gl/qq/bBct5Op743pWNSurXNg02+0jEIbyk48d4MFgZt+IT3
         3XniLgOk7nkqvywtcqVB+8Vcm0Dlfqpth6Cl8oDfVMsSq3blU+o0gkwZdidNpICzTTRb
         irUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684852861; x=1687444861;
        h=thread-index:content-language:mime-version:message-id:date:subject
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thPCzFEg8JqF+W831HC01axCAIGiJGNnzgZTXjwLeYw=;
        b=hCv+iyIUW94tFb20w7ROhUwtNZRcdU6oRgZik6k+EsraVjO35AESu+3tYKM0979YKT
         2R4xoeAZ62bubeEsJLm0L+gYO58VnnZZv3LtgXkzUhcYf2bduSz5XL3Qr05iShx6qGT6
         OQWM38J3aY3aNysZ4rjKB8iIMDB+6SEqWguco2GF4ms3G7IfAOYDKrscN4qgYvZOVKQq
         SA03KZ+/xDp0/P4PBokIyFZXourUu9Tc9w3k/6bFCfn/w0kURHHmdmD2aRoXmo0x+z65
         HDPJ3geRoEWn3nTxVs81hTbJT/LXWVc6XuU7TObwLYg2wT01IK4dz0bR2k7T41Nwvn1P
         yQlw==
X-Gm-Message-State: AC+VfDyvaWVPEGh9ZvvSRWvXLJDxBHiktDWQBxe9vjWpn5AaMfg78sMc
	dS8VLcRrSeNjZM/Ip1j4X6OrJHnc06o=
X-Google-Smtp-Source: ACHHUZ5fqHZDAUNdAJ5x7Dx8KFsTXJOE026GNRBqFebYvMT5eTTW6KpRkGnWucXKs1chil7x0L+hOQ==
X-Received: by 2002:a17:902:b404:b0:1ac:7ea7:6ccd with SMTP id x4-20020a170902b40400b001ac7ea76ccdmr11810265plr.34.1684852861067;
        Tue, 23 May 2023 07:41:01 -0700 (PDT)
Received: from skjolley ([2600:1011:a110:fb5:3813:85e0:f5e9:8cd9])
        by smtp.gmail.com with ESMTPSA id x6-20020a170902ea8600b00199193e5ea1sm6880533plb.61.2023.05.23.07.40.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 May 2023 07:41:00 -0700 (PDT)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@lists.yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Yocto Project Status 23 May 2023 (WW21)
Date: Tue, 23 May 2023 07:40:59 -0700
Message-ID: <0d9e01d98d84$97d0e6f0$c772b4d0$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0D9F_01D98D49.EB76C9E0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AdmNhEuLIQ2GzPv+SpSVPZycbkj/Fg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 14:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181637

This is a multipart message in MIME format.

------=_NextPart_000_0D9F_01D98D49.EB76C9E0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Current Dev Position: YP 4.3 M1

Next Deadline: 5th June 2023 YP 4.3 M1 build date

 

Next Team Meetings:

*	Bug Triage meeting Thursday May 25th 7:30 am PDT (
<https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09>
https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
*	Weekly Project Engineering Sync Tuesday May 23rd at 8 am PDT (
<https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09>
https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
<https://zoom.us/j/990892712> )
*	Twitch -  See  <https://www.twitch.tv/theyoctojester>
https://www.twitch.tv/theyoctojester

 

Key Status/Updates:

*	YP 4.0.10 is ready to release after TSC review
*	YP 4.2.1 is in QA

*	M1 is approaching fast (two weeks left), so please try and get any
major changes submitted soon.

*	Patches have been merging into master, thanks to everyone for both
review feedback and iterating on patches
*	We need to upgrade to gcc 13 soon, this is blocking enabling Fedora
38 workers on the autobuilder as we don't have a compatible uninative
release.
*	There are time64 patches being proposed to handle Y2038 issues on 32
bit architectures which likely need further discussion since the compiler
flag changes aren't without risk and potential side effects.
*	We're aiming to improve documentation as we go along in this
release, please keep this in mind when sending patches. Adding to the
documentation as we go will make the release a lot easier.
*	Autobuilder instability is a concern as known good builds are
regularly hitting issues, particularly the "ubuntu 20.04 libgcc not found"
issue which is likely python version specific but there are other
intermittent issues too. As an example, three of the last nightly builds
failed in succession. Due to the intermittent nature of these bugs, few
people are willing to spend time on them but they mean patches are being
very slow to merge. Help is very much needed but it is hard to be specific
about where/what the issue is unfortunately.

 

Ways to contribute:

*	As people are likely aware, the project has a number of components
which are either unmaintained, or have people with little to no time trying
to keep them alive. These components include: patchtest, layerindex,
devtool, toaster, wic, oeqa, autobuilder, CROPs containers, pseudo and more.
Many have open bugs. Help is welcome in trying to better look after these
components!
*	There are bugs identified as possible for newcomers to the project:
<https://wiki.yoctoproject.org/wiki/Newcomers>
https://wiki.yoctoproject.org/wiki/Newcomers
*	There are bugs that are currently unassigned for YP 4.3. See:
<https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.3_Unassigned_Enha
ncements.2FBugs>
https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.3_Unassigned_Enhan
cements.2FBugs
*	We'd welcome new maintainers for recipes in OE-Core. Please see the
list at:
<http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/mai
ntainers.inc>
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/main
tainers.inc and discuss with the existing maintainer, or ask on the OE-Core
mailing list. We will likely move a chunk of these to "Unassigned" soon to
help facilitate this.
*	Help is very much welcome in trying to resolve our autobuilder
intermittent issues. You can see the list of failures we're continuing to
see by searching for the "AB-INT" tag in bugzilla:
<https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT>
https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT.
*	Help us resolve CVE issues:
<https://autobuilder.yocto.io/pub/non-release/patchmetrics/> CVE metrics 
*	We have a growing number of bugs in bugzilla, any help with them is
appreciated.

 

YP 4.3 Milestone Dates:

*	YP 4.3 M1 build date  2023/06/05
*	YP 4.3 M1 Release date 2023/06/16
*	YP 4.3 M2 build date  2023/07/17
*	YP 4.3 M2 Release date 2023/07/28
*	YP 4.3 M3 build date  2023/08/28
*	YP 4.3 M3 Release date 2023/09/08
*	YP 4.3 M4 build date  2023/10/02
*	YP 4.3 M4 Release date 2023/10/27

 

Upcoming dot releases:

*	YP 4.0.10 is ready for release
*	YP 4.2.1 is in QA
*	YP 4.2.1 Release date 2023/06/02
*	YP 3.1.26 build date 2023/06/19
*	YP 3.1.26 Release date 2023/06/30
*	YP 4.0.11 build date 2023/06/26
*	YP 4.0.11 Release date 2023/07/07
*	YP 4.2.2 build date 2023/07/10
*	YP 4.2.2 Release date 2023/07/21 
*	YP 3.1.27 build date 2023/07/31
*	YP 3.1.27 Release date 2023/08/11
*	YP 4.0.12 build date 2023/08/07
*	YP 4.0.12 Release date 2023/08/18
*	YP 4.2.3 build date 2023/08/28
*	YP 4.2.3 Release date 2023/09/08
*	YP 3.1.28 build date 2023/09/18
*	YP 3.1.28 Release date 2023/09/29
*	YP 4.0.13 build date 2023/09/25
*	YP 4.0.13 Release date 2023/10/06
*	YP 3.1.29 build date 2023/10/30
*	YP 3.1.29 Release date 2023/11/10
*	YP 4.0.14 build date 2023/11/06
*	YP 4.0.14 Release date 2023/11/17
*	YP 4.2.4 build date 2023/11/13
*	YP 4.2.4 Release date 2023/11/24
*	YP 3.1.30 build date 2023/12/11
*	YP 3.1.30 Release date 2023/12/22
*	YP 4.0.15 build date 2023/12/18
*	YP 4.0.15 Release date 2023/12/29

 

Tracking Metrics:

*	WDD 2527 (last week 2535) (
<https://wiki.yoctoproject.org/charts/combo.html>
https://wiki.yoctoproject.org/charts/combo.html)
*	OE-Core/Poky Patch Metrics

*	Total patches found: 1198 (last week 1198)
*	Patches in the Pending State: 278 (23%) [last week 278 (23%)]

*	 <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>
https://autobuilder.yocto.io/pub/non-release/patchmetrics/

 

The Yocto Project's technical governance is through its Technical Steering
Committee, more information is available at:

 <https://wiki.yoctoproject.org/wiki/TSC>
https://wiki.yoctoproject.org/wiki/TSC

 

The Status reports are now stored on the wiki at:
<https://wiki.yoctoproject.org/wiki/Weekly_Status>
https://wiki.yoctoproject.org/wiki/Weekly_Status

 

[If anyone has suggestions for other information you'd like to see on this
weekly status update, let us know!]

 

Thanks,

 

Stephen K. Jolley

Yocto Project Program Manager

*    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> 

 


------=_NextPart_000_0D9F_01D98D49.EB76C9E0
Content-Type: text/html;
	boundary="----=_NextPart_000_1544_01D987CD.6BF739B0";
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"MS Sans Serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:90055478;
	mso-list-template-ids:746780612;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:242380317;
	mso-list-template-ids:1524679408;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2
	{mso-list-id:401607461;
	mso-list-template-ids:-2011413326;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3
	{mso-list-id:765688128;
	mso-list-template-ids:-1151185932;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l3:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4
	{mso-list-id:806511505;
	mso-list-template-ids:-383462760;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l4:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5
	{mso-list-id:862985754;
	mso-list-template-ids:676393104;}
@list l5:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l5:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6
	{mso-list-id:970792047;
	mso-list-template-ids:73413968;}
@list l6:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l6:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7
	{mso-list-id:1057776495;
	mso-list-template-ids:-1393937274;}
@list l7:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l7:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l7:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8
	{mso-list-id:1098480165;
	mso-list-template-ids:2041244128;}
@list l8:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l8:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l8:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9
	{mso-list-id:1133329879;
	mso-list-template-ids:529303264;}
@list l9:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l9:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l9:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10
	{mso-list-id:1437477510;
	mso-list-template-ids:1167912804;}
@list l10:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l10:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l10:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l11
	{mso-list-id:1468469108;
	mso-list-template-ids:-280870682;}
@list l11:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l11:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l11:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l11:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l11:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l11:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l11:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l11:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l11:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l12
	{mso-list-id:1495217666;
	mso-list-template-ids:1824322166;}
@list l12:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l12:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l12:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l12:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l12:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l12:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l12:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l12:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l12:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l13
	{mso-list-id:1506744518;
	mso-list-template-ids:1445349046;}
@list l13:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l13:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l13:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l13:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l13:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l13:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l13:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l13:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l13:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l14
	{mso-list-id:1657606328;
	mso-list-template-ids:836039332;}
@list l14:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l14:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l14:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l14:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l14:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l14:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l14:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l14:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l14:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l15
	{mso-list-id:1720784142;
	mso-list-template-ids:-284885396;}
@list l15:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l15:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l15:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l15:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l15:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l15:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l15:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l15:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l15:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Current Dev =
Position: YP 4.3 M1</span><o:p></o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Next Deadline: 5th =
June 2023 YP 4.3 M1 build date</span><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Next Team =
Meetings:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l10 =
level1 lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Bug Triage meeting Thursday May =
25th 7:30 am PDT (<a =
href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz0=
9"><span =
style=3D'color:#1155CC'>https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y=
0bFd5aVpHVVZ6dz09</span></a>)<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l10 =
level1 lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Weekly Project Engineering Sync =
Tuesday May 23rd at 8 am PDT (<a =
href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT0=
9"><span =
style=3D'color:#1155CC'>https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck8=
1bkcrYjRrcmJsUT09</span></a><a =
href=3D"https://zoom.us/j/990892712"><span =
style=3D'color:#1155CC'>)</span></a><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l10 =
level1 lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Twitch -&nbsp; See <a =
href=3D"https://www.twitch.tv/theyoctojester"><span =
style=3D'color:#1155CC'>https://www.twitch.tv/theyoctojester</span></a><o=
:p></o:p></span></li></ul><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Key =
Status/Updates:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.10 is ready to release =
after TSC review<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2.1 is in =
QA<o:p></o:p></span></li></ul><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l6 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>M1 is approaching fast (two =
weeks left), so please try and get any major changes submitted =
soon.<o:p></o:p></span></li></ul><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Patches have been merging into =
master, thanks to everyone for both review feedback and iterating on =
patches<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We need to upgrade to gcc 13 =
soon, this is blocking enabling Fedora 38 workers on the autobuilder as =
we don&#8217;t have a compatible uninative =
release.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There are time64 patches being =
proposed to handle Y2038 issues on 32 bit architectures which likely =
need further discussion since the compiler flag changes aren&#8217;t =
without risk and potential side effects.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We&#8217;re aiming to improve =
documentation as we go along in this release, please keep this in mind =
when sending patches. Adding to the documentation as we go will make the =
release a lot easier.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Autobuilder instability is a =
concern as known good builds are regularly hitting issues, particularly =
the &#8220;ubuntu 20.04 libgcc not found&#8221; issue which is likely =
python version specific but there are other intermittent issues too. As =
an example, three of the last nightly builds failed in succession. Due =
to the intermittent nature of these bugs, few people are willing to =
spend time on them but they mean patches are being very slow to merge. =
Help is very much needed but it is hard to be specific about where/what =
the issue is unfortunately.<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Ways to =
contribute:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo13;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>As people are likely aware, the =
project has a number of components which are either unmaintained, or =
have people with little to no time trying to keep them alive. These =
components include: patchtest, layerindex, devtool, toaster, wic, oeqa, =
autobuilder, CROPs containers, pseudo and more. Many have open bugs. =
Help is welcome in trying to better look after these =
components!<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo13;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There are bugs identified as =
possible for newcomers to the project: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Newcomers"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/wiki/Newcomers</spa=
n></a><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo13;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There are bugs that are =
currently unassigned for YP 4.3. See: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.3_Unass=
igned_Enhancements.2FBugs"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/wiki/Bug_Triage#Med=
ium.2B_4.3_Unassigned_Enhancements.2FBugs</span></a><o:p></o:p></span></l=
i><li style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 =
level1 lfo13;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We&#8217;d welcome new =
maintainers for recipes in OE-Core. Please see the list at: <a =
href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/i=
nclude/maintainers.inc"><span =
style=3D'color:#1155CC'>http://git.yoctoproject.org/cgit.cgi/poky/tree/me=
ta/conf/distro/include/maintainers.inc</span></a> and discuss with the =
existing maintainer, or ask on the OE-Core mailing list. We will likely =
move a chunk of these to &#8220;Unassigned&#8221; soon to help =
facilitate this.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo13;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Help is very much welcome in =
trying to resolve our autobuilder intermittent issues. You can see the =
list of failures we&#8217;re continuing to see by searching for the =
&#8220;AB-INT&#8221; tag in bugzilla: <a =
href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-IN=
T"><span =
style=3D'color:#1155CC'>https://bugzilla.yoctoproject.org/buglist.cgi?qui=
cksearch=3DAB-INT</span></a>.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo13;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Help us resolve CVE issues: <a =
href=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics/"><span=
 style=3D'color:#1155CC'>CVE =
metrics</span></a>&nbsp;<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo13;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We have a growing number of =
bugs in bugzilla, any help with them is =
appreciated.<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>YP 4.3 Milestone =
Dates:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l15 =
level1 lfo14;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.3 M1 build date&nbsp; =
2023/06/05<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l15 =
level1 lfo14;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.3 M1 Release date =
2023/06/16<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l15 =
level1 lfo14;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.3 M2 build date&nbsp; =
2023/07/17<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l15 =
level1 lfo14;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.3 M2 Release date =
2023/07/28<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l15 =
level1 lfo14;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.3 M3 build date&nbsp; =
2023/08/28<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l15 =
level1 lfo14;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.3 M3 Release date =
2023/09/08<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l15 =
level1 lfo14;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.3 M4 build date&nbsp; =
2023/10/02<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l15 =
level1 lfo14;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.3 M4 Release date =
2023/10/27<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Upcoming dot =
releases:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.10 is ready for =
release<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2.1 is in =
QA<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2.1 Release date =
2023/06/02<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.26 build date =
2023/06/19<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.26 Release date =
2023/06/30<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.11 build date =
2023/06/26<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.11 Release date =
2023/07/07<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2.2 build date =
2023/07/10<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2.2 Release date =
2023/07/21&nbsp;<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.27 build date =
2023/07/31<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.27 Release date =
2023/08/11<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.12 build date =
2023/08/07<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.12 Release date =
2023/08/18<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2.3 build date =
2023/08/28<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2.3 Release date =
2023/09/08<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.28 build date =
2023/09/18<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.28 Release date =
2023/09/29<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.13 build date =
2023/09/25<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.13 Release date =
2023/10/06<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.29 build date =
2023/10/30<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.29 Release date =
2023/11/10<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.14 build date =
2023/11/06<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.14 Release date =
2023/11/17<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2.4 build date =
2023/11/13<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2.4 Release date =
2023/11/24<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.30 build date =
2023/12/11<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.30 Release date =
2023/12/22<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.15 build date =
2023/12/18<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo15;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.15 Release date =
2023/12/29<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Tracking =
Metrics:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l13 =
level1 lfo16;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>WDD 2527 (last week =
2535)</span><span style=3D'font-family:Consolas'> (</span><span =
style=3D'font-family:"Arial",sans-serif'><a =
href=3D"https://wiki.yoctoproject.org/charts/combo.html"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/charts/combo.html</=
span></a></span><span style=3D'font-family:Consolas'>)</span><span =
style=3D'font-family:"Arial",sans-serif'><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l13 =
level1 lfo16;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>OE-Core/Poky Patch =
Metrics</span><span =
style=3D'font-family:Consolas'><o:p></o:p></span></li><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Dcircle><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l13 =
level2 lfo16;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Total patches found: 1198 (last =
week 1198)<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l13 =
level2 lfo16;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Patches in the Pending State: =
278 (23%) [last week 278 (23%)]</span><span =
style=3D'font-family:Consolas'><o:p></o:p></span></li></ul><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l13 =
level1 lfo16;vertical-align:baseline'><span =
style=3D'font-family:Consolas'><a =
href=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics/"><span=
 =
style=3D'font-family:"Arial",sans-serif;color:#1155CC'>https://autobuilde=
r.yocto.io/pub/non-release/patchmetrics/</span></a><o:p></o:p></span></li=
></ul><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>The Yocto =
Project&#8217;s technical governance is through its Technical Steering =
Committee, more information is available at:</span><o:p></o:p></p><p =
style=3D'margin:0in'><a =
href=3D"https://wiki.yoctoproject.org/wiki/TSC"><span =
style=3D'font-family:"Arial",sans-serif;color:#1155CC'>https://wiki.yocto=
project.org/wiki/TSC</span></a><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>The Status reports =
are now stored on the wiki at: </span><a =
href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status"><span =
style=3D'font-family:"Arial",sans-serif;color:#1155CC'>https://wiki.yocto=
project.org/wiki/Weekly_Status</span></a><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>[If anyone has =
suggestions for other information you&#8217;d like to see on this weekly =
status update, let us know!]</span><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'page-break-after:avoid;text-autospace:none'><b><i><span =
style=3D'font-size:16.0pt;font-family:"Times New =
Roman",serif;color:purple'>Stephen K. Jolley</span></i></b><b><i><span =
style=3D'font-size:16.0pt;font-family:"Tahoma",sans-serif;color:purple'><=
o:p></o:p></span></i></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:8.0pt;font-family:"Courier New";color:blue'>Yocto =
Project Program Manager<o:p></o:p></span></b></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings;color:black'>(</span><span=
 style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>&nbsp;&nbsp;&nbsp; </span><b><span =
style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Cell</span></b><span =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:9.0pt;font-family:"MS Sans Serif"'>(208) =
244-4460<span style=3D'color:black'><o:p></o:p></span></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings'>* </span><b><span =
lang=3DFR style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Email</span></b><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:</span><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;<u><span style=3D'color:blue'><a =
href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a></span=
></u></span><span lang=3DFR =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif'><o:p></o:p></sp=
an></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_0D9F_01D98D49.EB76C9E0--


