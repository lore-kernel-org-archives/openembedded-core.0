Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5D39B7E63B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 14:44:58 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id c6so3262978wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version;
	bh=Z4J/sWnyBP1Q0/75rjS6FjwYTAxDUJNI5VfzWMD7ihg=;
	b=LSKRyNGGc8Msm+MBAXKCLq4BSgiGcDfAQ05H2Z3vhhIwBWYrqLn17pfYWHaS8lm2wR
	Li7XYAGSjnX+fNXhxsHGrajB0bHK76KLUEZrXeMvZasAvY0oNpK/0IZbPlfwGLLPa8oU
	SOnNLJXKDsLw+ZDtLRs4zDfVHdSo4U05l9WuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version;
	bh=Z4J/sWnyBP1Q0/75rjS6FjwYTAxDUJNI5VfzWMD7ihg=;
	b=gBG9fOIlxpv9S8lb+5Bh+AlI8+4O2O+VX0bP0h+tKJUbKYnWFG0mGLK8JWCjguDs5N
	LmnYNEQtvo3/2tJc46IqApQ8PKGLhLt+tjYVG+f8AfPYCBKWEoNJNVAitmGnOvhn80Xv
	FTppKNa/1oIKW8Oa8roPx4aFsb153CeD+BOCsABsEUrTol4Nci14W8n0InyRPZXUFHks
	vJWFyA3QYyedv7JWQW0yGljfNJrxJcw6eJos5ZFVsXtwZ4ltTtZkmvKDZ7dYccsv1yo6
	tUl9/PYuabhduq9IJT0+6vAmfW8sBpjTRDiNItXpNEX55021LEXbqrjvkPOwwZaaNrbI
	CYRA==
X-Gm-Message-State: APjAAAWRyNy5BHrNK9v7Iqswh7aPr4lmwH+NCxUUiyzmCwnlbjgiVvrm
	+WQTX0Kwft/FbpdMRE5ZXukjPA==
X-Google-Smtp-Source: APXvYqx86FuiSf81Z17xdtX41D1679uiXm3A/BL2dCw1hgWt4zWRaiH0eMKbgt5j3OEQtWEkMK2L/g==
X-Received: by 2002:a1c:cb0c:: with SMTP id b12mr16959065wmg.93.1560264298954; 
	Tue, 11 Jun 2019 07:44:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y2sm14820599wrl.4.2019.06.11.07.44.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 11 Jun 2019 07:44:58 -0700 (PDT)
Message-ID: <da8baaeff554b5fd01205d0db9d2527215a99487.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 15:44:56 +0100
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Yocto Project Status WW24'19
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
X-List-Received-Date: Tue, 11 Jun 2019 14:44:58 -0000
Content-Type: multipart/alternative; boundary="=-aGT9oQh+mNz+0ZQzJO3x"

--=-aGT9oQh+mNz+0ZQzJO3x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.8 M2Next Deadline: YP 2.8 Milestone 2 Cutoff
July 14th, 2019
SWAT Team Rotation: * SWAT lead is currently: Anuj
 * SWAT team rotation: Anuj -> Paul on June 14, 2019
 * SWAT team rotation: Paul -> Ross on June 21, 2019
 * https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Next Team Meetings: * Bug Triage meeting Thursday June 13th at 7:30am
