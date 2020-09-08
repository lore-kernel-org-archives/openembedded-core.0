Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.29478.1599595525552681818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 13:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kbrZErTP;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id b16so165225pjp.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 13:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:thread-index
         :content-language;
        bh=M80U+oLwdOMXhrY3fgyqk1qwS/UFoOOxdAfepLMpTjs=;
        b=kbrZErTP6QdTHI4xnP9bQrJjezmSIqjTcHJDGUcE9KlEQi8Am4l/gq+SIk5UkopQ6I
         KKbiFyhAUoQZoNLvUsgipwgSX7ncj+6eQXjIPhqAeLUdnNwXL5MzZ3/+WHTZZv4WLspG
         peKQxqIueHIjMxMuPNWa6zoPwYeiIib+tuNF6UPr9Kju9GOZLRlDiZFZgKLQTV9XL4lI
         F6Ug2Hq8DRd8ocbtcCfyZ12Uv/6QIICz27kOkCeJ0s2+Ik2250KvRD1brISpFkwo9B5E
         Ng9FfQvN7CDEiCjRBlPFscWhp2CqEi2/gbLXQyvBwI5v8bQl2x0YO8oTB/Cz/SkZ5JE+
         nyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :thread-index:content-language;
        bh=M80U+oLwdOMXhrY3fgyqk1qwS/UFoOOxdAfepLMpTjs=;
        b=J3rx75gYhoItsT9abxT+AYABW8l5CaFX6u9fehsikgMI6rU+AwEfEtfA2DxQi+Uapk
         zf0I7v4MuK4KUcR32J22rlHxo0Ox2m0X5lc8Mvw4LNSrijw9secT5wsuc3pu4r0kM7rm
         v/4vTf+hAn8LrIsCR51WZPbsgcDhKYLv2X6qvfOVTOuzMs81+7GYJCLU0VaSVkbXn8Sl
         5nNp12N4gBq/jiK/T1nSIiiQ2KIuGyJfotqfm+UyG4i0p4uV3pA0BHluSdQu3NYbMo7Y
         spTEjH98SJ88tNNlMbw2dE5aNlZRFcuh3x62Vh4BwpUssrUgVprCF03y8xKdUibcKD2c
         kuRQ==
X-Gm-Message-State: AOAM530hJUM5L3RNj0eHEviGPvuc/AWybayYVMJSrPV2ANi8J+NSoHAg
	0E0IXRpvDFt/MAq6Z1gR4jc=
X-Google-Smtp-Source: ABdhPJy1DWlF7reeaoET9Q+qXYdqjV4WEHJ2Wwu3iW0MWdBmZFMkQI86tQW3r/Loo62FVl7fVdOtnQ==
X-Received: by 2002:a17:90a:d793:: with SMTP id z19mr439678pju.12.1599595523574;
        Tue, 08 Sep 2020 13:05:23 -0700 (PDT)
Return-Path: <sjolley.yp.pm@gmail.com>
Received: from skjolley (c-71-59-136-149.hsd1.or.comcast.net. [71.59.136.149])
        by smtp.gmail.com with ESMTPSA id k28sm231533pfh.196.2020.09.08.13.05.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 13:05:23 -0700 (PDT)
From: "Stephen Jolley" <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Yocto Project Status WW36'20
Date: Tue, 8 Sep 2020 13:05:23 -0700
Message-ID: <006701d6861b$634566e0$29d034a0$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdaF7Aj9k3vOLG1QQD25eKQyInsZ0Q==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0068_01D685E0.B6EB70E0"
Content-Language: en-us

------=_NextPart_000_0068_01D685E0.B6EB70E0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Current Dev Position: YP 3.2 M3

Next Deadline: YP 3.2 M3 Feature Freeze - Now

 

Next Team Meetings:

