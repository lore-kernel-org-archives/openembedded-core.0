Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9922C54E94
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 15:49:00 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.18426.1674575339288144576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 07:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FL7U8R5R;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso2425589pjj.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 07:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=thread-index:content-language:mime-version:message-id:date:subject
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8RuTlZou5yWaR+YzkRg7lDYJPEYhDDShdowWh0rgX3o=;
        b=FL7U8R5R45AjB8j/w7SJXXmPI3pqxYT1vfnfLb/Gy6766dMlz/o7MMk7WXIPvkqQnU
         00YGfDva5Bc5RATP/FNDuRqQqLEVIaEgG8imBrVVqt4+EXusWSa+YzdfNM25eqiOLiWB
         L4BgP2W4GPxcOtzCIMFT3Nvh6hbJH6yVrLfFCtzY4Eh9L5mps6vtV7X89cN5mekaOHtQ
         TVqyaO11MxCDEv4S/DgS4p82PAu9QtJXgrfOM1pzCE+eB6U7W4WgkzBNcz4IhnDefEU6
         fr5sUflCI7j+6WGDrhJV/D6I27QiushHR842qk5z0tA7apntMQk/QfN4jG1Azk11k6J9
         1fVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=thread-index:content-language:mime-version:message-id:date:subject
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RuTlZou5yWaR+YzkRg7lDYJPEYhDDShdowWh0rgX3o=;
        b=CKvjLBybmE/2lKDhmA8mXyNXtDNlSouheH0iD4kAEZ6i6MdUm6842pjH/N+PogISag
         mKJoHRELe8Wb/zw3uhmfOEPbzUE4pd37TDfUBW5TQxYZUwZ7IHDtqarSevi41bLUeoBw
         7goRc7Au1PuE5umbaQTImTqZmJXIiOhewTpqnCL0cQbPDBH2tRKr0Lr5FVg1nxxadhAE
         DwjGQHWmO4wkTncbEAX32bPhkaK1ggMxwwh1q78I71ZzzNuxkbr8VH8so589Fl01Ga7Z
         z1fEngSbS2Le4tjGQAE/hiSQ6vQegMCPQprfaH4rQcaW1d2+6mwvPfavij6q3mMvZNtj
         WJBw==
X-Gm-Message-State: AFqh2krspuZnM2u6UFQELUSpaqMU8M6feipCoRp/y71clMd37gX4pet7
	UyuUonmPMBWWUxfTjQSP3abvl+OM2cY=
X-Google-Smtp-Source: AMrXdXvEhlrTtdnWjNVmuAHfcuAEpRudG98mo3nnpVOWa+4pltKwPfKx6lTXd3qAvNUS14QG8aoZ9A==
X-Received: by 2002:a17:902:e5d2:b0:194:52ed:7a16 with SMTP id u18-20020a170902e5d200b0019452ed7a16mr36128149plf.24.1674575338094;
        Tue, 24 Jan 2023 07:48:58 -0800 (PST)
Received: from skjolley ([2600:1011:a102:bdcb:7217:7162:14b2:5b0])
        by smtp.gmail.com with ESMTPSA id y7-20020a1709029b8700b001929dff50a9sm1850644plp.87.2023.01.24.07.48.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2023 07:48:57 -0800 (PST)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@lists.yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Yocto Project Status 24 January 2023 (WW04)
Date: Tue, 24 Jan 2023 08:48:56 -0700
Message-ID: <0e2c01d9300b$5eb53e10$1c1fba30$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0E2D_01D92FD0.B258B000"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AdkwC0mcKEQOgWR+S8qXYOe6h8Q1vg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 15:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176328

This is a multipart message in MIME format.

------=_NextPart_000_0E2D_01D92FD0.B258B000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Current Dev Position: YP 4.2 M2

Next Deadline: 23rd January 2023 YP 4.2 M2 Build

 

Next Team Meetings:

