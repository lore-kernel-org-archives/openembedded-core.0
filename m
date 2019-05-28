Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id C64F27DF46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 14:53:05 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id t5so3213874wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 07:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version;
	bh=PT+PiUBTmT8F+3cH9uSFVK+Y8Tz1O+4U8hrPnlUXZWI=;
	b=PnClhPbrEf1dmN7A16DEJWduJCkZkpOLMF09ve1z09/rrBViEujNCXyhCHlmuC9noI
	FKRAF8dDLBMPVi4xGiLJnf2onb2vov4GFkmrMIkL1c+JfCOXI2m7YXDnJ3cGnB8peEpp
	QuCSpYVMa8mYtVilB8SA4UtKzoYTfjr0QJpVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version;
	bh=PT+PiUBTmT8F+3cH9uSFVK+Y8Tz1O+4U8hrPnlUXZWI=;
	b=X4ySDODPjJswbVGS/UGVPyuruEq1y50QYnPBp44K/JTp30MXzvxweafaAjduYgTiBw
	4IMUss9VJUiRqvTLUT6Um1JXkfejGXjBVifZHkgp4YyJYBeYJw0TuSYjU86w4tVXkxaP
	e0IVb3vNjTaaZd1iscwKnDUkkiLVxauWZ71GhsysdEW5f7NH5lC9p3Mr96tAXiYkzNY5
	50L76D3fJplZv6SWcgZCpIRUS35ZMvK2W49H6DN6GTpboMxw7Af2ZaakNMKAUAypk+Wo
	gFqGIZCQEA8Lrdg7CoquBZNdOWPD8nITo9HIK2vvX80DlXYL5MpLNOtHJe5UHjWYDPCS
	ZNew==
X-Gm-Message-State: APjAAAXtZB6vILpDrK7SNnk52phCuVqbXMMKLUVixMgEUPlffyCOgv2G
	SaHnCPULF78CSBGy3KgRxKEuBw==
X-Google-Smtp-Source: APXvYqx//KEFOAv2Hg+eORG/yji3eOvDFTXosYwivQbkv4VmfJG4tNoYML6W8DNovwFNS7Eie9WdmQ==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr3415508wmc.47.1559055186277;
	Tue, 28 May 2019 07:53:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h12sm12115410wre.14.2019.05.28.07.53.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 07:53:05 -0700 (PDT)
Message-ID: <9f5162e0b80f7ce624d0c433b9f100eb09515b83.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2019 15:53:04 +0100
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Yocto Project Status WW22'19
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
X-List-Received-Date: Tue, 28 May 2019 14:53:06 -0000
Content-Type: multipart/alternative; boundary="=-8ED0KjgyYLQ9Xbf2Q8jn"

--=-8ED0KjgyYLQ9Xbf2Q8jn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.8 M1Next Deadline: YP 2.8 Milestone 1 Cutoff
June 9th, 2019
SWAT Team Rotation: * SWAT lead is currently: Chen
 * SWAT team rotation: Chen -> Armin on May. 31, 2019
 * SWAT team rotation: Armin -> Anuj on June 7, 2019
 * https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Next Team Meetings: * Bug Triage meeting Thursday May 30th at 7:30am
