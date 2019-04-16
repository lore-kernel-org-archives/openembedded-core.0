Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 470607C608
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 14:55:04 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id n25so25871856wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version;
	bh=8PWVruPZYDvSBOV6YUJEmp8TeNbzmefZjgZTssANxuc=;
	b=c0zM0j9OWoIcSzrr4N51B94+uNk5i8NNkiFNisxAzjpsD4hgZiCNxPU6HgVAO7hzIM
	6UgG8qV+FxSFoxs8Zef0+uqTl8D2U9pd1YQ3EH5hUhReIapfJqLFp5jV52tVXCWxs+gX
	INMLWKPgpH4RMmiZDzaxyvtSSr0LxFKjaQ00o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version;
	bh=8PWVruPZYDvSBOV6YUJEmp8TeNbzmefZjgZTssANxuc=;
	b=b6w45Ii/ppQsefM/EuqPx/V6u/+MKXPp6TFZoZppFIdda1bb+ziB24q3z8mrsHmojw
	YKgeBX6eZSIs34WEAe7wbO5eePX9OiFvbXVfpAaUULooRjwONkgxtgSarCpzo9SfizGI
	6kZnceZapG37wZA0E9ID1RKojx/sE8gXUQvucLwJOF8Zr90FCL3eeIe1adT8h17D5g7q
	3R34IpWtkEqn6lEXFb8gxsOIAU5ZM3QwDFXSRe+Odmgf1xj+nD7YmEDYtXojMK6tiqmg
	Htq8Px46PVBoZyTikDFjdFuDqxxfurzqWKaCNH6RC+fGpf5OVVOMEXA+DWZUtN7kqMMc
	ecKg==
X-Gm-Message-State: APjAAAVnsyBaOECXIz1xBX5hyN9hIfrZJZcd0Iv7fLMJZJptAntchAhm
	te2Mma05+MvKIGnTOooPg3abghBls7c=
X-Google-Smtp-Source: APXvYqzqNPLOPQNKKuaSAhh7GTjGT2rCojnmjB6YIBtuqiaKHijBxgyXgd44HAjcoV7SIb7uT5d6ew==
X-Received: by 2002:a05:600c:d7:: with SMTP id
	u23mr27465423wmm.30.1555426504659; 
	Tue, 16 Apr 2019 07:55:04 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t81sm42822507wmb.5.2019.04.16.07.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Apr 2019 07:55:03 -0700 (PDT)
Message-ID: <7ac0389d612a596a3eab10161630c4662a70b63a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2019 15:55:01 +0100
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Yocto Project Status WW15'19
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
X-List-Received-Date: Tue, 16 Apr 2019 14:55:04 -0000
Content-Type: multipart/alternative; boundary="=-CFdbZfC1OsghrYqApM9V"

--=-CFdbZfC1OsghrYqApM9V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.7 M4 (2.7 rc2 is in QA)
Next Deadline: YP 2.7 Release Target April 26, 2019

