Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2EEC4167B
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 15:43:48 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.77108.1670946219342535979
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 07:43:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GqDFyD52;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id gt4so3822516pjb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 07:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tXOi/YVKp4dMw+TRrzA1gIttiNdMl2UhqS1dAiV9tI=;
        b=GqDFyD52dqTRUoAoDmv9xOldgdDR9upjQy6AyQ3mBbQ8AQF3MBo5siHAzwYTp9iTlB
         dnBfXN6YuizWZsm6WlCvY0w4Xm1lS9a/1ypYjd7pOL2xFCI6ByBjsO0wTqx9qzQ1MhHV
         36alAKG8gTlVytuP50dej008K4pHhMEvcxLzyQCdtZ1E/cLgPZHYu0T4UWRdtuDZWbE+
         a3XDIwMwtRs4Qumjj9ZsKYuaerDOe2UbYKXN25G9QrRydu5SIWzSlXOcTJ3ZCIb4br6f
         Rs6cfLBTaBikwSVy5gzkloDll2ayBHouWMgtLxgiB1Sz01XoVa0/Gyfp8sJ6hFqggUYF
         hGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tXOi/YVKp4dMw+TRrzA1gIttiNdMl2UhqS1dAiV9tI=;
        b=4TBeIda82+KxgC+3L9IKgFerVGbTHCcCtD3tURosIgXhe+O/QNBNRCad6DQlDgUJaU
         TJhXy8r268mDE1SQRuDAX443kx/UebM+zSooggtHAaiK3zJMnctBmHCmeG7jB+vRSbiQ
         7QGSN0oii1O0i0Iy4nlurEgEAtiLEKjU0bO8qJ3IzUKqLREbCLqfazVsTNrg/+nimI8x
         +gEcQJFnEPHvOWrWLbndrv71tCGNMsChPjL0DUK7NGaj5wYUn6F+h2/PfWc+rApR3eof
         N7vPtUSfR8flbANEXx8kA/GtBPJDi9TTYmC0Z4Rq8xLN0r0sySufzuZOJAUHwv3J3Rci
         +Vmw==
X-Gm-Message-State: ANoB5pn1rYpQaiEPu09dt411nietQQcwP1t+Gd9H6FHrpp5HwpebAOJq
	Pepm80Ef7ZV2N0KKVWZi4EIA7KsxvfQ=
X-Google-Smtp-Source: AA0mqf6m4+miCRO1Z6PV3Gx5MWykoXC0D5QsaGqL6DmQE8nJWa4GH3hhYLmeD1mqh7zC3Oc058S5/g==
X-Received: by 2002:a05:6a21:c014:b0:ac:4f99:b8cd with SMTP id bm20-20020a056a21c01400b000ac4f99b8cdmr27350855pzc.8.1670946218135;
        Tue, 13 Dec 2022 07:43:38 -0800 (PST)
Received: from skjolley ([2600:1011:a11e:7926:3670:229e:6a7c:c6b1])
        by smtp.gmail.com with ESMTPSA id b3-20020a63cf43000000b004785e505bcdsm7053457pgj.51.2022.12.13.07.43.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Dec 2022 07:43:37 -0800 (PST)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@lists.yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Yocto Project Status 13 December 2022 (WW50)
Date: Tue, 13 Dec 2022 08:43:37 -0700
Message-ID: <0ca301d90f09$ab3c2c30$01b48490$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0CA4_01D90ECE.FEE20F20"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdkPCZ3gK1KWzzgOQ/yrxiQivIH1hA==
Content-Language: en-us
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 15:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174537

This is a multipart message in MIME format.

------=_NextPart_000_0CA4_01D90ECE.FEE20F20
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Current Dev Position: YP 4.2 M2

Next Deadline: 23th January 2023 YP 4.2 M2 Build

 

Next Team Meetings:

