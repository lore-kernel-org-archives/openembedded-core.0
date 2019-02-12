Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 110FD6B7C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 16:10:22 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id r11so1462497pgp.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 08:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:thread-index
	:content-language;
	bh=8GlJ5ztbZntz1a271XYTv9/8+s9PuaAqn1HiVxjEfKs=;
	b=OGK/ftHk0e+wujLF8XKxvJGWEBU0cO6YuxjWqW8TxQwiGcTSZijOKzz6ir/lvSwUwi
	dW42uWul3sBd73rBt4veoeVxeYqhMpT/Il1CtXIYE0N4Nt6zjPekXtQHRRdwIxylmmNm
	HiT2gijMZnSl87VkHCKEQKD/IcSUruN3Bbrm5L4qAyaOnxg9Fy6wshVGvTedo/uJzqSs
	Y6mkseKFZAokY6E3eMwP7sgklD8t+mUfqBkxwTwrZsn8tRPs5/WMwmf/0uiDmieMdoxG
	Sre/WPGoSdbQ+fks1gU71jYYasuFb78Pb0DJf0VgmMUFuiCYTAhi4dVVoYWfmtAAvsBs
	ssyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:thread-index:content-language;
	bh=8GlJ5ztbZntz1a271XYTv9/8+s9PuaAqn1HiVxjEfKs=;
	b=YdbEGK8EqbxHzH8rJo/Kj+O3IWv8DB+O1sDbNQCDyHs9gDXK+fToPOt4ESB7S9NK/L
	TW/xoJrXFxEQ4crI5kqqxFJN7n+c/opTzucHZiH3RiE1U6NB14IfpHWWHm0b5WPLgqbf
	gbFELrBMbAjpX8UPCGFZxaGTVOTeXJVxdOKyaazHamFtID49AccK+H3N83OlNz1aYMen
	2KA1uYLzf2gf1lFTuTPrYsaJ208l4GXAEC82fvmwnUNDCpvJam3AbS/svxsVftvl8Xw8
	KN33l753Ca0exQlwO2vlQEOarCy424H2420vnHIdKsvaatVS3dJuWC36qXQNKtthbj6J
	SVBQ==
X-Gm-Message-State: AHQUAuYKo4whHaWMWaG3wQaQSuJH1g4bAph5scBpKGHj0GLBMzd6v7sZ
	Gl9ufMYF2PpAbrCfHrTuqR2T1hgG
X-Google-Smtp-Source: AHgI3IaqIYPdDHyrtaY872T8u7xh7M5mafKP1xK3d1aKe/lS8qWg2Sk1bBPwoLRPx+oUYvl0JGlPnw==
X-Received: by 2002:a63:cc41:: with SMTP id q1mr4286140pgi.323.1549987823879; 
	Tue, 12 Feb 2019 08:10:23 -0800 (PST)
Received: from sjolley (c-71-59-136-149.hsd1.or.comcast.net. [71.59.136.149])
	by smtp.gmail.com with ESMTPSA id
	b29sm18982536pff.34.2019.02.12.08.10.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 08:10:23 -0800 (PST)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Feb 2019 08:10:21 -0800
Message-ID: <03b301d4c2ed$7497f360$5dc7da20$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdTC7WBBVX/83SbmTgCXqyIcSlzkhg==
Subject: Yocto Project Status WW07'19
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
X-List-Received-Date: Tue, 12 Feb 2019 16:10:23 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_03B4_01D4C2AA.667612F0"
Content-Language: en-us

------=_NextPart_000_03B4_01D4C2AA.667612F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Current Dev Position: YP 2.7 M3

Next Deadline: YP 2.7 M3 Cutoff is Feb. 25, 2019

 

SWAT Team Rotation:

*	SWAT lead is currently: Paul 
*	SWAT team rotation: Paul -> Ross on Feb. 15, 2019
*	SWAT team rotation: Ross -> Amanda on Feb. 22, 2019
*	 <https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team>
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

 

Key Status/Updates:

