Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 696687E265
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 14:38:03 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id f204so3273008wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 07:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version;
	bh=bFxIFi4RoKVDCYXUOLeG+Vh5uHrDtMp3KVrqZcz06TA=;
	b=ESQISpwcscWJR+G/PzZlXF8KItKpsnDiFMp9Lp8vuDR9OBc2VQYBDQ0BiPimUiL9qD
	oakOz9EgS+VnHCT8ei1Fv/tN7u/QPI5aM1EMYnoLOFgMPmWADpZ5E4lDsmIeTO+sNPAu
	4tbg+/eUF+s/+MBY5TiSR0XijrwOyRnko4YKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version;
	bh=bFxIFi4RoKVDCYXUOLeG+Vh5uHrDtMp3KVrqZcz06TA=;
	b=fts9GlYvfEsj6s1e7M2mF+uHFEZi9wEL9gYXGIi5gTmqSRk6ck6jY973gw+D20Upsc
	a2SQYpCDX8HKGAnQywYeGgC5FK4yZMqqYQtFlgeQm6PLSU2wPA2GQoJmCyf4joXE6pp+
	mZXgVj0Ovl9suYG4vpJzNV5q85leG4BRk19AkOnXn5jesbOQVMcdyOVXsu/UPvZ7szFU
	mxdfR2edcdbNZmymo4xB1ICXedGPPJLmH3uwSxaiBCquTuUaLQQUu6QuJeiHYUOO341b
	avNfQj/gqc+0yioEo3yVs+5q0Hdlv1KTmJrwidqzVAE5oTPjDIa91mABoGsFqqj+yu/8
	To/A==
X-Gm-Message-State: APjAAAXUOVZefVso3hrw88z0tg9udiHeTOfRpyYvVDHl/UzUSiPKow/3
	uReOqMnRFOiEhnvMF7/emwSYgg==
X-Google-Smtp-Source: APXvYqypN3y+OCf8TJG5zdpVdIrbyju3Gfd01crEuVm64ZBZjMkgSk968bfcVpI0EO9t8SoyO7Z1eQ==
X-Received: by 2002:a1c:9c42:: with SMTP id f63mr3893800wme.23.1558449483994; 
	Tue, 21 May 2019 07:38:03 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x9sm4111194wmf.27.2019.05.21.07.38.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 07:38:02 -0700 (PDT)
Message-ID: <a979c8130d3c736d9a7a90f11805c21d5af00a6e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 15:38:01 +0100
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Yocto Project Status WW21'19
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
X-List-Received-Date: Tue, 21 May 2019 14:38:04 -0000
Content-Type: multipart/alternative; boundary="=-0QaRE4x6jmbOgU+hWhqh"

--=-0QaRE4x6jmbOgU+hWhqh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.8 M1Next Deadline: YP 2.8 Milestone 1 Cutoff
June 9th, 2019
SWAT Team Rotation: * SWAT lead is currently: Ross
 * SWAT team rotation: Ross -> Chen on May. 24, 2019
 * SWAT team rotation: Chen -> Armin on May. 31, 2019
 * https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Next Team Meetings: * Bug Triage meeting Thursday May 23rd at 7:30am
