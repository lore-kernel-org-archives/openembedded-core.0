Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.72.1614700133866737351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 07:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WmBh9zGn;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id e3so10088683pfj.6
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 07:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:thread-index
         :content-language;
        bh=prhx7zocfLzilPk+jTcyb0vwVGlrD2SIZNMXyqFntQ0=;
        b=WmBh9zGn3JHs+oKWvZVhy3K9hNITRy8FVDw35gr/WloZj5fhvtw2kvvVEgc/wmvDE/
         SgrCAOWj188T4TRRTMESBjGS2x672iH4+1EUaMvLE4HMAPBk/FsKobNO87cwfznCgf5a
         q71CKKE6uAl0dFDxjyueEZWJ1HF9yBATnQebRcFzNW3jO7EunC6y4HO9Gdom0UtAlUaP
         ThLyhTINdg5RrrDxUIiau9IwkHiOXCOZs19Db9RmnrdgNIhto2SZwU0wtyRsIT7NdvUV
         BY3B8RLoj3Zhfpy2AyI5ItMVWtGYpLwTRX9Uz8Z2Tc2T8Ua1DxhNA+CemQlMXbhWFxoM
         vefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :thread-index:content-language;
        bh=prhx7zocfLzilPk+jTcyb0vwVGlrD2SIZNMXyqFntQ0=;
        b=oOtGBKzGLtUWfbXeanKNVKWYg46JXh5Lql+WkpXgbEHIOZDMmtKvVfHsbCW6toNlZD
         5IiyrbVe3DYQiHMOsp4SbJZhVPovE0TTkG/Z0vPaRuHDTRiBDpOth1MLt0aYjj2OtTPE
         xJ8FJ2MzbkRY40kfps3Kp/NK2/iir9N/FKs+6cDA2L85SyxbaQ94C/0GFiB0RH4ySE70
         aFPQNc2rZXGUZL+HIZX8sNjnOwLICodZdWgQR3hmRMUkhLhnMmKjSbbQI3UjCayMXzNb
         mnypKxUBal3+WhmVs8bN45PugXI2Wi9LiPfz4UYP0K2KI+4GwcGrWXZKjU9axl44x9iY
         dmSg==
X-Gm-Message-State: AOAM533zX2WlvKvgpCYMbCLYcmYDjmD3hkTds2D1VD0uXFs6lBLUPsam
	XMxbWvYpos/g6xogq5uEa4B5hc+S04s=
X-Google-Smtp-Source: ABdhPJw9FuNjEHhC4peon65uPia1mjPXc3wsloV1ndHFJ5Q7oFl7eEmMUk1M4sK6vADejfAB5+O4iw==
X-Received: by 2002:a63:4924:: with SMTP id w36mr14419570pga.200.1614700131471;
        Tue, 02 Mar 2021 07:48:51 -0800 (PST)
Return-Path: <sjolley.yp.pm@gmail.com>
Received: from skjolley (c-71-59-136-149.hsd1.or.comcast.net. [71.59.136.149])
        by smtp.gmail.com with ESMTPSA id l74sm20970734pga.86.2021.03.02.07.48.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Mar 2021 07:48:51 -0800 (PST)