SWAT Team Rotation:
SWAT lead is currently: Chen SWAT team rotation: Chen -> Armin on Apr.
19, 2019SWAT team rotation: Armin -> Anuj on Apr. 26, 2019
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
Next Team Meetings:
YP 2.8 Planning meeting Tuesday April 16nd at 8am PDT (
https://zoom.us/j/990892712) Bug Triage meeting Thursday April 18th at
7:30am PDT (https://zoom.us/j/454367603)
Key Status/Updates:
Stephen is unavailable at the moment, please refer any queries to
RichardYP 2.6.2 was rebuilt as rc4 to include the boost upgrade revert
and is due to be released today. The YP 2.6.2 rc3/4 report is
summarized at 
https://lists.yoctoproject.org/pipermail/yocto/2019-April/044827.html
and the results are at https://autobuilder.yocto.io/pub/releases/yocto
-2.6.2.rc4/testresults/.YP 2.5.3 is currently going through the QA
process.We’re sad to announce that we will be removing eclipse plugin
builds from the autobuilder and will not be including the plugin in any
future project releases. This is due to a lack of anyone able to help
work on the plugin development, bug fixing or release.The key fixes
mentioned in last week’s status have been merged into 2.7.A key bug in
pseudo was identified which may be the root cause of the long standing
glibc-locale uid “host contamination” issue. Many thanks to Peter and
Otavio for the help in debugging that. A separate fix should also
ensure pseudo works with newer distro coreutils and glibc versions.YP
2.7 rc2 (warrior) was built successfully and is currently going through
the QA process after 2.5.3 is done.The ptest results in 2.7 are much
more stable than ever before with results being consistent from build
to build. At the start of 2.8 we can make some further improvements so
we take advantage of this and build upon it to reduce regressions in
the system.In an effort to keep the patch queue under control, patches
are merging to master.The list of issues from last week of worrying
things we lack resources to improve upon remains:Intermittent
autobuilder failures (fork running out of resources - which resources?,
oe-selftest intermittent issues, gpg signing resource problems,
occasional PR server failure and more)Build-appliance testing issues
(show up on each QA report across multiple releases)40% valgrind ptest
failuresKnown bitbake memory resident bugsOther ptest failuresThe 2.8
planning discussions are starting and there is a google doc summarising
the discussions so far: 
https://docs.google.com/document/d/1CNEKA4d0eT6-e0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/If
people are planning to work on specific things in 2.8 please let us
know so we can incorporate this into our plans. If you’re interested in
working on anything in the document, please also let us know or talk
with us in one of the planning meetings.

Planned Releases for YP 2.7:
YP 2.7 M4 Cutoff was Apr. 1, 2019YP 2.7 M4 Release Target is Apr. 26,
2019
Planned upcoming dot releases:
YP 2.5.3 (Sumo) is in QA.
Tracking Metrics:
WDD 2523 (last week 2471) (
https://wiki.yoctoproject.org/charts/combo.html)Poky Patch Metrics
 Total patches found: 1553 (last week 1553)Patches in the Pending
State: 654 (42%) [last week 655 (42%)]
Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features

The Status reports are now stored on the wiki at: 
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you’d like to see on
this weekly status update, let us know!]



--=-CFdbZfC1OsghrYqApM9V
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40" dir=3D"ltr"><head><meta http-equiv=3D"Content-T=
ype" content=3D"text/html; charset=3Dus-ascii"><meta name=3D"Generator" con=
tent=3D"Microsoft Word 15 (filtered medium)"><style><!--
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:9306114;
	mso-list-template-ids:96222662;}
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
	{mso-list-id:589238245;
	mso-list-template-ids:-540117286;}
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
	{mso-list-id:1099106041;
	mso-list-template-ids:1505633780;}
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
	{mso-list-id:1171020936;
	mso-list-template-ids:353788822;}
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
	{mso-list-id:1316642243;
	mso-list-template-ids:-1181954362;}
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
	{mso-list-id:1955483210;
	mso-list-template-ids:1375898524;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3D"EN-US" style=3D"text=
-align:left; direction:ltr;"><div class=3D"WordSection1"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;" id=3D"docs-intern=
al-guid-af0fe036-7fff-4ed3-75d8-b948c828758d"><span style=3D"font-size: 11p=
t; font-family: Arial; background-color: transparent; font-variant-ligature=
s: normal; font-variant-east-asian: normal; font-variant-position: normal; =
vertical-align: baseline; white-space: pre-wrap;">Current Dev Position: YP =
2.7 M4 (2.7 rc2 is in QA)</span></p><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre-wrap;">Next Deadline: YP 2.7 Release Targ=
et April 26, 2019</span></p><p style=3D"margin:0in;margin-bottom:.0001pt"><=
br></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; background-colo=
r: transparent; font-variant-ligatures: normal; font-variant-east-asian: no=
rmal; font-variant-position: normal; vertical-align: baseline; white-space:=
 pre-wrap;">SWAT Team Rotation:</span></p><ul style=3D"margin-top:0pt;margi=
n-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 1=
1pt; font-family: Arial; background-color: transparent; font-variant-ligatu=
res: normal; font-variant-east-asian: normal; font-variant-position: normal=
; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 1=
1pt; background-color: transparent; font-variant-ligatures: normal; font-va=
riant-east-asian: normal; font-variant-position: normal; vertical-align: ba=
seline; white-space: pre-wrap;">SWAT lead is currently: Chen </span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-fam=
ily: Arial; background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; vertical-al=
ign: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgrou=
nd-color: transparent; font-variant-ligatures: normal; font-variant-east-as=
ian: normal; font-variant-position: normal; vertical-align: baseline; white=
-space: pre-wrap;">SWAT team rotation: Chen -&gt; Armin on Apr. 19, 2019</s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11p=
t; font-family: Arial; background-color: transparent; font-variant-ligature=
s: normal; font-variant-east-asian: normal; font-variant-position: normal; =
vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11p=
t; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line; white-space: pre-wrap;">SWAT team rotation: Armin -&gt; Anuj on Apr. =
26, 2019</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; fon=
t-size: 11pt; font-family: Consolas; background-color: transparent; font-va=
riant-ligatures: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"http=
s://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team" style=3D"text=
-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204);=
 background-color: transparent; font-variant-ligatures: normal; font-varian=
t-east-asian: normal; font-variant-position: normal; text-decoration: under=
line; text-decoration-skip: none; vertical-align: baseline; white-space: pr=
e-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</=
span></a></p></li></ul><p style=3D"margin:0in;margin-bottom:.0001pt"><br></=
p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
;"><span style=3D"font-size: 11pt; font-family: Arial; background-color: tr=
ansparent; font-variant-ligatures: normal; font-variant-east-asian: normal;=
 font-variant-position: normal; vertical-align: baseline; white-space: pre-=
wrap;">Next Team Meetings:</span></p><ul style=3D"margin-top:0pt;margin-bot=
tom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; =
font-family: Arial; background-color: transparent; font-variant-ligatures: =
normal; font-variant-east-asian: normal; font-variant-position: normal; ver=
tical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; =
background-color: transparent; font-variant-ligatures: normal; font-variant=
-east-asian: normal; font-variant-position: normal; vertical-align: baselin=
e; white-space: pre-wrap;">YP 2.8 Planning meeting Tuesday April 16nd at 8a=
m PDT (</span><a href=3D"https://zoom.us/j/990892712" style=3D"text-decorat=
ion:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204); backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; text-decoration: underline; te=
xt-decoration-skip: none; vertical-align: baseline; white-space: pre-wrap;"=
>https://zoom.us/j/990892712)</span></a><span style=3D"font-size: 11pt; bac=
kground-color: transparent; font-variant-ligatures: normal; font-variant-ea=
st-asian: normal; font-variant-position: normal; vertical-align: baseline; =
white-space: pre-wrap;"> </span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type: disc; font-size: 11pt; font-family: Arial; background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; vertical-align: baseline; white-space: pre;"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><=
span style=3D"font-size: 11pt; background-color: transparent; font-variant-=
ligatures: normal; font-variant-east-asian: normal; font-variant-position: =
normal; vertical-align: baseline; white-space: pre-wrap;">Bug Triage meetin=
g Thursday April 18th at 7:30am PDT (</span><a href=3D"https://zoom.us/j/45=
4367603" style=3D"text-decoration:none;"><span style=3D"font-size: 10pt; co=
lor: rgb(17, 85, 204); background-color: transparent; font-variant-ligature=
s: normal; font-variant-east-asian: normal; font-variant-position: normal; =
text-decoration: underline; text-decoration-skip: none; vertical-align: bas=
eline; white-space: pre-wrap;">https://zoom.us/j/454367603</span></a><span =
style=3D"font-size: 11pt; background-color: transparent; font-variant-ligat=
ures: normal; font-variant-east-asian: normal; font-variant-position: norma=
l; vertical-align: baseline; white-space: pre-wrap;">)</span></p></li></ul>=
<p style=3D"margin:0in;margin-bottom:.0001pt"><br></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; font-family: Arial; background-color: transparent; font-varian=
t-ligatures: normal; font-variant-east-asian: normal; font-variant-position=
: normal; vertical-align: baseline; white-space: pre-wrap;">Key Status/Upda=
tes:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"l=
tr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; ba=
ckground-color: transparent; font-variant-ligatures: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; vertical-align: baseline;=
 white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: tran=
sparent; font-variant-ligatures: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; vertical-align: baseline; white-space: pre-wr=
ap;">Stephen is unavailable at the moment, please refer any queries to Rich=
ard</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-siz=
e: 11pt; font-family: Arial; background-color: transparent; font-variant-li=
gatures: normal; font-variant-east-asian: normal; font-variant-position: no=
rmal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-siz=
e: 11pt; background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; vertical-align=
: baseline; white-space: pre-wrap;">YP 2.6.2 was rebuilt as rc4 to include =
the boost upgrade revert and is due to be released today. The YP 2.6.2 rc3/=
4 report is summarized at </span><a href=3D"https://lists.yoctoproject.org/=
pipermail/yocto/2019-April/044827.html" style=3D"text-decoration:none;"><sp=
an style=3D"font-size: 11pt; color: rgb(17, 85, 204); background-color: tra=
nsparent; font-variant-ligatures: normal; font-variant-east-asian: normal; =
font-variant-position: normal; text-decoration: underline; text-decoration-=
skip: none; vertical-align: baseline; white-space: pre-wrap;">https://lists=
.yoctoproject.org/pipermail/yocto/2019-April/044827.html</span></a><span st=
yle=3D"font-size: 11pt; background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 vertical-align: baseline; white-space: pre-wrap;"> and the results are at =
</span><a href=3D"https://autobuilder.yocto.io/pub/releases/yocto-2.7_M3.rc=
1/testresults/" style=3D"text-decoration:none;"><span style=3D"font-size: 1=
1pt; color: rgb(17, 85, 204); background-color: transparent; font-variant-l=
igatures: normal; font-variant-east-asian: normal; font-variant-position: n=
ormal; text-decoration: underline; text-decoration-skip: none; vertical-ali=
gn: baseline; white-space: pre-wrap;">https://autobuilder.yocto.io/pub/rele=
ases/yocto-2.6.2.rc4/testresults/</span></a><span style=3D"font-size: 11pt;=
 background-color: transparent; font-variant-ligatures: normal; font-varian=
t-east-asian: normal; font-variant-position: normal; vertical-align: baseli=
ne; white-space: pre-wrap;">.</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type: disc; font-size: 11pt; font-family: Arial; background-color: tr=
ansparent; font-variant-ligatures: normal; font-variant-east-asian: normal;=
 font-variant-position: normal; vertical-align: baseline; white-space: pre;=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
;"><span style=3D"font-size: 11pt; background-color: transparent; font-vari=
ant-ligatures: normal; font-variant-east-asian: normal; font-variant-positi=
on: normal; vertical-align: baseline; white-space: pre-wrap;">YP 2.5.3 is c=
urrently going through the QA process.</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; background-=
color: transparent; font-variant-ligatures: normal; font-variant-east-asian=
: normal; font-variant-position: normal; vertical-align: baseline; white-sp=
ace: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent; =
font-variant-ligatures: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; vertical-align: baseline; white-space: pre-wrap;">We=
=E2=80=99re sad to announce that we will be removing eclipse plugin builds =
from the autobuilder and will not be including the plugin in any future pro=
ject releases. This is due to a lack of anyone able to help work on the plu=
gin development, bug fixing or release.</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; background=
-color: transparent; font-weight: 700; font-variant-ligatures: normal; font=
-variant-east-asian: normal; font-variant-position: normal; vertical-align:=
 baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-c=
olor: transparent; font-weight: 400; font-variant-ligatures: normal; font-v=
ariant-east-asian: normal; font-variant-position: normal; vertical-align: b=
aseline; white-space: pre-wrap;">The key fixes mentioned in last week=E2=80=
=99s status have been merged into 2.7.</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; background-=
color: transparent; font-variant-ligatures: normal; font-variant-east-asian=
: normal; font-variant-position: normal; vertical-align: baseline; white-sp=
ace: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent; =
font-variant-ligatures: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; vertical-align: baseline; white-space: pre-wrap;">A ke=
y bug in pseudo was identified which may be the root cause of the long stan=
ding glibc-locale uid =E2=80=9Chost contamination=E2=80=9D issue. Many than=
ks to Peter and Otavio for the help in debugging that. A separate fix shoul=
d also ensure pseudo works with newer distro coreutils and glibc versions.<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 1=
1pt; font-family: Arial; background-color: transparent; font-weight: 700; f=
ont-variant-ligatures: normal; font-variant-east-asian: normal; font-varian=
t-position: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span sty=
le=3D"font-size: 11pt; background-color: transparent; font-weight: 400; fon=
t-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-=
position: normal; vertical-align: baseline; white-space: pre-wrap;">YP 2.7 =
rc2 (warrior) was built successfully and is currently going through the QA =
process after 2.5.3 is done.</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type: disc; font-size: 11pt; font-family: Arial; background-color: tra=
nsparent; font-variant-ligatures: normal; font-variant-east-asian: normal; =
font-variant-position: normal; vertical-align: baseline; white-space: pre;"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;=
"><span style=3D"font-size: 11pt; background-color: transparent; font-varia=
nt-ligatures: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; vertical-align: baseline; white-space: pre-wrap;">The ptest resu=
lts in 2.7 are much more stable than ever before with results being consist=
ent from build to build. At the start of 2.8 we can make some further impro=
vements so we take advantage of this and build upon it to reduce regression=
s in the system.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: d=
isc; font-size: 11pt; font-family: Arial; background-color: transparent; fo=
nt-variant-ligatures: normal; font-variant-east-asian: normal; font-variant=
-position: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline; white-space: pre-wrap;">In an effort to keep the p=
atch queue under control, patches are merging to master.</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: =
Arial; background-color: transparent; font-variant-ligatures: normal; font-=
variant-east-asian: normal; font-variant-position: normal; vertical-align: =
baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-co=
lor: transparent; font-variant-ligatures: normal; font-variant-east-asian: =
normal; font-variant-position: normal; vertical-align: baseline; white-spac=
e: pre-wrap;">The list of issues from last week of worrying things we lack =
resources to improve upon remains:</span></p></li><ul style=3D"margin-top:0=
pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: circle; fo=
nt-size: 11pt; font-family: Arial; background-color: transparent; font-vari=
ant-ligatures: normal; font-variant-east-asian: normal; font-variant-positi=
on: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fo=
nt-size: 11pt; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline; white-space: pre-wrap;">Intermittent autobuilder failures=
 (fork running out of resources - which resources?, oe-selftest intermitten=
t issues, gpg signing resource problems, occasional PR server failure and m=
ore)</span></p></li><li dir=3D"ltr" style=3D"list-style-type: circle; font-=
size: 11pt; font-family: Arial; background-color: transparent; font-variant=
-ligatures: normal; font-variant-east-asian: normal; font-variant-position:=
 normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">Build-appliance testing issues (sho=
w up on each QA report across multiple releases)</span></p></li><li dir=3D"=
ltr" style=3D"list-style-type: circle; font-size: 11pt; font-family: Arial;=
 background-color: transparent; font-variant-ligatures: normal; font-varian=
t-east-asian: normal; font-variant-position: normal; vertical-align: baseli=
ne; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: t=
ransparent; font-variant-ligatures: normal; font-variant-east-asian: normal=
; font-variant-position: normal; vertical-align: baseline; white-space: pre=
-wrap;">40% valgrind ptest failures</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type: circle; font-size: 11pt; font-family: Arial; background-c=
olor: transparent; font-variant-ligatures: normal; font-variant-east-asian:=
 normal; font-variant-position: normal; vertical-align: baseline; white-spa=
ce: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent; f=
ont-variant-ligatures: normal; font-variant-east-asian: normal; font-varian=
t-position: normal; vertical-align: baseline; white-space: pre-wrap;">Known=
 bitbake memory resident bugs</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type: circle; font-size: 11pt; font-family: Arial; background-color: =
transparent; font-variant-ligatures: normal; font-variant-east-asian: norma=
l; font-variant-position: normal; vertical-align: baseline; white-space: pr=
e;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;"><span style=3D"font-size: 11pt; background-color: transparent; font-va=
riant-ligatures: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; vertical-align: baseline; white-space: pre-wrap;">Other ptest=
 failures</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type: dis=
c; font-size: 11pt; font-family: Arial; background-color: transparent; font=
-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-p=
osition: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">The 2.8 planning discussion=
s are starting and there is a google doc summarising the discussions so far=
: </span><a href=3D"https://docs.google.com/document/d/1CNEKA4d0eT6-e0hnS2p=
wi7xdZ5_t6smpZO2HbaJGXbU/" style=3D"text-decoration:none;"><span style=3D"f=
ont-size: 11pt; color: rgb(17, 85, 204); background-color: transparent; fon=
t-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-=
position: normal; text-decoration: underline; text-decoration-skip: none; v=
ertical-align: baseline; white-space: pre-wrap;">https://docs.google.com/do=
cument/d/1CNEKA4d0eT6-e0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/</span></a></p></li><=
/ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;margin-left: 36pt;"><span style=3D"font-size: 11pt; font-family: Arial; =
background-color: transparent; font-variant-ligatures: normal; font-variant=
-east-asian: normal; font-variant-position: normal; vertical-align: baselin=
e; white-space: pre-wrap;">If people are planning to work on specific thing=
s in 2.8 please let us know so we can incorporate this into our plans. If y=
ou=E2=80=99re interested in working on anything in the document, please als=
o let us know or talk with us in one of the planning meetings.</span></p><p=
 style=3D"margin:0in;margin-bottom:.0001pt"><br></p><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-si=
ze: 11pt; font-family: Arial; background-color: transparent; font-variant-l=
igatures: normal; font-variant-east-asian: normal; font-variant-position: n=
ormal; vertical-align: baseline; white-space: pre-wrap;">Planned Releases f=
or YP 2.7:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li di=
r=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Ari=
al; background-color: transparent; font-variant-ligatures: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; vertical-align: bas=
eline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color=
: transparent; font-variant-ligatures: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; vertical-align: baseline; white-space: =
pre-wrap;">YP 2.7 M4 Cutoff was Apr. 1, 2019</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backg=
round-color: transparent; font-variant-ligatures: normal; font-variant-east=
-asian: normal; font-variant-position: normal; vertical-align: baseline; wh=
ite-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transpa=
rent; font-variant-ligatures: normal; font-variant-east-asian: normal; font=
-variant-position: normal; vertical-align: baseline; white-space: pre-wrap;=
">YP 2.7 M4 Release Target is Apr. 26, 2019</span></p></li></ul><p style=3D=
"margin:0in;margin-bottom:.0001pt"><br></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt;=
 font-family: Arial; background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">Planned upcoming dot releas=
es:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"lt=
r" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; bac=
kground-color: transparent; font-variant-ligatures: normal; font-variant-ea=
st-asian: normal; font-variant-position: normal; vertical-align: baseline; =
white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: trans=
parent; font-variant-ligatures: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; vertical-align: baseline; white-space: pre-wra=
p;">YP 2.5.3 (Sumo) is in QA.</span></p></li></ul><p style=3D"margin:0in;ma=
rgin-bottom:.0001pt"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: =
Arial; background-color: transparent; font-variant-ligatures: normal; font-=
variant-east-asian: normal; font-variant-position: normal; vertical-align: =
baseline; white-space: pre-wrap;">Tracking Metrics:</span></p><ul style=3D"=
margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type=
: disc; font-size: 11pt; font-family: Arial; background-color: transparent;=
 font-variant-ligatures: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; vertical-align: baseline; white-space: pre;"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre-wrap;">WDD 2523 (last week 2=
471)</span><span style=3D"font-size: 11pt; font-family: Consolas; backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; vertical-align: baseline; white-=
space: pre-wrap;"> (</span><a href=3D"https://wiki.yoctoproject.org/charts/=
combo.html" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt;=
 color: rgb(17, 85, 204); background-color: transparent; font-variant-ligat=
ures: normal; font-variant-east-asian: normal; font-variant-position: norma=
l; text-decoration: underline; text-decoration-skip: none; vertical-align: =
baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/charts/comb=
o.html</span></a><span style=3D"font-size: 11pt; font-family: Consolas; bac=
kground-color: transparent; font-variant-ligatures: normal; font-variant-ea=
st-asian: normal; font-variant-position: normal; vertical-align: baseline; =
white-space: pre-wrap;">)</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type: disc; font-size: 11pt; font-family: Consolas; background-color: tra=
nsparent; font-variant-ligatures: normal; font-variant-east-asian: normal; =
font-variant-position: normal; vertical-align: baseline; white-space: pre;"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;=
"><span style=3D"font-size: 11pt; font-family: Arial; background-color: tra=
nsparent; font-variant-ligatures: normal; font-variant-east-asian: normal; =
font-variant-position: normal; vertical-align: baseline; white-space: pre-w=
rap;">Poky Patch Metrics &nbsp;</span></p></li><ul style=3D"margin-top:0pt;=
margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: circle; font-=
size: 11pt; font-family: Arial; background-color: transparent; font-variant=
-ligatures: normal; font-variant-east-asian: normal; font-variant-position:=
 normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">Total patches found: 1553 (last wee=
k 1553)</span></p></li><li dir=3D"ltr" style=3D"list-style-type: circle; fo=
nt-size: 11pt; font-family: Consolas; background-color: transparent; font-v=
ariant-ligatures: normal; font-variant-east-asian: normal; font-variant-pos=
ition: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D=
"font-size: 11pt; font-family: Arial; background-color: transparent; font-v=
ariant-ligatures: normal; font-variant-east-asian: normal; font-variant-pos=
ition: normal; vertical-align: baseline; white-space: pre-wrap;">Patches in=
 the Pending State: 654 (42%) [last week 655 (42%)]</span></p></li></ul></u=