PDT (https://zoom.us/j/454367603)
 * Monthly Project Meeting Tuesday June 4th at 8am PDT (
https://zoom.us/j/990892712) 

Key Status/Updates: * Stephen is going to be unavailable for several
weeks, please refer any queries to Richard
 * Mailing lists are moving to groups.io instead of our current mailman
setup on 27th May. This shouldn’t impact users directly, more details
will be sent to the mailing lists in due course.
 * We have a new “newcomer” bug category which are bugs suited to
someone new to the project. These can be seen here: 
https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs
 * Work is continuing to improve the ptest reliability with a focus now
on ensuring the dependencies are correct.


Planned Releases for YP 2.8: * M1 Cutoff June 9th
 * M1 Release June 21st
 * M2 Cutoff 14th July
 * M2 Release 26th July
 * M3 Cutoff (Feature Freeze) 25th Aug
 * M3 Release 6th Sept
 * M4 Cutoff 30th Sept
 * 2.8 (M4) Final Release 25th Oct

Planned upcoming dot releases: * YP 2.6.3 (Thud) is in planning
 * YP 2.7.1 (Warrior) is in planning

Tracking Metrics: * WDD 2559 (last week 2596) (
https://wiki.yoctoproject.org/charts/combo.html)
 * Poky Patch Metrics  
    * Total patches found: 1531 (last week 1560)
    * Patches in the Pending State: 654 (43%) [last week 665 (43%)]

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Statushttps://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedulehttps://wiki.yoctoproject.org/wiki/Yocto_2.8_Features
The Status reports are now stored on the wiki at: 
https://wiki.yoctoproject.org/wiki/Weekly_Status
[If anyone has suggestions for other information you’d like to see on
this weekly status update, let us know!]



--=-0QaRE4x6jmbOgU+hWhqh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;" id=3D"docs-internal-guid-81230a11-7fff-3576-3fb8-b6d2e1e3f00d"><span s=
tyle=3D"font-size: 11pt; font-family: Arial; background-color: transparent;=
 font-variant-ligatures: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; vertical-align: baseline; white-space: pre-wrap;">Cur=
rent Dev Position: YP 2.8 M1</span></p><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; fon=
t-family: Arial; background-color: transparent; font-variant-ligatures: nor=
mal; font-variant-east-asian: normal; font-variant-position: normal; vertic=
al-align: baseline; white-space: pre-wrap;">Next Deadline: YP 2.8 Milestone=
 1 Cutoff June 9th, 2019</span></p><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;" id=3D"docs-internal-guid-8d7ddb68-7fff-=
0f18-0bef-a2d25f029454"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-famil=
y: Arial; background-color: transparent; font-variant-ligatures: normal; fo=
nt-variant-east-asian: normal; font-variant-position: normal; vertical-alig=
n: baseline; white-space: pre-wrap;">SWAT Team Rotation:</span></p><ul styl=
e=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style=
-type: disc; font-size: 11pt; font-family: Arial; background-color: transpa=
rent; font-variant-ligatures: normal; font-variant-east-asian: normal; font=
-variant-position: normal; vertical-align: baseline; white-space: pre;"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><s=
pan style=3D"font-size: 11pt; background-color: transparent; font-variant-l=
igatures: normal; font-variant-east-asian: normal; font-variant-position: n=
ormal; vertical-align: baseline; white-space: pre-wrap;">SWAT lead is curre=
ntly: Ross</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; f=
ont-size: 11pt; font-family: Arial; background-color: transparent; font-var=
iant-ligatures: normal; font-variant-east-asian: normal; font-variant-posit=
ion: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"f=
ont-size: 11pt; background-color: transparent; font-variant-ligatures: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; vertica=
l-align: baseline; white-space: pre-wrap;">SWAT team rotation: Ross -&gt; C=
hen on May. 24, 2019</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e: disc; font-size: 11pt; font-family: Arial; background-color: transparent=
; font-variant-ligatures: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; vertical-align: baseline; white-space: pre;"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre-wrap;">SWAT team rotation: C=
hen -&gt; Armin on May. 31, 2019</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type: disc; font-size: 11pt; font-family: Consolas; background-col=
or: transparent; font-variant-ligatures: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; vertical-align: baseline; white-space=
: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_=
Swat_Team" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; =
color: rgb(17, 85, 204); background-color: transparent; font-variant-ligatu=
res: normal; font-variant-east-asian: normal; font-variant-position: normal=
; text-decoration: underline; text-decoration-skip: none; vertical-align: b=
aseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_B=
uild_Failure_Swat_Team</span></a></p></li></ul><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fon=
t-size: 11pt; font-family: Arial; background-color: transparent; font-varia=
nt-ligatures: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; vertical-align: baseline; white-space: pre-wrap;">Next Team Meet=
ings:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"=
ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; b=
ackground-color: transparent; font-variant-ligatures: normal; font-variant-=
east-asian: normal; font-variant-position: normal; vertical-align: baseline=
; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: tra=
nsparent; font-variant-ligatures: normal; font-variant-east-asian: normal; =
font-variant-position: normal; vertical-align: baseline; white-space: pre-w=
rap;">Bug Triage meeting Thursday May 23rd at 7:30am PDT (</span><a href=3D=
"https://zoom.us/j/454367603" style=3D"text-decoration:none;"><span style=
=3D"font-size: 10pt; color: rgb(17, 85, 204); background-color: transparent=
; font-variant-ligatures: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; text-decoration: underline; text-decoration-skip: no=
ne; vertical-align: baseline; white-space: pre-wrap;">https://zoom.us/j/454=
367603</span></a><span style=3D"font-size: 11pt; background-color: transpar=
ent; font-variant-ligatures: normal; font-variant-east-asian: normal; font-=
variant-position: normal; vertical-align: baseline; white-space: pre-wrap;"=
>)</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size=
: 11pt; font-family: Arial; background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size=
: 11pt; background-color: transparent; font-variant-ligatures: normal; font=
-variant-east-asian: normal; font-variant-position: normal; vertical-align:=
 baseline; white-space: pre-wrap;">Monthly Project Meeting Tuesday June 4th=
 at 8am PDT (</span><a href=3D"https://zoom.us/j/990892712" style=3D"text-d=
ecoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204); b=
ackground-color: transparent; font-variant-ligatures: normal; font-variant-=
east-asian: normal; font-variant-position: normal; text-decoration: underli=
ne; text-decoration-skip: none; vertical-align: baseline; white-space: pre-=
wrap;">https://zoom.us/j/990892712)</span></a><span style=3D"font-size: 11p=
t; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line; white-space: pre-wrap;"> </span></p></li></ul><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; font-family: Arial; background-color: transparent; fon=
t-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-=
position: normal; vertical-align: baseline; white-space: pre-wrap;">Key Sta=
tus/Updates:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li =
dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: A=
rial; background-color: transparent; font-variant-ligatures: normal; font-v=
ariant-east-asian: normal; font-variant-position: normal; vertical-align: b=
aseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-col=
or: transparent; font-variant-ligatures: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; vertical-align: baseline; white-space=
: pre-wrap;">Stephen is going to be unavailable for several weeks, please r=
efer any queries to Richard</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type: disc; font-size: 11pt; font-family: Arial; background-color: tran=
sparent; font-variant-ligatures: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; vertical-align: baseline; white-space: pre;">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size: 11pt; background-color: transparent; font-varian=
t-ligatures: normal; font-variant-east-asian: normal; font-variant-position=
: normal; vertical-align: baseline; white-space: pre-wrap;">Mailing lists a=
re moving to groups.io instead of our current mailman setup on 27th May. Th=
is shouldn=E2=80=99t impact users directly, more details will be sent to th=
e mailing lists in due course.</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type: disc; font-size: 11pt; font-family: Arial; background-color: t=
ransparent; font-variant-ligatures: normal; font-variant-east-asian: normal=
; font-variant-position: normal; vertical-align: baseline; white-space: pre=
;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t;"><span style=3D"font-size: 11pt; background-color: transparent; font-var=
iant-ligatures: normal; font-variant-east-asian: normal; font-variant-posit=
ion: normal; vertical-align: baseline; white-space: pre-wrap;">We have a ne=
w =E2=80=9Cnewcomer=E2=80=9D bug category which are bugs suited to someone =
new to the project. These can be seen here: </span><a href=3D"https://wiki.=
yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs" style=3D"text-decoration:no=
ne;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204); background-co=
lor: transparent; font-variant-ligatures: normal; font-variant-east-asian: =
normal; font-variant-position: normal; text-decoration: underline; text-dec=
oration-skip: none; vertical-align: baseline; white-space: pre-wrap;">https=
://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs</span></a></p></li><=
li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family=
: Arial; background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; vertical-align=
: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-=
color: transparent; font-variant-ligatures: normal; font-variant-east-asian=
: normal; font-variant-position: normal; vertical-align: baseline; white-sp=
ace: pre-wrap;">Work is continuing to improve the ptest reliability with a =
focus now on ensuring the dependencies are correct.</span></p></li></ul><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><b=
r><br></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; background-c=
olor: transparent; font-variant-ligatures: normal; font-variant-east-asian:=
 normal; font-variant-position: normal; vertical-align: baseline; white-spa=
ce: pre-wrap;">Planned Releases for YP 2.8:</span></p><ul style=3D"margin-t=
op:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; =
font-size: 11pt; font-family: Arial; background-color: transparent; font-va=
riant-ligatures: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"=
font-size: 11pt; background-color: transparent; font-variant-ligatures: nor=
mal; font-variant-east-asian: normal; font-variant-position: normal; vertic=
al-align: baseline; white-space: pre-wrap;">M1 Cutoff June 9th</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-fa=
mily: Arial; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">M1 Release June 21st</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; vertical-align: baseline; white-=
space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent=
; font-variant-ligatures: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; vertical-align: baseline; white-space: pre-wrap;">M2=
 Cutoff 14th July</span></p></li><li dir=3D"ltr" style=3D"list-style-type: =
disc; font-size: 11pt; font-family: Arial; background-color: transparent; f=
ont-variant-ligatures: normal; font-variant-east-asian: normal; font-varian=
t-position: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span sty=
le=3D"font-size: 11pt; background-color: transparent; font-variant-ligature=
s: normal; font-variant-east-asian: normal; font-variant-position: normal; =
vertical-align: baseline; white-space: pre-wrap;">M2 Release 26th July</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt;=
 font-family: Arial; background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; ve=
rtical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt;=
 background-color: transparent; font-variant-ligatures: normal; font-varian=
t-east-asian: normal; font-variant-position: normal; vertical-align: baseli=
ne; white-space: pre-wrap;">M3 Cutoff (Feature Freeze) 25th Aug</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; vertical-align: baseline; whi=
te-space: pre-wrap;">M3 Release 6th Sept</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; vertical-align: baseline; white-=
space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent=
; font-variant-ligatures: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; vertical-align: baseline; white-space: pre-wrap;">M4=
 Cutoff 30th Sept</span></p></li><li dir=3D"ltr" style=3D"list-style-type: =
disc; font-size: 11pt; font-family: Arial; background-color: transparent; f=
ont-variant-ligatures: normal; font-variant-east-asian: normal; font-varian=
t-position: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span sty=
le=3D"font-size: 11pt; background-color: transparent; font-variant-ligature=
s: normal; font-variant-east-asian: normal; font-variant-position: normal; =
vertical-align: baseline; white-space: pre-wrap;">2.8 (M4) Final Release 25=
th Oct</span></p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre-wrap;">Planned upcoming dot releases:</sp=
an></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" styl=
e=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; background=
-color: transparent; font-variant-ligatures: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; vertical-align: baseline; white-s=
pace: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent;=
 font-variant-ligatures: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; vertical-align: baseline; white-space: pre-wrap;">YP =
2.6.3 (Thud) is in planning</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type: disc; font-size: 11pt; font-family: Arial; background-color: tran=
sparent; font-variant-ligatures: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; vertical-align: baseline; white-space: pre;">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size: 11pt; background-color: transparent; font-varian=
t-ligatures: normal; font-variant-east-asian: normal; font-variant-position=
: normal; vertical-align: baseline; white-space: pre-wrap;">YP 2.7.1 (Warri=
or) is in planning</span></p></li></ul><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: =
11pt; font-family: Arial; background-color: transparent; font-variant-ligat=
ures: normal; font-variant-east-asian: normal; font-variant-position: norma=
l; vertical-align: baseline; white-space: pre-wrap;">Tracking Metrics:</spa=
n></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=
=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; background-=
color: transparent; font-variant-ligatures: normal; font-variant-east-asian=
: normal; font-variant-position: normal; vertical-align: baseline; white-sp=
ace: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent; =
font-variant-ligatures: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; vertical-align: baseline; white-space: pre-wrap;">WDD =
2559 (last week 2596)</span><span style=3D"font-size: 11pt; font-family: Co=
nsolas; background-color: transparent; font-variant-ligatures: normal; font=
-variant-east-asian: normal; font-variant-position: normal; vertical-align:=
 baseline; white-space: pre-wrap;"> (</span><a href=3D"https://wiki.yoctopr=