From: "Stephen Jolley" <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Yocto Project Status WW09`21
Date: Tue, 2 Mar 2021 07:48:50 -0800
Message-ID: <164e01d70f7b$8abdfd60$a039f820$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcPe4osxAFiXaeURBaHSPLUKwLbYA==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_164F_01D70F38.7C9E3FD0"
Content-Language: en-us

------=_NextPart_000_164F_01D70F38.7C9E3FD0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Current Dev Position: YP 3.3 Feature Freeze

Next Deadline: 1st March 2021 YP 3.3 M3 build

 

Next Team Meetings:

*	Bug Triage meeting Thursday Mar. 4th at 7:30am PDT (
<https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09>
https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
*	Monthly Project Meeting Tuesday Mar. 2nd at 8am PDT (
<https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09>
https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
<https://zoom.us/j/990892712> )
*	Weekly Engineering Sync Tuesday Mar. 9th at 8am PDT (
<https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09>
https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09
<https://zoom.us/j/990892712> )
*	Twitch -  See https://www.twitch.tv/theyoctojester

 

Key Status/Updates:

*	YP 3.2.2 and YP 3.1.6  were released.
*	YP 3.3 M3 is due to build soon, we are now at feature freeze
*	Reproducibility has improved over the last week with a number of
fixes added meaning the exclusion list has been significantly reduced. Many
of the fixes were accepted by upstream projects too. The remaining
reproducibility issues now have bugs open in bugzilla. In particular, meson
and ruby have intermittent issues, perf and ovmf have hardcoded path
problems and ltp whilst improved, still appears to have issues.

 <https://www.yoctoproject.org/reproducible-build-results/>
https://www.yoctoproject.org/reproducible-build-results/

*	Infrastructure issues around diffoscope and performance of
reproducibility tests have been fixed, both by us and upstream diffoscope
which should resolve delays in builds and improve testing throughput.
*	Looking through some of the patches in the "Pending" state, we have
some really old stale ones which really need decisions to be made about
their future. It would help a lot if recipe maintainers could review recipe
patchsets and upstream them or remove them if they are no longer relevant. 
*	Intermittent autobuilder issues continue to occur and are now at a
record high level. You can see the list of failures we're continuing to see
by searching for the "AB-INT" tag in bugzilla:
<https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT>
https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT

 

Ways to contribute:

*	There are bugs identified as possible for newcomers to the project:
<https://wiki.yoctoproject.org/wiki/Newcomers>
https://wiki.yoctoproject.org/wiki/Newcomers
*	There are bugs that are currently unassigned for YP 3.3. See:
<https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.3_Unassigned_Enha
ncements.2FBugs>
https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.3_Unassigned_Enhan
cements.2FBugs
*	We'd welcome new maintainers for recipes in OE-Core. Please see the
list at:
<http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/mai
ntainers.inc>
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/main
tainers.inc and discuss with the existing maintainer, or ask on the OE-Core
mailing list. We will likely move a chunk of these to "Unassigned" soon to
help facilitate this.

 

YP 3.3 Milestone Dates:

*	YP 3.3 M3 build date 2021/03/01
*	YP 3.3 M3 Release date 2021/03/12
*	YP 3.3 M4 build date 2021/04/05
*	YP 3.3 M4 Release date 2021/04/30

 

Planned upcoming dot releases:

*	YP 3.2.2 is released.
*	YP 3.1.6 is released.
*	YP 3.2.3 build date 2021/03/15
*	YP 3.2.3 release date 2021/03/26
*	YP 3.1.7 build date 2021/03/29
*	YP 3.1.7 release date 2021/04/09
*	YP 3.2.4 build date 2021/05/3
*	YP 3.2.4 release date 2021/05/14
*	YP 3.1.8 build date 2021/05/17
*	YP 3.1.8 release date 2021/05/28

 

Tracking Metrics:

*	WDD 2647 (last week 2647) (
<https://wiki.yoctoproject.org/charts/combo.html>
https://wiki.yoctoproject.org/charts/combo.html)
*	Poky Patch Metrics

*	Total patches found: 1280 (last week 1269)
*	Patches in the Pending State: 484 (38%) [last week 487 (39%)]

 

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

 


------=_NextPart_000_164F_01D70F38.7C9E3FD0
Content-Type: text/html;
	boundary="----=_NextPart_000_094E_01D709B7.EC83E150";
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
	{font-family:"MS Sans Serif";}
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
	{mso-list-id:260840383;
	mso-list-template-ids:818073812;}
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
	{mso-list-id:377978750;
	mso-list-template-ids:-827664054;}
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
	{mso-list-id:599071764;
	mso-list-template-ids:-979974474;}
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
	{mso-list-id:659699660;
	mso-list-template-ids:-1533249460;}
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
	{mso-list-id:727414878;
	mso-list-template-ids:-462099826;}
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
	{mso-list-id:744302887;
	mso-list-template-ids:-447457262;}
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
	{mso-list-id:1122919043;
	mso-list-template-ids:357173562;}
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
	{mso-list-id:1437797664;
	mso-list-template-ids:-2054137188;}
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
	{mso-list-id:1767798992;
	mso-list-template-ids:1055194146;}
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
	{mso-list-id:1831557966;
	mso-list-template-ids:-229597534;}
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
	{mso-list-id:2058357419;
	mso-list-template-ids:-428023386;}
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
	{mso-list-id:2107380746;
	mso-list-template-ids:-897032198;}
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
	{mso-list-id:2128308164;
	mso-list-template-ids:635616236;}
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
Position: YP 3.3 Feature Freeze</span><o:p></o:p></p><p =
style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Next Deadline: 1st =
March 2021 YP 3.3 M3 build</span><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Next Team =
Meetings:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l11 =
level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Bug Triage meeting Thursday =
Mar. 4th at 7:30am PDT (<a =
href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz0=
9"><span =
style=3D'color:#1155CC'>https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y=
0bFd5aVpHVVZ6dz09</span></a>)<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l11 =
level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Monthly Project Meeting Tuesday =
Mar. 2nd at 8am PDT (<a =
href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT0=
9"><span =
style=3D'color:#1155CC'>https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck8=
1bkcrYjRrcmJsUT09</span></a><a =
href=3D"https://zoom.us/j/990892712"><span =
style=3D'color:#1155CC'>)</span></a><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l11 =
level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Weekly Engineering Sync Tuesday =
Mar. 9th at 8am PDT (<a =
href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT0=
9"><span =
style=3D'color:#1155CC'>https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck8=
1bkcrYjRrcmJsUT09</span></a><a =
href=3D"https://zoom.us/j/990892712"><span =
style=3D'color:#1155CC'>)</span></a><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l11 =
level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Twitch -&nbsp; See =
https://www.twitch.tv/theyoctojester<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Key =
Status/Updates:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l4 level1 =
lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.2.2 and YP 3.1.6&nbsp; =
were released.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l4 level1 =
lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.3 M3 is due to build soon, =
we are now at feature freeze<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l4 level1 =
lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Reproducibility has improved =
over the last week with a number of fixes added meaning the exclusion =
list has been significantly reduced. Many of the fixes were accepted by =
upstream projects too. The remaining reproducibility issues now have =
bugs open in bugzilla. In particular, meson and ruby have intermittent =
issues, perf and ovmf have hardcoded path problems and ltp whilst =
improved, still appears to have issues.<o:p></o:p></span></li></ul><p =
style=3D'mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin=
-left:.5in'><a =
href=3D"https://www.yoctoproject.org/reproducible-build-results/"><span =
style=3D'font-family:"Arial",sans-serif;color:#1155CC'>https://www.yoctop=
roject.org/reproducible-build-results/</span></a><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Infrastructure issues around =
diffoscope and performance of reproducibility tests have been fixed, =
both by us and upstream diffoscope which should resolve delays in builds =
and improve testing throughput.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Looking through some of the =
patches in the &#8220;Pending&#8221; state, we have some really old =
stale ones which really need decisions to be made about their future. It =
would help a lot if recipe maintainers could review recipe patchsets and =
upstream them or remove them if they are no longer =
relevant.&nbsp;<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l12 =
level1 lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Intermittent autobuilder issues =
continue to occur and are now at a record high level. You can see the =
list of failures we&#8217;re continuing to see by searching for the =
&#8220;AB-INT&#8221; tag in bugzilla: <a =
href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-IN=
T"><span =
style=3D'color:#1155CC'>https://bugzilla.yoctoproject.org/buglist.cgi?qui=
cksearch=3DAB-INT</span></a><o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Ways to =
contribute:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There are bugs identified as =
possible for newcomers to the project: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Newcomers"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/wiki/Newcomers</spa=
n></a><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 level1 =
lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There are bugs that are =
currently unassigned for YP 3.3. See: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.3_Unass=
igned_Enhancements.2FBugs"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/wiki/Bug_Triage#Med=
ium.2B_3.3_Unassigned_Enhancements.2FBugs</span></a><o:p></o:p></span></l=
i><li style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l9 =
level1 lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We&#8217;d welcome new =
maintainers for recipes in OE-Core. Please see the list at: <a =
href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/i=
nclude/maintainers.inc"><span =
style=3D'color:#1155CC'>http://git.yoctoproject.org/cgit.cgi/poky/tree/me=
ta/conf/distro/include/maintainers.inc</span></a> and discuss with the =
existing maintainer, or ask on the OE-Core mailing list. We will likely =
move a chunk of these to &#8220;Unassigned&#8221; soon to help =
facilitate this.<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>YP 3.3 Milestone =
Dates:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.3 M3 build date =
2021/03/01<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.3 M3 Release date =
2021/03/12<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.3 M4 build date =
2021/04/05<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l5 level1 =
lfo11;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.3 M4 Release date =
2021/04/30<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Planned upcoming =
dot releases:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.2.2 is =
released.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.6 is =
released.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.2.3 build date =
2021/03/15<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.2.3 release date =
2021/03/26<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.7 build date =
2021/03/29<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.7 release date =
2021/04/09<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.2.4 build date =
2021/05/3<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.2.4 release date =
2021/05/14<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.8 build date =
2021/05/17<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l2 level1 =
lfo12;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.8 release date =
2021/05/28<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Tracking =
Metrics:</span><o:p></o:p></p><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l8 level1 =
lfo13;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>WDD 2647 (last week =
2647)</span><span style=3D'font-family:Consolas'> (</span><span =
style=3D'font-family:"Arial",sans-serif'><a =
href=3D"https://wiki.yoctoproject.org/charts/combo.html"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/charts/combo.html</=
span></a></span><span style=3D'font-family:Consolas'>)</span><span =
style=3D'font-family:"Arial",sans-serif'><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l8 level1 =
lfo13;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Poky Patch Metrics</span><span =
style=3D'font-family:Consolas'><o:p></o:p></span></li><ul =
style=3D'margin-top:0in;padding-inline-start:48px' type=3Dcircle><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l8 level2 =
lfo13;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Total patches found: 1280 (last =
week 1269)<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;mso-list:l8 level2 =
lfo13;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Patches in the Pending State: =
484 (38%) [last week 487 (39%)]</span><span =
style=3D'font-family:Consolas'><o:p></o:p></span></li></ul></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
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

------=_NextPart_000_164F_01D70F38.7C9E3FD0--