l><p style=3D"margin:0in;margin-bottom:.0001pt"><br></p><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fon=
t-size: 11pt; font-family: Arial; background-color: transparent; font-varia=
nt-ligatures: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; vertical-align: baseline; white-space: pre-wrap;">Key Status Lin=
ks for YP:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_P=
roject_v2.7_Status" style=3D"text-decoration:none;"><span style=3D"font-siz=
e: 11pt; font-family: Consolas; color: rgb(17, 85, 204); background-color: =
transparent; font-variant-ligatures: normal; font-variant-east-asian: norma=
l; font-variant-position: normal; text-decoration: underline; text-decorati=
on-skip: none; vertical-align: baseline; white-space: pre-wrap;">https://wi=
ki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status</span></a></p><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=
=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule" style=3D"text-de=
coration:none;"><span style=3D"font-size: 11pt; font-family: Consolas; colo=
r: rgb(17, 85, 204); background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; te=
xt-decoration: underline; text-decoration-skip: none; vertical-align: basel=
ine; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_2.7_S=
chedule</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_=
2.7_Features" style=3D"text-decoration:none;"><span style=3D"font-size: 11p=
t; font-family: Consolas; color: rgb(17, 85, 204); background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; text-decoration: underline; text-decoration-ski=
p: none; vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoc=
toproject.org/wiki/Yocto_2.7_Features</span></a></p><p style=3D"margin:0in;=
margin-bottom:.0001pt"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family=
: Arial; background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; vertical-align=
: baseline; white-space: pre-wrap;">The Status reports are now stored on th=
e wiki at: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Stat=
us" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; font-fa=
mily: Arial; color: rgb(17, 85, 204); background-color: transparent; font-v=
ariant-ligatures: normal; font-variant-east-asian: normal; font-variant-pos=
ition: normal; text-decoration: underline; text-decoration-skip: none; vert=
ical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org=
/wiki/Weekly_Status</span></a></p><p style=3D"margin:0in;margin-bottom:.000=
1pt"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; vertical-align: baseline; white-=
space: pre-wrap;">[If anyone has suggestions for other information you=E2=
=80=99d like to see on this weekly status update, let us know!]</span></p><=
p style=3D"margin:0in;margin-bottom:.0001pt"><br></p></div></body></html>

--=-CFdbZfC1OsghrYqApM9V--