*	YP M2 rc1 had major problems in perl as fallout from the perl
upgrade and switch to perl-cross. We've therefore built an rc2 based on a
more recent master.
*	The python upgrade to 3.7 merged, thanks to AlexK for his hard work
on this. It means all of the major components in OE-Core are finally up to
date (many minor versions are still adrift).
*	Major util-linux changes have just merged which should hopefully
allow easier long term maintenance of this recipe (all binaries now have
their own package, this recipe kept being split up)
*	Build performance tests on the autobuilder have been improved and
builds now have automated result comparisons, e.g.:
<https://autobuilder.yocto.io/pub/non-release/20190212-7/testresults/buildpe
rf-ubuntu1604/perf-ubuntu1604_master_20190212045844_be52da1.html>
https://autobuilder.yocto.io/pub/non-release/20190212-7/testresults/buildper
f-ubuntu1604/perf-ubuntu1604_master_20190212045844_be52da1.html (from
<https://autobuilder.yoctoproject.org/typhoon/#/builders/92/builds/101>
https://autobuilder.yoctoproject.org/typhoon/#/builders/92/builds/101)
(Thanks to Markus for a lot of the underlying code/work)
*	Build performance can now compare master to master-next test builds
*	We continue to need help with ptest, both on the tests themselves
and on the results reporting. The intent is to have something similar to the
build performance pieces above.
*	The recipe reporting system integration with the layer index is
available at:  <https://layers.openembedded.org/rrs/recipes/OE-Core/2.7/M3/>
https://layers.openembedded.org/rrs/recipes/OE-Core/2.7/M3/ and the
historical data has now been imported.
*	The project is considering moving its mailing list hosting to
groups.io, if anyone has any experience of that, positive or negative please
let Michael, Nico and Richard know. Note that google has made further
significant changes to its mail processing at the detriment to mailing
lists:
<https://lists.freedesktop.org/archives/freedesktop/2019-February/000396.htm
l>
https://lists.freedesktop.org/archives/freedesktop/2019-February/000396.html
*	If anyone has feedback about the maintainers/recipe upgrade
processes or how to attract new recipe maintainers, please talk to Richard
Purdie / Ross Burton

 

Planned Releases for YP 2.7:

*	YP 2.7 M2 is being rebuilt and will go back to QA for rc2.
*	YP 2.7 M2 Release Target is Feb. 1, 2019
*	YP 2.7 M3 Cutoff is Feb. 25, 2019
*	YP 2.7 M3 Release Target is Mar. 8, 2019
*	YP 2.7 M4 Cutoff is Apr. 1, 2019
*	YP 2.7 M4 Release Target is Apr. 26, 2019

 

Planned upcoming dot releases:

*	YP 2.5.3 (Sumo) will be targeted after YP 2.7 M2 is done.
*	YP 2.5.4 (Sumo) will be targeted after YP 2.7 M4 is done.
*	YP 2.6.2 (Thud) will be targeted after YP 2.5.4 is done.

 

Tracking Metrics:

*	WDD 2353 (last week 2356) (
<https://wiki.yoctoproject.org/charts/combo.html>
https://wiki.yoctoproject.org/charts/combo.html)
*	Poky Patch Metrics  

*	Total patches found: 1527 (last week 1572
*	Patches in the Pending State: 663 (43%) [last week 678 (43%)]

 

Key Status Links for YP:

 <https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status>
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status

 <https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule>
https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule

 <https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features>
https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features

 

The Status reports are now stored on the wiki at:
<https://wiki.yoctoproject.org/wiki/Weekly_Status>
https://wiki.yoctoproject.org/wiki/Weekly_Status

 

[If anyone has suggestions for other information you'd like to see on this
weekly status update, let us know!]

 

Thanks,

 

Stephen K. Jolley

Yocto Project Project Manager

*    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> 

 


------=_NextPart_000_03B4_01D4C2AA.667612F0
Content-Type: text/html;
	boundary="----=_NextPart_000_04B4_01D4BD27.25A3C110";
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
	{font-family:"MS Sans Serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;}
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
	{mso-list-id:83459948;
	mso-list-template-ids:1540109106;}
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
	{mso-list-id:338429312;
	mso-list-template-ids:1784317356;}
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
	{mso-list-id:595863204;
	mso-list-template-ids:622891490;}
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
	{mso-list-id:808859587;
	mso-list-template-ids:-1027860384;}
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
	{mso-list-id:1047604622;
	mso-list-template-ids:-1292573438;}
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
	{mso-list-id:1197812363;
	mso-list-template-ids:-1001640280;}
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
	{mso-list-id:1202326758;
	mso-list-template-ids:-115583536;}
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
	{mso-list-id:1316492762;
	mso-list-template-ids:-573955092;}
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
	{mso-list-id:1330523437;
	mso-list-template-ids:-2076256000;}
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
	{mso-list-id:1644700854;
	mso-list-template-ids:766140848;}
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
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Current Dev =
Position: YP 2.7 M3</span><o:p></o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Next Deadline: YP =
2.7 M3 Cutoff is Feb. 25, 2019</span><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>SWAT Team =
Rotation:</span><o:p></o:p></p><ul style=3D'margin-top:0in' =
type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l9 level1 lfo6;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>SWAT lead is currently: Paul =
<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l9 level1 lfo6;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>SWAT team rotation: Paul -&gt; =
Ross on Feb. 15, 2019<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l9 level1 lfo6;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>SWAT team rotation: Ross -&gt; =
Amanda on Feb. 22, 2019<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l9 level1 lfo6;vertical-align:baseline'><span =
style=3D'font-family:Consolas'><a =
href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team"=
><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/wiki/Yocto_Build_Fa=
ilure_Swat_Team</span></a><o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Key =
Status/Updates:</span><o:p></o:p></p><ul style=3D'margin-top:0in' =
type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l1 level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP M2 rc1 had major problems in =
perl as fallout from the perl upgrade and switch to perl-cross. =
We&#8217;ve therefore built an rc2 based on a more recent =
master.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l1 level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>The python upgrade to 3.7 =
merged, thanks to AlexK for his hard work on this. It means all of the =
major components in OE-Core are finally up to date (many minor versions =
are still adrift).<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l1 level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Major util-linux changes have =
just merged which should hopefully allow easier long term maintenance of =
this recipe (all binaries now have their own package, this recipe kept =
being split up)<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l1 level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Build performance tests on the =
autobuilder have been improved and builds now have automated result =
comparisons, e.g.: <a =
href=3D"https://autobuilder.yocto.io/pub/non-release/20190212-7/testresul=
ts/buildperf-ubuntu1604/perf-ubuntu1604_master_20190212045844_be52da1.htm=
l"><span =
style=3D'color:#1155CC'>https://autobuilder.yocto.io/pub/non-release/2019=
0212-7/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master_2019021204=
5844_be52da1.html</span></a> (from <a =
href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/92/builds=
/101"><span =
style=3D'color:#1155CC'>https://autobuilder.yoctoproject.org/typhoon/#/bu=
ilders/92/builds/101</span></a>) (Thanks to Markus for a lot of the =
underlying code/work)<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l1 level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Build performance can now =
compare master to master-next test builds<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l1 level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>We continue to need help with =
ptest, both on the tests themselves and on the results reporting. The =
intent is to have something similar to the build performance pieces =
above.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l1 level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>The recipe reporting system =
integration with the layer index is available at: <a =
href=3D"https://layers.openembedded.org/rrs/recipes/OE-Core/2.7/M3/"><spa=
n =
style=3D'color:#1155CC'>https://layers.openembedded.org/rrs/recipes/OE-Co=
re/2.7/M3/</span></a> and the historical data has now been =
imported.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l1 level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>The project is considering =
moving its mailing list hosting to groups.io, if anyone has any =
experience of that, positive or negative please let Michael, Nico and =
Richard know. Note that google has made further significant changes to =
its mail processing at the detriment to mailing lists: <a =
href=3D"https://lists.freedesktop.org/archives/freedesktop/2019-February/=
000396.html"><span =
style=3D'color:#1155CC'>https://lists.freedesktop.org/archives/freedeskto=
p/2019-February/000396.html</span></a><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l1 level1 lfo7;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>If anyone has feedback about =
the maintainers/recipe upgrade processes or how to attract new recipe =
maintainers, please talk to Richard Purdie / Ross =
Burton<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Planned Releases =
for YP 2.7:</span><o:p></o:p></p><ul style=3D'margin-top:0in' =
type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l7 level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 2.7 M2 is being rebuilt and =
will go back to QA for rc2.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l7 level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 2.7 M2 Release Target is =
Feb. 1, 2019<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l7 level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 2.7 M3 Cutoff is Feb. 25, =
2019<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l7 level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 2.7 M3 Release Target is =
Mar. 8, 2019<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l7 level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 2.7 M4 Cutoff is Apr. 1, =
2019<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l7 level1 lfo8;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 2.7 M4 Release Target is =
Apr. 26, 2019<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Planned upcoming =
dot releases:</span><o:p></o:p></p><ul style=3D'margin-top:0in' =
type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l8 level1 lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 2.5.3 (Sumo) will be =
targeted after YP 2.7 M2 is done.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l8 level1 lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 2.5.4 (Sumo) will be =
targeted after YP 2.7 M4 is done.<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l8 level1 lfo9;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>YP 2.6.2 (Thud) will be =
targeted after YP 2.5.4 is done.<o:p></o:p></span></li></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Tracking =
Metrics:</span><o:p></o:p></p><ul style=3D'margin-top:0in' =
type=3Ddisc><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l6 level1 lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>WDD 2353 (last week =
2356)</span><span style=3D'font-family:Consolas'> (</span><span =
style=3D'font-family:"Arial",sans-serif'><a =
href=3D"https://wiki.yoctoproject.org/charts/combo.html"><span =
style=3D'color:#1155CC'>https://wiki.yoctoproject.org/charts/combo.html</=
span></a></span><span style=3D'font-family:Consolas'>)</span><span =
style=3D'font-family:"Arial",sans-serif'><o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l6 level1 lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Poky Patch Metrics =
&nbsp;</span><span =
style=3D'font-family:Consolas'><o:p></o:p></span></li><ul =
style=3D'margin-top:0in' type=3Dcircle><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l6 level2 lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Total patches found: 1527 (last =
week 1572<o:p></o:p></span></li><li =
style=3D'color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001=
pt;mso-list:l6 level2 lfo10;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif'>Patches in the Pending State: =
663 (43%) [last week 678 (43%)]</span><span =
style=3D'font-family:Consolas'><o:p></o:p></span></li></ul></ul><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Key Status Links =
for YP:</span><o:p></o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><a =
href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status"><sp=
an =
style=3D'font-family:Consolas;color:#1155CC'>https://wiki.yoctoproject.or=
g/wiki/Yocto_Project_v2.7_Status</span></a><o:p></o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><a =
href=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule"><span =
style=3D'font-family:Consolas;color:#1155CC'>https://wiki.yoctoproject.or=
g/wiki/Yocto_2.7_Schedule</span></a><o:p></o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><a =
href=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features"><span =
style=3D'font-family:Consolas;color:#1155CC'>https://wiki.yoctoproject.or=
g/wiki/Yocto_2.7_Features</span></a><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>The Status reports =
are now stored on the wiki at: </span><a =
href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status"><span =
style=3D'font-family:"Arial",sans-serif;color:#1155CC'>https://wiki.yocto=
project.org/wiki/Weekly_Status</span></a><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0in;margin-bottom:.0001pt'><span =
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
Project Project Manager<o:p></o:p></span></b></p><p =
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

------=_NextPart_000_03B4_01D4C2AA.667612F0--