*	Bug Triage meeting Thursday Sept. 10th at 7:30am PDT (
<https://zoom.us/j/454367603> https://zoom.us/j/454367603)
*	Monthly Project Meeting Tuesday Oct. 6th at 8am PDT (
<https://zoom.us/j/990892712> https://zoom.us/j/990892712)
*	Weekly Engineering Sync Tuesday Sept. 8th at 8am PDT (
<https://zoom.us/j/990892712> https://zoom.us/j/990892712)
*	Twitch -  See https://www.twitch.tv/theyoctojester

 

Key Status/Updates:

*	M3 has now closed and we're at feature freeze for 3.2.
*	We now have most patches merged for 3.2, the main remaining question
is around the documentation. The current plan is to merge the sphinx
branches into master and then build M3.
*	There is a new technique being used to try and mitigate some of the
runtime autobuilder issues, so far the results from that have looked
promising (using the runqemu-renice script).
*	Some fixes for bitbake's parsing handling have merged which
hopefully will address some of the hung process issues we've been seeing.
Some of the issues look like potential issues in upstream python
multiprocessing.
*	There have also been significant cleanups to the server process
logging and reporting of processes holding the bitbake lock.
*	The work in enabling PRServ to work well with hash equivalence has
merged.
*	A preview of the sphinx built documentation is now available at
<http://docs.yoctoproject.org/> https://docs.yoctoproject.org/, work is
ongoing to complete the migration work.
*	We continue to struggle with a number of autobuilder intermittent
bugs. You can see the list of failures we're continuing to see by searching
for the "AB-INT" tag in bugzilla:
<https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT>
https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT

Help with any of these would be much appreciated, unfortunately it is
proving hard to find anyone interested in helping figure these out and they
significantly hamper our testing.

*	One way to help the project is to help us with bugs that are
currently unassigned but ideally needed during YP 3.2. See:
<https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.2_Unassigned_Enha
ncements.2FBugs>
https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.2_Unassigned_Enhan
cements.2FBugs
*	For older releases, we've been struggling to handle these with the
changing distros on the autobuilder infrastructure. We've managed to pull
together various pieces of work to allow these older releases to be built on
the infrastructure and an email discussing this was sent to the
openembedded-architecture list. It will mean adding some larger series of
patches to the older release branches for the yocto-autobuilder-helper and
openembedded-core repositories but it is believed this is in the best
interests of being able to test these older releases going forward if
needed. This may also reduce the barrier to entry for new maintainers and
community maintenance.

 

YP 3.2 Milestone Dates:

*	YP 3.2 M3 build date 2020/8/31
*	YP 3.2 M3 Release date 2020/9/11
*	YP 3.2 M4 build date 2020/10/5
*	YP 3.2 M4 Release date 2020/10/30

 

Planned upcoming dot releases:

*	YP 3.1.3 build date 2020/9/14
*	YP 3.1.3 release date 2020/9/25

 

Tracking Metrics:

*	WDD 2461 (last week 2436) (
<https://wiki.yoctoproject.org/charts/combo.html>
https://wiki.yoctoproject.org/charts/combo.html)
*	Poky Patch Metrics  

*	Total patches found: 1264 (last week 1264)
*	Patches in the Pending State: 502 (40%) [last week 502 (40%)]

 

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

 


------=_NextPart_000_0068_01D685E0.B6EB70E0
Content-Type: text/html;
	boundary="----=_NextPart_000_0F1D_01D67AB3.FF9C8230";
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
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"MS Sans Serif";}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
	{mso-list-id:213396123;
	mso-list-template-ids:1376966082;}
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
	{mso-list-id:230505043;
	mso-list-template-ids:1910961534;}
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
	{mso-list-id:1041712288;
	mso-list-template-ids:-845762810;}
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
	{mso-list-id:1775397283;
	mso-list-template-ids:-1597227952;}
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
	{mso-list-id:1888755021;
	mso-list-template-ids:-1867116572;}
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
	{mso-list-id:1946384296;
	mso-list-template-ids:1334194090;}
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
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Current Dev =
Position: YP 3.2 M3</span><o:p></o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Next Deadline: YP =
3.2 M3 Feature Freeze - Now</span><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Next Team =
Meetings:</span><o:p></o:p></p><ul style=3D'margin-top:0in' =
type=3Ddisc><li class=3DMsoNormal style=3D'color:black;mso-list:l3 =
level1 lfo1;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Bug Triage meeting Thursday =
Sept. 10th at 7:30am PDT (<a href=3D"https://zoom.us/j/454367603"><span =
style=3D'font-size:10.0pt;color:#1155CC'>https://zoom.us/j/454367603</spa=
n></a>)<o:p></o:p></span></li><li class=3DMsoNormal =
style=3D'color:black;mso-list:l3 level1 =
lfo1;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Monthly Project Meeting Tuesday =
Oct. 6th at 8am PDT (<a href=3D"https://zoom.us/j/990892712"><span =
style=3D'color:#1155CC'>https://zoom.us/j/990892712)</span></a><o:p></o:p=
></span></li><li class=3DMsoNormal style=3D'color:black;mso-list:l3 =
level1 lfo1;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Weekly Engineering Sync Tuesday =
Sept. 8th at 8am PDT (<a href=3D"https://zoom.us/j/990892712"><span =
style=3D'color:#1155CC'>https://zoom.us/j/990892712)</span></a><o:p></o:p=
></span></li><li class=3DMsoNormal style=3D'color:black;mso-list:l3 =
level1 lfo1;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Twitch -&nbsp; See =
https://www.twitch.tv/theyoctojester<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Key =
Status/Updates:</span><o:p></o:p></p><ul style=3D'margin-top:0in' =
type=3Ddisc><li class=3DMsoNormal style=3D'color:black;mso-list:l1 =
level1 lfo2;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>M3 has now closed and =
we&#8217;re at feature freeze for 3.2.<o:p></o:p></span></li><li =
class=3DMsoNormal style=3D'color:black;mso-list:l1 level1 =
lfo2;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We now have most patches merged =
for 3.2, the main remaining question is around the documentation. The =
current plan is to merge the sphinx branches into master and then build =
M3.<o:p></o:p></span></li><li class=3DMsoNormal =
style=3D'color:black;mso-list:l1 level1 =
lfo2;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There is a new technique being =
used to try and mitigate some of the runtime autobuilder issues, so far =
the results from that have looked promising (using the runqemu-renice =
script).<o:p></o:p></span></li><li class=3DMsoNormal =
style=3D'color:black;mso-list:l1 level1 =
lfo2;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Some fixes for bitbake&#8217;s =
parsing handling have merged which hopefully will address some of the =
hung process issues we&#8217;ve been seeing. Some of the issues look =
like potential issues in upstream python =
multiprocessing.<o:p></o:p></span></li><li class=3DMsoNormal =
style=3D'color:black;mso-list:l1 level1 =
lfo2;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>There have also been =
significant cleanups to the server process logging and reporting of =
processes holding the bitbake lock.<o:p></o:p></span></li><li =
class=3DMsoNormal style=3D'color:black;mso-list:l1 level1 =
lfo2;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>The work in enabling PRServ to =
work well with hash equivalence has merged.<o:p></o:p></span></li><li =
class=3DMsoNormal style=3D'color:black;mso-list:l1 level1 =
lfo2;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>A preview of the sphinx built =
documentation is now available at <a =
href=3D"http://docs.yoctoproject.org/"><span =
style=3D'color:#1155CC'>https://docs.yoctoproject.org/</span></a>, work =
is ongoing to complete the migration work.<o:p></o:p></span></li><li =
class=3DMsoNormal style=3D'color:black;mso-list:l1 level1 =
lfo2;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We continue to struggle with a =
number of autobuilder intermittent bugs. You can see the list of =
failures we&#8217;re continuing to see by searching for the =
&#8220;AB-INT&#8221; tag in bugzilla: <a =
href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-IN=
T"><span =
style=3D'color:#1155CC'>https://bugzilla.yoctoproject.org/buglist.cgi?qui=
cksearch=3DAB-INT</span></a><o:p></o:p></span></li></ul><p =
style=3D'mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin=
-left:.5in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Help with any of =
these would be much appreciated, unfortunately it is proving hard to =
find anyone interested in helping figure these out and they =
significantly hamper our testing.</span><o:p></o:p></p><ul =
style=3D'margin-top:0in' type=3Ddisc><li class=3DMsoNormal =
style=3D'color:black;mso-list:l2 level1 =
lfo3;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>One way to help the project is =
to help us with bugs that are currently unassigned but ideally needed =
during YP 3.2. See: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.2_Unass=
igned_Enhancements.2FBugs"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/wiki/Bug_Triage#Med=
ium.2B_3.2_Unassigned_Enhancements.2FBugs</span></a><o:p></o:p></span></l=
i><li class=3DMsoNormal style=3D'color:black;mso-list:l2 level1 =
lfo3;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>For older releases, we&#8217;ve =
been struggling to handle these with the changing distros on the =
autobuilder infrastructure. We&#8217;ve managed to pull together various =
pieces of work to allow these older releases to be built on the =
infrastructure and an email discussing this was sent to the =
openembedded-architecture list. It will mean adding some larger series =
of patches to the older release branches for the =
yocto-autobuilder-helper and openembedded-core repositories but it is =
believed this is in the best interests of being able to test these older =
releases going forward if needed. This may also reduce the barrier to =
entry for new maintainers and community =
maintenance.<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>YP 3.2 Milestone =
Dates:</span><o:p></o:p></p><ul style=3D'margin-top:0in' type=3Ddisc><li =
class=3DMsoNormal style=3D'color:black;mso-list:l5 level1 =
lfo4;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.2 M3 build date =
2020/8/31<o:p></o:p></span></li><li class=3DMsoNormal =
style=3D'color:black;mso-list:l5 level1 =
lfo4;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.2 M3 Release date =
2020/9/11<o:p></o:p></span></li><li class=3DMsoNormal =
style=3D'color:black;mso-list:l5 level1 =
lfo4;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.2 M4 build date =
2020/10/5<o:p></o:p></span></li><li class=3DMsoNormal =
style=3D'color:black;mso-list:l5 level1 =
lfo4;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.2 M4 Release date =
2020/10/30<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Planned upcoming =
dot releases:</span><o:p></o:p></p><ul style=3D'margin-top:0in' =
type=3Ddisc><li class=3DMsoNormal style=3D'color:black;mso-list:l4 =
level1 lfo5;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.3 build date =
2020/9/14<o:p></o:p></span></li><li class=3DMsoNormal =
style=3D'color:black;mso-list:l4 level1 =
lfo5;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 3.1.3 release date =
2020/9/25<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p style=3D'margin:0in'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Tracking =
Metrics:</span><o:p></o:p></p><ul style=3D'margin-top:0in' =
type=3Ddisc><li class=3DMsoNormal style=3D'color:black;mso-list:l0 =
level1 lfo6;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>WDD 2461 (last week =
2436)</span><span style=3D'font-family:Consolas'> (</span><span =
style=3D'font-family:"Arial",sans-serif'><a =
href=3D"https://wiki.yoctoproject.org/charts/combo.html"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/charts/combo.html</=
span></a></span><span style=3D'font-family:Consolas'>)</span><span =
style=3D'font-family:"Arial",sans-serif'><o:p></o:p></span></li><li =
class=3DMsoNormal style=3D'color:black;mso-list:l0 level1 =
lfo6;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Poky Patch =
Metrics&nbsp;&nbsp;</span><span =
style=3D'font-family:Consolas'><o:p></o:p></span></li><ul =
style=3D'margin-top:0in' type=3Dcircle><li class=3DMsoNormal =
style=3D'color:black;mso-list:l0 level2 =
lfo6;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Total patches found: 1264 (last =
week 1264)<o:p></o:p></span></li><li class=3DMsoNormal =
style=3D'color:black;mso-list:l0 level2 =
lfo6;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Patches in the Pending State: =
502 (40%) [last week 502 (40%)]</span><span =
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

------=_NextPart_000_0068_01D685E0.B6EB70E0--