*	Bug Triage meeting Thursday December 15th 7:30 am PDT (
<https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09>
https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
*	Weekly Project Engineering Sync Tuesday December 13th at 8 am PDT (
<https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09>
https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
<https://zoom.us/j/990892712> )
*	Twitch -  See  <https://www.twitch.tv/theyoctojester>
https://www.twitch.tv/theyoctojester

 

Key Status/Updates:

*	YP 4.2 M1 is in QA
*	YP 4.0.6 is due to build today
*	There have been a number of more invasive bitbake changes either
merged or are queued. This included a move to adopt the new layer.conf
"addpylib" directive for layers with python library directories. Also
included was a new optional bitbake cache mode which includes hash
construction information, we're likely to switch to use this for the
dump-signatures functionality. We haven't merged optimisations for that
cache yet.
*	We have increased the minimum python version requirement to 3.8.
*	Functionality versus parsing speed continues to be a discussion for
some of the bitbake patches.
*	CVEs in master are lower but some have been open for a number of
weeks now.
*	We have a growing number of bugs in bugzilla, any help with them is
appreciated.
*	As people are likely aware, the project has a number of components
which are either unmaintained, or have people with little to no time trying
to keep them alive. These components include: patchtest, layerindex,
devtool, toaster, wic, oeqa, autobuilder, CROPs containers, pseudo and more.
Many have open bugs. Help is welcome in trying to better look after these
components!

 

Ways to contribute:

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

*	YP 4.2 M1 is in QA
*	YP 4.2 M1 Release date 2022/12/16
*	YP 4.2 M2 build date 2023/01/23
*	YP 4.2 M2 Release date 2023/02/03
*	YP 4.2 M3 build date 2023/02/20
*	YP 4.2 M3 Release date 2023/03/03
*	YP 4.2 M4 build date 2023/04/03
*	YP 4.2 M4 Release date 2023/04/28

 

Upcoming dot releases:

*	YP 4.0.6 build date 2022/12/12
*	YP 4.0.6 Release date 2022/12/23
*	YP 4.1.2 build date 2023/01/09
*	YP 4.1.2 Release date 2023/01/20
*	YP 3.1.22 build date 2023/01/16
*	YP 3.1.22 Release date 2023/01/27
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

*	WDD 2437 (last week 2444) (
<https://wiki.yoctoproject.org/charts/combo.html>
https://wiki.yoctoproject.org/charts/combo.html)
*	OE-Core/Poky Patch Metrics

*	Total patches found: 1162 (last week 1164)
*	Patches in the Pending State: 285 (25%) [last week 285 (24%)]

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

 


------=_NextPart_000_0CA4_01D90ECE.FEE20F20
Content-Type: text/html;
	boundary="----=_NextPart_000_0C88_01D90950.0C190420";
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
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
	{mso-list-id:584532016;
	mso-list-template-ids:1574084324;}
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
	{mso-list-id:1279680563;
	mso-list-template-ids:-2013363694;}
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
	{mso-list-id:1326475213;
	mso-list-template-ids:72785772;}
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
	{mso-list-id:1412266210;
	mso-list-template-ids:-1871662808;}
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
	{mso-list-id:1464039867;
	mso-list-template-ids:-1508884798;}
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
	{mso-list-id:1596353705;
	mso-list-template-ids:-1193214132;}
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
	{mso-list-id:1611206082;
	mso-list-template-ids:409359494;}
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
	{mso-list-id:1646349044;
	mso-list-template-ids:2103220006;}
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
	{mso-list-id:1674995307;
	mso-list-template-ids:-771985044;}
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
	{mso-list-id:1797092950;
	mso-list-template-ids:298499914;}
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
	{mso-list-id:1914463632;
	mso-list-template-ids:594983780;}
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
	{mso-list-id:1952544141;
	mso-list-template-ids:-937903410;}
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
style=3D'font-family:"Arial",sans-serif;color:black'>Next Deadline: 23th =
January 2023 YP 4.2 M2 Build</span><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Next Team =
Meetings:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l0 level1 =
lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Bug Triage meeting Thursday =
December 15th 7:30 am PDT (<a =
href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz0=
9"><span =
style=3D'color:#1155CC'>https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y=
0bFd5aVpHVVZ6dz09</span></a>)<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l0 level1 =
lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Weekly Project Engineering Sync =
Tuesday December 13th at 8 am PDT (<a =
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
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l10 =
level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M1 is in =
QA<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l10 =
level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.6 is due to build =
today<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l10 =
level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There have been a number of =
more invasive bitbake changes either merged or are queued. This included =
a move to adopt the new layer.conf &#8220;addpylib&#8221; directive for =
layers with python library directories. Also included was a new optional =
bitbake cache mode which includes hash construction information, =
we&#8217;re likely to switch to use this for the dump-signatures =
functionality. We haven&#8217;t merged optimisations for that cache =
yet.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l10 =
level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We have increased the minimum =
python version requirement to 3.8.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l10 =
level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Functionality versus parsing =
speed continues to be a discussion for some of the bitbake =
patches.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l10 =
level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>CVEs in master are lower but =
some have been open for a number of weeks now.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l10 =
level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We have a growing number of =
bugs in bugzilla, any help with them is =
appreciated.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l10 =
level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>As people are likely aware, the =
project has a number of components which are either unmaintained, or =
have people with little to no time trying to keep them alive. These =
components include: patchtest, layerindex, devtool, toaster, wic, oeqa, =
autobuilder, CROPs containers, pseudo and more. Many have open bugs. =
Help is welcome in trying to better look after these =
components!<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Ways to =
contribute:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l4 level1 =
lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There are bugs identified as =
possible for newcomers to the project: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Newcomers"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/wiki/Newcomers</spa=
n></a><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l4 level1 =
lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There are bugs that are =
currently unassigned for YP 4.2. See: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.1_Unass=
igned_Enhancements.2FBugs"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/wiki/Bug_Triage#Med=
ium.2B_4.2_Unassigned_Enhancements.2FBugs</span></a><o:p></o:p></span></l=
i><li style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l4 =
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
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l4 level1 =
lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Help is very much welcome in =
trying to resolve our autobuilder intermittent issues. You can see the =
list of failures we&#8217;re continuing to see by searching for the =
&#8220;AB-INT&#8221; tag in bugzilla: <a =
href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-IN=
T"><span =
style=3D'color:#1155CC'>https://bugzilla.yoctoproject.org/buglist.cgi?qui=
cksearch=3DAB-INT</span></a>.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l4 level1 =
lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Help us resolve CVE issues: <a =
href=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics/"><span=
 style=3D'color:#1155CC'>CVE =
metrics</span></a>&nbsp;<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>YP 4.2 Milestone =
Dates:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M1 is in =
QA<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M1 Release date =
2022/12/16<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M2 build date =
2023/01/23<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M2 Release date =
2023/02/03<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M3 build date =
2023/02/20<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M3 Release date =
2023/03/03<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M4 build date =
2023/04/03<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l1 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.2 M4 Release date =
2023/04/28<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Upcoming dot =
releases:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.6 build date =
2022/12/12<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.6 Release date =
2022/12/23<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.2 build date =
2023/01/09<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.2 Release date =
2023/01/20<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.22 build date =
2023/01/16<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.22 Release date =
2023/01/27<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.7 build date =
2023/01/30<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.7 Release date =
2023/02/10<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.23 build date =
2023/02/13<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.23 Release date =
2023/02/24<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.8 build date =
2023/02/27<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.8 Release date =
2023/03/10<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.3 build date =
2023/03/06<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.3 Release date =
2023/03/17<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.24 build date =
2023/03/20<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.24 Release date =
2023/03/31<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.9 build date =
2023/04/10<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.9 Release date =
2023/04/21<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.4 build date =
2023/05/01<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.1.4 Release date =
2023/05/13<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.25 build date =
2023/05/08<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.25 Release date =
2023/05/19<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.10 build date =
2023/05/15<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l3 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 4.0.10 Release date =
2023/05/26<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Tracking =
Metrics:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>WDD 2437 (last week =
2444)</span><span style=3D'font-family:Consolas'> (</span><span =
style=3D'font-family:"Arial",sans-serif'><a =
href=3D"https://wiki.yoctoproject.org/charts/combo.html"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/charts/combo.html</=
span></a></span><span style=3D'font-family:Consolas'>)</span><span =
style=3D'font-family:"Arial",sans-serif'><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>OE-Core/Poky Patch =
Metrics</span><span =
style=3D'font-family:Consolas'><o:p></o:p></span></li><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Dcircle><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level2 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Total patches found: 1162 (last =
week 1164)<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level2 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Patches in the Pending State: =
285 (25%) [last week 285 (24%)]</span><span =
style=3D'font-family:Consolas'><o:p></o:p></span></li></ul><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
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
------=_NextPart_000_0CA4_01D90ECE.FEE20F20--