oject.org/charts/combo.html" style=3D"text-decoration:none;"><span style=3D=
"font-size: 11pt; color: rgb(17, 85, 204); background-color: transparent; f=
ont-variant-ligatures: normal; font-variant-east-asian: normal; font-varian=
t-position: normal; text-decoration: underline; text-decoration-skip: none;=
 vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoprojec=
t.org/charts/combo.html</span></a><span style=3D"font-size: 11pt; font-fami=
ly: Consolas; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre-wrap;">)</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type: disc; font-size: 11pt; font-family: Consolas; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline; w=
hite-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline; w=
hite-space: pre-wrap;">Poky Patch Metrics &nbsp;</span></p></li><ul style=
=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-=
type: circle; font-size: 11pt; font-family: Arial; background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; vertical-align: baseline; white-space: pre;"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><=
span style=3D"font-size: 11pt; background-color: transparent; font-variant-=
ligatures: normal; font-variant-east-asian: normal; font-variant-position: =
normal; vertical-align: baseline; white-space: pre-wrap;">Total patches fou=
nd: 1531 (last week 1560)</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type: circle; font-size: 11pt; font-family: Consolas; background-color: t=
ransparent; font-variant-ligatures: normal; font-variant-east-asian: normal=
; font-variant-position: normal; vertical-align: baseline; white-space: pre=
;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t;"><span style=3D"font-size: 11pt; font-family: Arial; background-color: t=
ransparent; font-variant-ligatures: normal; font-variant-east-asian: normal=
; font-variant-position: normal; vertical-align: baseline; white-space: pre=
-wrap;">Patches in the Pending State: 654 (43%) [last week 665 (43%)]</span=
></p></li></ul></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: =
Arial; background-color: transparent; font-variant-ligatures: normal; font-=
variant-east-asian: normal; font-variant-position: normal; vertical-align: =
baseline; white-space: pre-wrap;">Key Status Links for YP:</span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a hr=
ef=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status" style=
=3D"text-decoration:none;"><span style=3D"font-size: 11pt; font-family: Con=
solas; color: rgb(17, 85, 204); background-color: transparent; font-variant=
-ligatures: normal; font-variant-east-asian: normal; font-variant-position:=
 normal; text-decoration: underline; text-decoration-skip: none; vertical-a=