PDT (https://zoom.us/j/454367603)
 * Monthly Project Meeting Tuesday June 4th at 8am PDT (
https://zoom.us/j/990892712) 

Key Status/Updates: * Stephen is going to be unavailable for several
weeks, please refer any queries to Richard
 * Mailing lists are moving to groups.io instead of our current mailman
setup. For various reasons the move was delayed and will take place on
3rd June. This shouldn’t impact users directly, more details will be
sent to the mailing lists in due course.
 * We have a new “newcomer” bug category which are bugs suited to
someone new to the project. These can be seen here: 
https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs
 * Adrian Bunk has done some much appreciated work in removing patches
which are no longer needed or appropriate.
 * Various upgrades and ptest dependency fixes merged. Work is still
needed on ptest dependencies, particularly on perl modules.
 * Gcc 9 is now the default, thanks to Khem for working around the
remaining bug in OE-Core.


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

Tracking Metrics: * WDD 2524 (last week 2559) (
https://wiki.yoctoproject.org/charts/combo.html)
 * Poky Patch Metrics  
    * Total patches found: 1525 (last week 1531)
    * Patches in the Pending State: 649 (43%) [last week 655 (43%)]

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Statushttps://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedulehttps://wiki.yoctoproject.org/wiki/Yocto_2.8_Features
The Status reports are now stored on the wiki at: 
https://wiki.yoctoproject.org/wiki/Weekly_Status
[If anyone has suggestions for other information you’d like to see on
this weekly status update, let us know!]





--=-8ED0KjgyYLQ9Xbf2Q8jn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;" id=3D"docs-internal-guid-f7acfc97-7fff-1c67-9b52-1ff1d18d735f"><span s=
tyle=3D"font-family: Arial; font-size: 11pt; white-space: pre-wrap; backgro=
und-color: transparent;">Current Dev Position: YP 2.8 M1</span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; font-family: Arial; background-color: transparen=
t; font-variant-ligatures: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; vertical-align: baseline; white-space: pre-wrap;">N=
ext Deadline: YP 2.8 Milestone 1 Cutoff June 9th, 2019</span></p><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;">=
<span style=3D"font-size: 11pt; font-family: Arial; background-color: trans=
parent; font-variant-ligatures: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; vertical-align: baseline; white-space: pre-wra=
p;">SWAT Team Rotation:</span></p><ul style=3D"margin-top:0pt;margin-bottom=
:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; fon=
t-family: Arial; background-color: transparent; font-variant-ligatures: nor=
mal; font-variant-east-asian: normal; font-variant-position: normal; vertic=
al-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; bac=
kground-color: transparent; font-variant-ligatures: normal; font-variant-ea=
st-asian: normal; font-variant-position: normal; vertical-align: baseline; =
white-space: pre-wrap;">SWAT lead is currently: Chen</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Aria=
l; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color:=
 transparent; font-variant-ligatures: normal; font-variant-east-asian: norm=
al; font-variant-position: normal; vertical-align: baseline; white-space: p=
re-wrap;">SWAT team rotation: Chen -&gt; Armin on May. 31, 2019</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; vertical-align: baseline; whi=
te-space: pre-wrap;">SWAT team rotation: Armin -&gt; Anuj on June 7, 2019</=
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
 May 30th at 7:30am PDT (</span><a href=3D"https://zoom.us/j/454367603" sty=
le=3D"text-decoration:none;"><span style=3D"font-size: 10pt; color: rgb(17,=
 85, 204); background-color: transparent; font-variant-ligatures: normal; f=
ont-variant-east-asian: normal; font-variant-position: normal; text-decorat=
ion: underline; text-decoration-skip: none; vertical-align: baseline; white=
-space: pre-wrap;">https://zoom.us/j/454367603</span></a><span style=3D"fon=
t-size: 11pt; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre-wrap;">)</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transpare=
nt; font-variant-ligatures: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; vertical-align: baseline; white-space: pre-wrap;">=
Monthly Project Meeting Tuesday June 4th at 8am PDT (</span><a href=3D"http=
s://zoom.us/j/990892712" style=3D"text-decoration:none;"><span style=3D"fon=
t-size: 11pt; color: rgb(17, 85, 204); background-color: transparent; font-=
variant-ligatures: normal; font-variant-east-asian: normal; font-variant-po=
sition: normal; text-decoration: underline; text-decoration-skip: none; ver=
tical-align: baseline; white-space: pre-wrap;">https://zoom.us/j/990892712)=
</span></a><span style=3D"font-size: 11pt; background-color: transparent; f=
ont-variant-ligatures: normal; font-variant-east-asian: normal; font-varian=
t-position: normal; vertical-align: baseline; white-space: pre-wrap;"> </sp=
an></p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Ari=
al; background-color: transparent; font-variant-ligatures: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; vertical-align: bas=
eline; white-space: pre-wrap;">Key Status/Updates:</span></p><ul style=3D"m=
argin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type:=
 disc; font-size: 11pt; font-family: Arial; background-color: transparent; =
font-variant-ligatures: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; vertical-align: baseline; white-space: pre;"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span st=
yle=3D"font-size: 11pt; background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 vertical-align: baseline; white-space: pre-wrap;">Stephen is going to be u=
navailable for several weeks, please refer any queries to Richard</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font=
-family: Arial; background-color: transparent; font-variant-ligatures: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; vertica=
l-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline; w=
hite-space: pre-wrap;">Mailing lists are moving to groups.io instead of our=
 current mailman setup. For various reasons the move was delayed and will t=
ake place on 3rd June. This shouldn=E2=80=99t impact users directly, more d=
etails will be sent to the mailing lists in due course.</span></p></li><li =
dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: A=
rial; background-color: transparent; font-variant-ligatures: normal; font-v=
ariant-east-asian: normal; font-variant-position: normal; vertical-align: b=
aseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-col=
or: transparent; font-variant-ligatures: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; vertical-align: baseline; white-space=
: pre-wrap;">We have a new =E2=80=9Cnewcomer=E2=80=9D bug category which ar=
e bugs suited to someone new to the project. These can be seen here: </span=
><a href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs" st=
yle=3D"text-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17=
, 85, 204); background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; text-decora=
tion: underline; text-decoration-skip: none; vertical-align: baseline; whit=
e-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_=
Bugs</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; fon=
t-size: 11pt; font-family: Arial; background-color: transparent; font-varia=
nt-ligatures: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fon=
t-size: 11pt; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre-wrap;">Adrian Bunk has done some much app=
reciated work in removing patches which are no longer needed or appropriate=
.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size:=
 11pt; font-family: Arial; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size:=
 11pt; background-color: transparent; font-variant-ligatures: normal; font-=
variant-east-asian: normal; font-variant-position: normal; vertical-align: =
baseline; white-space: pre-wrap;">Various upgrades and ptest dependency fix=
es merged. Work is still needed on ptest dependencies, particularly on perl=
 modules.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; fo=
nt-size: 11pt; font-family: Arial; background-color: transparent; font-vari=
ant-ligatures: normal; font-variant-east-asian: normal; font-variant-positi=
on: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fo=
nt-size: 11pt; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline; white-space: pre-wrap;">Gcc 9 is now the default, thanks =
to Khem for working around the remaining bug in OE-Core.</span></p></li></u=
l><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
;"><br><br></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">Planned Releases for YP 2.8:</span></p><ul style=3D"mar=
gin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: d=
isc; font-size: 11pt; font-family: Arial; background-color: transparent; fo=
nt-variant-ligatures: normal; font-variant-east-asian: normal; font-variant=
-position: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline; white-space: pre-wrap;">M1 Cutoff June 9th</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; fo=
nt-family: Arial; background-color: transparent; font-variant-ligatures: no=
rmal; font-variant-east-asian: normal; font-variant-position: normal; verti=
cal-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; ba=
ckground-color: transparent; font-variant-ligatures: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; vertical-align: baseline;=
 white-space: pre-wrap;">M1 Release June 21st</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline; w=
hite-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; vertical-align: baseline; white-space: pre-wrap=
;">M2 Cutoff 14th July</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype: disc; font-size: 11pt; font-family: Arial; background-color: transpare=
nt; font-variant-ligatures: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; vertical-align: baseline; white-space: pre;"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; vertical-align: baseline; white-space: pre-wrap;">M2 Release 26th July=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: =
11pt; font-family: Arial; background-color: transparent; font-variant-ligat=
ures: normal; font-variant-east-asian: normal; font-variant-position: norma=
l; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: =
11pt; background-color: transparent; font-variant-ligatures: normal; font-v=
ariant-east-asian: normal; font-variant-position: normal; vertical-align: b=
aseline; white-space: pre-wrap;">M3 Cutoff (Feature Freeze) 25th Aug</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; f=
ont-family: Arial; background-color: transparent; font-variant-ligatures: n=
ormal; font-variant-east-asian: normal; font-variant-position: normal; vert=
ical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; b=
ackground-color: transparent; font-variant-ligatures: normal; font-variant-=
east-asian: normal; font-variant-position: normal; vertical-align: baseline=
; white-space: pre-wrap;">M3 Release 6th Sept</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline; w=
hite-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; vertical-align: baseline; white-space: pre-wrap=
;">M4 Cutoff 30th Sept</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype: disc; font-size: 11pt; font-family: Arial; background-color: transpare=
nt; font-variant-ligatures: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; vertical-align: baseline; white-space: pre;"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; vertical-align: baseline; white-space: pre-wrap;">2.8 (M4) Final Relea=
se 25th Oct</span></p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; f=
ont-family: Arial; background-color: transparent; font-variant-ligatures: n=
ormal; font-variant-east-asian: normal; font-variant-position: normal; vert=
ical-align: baseline; white-space: pre-wrap;">Planned upcoming dot releases=
:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr"=
 style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backg=
round-color: transparent; font-variant-ligatures: normal; font-variant-east=
-asian: normal; font-variant-position: normal; vertical-align: baseline; wh=
ite-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transpa=
rent; font-variant-ligatures: normal; font-variant-east-asian: normal; font=
-variant-position: normal; vertical-align: baseline; white-space: pre-wrap;=
">YP 2.6.3 (Thud) is in planning</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type: disc; font-size: 11pt; font-family: Arial; background-color:=
 transparent; font-variant-ligatures: normal; font-variant-east-asian: norm=
al; font-variant-position: normal; vertical-align: baseline; white-space: p=
re;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt;"><span style=3D"font-size: 11pt; background-color: transparent; font-v=
ariant-ligatures: normal; font-variant-east-asian: normal; font-variant-pos=
ition: normal; vertical-align: baseline; white-space: pre-wrap;">YP 2.7.1 (=
Warrior) is in planning</span></p></li></ul><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; font-family: Arial; background-color: transparent; font-varian=
t-ligatures: normal; font-variant-east-asian: normal; font-variant-position=
: normal; vertical-align: baseline; white-space: pre-wrap;">Tracking Metric=
s:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr=
" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline; w=
hite-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; vertical-align: baseline; white-space: pre-wrap=
;">WDD 2524 (last week 2559)</span><span style=3D"font-size: 11pt; font-fam=
ily: Consolas; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline; white-space: pre-wrap;"> (</span><a href=3D"https://wiki.=
yoctoproject.org/charts/combo.html" style=3D"text-decoration:none;"><span s=
tyle=3D"font-size: 11pt; color: rgb(17, 85, 204); background-color: transpa=
rent; font-variant-ligatures: normal; font-variant-east-asian: normal; font=
-variant-position: normal; text-decoration: underline; text-decoration-skip=
: none; vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoct=
oproject.org/charts/combo.html</span></a><span style=3D"font-size: 11pt; fo=
nt-family: Consolas; background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">)</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Consola=
s; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Aria=
l; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line; white-space: pre-wrap;">Poky Patch Metrics &nbsp;</span></p></li><ul =
style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-s=
tyle-type: circle; font-size: 11pt; font-family: Arial; background-color: t=
ransparent; font-variant-ligatures: normal; font-variant-east-asian: normal=
; font-variant-position: normal; vertical-align: baseline; white-space: pre=
;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t;"><span style=3D"font-size: 11pt; background-color: transparent; font-var=
iant-ligatures: normal; font-variant-east-asian: normal; font-variant-posit=
ion: normal; vertical-align: baseline; white-space: pre-wrap;">Total patche=
s found: 1525 (last week 1531)</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type: circle; font-size: 11pt; font-family: Consolas; background-col=
or: transparent; font-variant-ligatures: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; vertical-align: baseline; white-space=
: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; background-col=
or: transparent; font-variant-ligatures: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; vertical-align: baseline; white-space=
: pre-wrap;">Patches in the Pending State: 649 (43%) [last week 655 (43%)]<=
/span></p></li></ul></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-fam=
ily: Arial; background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; vertical-al=
ign: baseline; white-space: pre-wrap;">Key Status Links for YP:</span></p><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;">=
<a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Status" st=
yle=3D"text-decoration:none;"><span style=3D"font-size: 11pt; font-family: =
Consolas; color: rgb(17, 85, 204); background-color: transparent; font-vari=
ant-ligatures: normal; font-variant-east-asian: normal; font-variant-positi=
on: normal; text-decoration: underline; text-decoration-skip: none; vertica=
l-align: baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wi=
ki/Yocto_Project_v2.8_Status</span></a></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctopr=
oject.org/wiki/Yocto_2.8_Schedule" style=3D"text-decoration:none;"><span st=
yle=3D"font-size: 11pt; font-family: Consolas; color: rgb(17, 85, 204); bac=
kground-color: transparent; font-variant-ligatures: normal; font-variant-ea=
st-asian: normal; font-variant-position: normal; text-decoration: underline=
; text-decoration-skip: none; vertical-align: baseline; white-space: pre-wr=
ap;">https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule</span></a></p><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><=
a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.8_Features" style=3D"t=
ext-decoration:none;"><span style=3D"font-size: 11pt; font-family: Consolas=
; color: rgb(17, 85, 204); background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; text-decoration: underline; text-decoration-skip: none; vertical-align:=
 baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto=
_2.8_Features</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-=
family: Arial; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline; white-space: pre-wrap;">The Status reports are now stored=
 on the wiki at: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekl=
y_Status" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; f=
ont-family: Arial; color: rgb(17, 85, 204); background-color: transparent; =
font-variant-ligatures: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; text-decoration: underline; text-decoration-skip: none=
; vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoproje=
ct.org/wiki/Weekly_Status</span></a></p><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size:=
 11pt; font-family: Arial; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre-wrap;">[If anyone has sugges=
tions for other information you=E2=80=99d like to see on this weekly status=
 update, let us know!]</span></p><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt;"><br></p>


</body></html>

--=-8ED0KjgyYLQ9Xbf2Q8jn--
