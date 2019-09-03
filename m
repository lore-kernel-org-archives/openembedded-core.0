Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8031E7DD70
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 21:02:05 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id g207so929312wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 14:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version;
	bh=TBKodlq8CL69TnUeBmuAFEqWs9oHn5kYHEpC+mLB6C0=;
	b=YkIn8cISDYJXNvDoXrSo4MLJ9T4qY9kmPY0y5tFn6ncr1ULe/jlQ3aevynX76+4Nlh
	eHeX++2WYfls5oQoJ2s1Ly2jQktzHAbE01IyqEHsESoUnYTmngcP+GLIBiKuJc48bnPa
	wAijiNUhPtKCY8ihC0/I5dO5A/OpsIwLlv6vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version;
	bh=TBKodlq8CL69TnUeBmuAFEqWs9oHn5kYHEpC+mLB6C0=;
	b=gVo1VQbb01tbnslrY+dHFvfYwkKvCWmx5Qr2ilT2/RQ2tdImWvy0xU2ET0JGoxkItE
	gtIrK68Thm8NywuOr7p5h5l1l4U6DwRWpcjjCMJPyODCvoL+JgeNl19qskLXEOA0ziAs
	3v24MnKWCNnxwEwHM1bQuA4tjSeugIkHfTESm46jNSNChajkohe+owxXu8PPV5QppW00
	yBguuL3tIbmCqYdCEz9gK/w0IP4AMAOtuScSOJ4h2IZTsZ092PYXPA3UnR2y+w/hQUDm
	10L6xf51PDTiK9jjEWb/ewRrEwpd5AE2Jejmdt3LrGGRKY8iFYdvIuY5JGRMcWkijz/i
	MWKg==
X-Gm-Message-State: APjAAAWLr5yoGhBqD6K4GwG9cRRO31zprjwAleKiFKJrLLc5gSZqQm5k
	Co8CI+gaZQXFARBRIv7wcjoTDZ8aaTuwWQ==
X-Google-Smtp-Source: APXvYqyAiV61CIClADZ5sv6K81huqRi4y2ujqWIsznxEW+27tv3aKtfd2GcmzZ46odfa6Y3yD2dWxw==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr1446318wmb.151.1567544525825; 
	Tue, 03 Sep 2019 14:02:05 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y13sm18154441wrg.8.2019.09.03.14.02.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 14:02:05 -0700 (PDT)
Message-ID: <5f8b6847cd6de8130d04167624c4a61a74519bac.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org, Yocto discussion list
	<yocto@yoctoproject.org>
Date: Tue, 03 Sep 2019 22:02:03 +0100
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1czNuKAmTE5?=
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
X-List-Received-Date: Tue, 03 Sep 2019 21:02:06 -0000
Content-Type: multipart/alternative; boundary="=-nzJM+BIdpUSR4vgtkVAn"