lign: baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/=
Yocto_Project_v2.8_Status</span></a></p><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproje=
ct.org/wiki/Yocto_2.7_Schedule" style=3D"text-decoration:none;"><span style=
=3D"font-size: 11pt; font-family: Consolas; color: rgb(17, 85, 204); backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; text-decoration: underline; t=
ext-decoration-skip: none; vertical-align: baseline; white-space: pre-wrap;=
">https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule</span></a></p><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a h=
ref=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features" style=3D"text=
-decoration:none;"><span style=3D"font-size: 11pt; font-family: Consolas; c=
olor: rgb(17, 85, 204); background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 text-decoration: underline; text-decoration-skip: none; vertical-align: ba=
seline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_2.=
8_Features</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-fam=
ily: Arial; background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; vertical-al=
ign: baseline; white-space: pre-wrap;">The Status reports are now stored on=
 the wiki at: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_S=
tatus" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; font=
-family: Arial; color: rgb(17, 85, 204); background-color: transparent; fon=
t-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-=
position: normal; text-decoration: underline; text-decoration-skip: none; v=
ertical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoproject.=
org/wiki/Weekly_Status</span></a></p><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11=
pt; font-family: Arial; background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 vertical-align: baseline; white-space: pre-wrap;">[If anyone has suggestio=
ns for other information you=E2=80=99d like to see on this weekly status up=
date, let us know!]</span></p>

</body></html>

--=-0QaRE4x6jmbOgU+hWhqh--