*	Bug Triage meeting Thursday January 26th 7:30 am PDT (
<https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09>
https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
*	Weekly Project Engineering Sync Tuesday January 24th at 8 am PDT (
<https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09>
https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
<https://zoom.us/j/990892712> )
*	Twitch -  See  <https://www.twitch.tv/theyoctojester>
https://www.twitch.tv/theyoctojester

 

Key Status/Updates:

*	YP 4.1.2 and YP 3.1.22 were released
*	YP 4.2 M2 is due to build this week.
*	Stable builds have been proving hard to obtain due to varying issues
over many of the submitted patches. This has limited patch flow over the
last week.
*	We were able to merge 6.1 kernel improvements and a number of good
bug fixes in other areas too.
*	There has been an improvement to the configurability of patch
warnings/errors and patch fuzz issues will now error and stop builds by
default.
*	Warning/errors over missing Upstream-Status details in non-core
layers appears too controversial to enable by default but the option is now
available should users wish to.
*	CVE levels in master are becoming worrying again, Ross helpfully
summarized the situation and submitted CPE changes for some of the issues
being highlighted, thanks!
*	We have a growing number of bugs in bugzilla, any help with them is
appreciated.

 

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
*	There are bugs that are currently unassigned for YP 4.2. See:
<https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.1_Unassigned_Enha
ncements.2FBugs>
https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.2_Unassigned_Enhan
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

 

YP 4.2 Milestone Dates:

*	YP 4.2 M2 build date 2023/01/23
*	YP 4.2 M2 Release date 2023/02/03
*	YP 4.2 M3 build date 2023/02/20
*	YP 4.2 M3 Release date 2023/03/03
*	YP 4.2 M4 build date 2023/04/03
*	YP 4.2 M4 Release date 2023/04/28

 

Upcoming dot releases:

*	YP 4.1.2 is released
*	YP 3.1.22 is released
*	YP 4.0.7 build date 2023/01/30
*	YP 4.0.7 Release date 2023/02/10
*	YP 3.1.23 build date 2023/02/13
*	YP 3.1.23 Release date 2023/02/24
*	YP 4.0.8 build date 2023/02/27
*	YP 4.0.8 Release date 2023/03/10
*	YP 4.1.3 build date 2023/03/06
*	YP 4.1.3 Release date 2023/03/17
*	YP 3.1.24 build date 2023/03/20
*	YP 3.1.24 Release date 2023/03/31
*	YP 4.0.9 build date 2023/04/10
*	YP 4.0.9 Release date 2023/04/21
*	YP 4.1.4 build date 2023/05/01
*	YP 4.1.4 Release date 2023/05/13
*	YP 3.1.25 build date 2023/05/08
*	YP 3.1.25 Release date 2023/05/19
*	YP 4.0.10 build date 2023/05/15
*	YP 4.0.10 Release date 2023/05/26

 

Tracking Metrics:

*	WDD 2442 (last week 2457) (
<https://wiki.yoctoproject.org/charts/combo.html>
https://wiki.yoctoproject.org/charts/combo.html)
*	OE-Core/Poky Patch Metrics

*	Total patches found: 1190 (last week 1181)
*	Patches in the Pending State: 279 (23%) [last week 279 (24%)]

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

 


------=_NextPart_000_0E2D_01D92FD0.B258B000
Content-Type: text/html;
	boundary="----=_NextPart_000_0EFE_01D92A4F.B6C53220";
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
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:157232218;
	mso-list-template-ids:1272454200;}
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
	{mso-list-id:285549395;
	mso-list-template-ids:-831649618;}
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
	{mso-list-id:582765415;
	mso-list-template-ids:-881846756;}
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
	{mso-list-id:629633602;
	mso-list-template-ids:1607483098;}
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
	{mso-list-id:1041319449;
	mso-list-template-ids:-543510508;}
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
	{mso-list-id:1140882091;
	mso-list-template-ids:-1985056844;}
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
	{mso-list-id:1245913085;
	mso-list-template-ids:-1230895536;}
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
	{mso-list-id:1281457311;
	mso-list-template-ids:1580887550;}
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
	{mso-list-id:1318611067;
	mso-list-template-ids:-493082054;}
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
	{mso-list-id:1699895253;
	mso-list-template-ids:-1755035984;}
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
	{mso-list-id:1925335649;
	mso-list-template-ids:971413828;}
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
	{mso-list-id:2083521310;
	mso-list-template-ids:-1901274362;}
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
Position: YP 4.2 M2</span><o:p></o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Next Deadline: 23rd =
January 2023 YP 4.2 M2 Build</span><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Next Team =
Meetings:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l0 level1 =
lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Bug Triage meeting Thursday =
January 26th 7:30 am PDT (<a =
href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz0=
9"><span =
style=3D'color:#1155CC'>https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y=
0bFd5aVpHVVZ6dz09</span></a>)<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l0 level1 =
lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Weekly Project Engineering Sync =
Tuesday January 24th at 8 am PDT (<a =
href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT0=
9"><span =
style=3D'color:#1155CC'>https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck8=
1bkcrYjRrcmJsUT09</span></a><a =
href=3D"https://zoom.us/j/990892712"><span =
style=3D'color:#1155CC'>)</span></a><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l0 level1 =
lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Twitch -&nbsp; See <a =
href=3D"https://www.twitch.tv/theyoctojester"><span =
style=3D'color:#1155CC'>https://www.twitch.tv/theyoctojester</span></a><o=
:p></o:p></span></li></ul><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Key =
Status/Updates:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.2 and YP 3.1.22 were =
released<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M2 is due to build this =
week.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Stable builds have been proving =
hard to obtain due to varying issues over many of the submitted patches. =
This has limited patch flow over the last =
week.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We were able to merge 6.1 =
kernel improvements and a number of good bug fixes in other areas =
too.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There has been an improvement =
to the configurability of patch warnings/errors and patch fuzz issues =
will now error and stop builds by default.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Warning/errors over missing =
Upstream-Status details in non-core layers appears too controversial to =
enable by default but the option is now available should users wish =
to.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>CVE levels in master are =
becoming worrying again, Ross helpfully summarized the situation and =
submitted CPE changes for some of the issues being highlighted, =
thanks!<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We have a growing number of =
bugs in bugzilla, any help with them is =
appreciated.<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Ways to =
contribute:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>As people are likely aware, the =
project has a number of components which are either unmaintained, or =
have people with little to no time trying to keep them alive. These =
components include: patchtest, layerindex, devtool, toaster, wic, oeqa, =
autobuilder, CROPs containers, pseudo and more. Many have open bugs. =
Help is welcome in trying to better look after these =
components!<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There are bugs identified as =
possible for newcomers to the project: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Newcomers"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/wiki/Newcomers</spa=
n></a><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There are bugs that are =
currently unassigned for YP 4.2. See: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.1_Unass=
igned_Enhancements.2FBugs"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/wiki/Bug_Triage#Med=
ium.2B_4.2_Unassigned_Enhancements.2FBugs</span></a><o:p></o:p></span></l=
i><li style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 =
level1 lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We&#8217;d welcome new =
maintainers for recipes in OE-Core. Please see the list at: <a =
href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/i=
nclude/maintainers.inc"><span =
style=3D'color:#1155CC'>http://git.yoctoproject.org/cgit.cgi/poky/tree/me=
ta/conf/distro/include/maintainers.inc</span></a> and discuss with the =
existing maintainer, or ask on the OE-Core mailing list. We will likely =
move a chunk of these to &#8220;Unassigned&#8221; soon to help =
facilitate this.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Help is very much welcome in =
trying to resolve our autobuilder intermittent issues. You can see the =
list of failures we&#8217;re continuing to see by searching for the =
&#8220;AB-INT&#8221; tag in bugzilla: <a =
href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-IN=
T"><span =
style=3D'color:#1155CC'>https://bugzilla.yoctoproject.org/buglist.cgi?qui=
cksearch=3DAB-INT</span></a>.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Help us resolve CVE issues: <a =
href=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics/"><span=
 style=3D'color:#1155CC'>CVE =
metrics</span></a>&nbsp;<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>YP 4.2 Milestone =
Dates:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l7 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M2 build date =
2023/01/23<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l7 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M2 Release date =
2023/02/03<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l7 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M3 build date =
2023/02/20<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l7 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M3 Release date =
2023/03/03<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l7 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M4 build date =
2023/04/03<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l7 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M4 Release date =
2023/04/28<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Upcoming dot =
releases:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.2 is =
released<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.22 is =
released<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.7 build date =
2023/01/30<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.7 Release date =
2023/02/10<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.23 build date =
2023/02/13<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.23 Release date =
2023/02/24<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.8 build date =
2023/02/27<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.8 Release date =
2023/03/10<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.3 build date =
2023/03/06<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.3 Release date =
2023/03/17<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.24 build date =
2023/03/20<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.24 Release date =
2023/03/31<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.9 build date =
2023/04/10<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.9 Release date =
2023/04/21<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.4 build date =
2023/05/01<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.4 Release date =
2023/05/13<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.25 build date =
2023/05/08<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.25 Release date =
2023/05/19<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.10 build date =
2023/05/15<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.10 Release date =
2023/05/26<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Tracking =
Metrics:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>WDD 2442 (last week =
2457)</span><span style=3D'font-family:Consolas'> (</span><span =
style=3D'font-family:"Arial",sans-serif'><a =
href=3D"https://wiki.yoctoproject.org/charts/combo.html"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/charts/combo.html</=
span></a></span><span style=3D'font-family:Consolas'>)</span><span =
style=3D'font-family:"Arial",sans-serif'><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>OE-Core/Poky Patch =
Metrics</span><span =
style=3D'font-family:Consolas'><o:p></o:p></span></li><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Dcircle><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level2 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Total patches found: 1190 (last =
week 1181)<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level2 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Patches in the Pending State: =
279 (23%) [last week 279 (24%)]</span><span =
style=3D'font-family:Consolas'><o:p></o:p></span></li></ul><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo12;vertical-align:baseline'><span style=3D'font-family:Consolas'><a =
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
------=_NextPart_000_0E2D_01D92FD0.B258B000--