--=-nzJM+BIdpUSR4vgtkVAn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.8 M4 Feature FreezeNext Deadline: YP 3.0
Final Release 25th Oct
SWAT Team Rotation:SWAT lead is currently: ArminSWAT team rotation:
Armin -> Paul on Sept. 6, 2019SWAT team rotation: Paul -> Ross on Sept.
13, 2019
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
Next Team Meetings:Bug Triage meeting Thursday Sept 5th at 7:30am PDT (
https://zoom.us/j/454367603)Monthly Project Meeting Tuesday Sept. 3rd
at 8am PDT (https://zoom.us/j/990892712) Twitch - Next event is Tuesday
Sept. 10th at 8am PDT (https://www.twitch.tv/yocto_project)
Key Status/Updates:We’re now in feature freeze for 3.0 and working on
bug fixing for final releaseSeveral key 3.0 changes have now merged:5.2
linux-libc-kernel-headers5.2 kernel recipesRemoval of LSB and poky-lsb
and replacement with alt config testingPatches have significantly
reduced the dependency on python2Reproducible builds are now being
tested for core-image-minimalThere are the following changes still
under discussion/testing:Systemd vs. sysvinit defaults (maybe for the
poky alternative configuration tests)Making 5.2 the default kernel for
qemu (has regressions, see below)Hashserv performance issue
resolutionFinal configuration of hash equivalencytoolchain testsuite
patch seriesThe sstate hash equivalency continues to have challenges:we
need to rework the client/server communication to scale to the
autobuilderthere are some bugs in the code the autobuilder continues to
exposewe have cases where its not 100% clear what the correct behaviour
should betest cases are proving to be problematic to write in a
maintainable wayPatch merging is roughly up to date againWe have
several significant problematic bugs that are being worked on:5.2 stap
build issue on qemuarm5.2 kprobes error message (qemuarm64,
qemumips64)qemumips machine hangIf anyone has any status items for the
project they’d like to add to the weekly reports, please email
Richard+Stephen.
Planned Releases for YP 3.0 {2.8}:M3 Release 6th SeptM4 Cutoff 30th
Sept - this will be YP 3.0.YP 3.0 {2.8 (M4)} Final Release 25th Oct
Planned upcoming dot releases:YP 2.7.2 (Warrior) is planned for after
YP 3.0 release.YP 2.6.4 (Thud) is planned for after YP 2.7.2  release.
Tracking Metrics:WDD 2413 (last week 2485) (
https://wiki.yoctoproject.org/charts/combo.html)Poky Patch
Metrics  Total patches found: 1470 (last week 1474)Patches in the
Pending State: 611 (42%) [last week 613 (41%)]
Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Statushttps://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedulehttps://wiki.yoctoproject.org/wiki/Yocto_2.8_Features
The Yocto Project’s technical governance is through its Technical
Steering Committee, more information is available at:
https://wiki.yoctoproject.org/wiki/TSC
The Status reports are now stored on the wiki at: 
https://wiki.yoctoproject.org/wiki/Weekly_Status
[If anyone has suggestions for other information you’d like to see on
this weekly status update, let us know!]



--=-nzJM+BIdpUSR4vgtkVAn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;" id=3D"docs-internal-guid-903f53e5-7fff-e30b-026f-7e78755a9f86"><span s=
tyle=3D"font-family: Arial; font-size: 11pt; white-space: pre-wrap; backgro=
und-color: transparent;">Current Dev Position: YP 2.8 M4 Feature Freeze</sp=
an></p><pre><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; background=
-color: transparent; font-variant-ligatures: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; vertical-align: baseline; white-s=
pace: pre-wrap;">Next Deadline: YP 3.0 Final Release 25th Oct</span></p><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;=
"><span style=3D"font-size: 11pt; font-family: Arial; background-color: tra=
nsparent; font-variant-ligatures: normal; font-variant-east-asian: normal; =
font-variant-position: normal; vertical-align: baseline; white-space: pre-w=
rap;">SWAT Team Rotation:</span></p><ul style=3D"margin-top:0;margin-bottom=
:0;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-=
family: Arial; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: trans=
parent; font-variant-ligatures: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; vertical-align: baseline; white-space: pre-wra=
p;">SWAT lead is currently: Armin</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type: disc; font-size: 11pt; font-family: Arial; background-color=
: transparent; font-variant-ligatures: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; vertical-align: baseline;"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">SWAT team rotation: Armin -=
&gt; Paul on Sept. 6, 2019</span></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type: disc; font-size: 11pt; font-family: Arial; background-color: trans=
parent; font-variant-ligatures: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fon=
t-size: 11pt; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre-wrap;">SWAT team rotation: Paul -&gt; Ros=
s on Sept. 13, 2019</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
: disc; font-size: 11pt; font-family: Consolas, sans-serif; background-colo=
r: transparent; font-variant-ligatures: normal; font-variant-east-asian: no=
rmal; font-variant-position: normal; vertical-align: baseline;"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D=
"https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team" style=3D=
"text-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, =
204); background-color: transparent; font-variant-ligatures: normal; font-v=
ariant-east-asian: normal; font-variant-position: normal; text-decoration: =
underline; text-decoration-skip: none; vertical-align: baseline; white-spac=
e: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_T=
eam</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-famil=
y: Arial; background-color: transparent; font-variant-ligatures: normal; fo=
nt-variant-east-asian: normal; font-variant-position: normal; vertical-alig=
n: baseline; white-space: pre-wrap;">Next Team Meetings:</span></p><ul styl=
e=3D"margin-top:0;margin-bottom:0;"><li dir=3D"ltr" style=3D"list-style-typ=
e: disc; font-size: 11pt; font-family: Arial; background-color: transparent=
; font-variant-ligatures: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size=
: 11pt; background-color: transparent; font-variant-ligatures: normal; font=
-variant-east-asian: normal; font-variant-position: normal; vertical-align:=
 baseline; white-space: pre-wrap;">Bug Triage meeting Thursday Sept 5th at =
7:30am PDT (</span><a href=3D"https://zoom.us/j/454367603" style=3D"text-de=
coration:none;"><span style=3D"font-size: 10pt; color: rgb(17, 85, 204); ba=
ckground-color: transparent; font-variant-ligatures: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; text-decoration: underlin=
e; text-decoration-skip: none; vertical-align: baseline; white-space: pre-w=
rap;">https://zoom.us/j/454367603</span></a><span style=3D"font-size: 11pt;=
 background-color: transparent; font-variant-ligatures: normal; font-varian=
t-east-asian: normal; font-variant-position: normal; vertical-align: baseli=
ne; white-space: pre-wrap;">)</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type: disc; font-size: 11pt; font-family: Arial; background-color: tr=
ansparent; font-variant-ligatures: normal; font-variant-east-asian: normal;=
 font-variant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"=
font-size: 11pt; background-color: transparent; font-variant-ligatures: nor=
mal; font-variant-east-asian: normal; font-variant-position: normal; vertic=
al-align: baseline; white-space: pre-wrap;">Monthly Project Meeting Tuesday=
 Sept. 3rd at 8am PDT (</span><a href=3D"https://zoom.us/j/990892712" style=
=3D"text-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 8=
5, 204); background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; text-decoratio=
n: underline; text-decoration-skip: none; vertical-align: baseline; white-s=
pace: pre-wrap;">https://zoom.us/j/990892712)</span></a><span style=3D"font=
-size: 11pt; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">&nbsp;</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; bac=
kground-color: transparent; font-variant-ligatures: normal; font-variant-ea=
st-asian: normal; font-variant-position: normal; vertical-align: baseline;"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;=
"><span style=3D"font-size: 11pt; background-color: transparent; font-varia=
nt-ligatures: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; vertical-align: baseline; white-space: pre-wrap;">Twitch - Next =
event is Tuesday Sept. 10th at 8am PDT (</span><a href=3D"https://www.twitc=
h.tv/yocto_project" style=3D"text-decoration:none;"><span style=3D"font-siz=
e: 11pt; color: rgb(17, 85, 204); background-color: transparent; font-varia=
nt-ligatures: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; text-decoration: underline; text-decoration-skip: none; vertical=
-align: baseline; white-space: pre-wrap;">https://www.twitch.tv/yocto_proje=
ct</span></a><span style=3D"font-size: 11pt; background-color: transparent;=
 font-variant-ligatures: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; vertical-align: baseline; white-space: pre-wrap;">)</=
span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial;=
 background-color: transparent; font-variant-ligatures: normal; font-varian=
t-east-asian: normal; font-variant-position: normal; vertical-align: baseli=
ne; white-space: pre-wrap;">Key Status/Updates:</span></p><ul style=3D"marg=
in-top:0;margin-bottom:0;"><li dir=3D"ltr" style=3D"list-style-type: disc; =
font-size: 11pt; font-family: Arial; background-color: transparent; font-va=
riant-ligatures: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; b=
ackground-color: transparent; font-variant-ligatures: normal; font-variant-=
east-asian: normal; font-variant-position: normal; vertical-align: baseline=
; white-space: pre-wrap;">We=E2=80=99re now in feature freeze for 3.0 and w=
orking on bug fixing for final release</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; background-=
color: transparent; font-variant-ligatures: normal; font-variant-east-asian=
: normal; font-variant-position: normal; vertical-align: baseline;"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre-wrap;">Several key 3.0 chang=
es have now merged:</span></p></li><ul style=3D"margin-top:0;margin-bottom:=
0;"><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font=
-family: Arial; background-color: transparent; font-variant-ligatures: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; vertica=
l-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: tran=
sparent; font-variant-ligatures: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; vertical-align: baseline; white-space: pre-wr=
ap;">5.2 linux-libc-kernel-headers</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type: circle; font-size: 11pt; font-family: Arial; background-co=
lor: transparent; font-variant-ligatures: normal; font-variant-east-asian: =
normal; font-variant-position: normal; vertical-align: baseline;"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span st=
yle=3D"font-size: 11pt; background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 vertical-align: baseline; white-space: pre-wrap;">5.2 kernel recipes</span=
></p></li><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt=
; font-family: Arial; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color=
: transparent; font-variant-ligatures: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; vertical-align: baseline; white-space: =
pre-wrap;">Removal of LSB and poky-lsb and replacement with alt config test=
ing</span></p></li><li dir=3D"ltr" style=3D"list-style-type: circle; font-s=
ize: 11pt; font-family: Arial; background-color: transparent; font-variant-=
ligatures: normal; font-variant-east-asian: normal; font-variant-position: =
normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">Patches have significantly reduced the dependency on py=
thon2</span></p></li><li dir=3D"ltr" style=3D"list-style-type: circle; font=
-size: 11pt; font-family: Arial; background-color: transparent; font-varian=
t-ligatures: normal; font-variant-east-asian: normal; font-variant-position=
: normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backg=
round-color: transparent; font-variant-ligatures: normal; font-variant-east=
-asian: normal; font-variant-position: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;">Reproducible builds are now being tested for core-ima=
ge-minimal</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type: di=
sc; font-size: 11pt; font-family: Arial; background-color: transparent; fon=
t-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-=
position: normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11p=
t; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line; white-space: pre-wrap;">There are the following changes still under d=
iscussion/testing:</span></p></li><ul style=3D"margin-top:0;margin-bottom:0=
;"><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-=
family: Arial; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: trans=
parent; font-variant-ligatures: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; vertical-align: baseline; white-space: pre-wra=
p;">Systemd vs. sysvinit defaults (maybe for the poky alternative configura=
tion tests)</span></p></li><li dir=3D"ltr" style=3D"list-style-type: circle=
; font-size: 11pt; font-family: Arial; background-color: transparent; font-=
variant-ligatures: normal; font-variant-east-asian: normal; font-variant-po=
sition: normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt;=
 background-color: transparent; font-variant-ligatures: normal; font-varian=
t-east-asian: normal; font-variant-position: normal; vertical-align: baseli=
ne; white-space: pre-wrap;">Making 5.2 the default kernel for qemu (has reg=
ressions, see below)</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e: circle; font-size: 11pt; font-family: Arial; background-color: transpare=
nt; font-variant-ligatures: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-si=
ze: 11pt; background-color: transparent; font-variant-ligatures: normal; fo=
nt-variant-east-asian: normal; font-variant-position: normal; vertical-alig=
n: baseline; white-space: pre-wrap;">Hashserv performance issue resolution<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type: circle; font-size:=
 11pt; font-family: Arial; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-=
color: transparent; font-variant-ligatures: normal; font-variant-east-asian=
: normal; font-variant-position: normal; vertical-align: baseline; white-sp=
ace: pre-wrap;">Final configuration of hash equivalency</span></p></li><li =
dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-family:=
 Arial; background-color: transparent; font-variant-ligatures: normal; font=
-variant-east-asian: normal; font-variant-position: normal; vertical-align:=
 baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent;=
 font-variant-ligatures: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; vertical-align: baseline; white-space: pre-wrap;">too=
lchain testsuite patch series</span></p></li></ul><li dir=3D"ltr" style=3D"=
list-style-type: disc; font-size: 11pt; font-family: Arial; background-colo=
r: transparent; font-variant-ligatures: normal; font-variant-east-asian: no=
rmal; font-variant-position: normal; vertical-align: baseline;"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline; white-space: pre-wrap;">The sstate hash equivalenc=
y continues to have challenges:</span></p></li><ul style=3D"margin-top:0;ma=
rgin-bottom:0;"><li dir=3D"ltr" style=3D"list-style-type: circle; font-size=
: 11pt; font-family: Arial; background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background=
-color: transparent; font-variant-ligatures: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; vertical-align: baseline; white-s=
pace: pre-wrap;">we need to rework the client/server communication to scale=
 to the autobuilder</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
: circle; font-size: 11pt; font-family: Arial; background-color: transparen=
t; font-variant-ligatures: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-siz=
e: 11pt; background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; vertical-align=
: baseline; white-space: pre-wrap;">there are some bugs in the code the aut=
obuilder continues to expose</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type: circle; font-size: 11pt; font-family: Arial; background-color: t=
ransparent; font-variant-ligatures: normal; font-variant-east-asian: normal=
; font-variant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D=
"font-size: 11pt; background-color: transparent; font-variant-ligatures: no=
rmal; font-variant-east-asian: normal; font-variant-position: normal; verti=
cal-align: baseline; white-space: pre-wrap;">we have cases where its not 10=
0% clear what the correct behaviour should be</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type: circle; font-size: 11pt; font-family: Arial; ba=
ckground-color: transparent; font-variant-ligatures: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; vertical-align: baseline;=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
;"><span style=3D"font-size: 11pt; background-color: transparent; font-vari=
ant-ligatures: normal; font-variant-east-asian: normal; font-variant-positi=
on: normal; vertical-align: baseline; white-space: pre-wrap;">test cases ar=
e proving to be problematic to write in a maintainable way</span></p></li><=
/ul><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; vertical-align: baseline; white-space: pre-wrap=
;">Patch merging is roughly up to date again</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backg=
round-color: transparent; font-variant-ligatures: normal; font-variant-east=
-asian: normal; font-variant-position: normal; vertical-align: baseline;"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;">=
<span style=3D"font-size: 11pt; background-color: transparent; font-variant=
-ligatures: normal; font-variant-east-asian: normal; font-variant-position:=
 normal; vertical-align: baseline; white-space: pre-wrap;">We have several =
significant problematic bugs that are being worked on:</span></p></li><ul s=
tyle=3D"margin-top:0;margin-bottom:0;"><li dir=3D"ltr" style=3D"list-style-=
type: circle; font-size: 11pt; font-family: Arial; background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">5.2 stap build issue on qemuarm</sp=
an></p></li><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11=
pt; font-family: Arial; background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-col=
or: transparent; font-variant-ligatures: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; vertical-align: baseline; white-space=
: pre-wrap;">5.2 kprobes error message (qemuarm64, qemumips64)</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-=
family: Arial; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: trans=
parent; font-variant-ligatures: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; vertical-align: baseline; white-space: pre-wra=
p;">qemumips machine hang</span></p></li></ul><li dir=3D"ltr" style=3D"list=
-style-type: disc; font-size: 11pt; font-family: Arial; background-color: t=
ransparent; font-variant-ligatures: normal; font-variant-east-asian: normal=
; font-variant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D=
"font-size: 11pt; background-color: transparent; font-variant-ligatures: no=
rmal; font-variant-east-asian: normal; font-variant-position: normal; verti=
cal-align: baseline; white-space: pre-wrap;">If anyone has any status items=
 for the project they=E2=80=99d like to add to the weekly reports, please e=
mail Richard+Stephen.</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11=
pt; font-family: Arial; background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 vertical-align: baseline; white-space: pre-wrap;">Planned Releases for YP =
3.0 {2.8}:</span></p><ul style=3D"margin-top:0;margin-bottom:0;"><li dir=3D=
"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; =
background-color: transparent; font-variant-ligatures: normal; font-variant=
-east-asian: normal; font-variant-position: normal; vertical-align: baselin=
e;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;"><span style=3D"font-size: 11pt; background-color: transparent; font-va=
riant-ligatures: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; vertical-align: baseline; white-space: pre-wrap;">M3 Release =
6th Sept</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; fon=
t-size: 11pt; font-family: Arial; background-color: transparent; font-varia=
nt-ligatures: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline; w=
hite-space: pre-wrap;">M4 Cutoff 30th Sept - this will be YP 3.0.</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font=
-family: Arial; background-color: transparent; font-variant-ligatures: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; vertica=
l-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: tran=
sparent; font-variant-ligatures: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; vertical-align: baseline; white-space: pre-wr=
ap;">YP 3.0 {2.8 (M4)} Final Release 25th Oct</span></p></li></ul><br><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; font-family: Arial; background-color: transpare=
nt; font-variant-ligatures: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; vertical-align: baseline; white-space: pre-wrap;">=
Planned upcoming dot releases:</span></p><ul style=3D"margin-top:0;margin-b=
ottom:0;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; =
font-family: Arial; background-color: transparent; font-variant-ligatures: =
normal; font-variant-east-asian: normal; font-variant-position: normal; ver=
tical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: =
transparent; font-variant-ligatures: normal; font-variant-east-asian: norma=
l; font-variant-position: normal; vertical-align: baseline; white-space: pr=
e-wrap;">YP 2.7.2 (Warrior) is planned for after YP 3.0 release.</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-=
family: Arial; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: trans=
parent; font-variant-ligatures: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; vertical-align: baseline; white-space: pre-wra=
p;">YP 2.6.4 (Thud) is planned for after YP 2.7.2&nbsp; release.</span></p>=
</li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; backgrou=
nd-color: transparent; font-variant-ligatures: normal; font-variant-east-as=
ian: normal; font-variant-position: normal; vertical-align: baseline; white=
-space: pre-wrap;">Tracking Metrics:</span></p><ul style=3D"margin-top:0;ma=
rgin-bottom:0;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: =
11pt; font-family: Arial; background-color: transparent; font-variant-ligat=
ures: normal; font-variant-east-asian: normal; font-variant-position: norma=
l; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-c=
olor: transparent; font-variant-ligatures: normal; font-variant-east-asian:=
 normal; font-variant-position: normal; vertical-align: baseline; white-spa=
ce: pre-wrap;">WDD 2413 (last week 2485)</span><span style=3D"font-size: 11=
pt; font-family: Consolas, sans-serif; background-color: transparent; font-=
variant-ligatures: normal; font-variant-east-asian: normal; font-variant-po=
sition: normal; vertical-align: baseline; white-space: pre-wrap;"> (</span>=
<a href=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D"text-d=
ecoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204); b=
ackground-color: transparent; font-variant-ligatures: normal; font-variant-=
east-asian: normal; font-variant-position: normal; text-decoration: underli=
ne; text-decoration-skip: none; vertical-align: baseline; white-space: pre-=
wrap;">https://wiki.yoctoproject.org/charts/combo.html</span></a><span styl=
e=3D"font-size: 11pt; font-family: Consolas, sans-serif; background-color: =
transparent; font-variant-ligatures: normal; font-variant-east-asian: norma=
l; font-variant-position: normal; vertical-align: baseline; white-space: pr=
e-wrap;">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; f=
ont-size: 11pt; font-family: Consolas, sans-serif; background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; font-family: Arial; background-color: transparent; font-varian=
t-ligatures: normal; font-variant-east-asian: normal; font-variant-position=
: normal; vertical-align: baseline; white-space: pre-wrap;">Poky Patch Metr=
ics&nbsp;&nbsp;</span></p></li><ul style=3D"margin-top:0;margin-bottom:0;">=
<li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-fam=
ily: Arial; background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; vertical-al=
ign: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transpar=
ent; font-variant-ligatures: normal; font-variant-east-asian: normal; font-=
variant-position: normal; vertical-align: baseline; white-space: pre-wrap;"=
>Total patches found: 1470 (last week 1474)</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type: circle; font-size: 11pt; font-family: Consolas, s=
ans-serif; background-color: transparent; font-variant-ligatures: normal; f=
ont-variant-east-asian: normal; font-variant-position: normal; vertical-ali=
gn: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">Patches in the Pending State: 611 (42%) [last week 613 =
(41%)]</span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre-wrap;">Key Status Links for YP:</span></p=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;=
"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Status" =
style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; font-family=
: Consolas, sans-serif; color: rgb(17, 85, 204); background-color: transpar=
ent; font-variant-ligatures: normal; font-variant-east-asian: normal; font-=
variant-position: normal; text-decoration: underline; text-decoration-skip:=
 none; vertical-align: baseline; white-space: pre-wrap;">https://wiki.yocto=
project.org/wiki/Yocto_Project_v2.8_Status</span></a></p><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https:=
//wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule" style=3D"text-decoration:n=
one;"><span style=3D"font-size: 11pt; font-family: Consolas, sans-serif; co=
lor: rgb(17, 85, 204); background-color: transparent; font-variant-ligature=
s: normal; font-variant-east-asian: normal; font-variant-position: normal; =
text-decoration: underline; text-decoration-skip: none; vertical-align: bas=
eline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_2.8=
_Schedule</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yoct=
o_2.8_Features" style=3D"text-decoration:none;"><span style=3D"font-size: 1=
1pt; font-family: Consolas, sans-serif; color: rgb(17, 85, 204); background=
-color: transparent; font-variant-ligatures: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; text-decoration: underline; text-=
decoration-skip: none; vertical-align: baseline; white-space: pre-wrap;">ht=
tps://wiki.yoctoproject.org/wiki/Yocto_2.8_Features</span></a></p><br><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; font-family: Arial; background-color: transpare=
nt; font-variant-ligatures: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; vertical-align: baseline; white-space: pre-wrap;">=
The Yocto Project=E2=80=99s technical governance is through its Technical S=
teering Committee, more information is available at:</span></p><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"=
https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration:none;"><sp=
an style=3D"font-size: 11pt; font-family: Arial; color: rgb(17, 85, 204); b=
ackground-color: transparent; font-variant-ligatures: normal; font-variant-=
east-asian: normal; font-variant-position: normal; text-decoration: underli=
ne; text-decoration-skip: none; vertical-align: baseline; white-space: pre-=
wrap;">https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; font-family: Arial; background-color: transparent; fo=
nt-variant-ligatures: normal; font-variant-east-asian: normal; font-variant=
-position: normal; vertical-align: baseline; white-space: pre-wrap;">The St=
atus reports are now stored on the wiki at: </span><a href=3D"https://wiki.=
yoctoproject.org/wiki/Weekly_Status" style=3D"text-decoration:none;"><span =
style=3D"font-size: 11pt; font-family: Arial; color: rgb(17, 85, 204); back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; text-decoration: underline;=
 text-decoration-skip: none; vertical-align: baseline; white-space: pre-wra=
p;">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><br><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><sp=
an style=3D"font-size: 11pt; font-family: Arial; background-color: transpar=
ent; font-variant-ligatures: normal; font-variant-east-asian: normal; font-=
variant-position: normal; vertical-align: baseline; white-space: pre-wrap;"=
>[If anyone has suggestions for other information you=E2=80=99d like to see=
 on this weekly status update, let us know!]</span></p><br></pre><div></div=
>
</body></html>

--=-nzJM+BIdpUSR4vgtkVAn--