PDT (https://zoom.us/j/454367603)
 * Monthly Project Meeting Tuesday July 2nd at 8am PDT (
https://zoom.us/j/990892712) 
 * Twitch - Next event is Tuesday 11th June at 8am PDT (
https://www.twitch.tv/yocto_project)

Key Status/Updates: * 2.8 M1 has been built and rc2 is now undergoing
QA (rc1 ran into an issue with a broken autobuilder worker).
 * Stephen continues to be unavailable, please refer any queries to
Richard
 * Mailing lists are moving to groups.io instead of our current mailman
setup. This shouldn’t impact users directly, more details will be sent
to the mailing lists before the transfer. THe Yocto Project lists will
move first, followed by OE, likely a week later.
 * We have a new “newcomer” bug category which are bugs suited to
someone new to the project. These can be seen here: 
https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs
 * We’re seeing an increasing number of intermittent failures which
affect the autobuilder builds, causing problems for merging patches and
for release builds. One cause, a long standing problem with gpg signing
testing has finally been root caused and fixed. Several others keep
appearing. There is a backlog of them in the bugzilla and we’re opening
bugs for the new ones.
 * M1 isn’t of ideal quality, there are three ptest timeouts (2.7 had
none). The ptest failure rate is however much improved. There is nobody
actively working on some of the ptest timeout issues so holding the
milestone build wouldn’t have made much difference but its a worrying
sign for the project quality.
 * M1 also has a couple of MIPS issues with the gcc9 upgrade. There
doesn’t appear to be much interest in investigating and fixing these
which raises questions about supporting the architecture within the
project.
 * There was a Yocto Project related article in LWN: 
https://lwn.net/Articles/788626/

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

Tracking Metrics: * WDD 2478 (last week 2507) (
https://wiki.yoctoproject.org/charts/combo.html)
 * Poky Patch Metrics  
    * Total patches found: 1507 (last week 1513)
    * Patches in the Pending State: 641 (43%) [last week 646 (43%)]

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Statushttps://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedulehttps://wiki.yoctoproject.org/wiki/Yocto_2.8_Features
The Status reports are now stored on the wiki at: 
https://wiki.yoctoproject.org/wiki/Weekly_Status
[If anyone has suggestions for other information you’d like to see on
this weekly status update, let us know!]






--=-aGT9oQh+mNz+0ZQzJO3x
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;" id=3D"docs-internal-guid-c935c5cd-7fff-246e-7db5-da835f275c15"><span s=
tyle=3D"font-family: Arial; font-size: 11pt; white-space: pre-wrap; backgro=
und-color: transparent;">Current Dev Position: YP 2.8 M2</span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; font-family: Arial; background-color: transparen=
t; font-variant-ligatures: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; vertical-align: baseline; white-space: pre-wrap;">N=
ext Deadline: YP 2.8 Milestone 2 Cutoff July 14th, 2019</span></p><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size: 11pt; font-family: Arial; background-color: tran=
sparent; font-variant-ligatures: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; vertical-align: baseline; white-space: pre-wr=
ap;">SWAT Team Rotation:</span></p><ul style=3D"margin-top:0pt;margin-botto=
m:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; fo=
nt-family: Arial; background-color: transparent; font-variant-ligatures: no=
rmal; font-variant-east-asian: normal; font-variant-position: normal; verti=
cal-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; ba=
ckground-color: transparent; font-variant-ligatures: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; vertical-align: baseline;=
 white-space: pre-wrap;">SWAT lead is currently: Anuj</span></p></li><li di=
r=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Ari=
al; background-color: transparent; font-variant-ligatures: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; vertical-align: bas=
eline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color=
: transparent; font-variant-ligatures: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; vertical-align: baseline; white-space: =
pre-wrap;">SWAT team rotation: Anuj -&gt; Paul on June 14, 2019</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; vertical-align: baseline; whi=
te-space: pre-wrap;">SWAT team rotation: Paul -&gt; Ross on June 21, 2019</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11=
pt; font-family: Consolas; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.y=
octoproject.org/wiki/Yocto_Build_Failure_Swat_Team" style=3D"text-decoratio=
n:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204); backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; text-decoration: underline; text=
-decoration-skip: none; vertical-align: baseline; white-space: pre-wrap;">h=
ttps://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a><=
/p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; =
background-color: transparent; font-variant-ligatures: normal; font-variant=
-east-asian: normal; font-variant-position: normal; vertical-align: baselin=
e; white-space: pre-wrap;">Next Team Meetings:</span></p><ul style=3D"margi=
n-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: dis=
c; font-size: 11pt; font-family: Arial; background-color: transparent; font=
-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-p=
osition: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">Bug Triage meeting Thursday=
 June 13th at 7:30am PDT (</span><a href=3D"https://zoom.us/j/454367603" st=
yle=3D"text-decoration:none;"><span style=3D"font-size: 10pt; color: rgb(17=
, 85, 204); background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; text-decora=
tion: underline; text-decoration-skip: none; vertical-align: baseline; whit=
e-space: pre-wrap;">https://zoom.us/j/454367603</span></a><span style=3D"fo=
nt-size: 11pt; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline; white-space: pre-wrap;">)</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; vertical-align: baseline; whi=
te-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transpar=
ent; font-variant-ligatures: normal; font-variant-east-asian: normal; font-=
variant-position: normal; vertical-align: baseline; white-space: pre-wrap;"=
>Monthly Project Meeting Tuesday July 2nd at 8am PDT (</span><a href=3D"htt=
ps://zoom.us/j/990892712" style=3D"text-decoration:none;"><span style=3D"fo=
nt-size: 11pt; color: rgb(17, 85, 204); background-color: transparent; font=
-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-p=
osition: normal; text-decoration: underline; text-decoration-skip: none; ve=
rtical-align: baseline; white-space: pre-wrap;">https://zoom.us/j/990892712=
)</span></a><span style=3D"font-size: 11pt; background-color: transparent; =
font-variant-ligatures: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; vertical-align: baseline; white-space: pre-wrap;"> </s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11p=
t; font-family: Arial; background-color: transparent; font-variant-ligature=
s: normal; font-variant-east-asian: normal; font-variant-position: normal; =
vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11p=
t; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line; white-space: pre-wrap;">Twitch - Next event is Tuesday 11th June at 8=
am PDT (</span><a href=3D"https://www.twitch.tv/yocto_project" style=3D"tex=
t-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204)=
; background-color: transparent; font-variant-ligatures: normal; font-varia=
nt-east-asian: normal; font-variant-position: normal; text-decoration: unde=
rline; text-decoration-skip: none; vertical-align: baseline; white-space: p=
re-wrap;">https://www.twitch.tv/yocto_project</span></a><span style=3D"font=
-size: 11pt; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">)</span></p></li></ul><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><sp=
an style=3D"font-size: 11pt; font-family: Arial; background-color: transpar=
ent; font-variant-ligatures: normal; font-variant-east-asian: normal; font-=
variant-position: normal; vertical-align: baseline; white-space: pre-wrap;"=
>Key Status/Updates:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0p=
t;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; vertical-align: baseline; whi=
te-space: pre-wrap;">2.8 M1 has been built and rc2 is now undergoing QA (rc=
1 ran into an issue with a broken autobuilder worker).</span></p></li><li d=
ir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Ar=
ial; background-color: transparent; font-variant-ligatures: normal; font-va=
riant-east-asian: normal; font-variant-position: normal; vertical-align: ba=
seline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-colo=
r: transparent; font-variant-ligatures: normal; font-variant-east-asian: no=
rmal; font-variant-position: normal; vertical-align: baseline; white-space:=
 pre-wrap;">Stephen continues to be unavailable, please refer any queries t=
o Richard</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; fo=
nt-size: 11pt; font-family: Arial; background-color: transparent; font-vari=
ant-ligatures: normal; font-variant-east-asian: normal; font-variant-positi=
on: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fo=
nt-size: 11pt; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline; white-space: pre-wrap;">Mailing lists are moving to group=
s.io instead of our current mailman setup. This shouldn=E2=80=99t impact us=
ers directly, more details will be sent to the mailing lists before the tra=
nsfer. THe Yocto Project lists will move first, followed by OE, likely a we=
ek later.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; fo=
nt-size: 11pt; font-family: Arial; background-color: transparent; font-vari=
ant-ligatures: normal; font-variant-east-asian: normal; font-variant-positi=
on: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fo=
nt-size: 11pt; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline; white-space: pre-wrap;">We have a new =E2=80=9Cnewcomer=
=E2=80=9D bug category which are bugs suited to someone new to the project.=
 These can be seen here: </span><a href=3D"https://wiki.yoctoproject.org/wi=
ki/Bug_Triage#Newcomer_Bugs" style=3D"text-decoration:none;"><span style=3D=
"font-size: 11pt; color: rgb(17, 85, 204); background-color: transparent; f=
ont-variant-ligatures: normal; font-variant-east-asian: normal; font-varian=
t-position: normal; text-decoration: underline; text-decoration-skip: none;=
 vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoprojec=
t.org/wiki/Bug_Triage#Newcomer_Bugs</span></a></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; background=
-color: transparent; font-variant-ligatures: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; vertical-align: baseline; white-s=
pace: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent;=
 font-variant-ligatures: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; vertical-align: baseline; white-space: pre-wrap;">We=
=E2=80=99re seeing an increasing number of intermittent failures which affe=
ct the autobuilder builds, causing problems for merging patches and for rel=
ease builds. One cause, a long standing problem with gpg signing testing ha=
s finally been root caused and fixed. Several others keep appearing. There =
is a backlog of them in the bugzilla and we=E2=80=99re opening bugs for the=
 new ones.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; f=
ont-size: 11pt; font-family: Arial; background-color: transparent; font-var=
iant-ligatures: normal; font-variant-east-asian: normal; font-variant-posit=
ion: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"f=
ont-size: 11pt; background-color: transparent; font-variant-ligatures: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; vertica=
l-align: baseline; white-space: pre-wrap;">M1 isn=E2=80=99t of ideal qualit=
y, there are three ptest timeouts (2.7 had none). The ptest failure rate is=
 however much improved. There is nobody actively working on some of the pte=
st timeout issues so holding the milestone build wouldn=E2=80=99t have made=
 much difference but its a worrying sign for the project quality.</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font=
-family: Arial; background-color: transparent; font-variant-ligatures: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; vertica=
l-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline; w=
hite-space: pre-wrap;">M1 also has a couple of MIPS issues with the gcc9 up=
grade. There doesn=E2=80=99t appear to be much interest in investigating an=
d fixing these which raises questions about supporting the architecture wit=
hin the project.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: d=
isc; font-size: 11pt; font-family: Arial; background-color: transparent; fo=
nt-variant-ligatures: normal; font-variant-east-asian: normal; font-variant=
-position: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline; white-space: pre-wrap;">There was a Yocto Project =
related article in LWN: </span><a href=3D"https://lwn.net/Articles/788626/"=
 style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; color: rgb=
(17, 85, 204); background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; text-dec=
oration: underline; text-decoration-skip: none; vertical-align: baseline; w=
hite-space: pre-wrap;">https://lwn.net/Articles/788626/</span></a></p></li>=
</ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; backgrou=
nd-color: transparent; font-variant-ligatures: normal; font-variant-east-as=
ian: normal; font-variant-position: normal; vertical-align: baseline; white=
-space: pre-wrap;">Planned Releases for YP 2.8:</span></p><ul style=3D"marg=
in-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: di=
sc; font-size: 11pt; font-family: Arial; background-color: transparent; fon=
t-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-=
position: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">M1 Cutoff June 9th</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; fon=
t-family: Arial; background-color: transparent; font-variant-ligatures: nor=
mal; font-variant-east-asian: normal; font-variant-position: normal; vertic=
al-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; bac=
kground-color: transparent; font-variant-ligatures: normal; font-variant-ea=
st-asian: normal; font-variant-position: normal; vertical-align: baseline; =
white-space: pre-wrap;">M1 Release June 21st</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backg=
round-color: transparent; font-variant-ligatures: normal; font-variant-east=
-asian: normal; font-variant-position: normal; vertical-align: baseline; wh=
ite-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transpa=
rent; font-variant-ligatures: normal; font-variant-east-asian: normal; font=
-variant-position: normal; vertical-align: baseline; white-space: pre-wrap;=
">M2 Cutoff 14th July</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe: disc; font-size: 11pt; font-family: Arial; background-color: transparen=
t; font-variant-ligatures: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; vertical-align: baseline; white-space: pre;"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre-wrap;">M2 Release 26th July<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 1=
1pt; font-family: Arial; background-color: transparent; font-variant-ligatu=
res: normal; font-variant-east-asian: normal; font-variant-position: normal=
; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 1=
1pt; background-color: transparent; font-variant-ligatures: normal; font-va=
riant-east-asian: normal; font-variant-position: normal; vertical-align: ba=
seline; white-space: pre-wrap;">M3 Cutoff (Feature Freeze) 25th Aug</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; fo=
nt-family: Arial; background-color: transparent; font-variant-ligatures: no=
rmal; font-variant-east-asian: normal; font-variant-position: normal; verti=
cal-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; ba=
ckground-color: transparent; font-variant-ligatures: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; vertical-align: baseline;=
 white-space: pre-wrap;">M3 Release 6th Sept</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backg=
round-color: transparent; font-variant-ligatures: normal; font-variant-east=
-asian: normal; font-variant-position: normal; vertical-align: baseline; wh=
ite-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transpa=
rent; font-variant-ligatures: normal; font-variant-east-asian: normal; font=
-variant-position: normal; vertical-align: baseline; white-space: pre-wrap;=
">M4 Cutoff 30th Sept</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe: disc; font-size: 11pt; font-family: Arial; background-color: transparen=
t; font-variant-ligatures: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; vertical-align: baseline; white-space: pre;"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre-wrap;">2.8 (M4) Final Releas=
e 25th Oct</span></p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; fo=
nt-family: Arial; background-color: transparent; font-variant-ligatures: no=
rmal; font-variant-east-asian: normal; font-variant-position: normal; verti=
cal-align: baseline; white-space: pre-wrap;">Planned upcoming dot releases:=
</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" =
style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; vertical-align: baseline; whi=
te-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transpar=
ent; font-variant-ligatures: normal; font-variant-east-asian: normal; font-=
variant-position: normal; vertical-align: baseline; white-space: pre-wrap;"=
>YP 2.6.3 (Thud) is in planning</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type: disc; font-size: 11pt; font-family: Arial; background-color: =
transparent; font-variant-ligatures: normal; font-variant-east-asian: norma=
l; font-variant-position: normal; vertical-align: baseline; white-space: pr=
e;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;"><span style=3D"font-size: 11pt; background-color: transparent; font-va=
riant-ligatures: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; vertical-align: baseline; white-space: pre-wrap;">YP 2.7.1 (W=
arrior) is in planning</span></p></li></ul><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-si=
ze: 11pt; font-family: Arial; background-color: transparent; font-variant-l=
igatures: normal; font-variant-east-asian: normal; font-variant-position: n=
ormal; vertical-align: baseline; white-space: pre-wrap;">Tracking Metrics:<=
/span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" s=
tyle=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transpare=
nt; font-variant-ligatures: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; vertical-align: baseline; white-space: pre-wrap;">=
WDD 2478 (last week 2507)</span><span style=3D"font-size: 11pt; font-family=
: Consolas; background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; vertical-al=
ign: baseline; white-space: pre-wrap;"> (</span><a href=3D"https://wiki.yoc=
toproject.org/charts/combo.html" style=3D"text-decoration:none;"><span styl=
e=3D"font-size: 11pt; color: rgb(17, 85, 204); background-color: transparen=
t; font-variant-ligatures: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; text-decoration: underline; text-decoration-skip: n=
one; vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoctopr=
oject.org/charts/combo.html</span></a><span style=3D"font-size: 11pt; font-=
family: Consolas; background-color: transparent; font-variant-ligatures: no=
rmal; font-variant-east-asian: normal; font-variant-position: normal; verti=
cal-align: baseline; white-space: pre-wrap;">)</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type: disc; font-size: 11pt; font-family: Consolas; =
background-color: transparent; font-variant-ligatures: normal; font-variant=
-east-asian: normal; font-variant-position: normal; vertical-align: baselin=
e; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; =
background-color: transparent; font-variant-ligatures: normal; font-variant=
-east-asian: normal; font-variant-position: normal; vertical-align: baselin=
e; white-space: pre-wrap;">Poky Patch Metrics &nbsp;</span></p></li><ul sty=
le=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-styl=
e-type: circle; font-size: 11pt; font-family: Arial; background-color: tran=
sparent; font-variant-ligatures: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; vertical-align: baseline; white-space: pre;">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size: 11pt; background-color: transparent; font-varian=
t-ligatures: normal; font-variant-east-asian: normal; font-variant-position=
: normal; vertical-align: baseline; white-space: pre-wrap;">Total patches f=
ound: 1507 (last week 1513)</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type: circle; font-size: 11pt; font-family: Consolas; background-color:=
 transparent; font-variant-ligatures: normal; font-variant-east-asian: norm=
al; font-variant-position: normal; vertical-align: baseline; white-space: p=
re;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt;"><span style=3D"font-size: 11pt; font-family: Arial; background-color:=
 transparent; font-variant-ligatures: normal; font-variant-east-asian: norm=
al; font-variant-position: normal; vertical-align: baseline; white-space: p=
re-wrap;">Patches in the Pending State: 641 (43%) [last week 646 (43%)]</sp=
an></p></li></ul></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family=
: Arial; background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; vertical-align=
: baseline; white-space: pre-wrap;">Key Status Links for YP:</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a =
href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Status" style=
=3D"text-decoration:none;"><span style=3D"font-size: 11pt; font-family: Con=
solas; color: rgb(17, 85, 204); background-color: transparent; font-variant=
-ligatures: normal; font-variant-east-asian: normal; font-variant-position:=
 normal; text-decoration: underline; text-decoration-skip: none; vertical-a=
lign: baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/=
Yocto_Project_v2.8_Status</span></a></p><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproje=
ct.org/wiki/Yocto_2.8_Schedule" style=3D"text-decoration:none;"><span style=
=3D"font-size: 11pt; font-family: Consolas; color: rgb(17, 85, 204); backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; text-decoration: underline; t=
ext-decoration-skip: none; vertical-align: baseline; white-space: pre-wrap;=
">https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule</span></a></p><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a h=
ref=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.8_Features" style=3D"text=
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

--=-aGT9oQh+mNz+0ZQzJO3x--
