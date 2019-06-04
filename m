Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id CFD616BCE7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 14:13:45 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id u16so219298wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2019 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version;
	bh=px5kBSBHP+Z+meXGgcqUbWb+ryaZ4swnkQKTwWh3fNI=;
	b=QQOBDAXagsJqSrWxV6kR1BAmMU8pn0GBOsIfyBd6c7dzBOqE1DEaiWI6QSgbHA3lOb
	O+LSd/hYmKQYcj9Uf6LPg6eMXBPqzQo1SeE6jvCv5Abe6mdLMBs5PT0+lUTD37CobbH8
	zuJ7ONrYIpXT/alBFyuOtDQ4gFSjf/HQuY/o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version;
	bh=px5kBSBHP+Z+meXGgcqUbWb+ryaZ4swnkQKTwWh3fNI=;
	b=eDyqs4tetL2AQCzzjAT6lDjiZ4YoawsuMffdcYByqGPQa0ikfrelWVXG5LHSJinJkt
	ww9pmBgs5W8G4ffmrKVwbTQljG2Mz5sQ6BPJZUIHT0eyr/iHFIvVZGHWETzyu6bKgzAQ
	E/1t8RjdwWX9A9g6AYXXUYxuz04lfaVltc+laX9zWa6+kOoSHAqNQQMkeBzyADXu16vw
	0wTyIrzTW+igtVkVqg8gM8m1H1dkniCAhUNTGuzTpJOpWS321BcBelhxBIqn8OfVKym0
	5AdYTzW+0nId0zSXuXnU61Pjt3HZ9gSL574+JXrjPY0quMP/PIKwJRbZMs4Fx5F2oCjy
	0Zjg==
X-Gm-Message-State: APjAAAVBX+bG4O9bOWkZEbzGi+y7nI9mcXmJPGvhNBYuYUG87RYjDMey
	yfkskwhMxyiI0oYUSZ9vXYeQWQ==
X-Google-Smtp-Source: APXvYqz0NWGJMnTb41ZyvgOUPxAb0zVNAeDX5MS509hsPKvV7shon3CbV82RvIPuEktefSA/DOGPQQ==
X-Received: by 2002:a1c:7a10:: with SMTP id v16mr14825170wmc.98.1559657626297; 
	Tue, 04 Jun 2019 07:13:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k184sm36269015wmk.0.2019.06.04.07.13.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 04 Jun 2019 07:13:45 -0700 (PDT)
Message-ID: <6635a76b6f53140e31829e3b7e423e39736fe7e9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Tue, 04 Jun 2019 15:13:43 +0100
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Yocto Project Status WW23'19
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
X-List-Received-Date: Tue, 04 Jun 2019 14:13:46 -0000
Content-Type: multipart/alternative; boundary="=-ni+tJk+lYQBTBjM67SzR"

--=-ni+tJk+lYQBTBjM67SzR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.8 M1Next Deadline: YP 2.8 Milestone 1 Cutoff
June 9th, 2019
SWAT Team Rotation: * SWAT lead is currently: Armin
 * SWAT team rotation: Armin -> Anuj on June 7, 2019
 * SWAT team rotation: Anuj -> Paul on June 14, 2019
 * https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Next Team Meetings: * Bug Triage meeting Thursday June 6th at 7:30am
PDT (https://zoom.us/j/454367603)
 * Monthly Project Meeting Tuesday June 4th at 8am PDT (
https://zoom.us/j/990892712) 
 * Twitch - Next event is Tuesday 11th June at 8am PDT (
https://www.twitch.tv/yocto_project)

Key Status/Updates: * 2.8 M1 is nearly upon us with just under a week
left for the remaining features/patches.
 * Stephen continues to be unavailable, please refer any queries to
Richard
 * Mailing lists are moving to groups.io instead of our current mailman
setup. This shouldn’t impact users directly, more details will be sent
to the mailing lists before the transfer. THe Yocto Project lists will
move first, followed by OE, likely a week later.
 * We have a new “newcomer” bug category which are bugs suited to
someone new to the project. These can be seen here: 
https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs
 * Uninative 2.5 was released which supports gcc 9. This should fix
issues for fedora 30 builds and allow the bringup of fedora 30 workers
in the autobuilder too.
 * ARM native builds are now working on the autobuilder as well as KVM
accelerated ARM ptest and ltp testing.
 * There are ongoing concerns about perl module dependencies. Tim and
Richard have applied bandaids to solve some ptest issues but we really
need work in this area if there are any perl experts interested.
 * Many further ptests fixes have merged, thanks to all for the
contributions.

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

Tracking Metrics: * WDD 2507 (last week 2524) (
https://wiki.yoctoproject.org/charts/combo.html)
 * Poky Patch Metrics  
    * Total patches found: 1513 (last week 1525)
    * Patches in the Pending State: 646 (43%) [last week 649 (43%)]

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Statushttps://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedulehttps://wiki.yoctoproject.org/wiki/Yocto_2.8_Features
The Status reports are now stored on the wiki at: 
https://wiki.yoctoproject.org/wiki/Weekly_Status
[If anyone has suggestions for other information you’d like to see on
this weekly status update, let us know!]





--=-ni+tJk+lYQBTBjM67SzR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;" id=3D"docs-internal-guid-cf654220-7fff-09aa-1a24-fd6553d5f616"><span s=
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
white-space: pre-wrap;">SWAT lead is currently: Armin</span></p></li><li di=
r=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Ari=
al; background-color: transparent; font-variant-ligatures: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; vertical-align: bas=
eline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color=
: transparent; font-variant-ligatures: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; vertical-align: baseline; white-space: =
pre-wrap;">SWAT team rotation: Armin -&gt; Anuj on June 7, 2019</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; vertical-align: baseline; whi=
te-space: pre-wrap;">SWAT team rotation: Anuj -&gt; Paul on June 14, 2019</=
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
 June 6th at 7:30am PDT (</span><a href=3D"https://zoom.us/j/454367603" sty=
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
an></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt=
; font-family: Arial; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt=
; background-color: transparent; font-variant-ligatures: normal; font-varia=
nt-east-asian: normal; font-variant-position: normal; vertical-align: basel=
ine; white-space: pre-wrap;">Twitch - Next event is Tuesday 11th June at 8a=
m PDT (</span><a href=3D"https://www.twitch.tv/yocto_project" style=3D"text=
-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204);=
 background-color: transparent; font-variant-ligatures: normal; font-varian=
t-east-asian: normal; font-variant-position: normal; text-decoration: under=
line; text-decoration-skip: none; vertical-align: baseline; white-space: pr=
e-wrap;">https://www.twitch.tv/yocto_project</span></a><span style=3D"font-=
size: 11pt; background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; vertical-al=
ign: baseline; white-space: pre-wrap;">)</span></p></li></ul><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; font-family: Arial; background-color: transpare=
nt; font-variant-ligatures: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; vertical-align: baseline; white-space: pre-wrap;">=
Key Status/Updates:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt=
;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-fa=
mily: Arial; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">2.8 M1 is nearly upon us with just under a week left fo=
r the remaining features/patches.</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type: disc; font-size: 11pt; font-family: Arial; background-color=
: transparent; font-variant-ligatures: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; vertical-align: baseline; white-space: =
pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt;"><span style=3D"font-size: 11pt; background-color: transparent; font-=
variant-ligatures: normal; font-variant-east-asian: normal; font-variant-po=
sition: normal; vertical-align: baseline; white-space: pre-wrap;">Stephen c=
ontinues to be unavailable, please refer any queries to Richard</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; vertical-align: baseline; whi=
te-space: pre-wrap;">Mailing lists are moving to groups.io instead of our c=
urrent mailman setup. This shouldn=E2=80=99t impact users directly, more de=
tails will be sent to the mailing lists before the transfer. THe Yocto Proj=
ect lists will move first, followed by OE, likely a week later.</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; vertical-align: baseline; whi=
te-space: pre-wrap;">We have a new =E2=80=9Cnewcomer=E2=80=9D bug category =
which are bugs suited to someone new to the project. These can be seen here=
: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_=
Bugs" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; color=
: rgb(17, 85, 204); background-color: transparent; font-variant-ligatures: =
normal; font-variant-east-asian: normal; font-variant-position: normal; tex=
t-decoration: underline; text-decoration-skip: none; vertical-align: baseli=
ne; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Bug_Triage#N=
ewcomer_Bugs</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type: d=
isc; font-size: 11pt; font-family: Arial; background-color: transparent; fo=
nt-variant-ligatures: normal; font-variant-east-asian: normal; font-variant=
-position: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline; white-space: pre-wrap;">Uninative 2.5 was released=
 which supports gcc 9. This should fix issues for fedora 30 builds and allo=
w the bringup of fedora 30 workers in the autobuilder too.</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family=
: Arial; background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; vertical-align=
: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-=
color: transparent; font-variant-ligatures: normal; font-variant-east-asian=
: normal; font-variant-position: normal; vertical-align: baseline; white-sp=
ace: pre-wrap;">ARM native builds are now working on the autobuilder as wel=
l as KVM accelerated ARM ptest and ltp testing.</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; ba=
ckground-color: transparent; font-variant-ligatures: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; vertical-align: baseline;=
 white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: tran=
sparent; font-variant-ligatures: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; vertical-align: baseline; white-space: pre-wr=
ap;">There are ongoing concerns about perl module dependencies. Tim and Ric=
hard have applied bandaids to solve some ptest issues but we really need wo=
rk in this area if there are any perl experts interested.</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family:=
 Arial; background-color: transparent; font-variant-ligatures: normal; font=
-variant-east-asian: normal; font-variant-position: normal; vertical-align:=
 baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-c=
olor: transparent; font-variant-ligatures: normal; font-variant-east-asian:=
 normal; font-variant-position: normal; vertical-align: baseline; white-spa=
ce: pre-wrap;">Many further ptests fixes have merged, thanks to all for the=
 contributions.</span></p></li></ul><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11p=
t; font-family: Arial; background-color: transparent; font-variant-ligature=
s: normal; font-variant-east-asian: normal; font-variant-position: normal; =
vertical-align: baseline; white-space: pre-wrap;">Planned Releases for YP 2=
.8:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"lt=
r" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; bac=
kground-color: transparent; font-variant-ligatures: normal; font-variant-ea=
st-asian: normal; font-variant-position: normal; vertical-align: baseline; =
white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: trans=
parent; font-variant-ligatures: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; vertical-align: baseline; white-space: pre-wra=
p;">M1 Cutoff June 9th</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype: disc; font-size: 11pt; font-family: Arial; background-color: transpare=
nt; font-variant-ligatures: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; vertical-align: baseline; white-space: pre;"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; vertical-align: baseline; white-space: pre-wrap;">M1 Release June 21st=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: =
11pt; font-family: Arial; background-color: transparent; font-variant-ligat=
ures: normal; font-variant-east-asian: normal; font-variant-position: norma=
l; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: =
11pt; background-color: transparent; font-variant-ligatures: normal; font-v=
ariant-east-asian: normal; font-variant-position: normal; vertical-align: b=
aseline; white-space: pre-wrap;">M2 Cutoff 14th July</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Aria=
l; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color:=
 transparent; font-variant-ligatures: normal; font-variant-east-asian: norm=
al; font-variant-position: normal; vertical-align: baseline; white-space: p=
re-wrap;">M2 Release 26th July</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type: disc; font-size: 11pt; font-family: Arial; background-color: t=
ransparent; font-variant-ligatures: normal; font-variant-east-asian: normal=
; font-variant-position: normal; vertical-align: baseline; white-space: pre=
;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t;"><span style=3D"font-size: 11pt; background-color: transparent; font-var=
iant-ligatures: normal; font-variant-east-asian: normal; font-variant-posit=
ion: normal; vertical-align: baseline; white-space: pre-wrap;">M3 Cutoff (F=
eature Freeze) 25th Aug</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type: disc; font-size: 11pt; font-family: Arial; background-color: transpar=
ent; font-variant-ligatures: normal; font-variant-east-asian: normal; font-=
variant-position: normal; vertical-align: baseline; white-space: pre;"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><sp=
an style=3D"font-size: 11pt; background-color: transparent; font-variant-li=
gatures: normal; font-variant-east-asian: normal; font-variant-position: no=
rmal; vertical-align: baseline; white-space: pre-wrap;">M3 Release 6th Sept=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: =
11pt; font-family: Arial; background-color: transparent; font-variant-ligat=
ures: normal; font-variant-east-asian: normal; font-variant-position: norma=
l; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: =
11pt; background-color: transparent; font-variant-ligatures: normal; font-v=
ariant-east-asian: normal; font-variant-position: normal; vertical-align: b=
aseline; white-space: pre-wrap;">M4 Cutoff 30th Sept</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Aria=
l; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color:=
 transparent; font-variant-ligatures: normal; font-variant-east-asian: norm=
al; font-variant-position: normal; vertical-align: baseline; white-space: p=
re-wrap;">2.8 (M4) Final Release 25th Oct</span></p></li></ul><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><sp=
an style=3D"font-size: 11pt; font-family: Arial; background-color: transpar=
ent; font-variant-ligatures: normal; font-variant-east-asian: normal; font-=
variant-position: normal; vertical-align: baseline; white-space: pre-wrap;"=
>Planned upcoming dot releases:</span></p><ul style=3D"margin-top:0pt;margi=
n-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 1=
1pt; font-family: Arial; background-color: transparent; font-variant-ligatu=
res: normal; font-variant-east-asian: normal; font-variant-position: normal=
; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 1=
1pt; background-color: transparent; font-variant-ligatures: normal; font-va=
riant-east-asian: normal; font-variant-position: normal; vertical-align: ba=
seline; white-space: pre-wrap;">YP 2.6.3 (Thud) is in planning</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-fa=
mily: Arial; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">YP 2.7.1 (Warrior) is in planning</span></p></li></ul><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;">=
<br></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; background-col=
or: transparent; font-variant-ligatures: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; vertical-align: baseline; white-space=
: pre-wrap;">Tracking Metrics:</span></p><ul style=3D"margin-top:0pt;margin=
-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11=
pt; font-family: Arial; background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11=
pt; background-color: transparent; font-variant-ligatures: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; vertical-align: bas=
eline; white-space: pre-wrap;">WDD 2507 (last week 2524)</span><span style=
=3D"font-size: 11pt; font-family: Consolas; background-color: transparent; =
font-variant-ligatures: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; vertical-align: baseline; white-space: pre-wrap;"> (</=
span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D"t=
ext-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 20=
4); background-color: transparent; font-variant-ligatures: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; text-decoration: un=
derline; text-decoration-skip: none; vertical-align: baseline; white-space:=
 pre-wrap;">https://wiki.yoctoproject.org/charts/combo.html</span></a><span=
 style=3D"font-size: 11pt; font-family: Consolas; background-color: transpa=
rent; font-variant-ligatures: normal; font-variant-east-asian: normal; font=
-variant-position: normal; vertical-align: baseline; white-space: pre-wrap;=
">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-siz=
e: 11pt; font-family: Consolas; background-color: transparent; font-variant=
-ligatures: normal; font-variant-east-asian: normal; font-variant-position:=
 normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; font-family: Arial; background-color: transparent; font-varian=
t-ligatures: normal; font-variant-east-asian: normal; font-variant-position=
: normal; vertical-align: baseline; white-space: pre-wrap;">Poky Patch Metr=
ics &nbsp;</span></p></li><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><=
li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-fami=
ly: Arial; background-color: transparent; font-variant-ligatures: normal; f=
ont-variant-east-asian: normal; font-variant-position: normal; vertical-ali=
gn: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; vertical-align: baseline; white-=
space: pre-wrap;">Total patches found: 1513 (last week 1525)</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-fa=
mily: Consolas; background-color: transparent; font-variant-ligatures: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; vertica=
l-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font=
-family: Arial; background-color: transparent; font-variant-ligatures: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; vertica=
l-align: baseline; white-space: pre-wrap;">Patches in the Pending State: 64=
6 (43%) [last week 649 (43%)]</span></p></li></ul></ul><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; font-family: Arial; background-color: transparent; fo=
nt-variant-ligatures: normal; font-variant-east-asian: normal; font-variant=
-position: normal; vertical-align: baseline; white-space: pre-wrap;">Key St=
atus Links for YP:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki=
/Yocto_Project_v2.8_Status" style=3D"text-decoration:none;"><span style=3D"=
font-size: 11pt; font-family: Consolas; color: rgb(17, 85, 204); background=
-color: transparent; font-variant-ligatures: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; text-decoration: underline; text-=
decoration-skip: none; vertical-align: baseline; white-space: pre-wrap;">ht=
tps://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Status</span></a></p><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><=
a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule" style=3D"t=
ext-decoration:none;"><span style=3D"font-size: 11pt; font-family: Consolas=
; color: rgb(17, 85, 204); background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; text-decoration: underline; text-decoration-skip: none; vertical-align:=
 baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto=
_2.8_Schedule</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/=
Yocto_2.8_Features" style=3D"text-decoration:none;"><span style=3D"font-siz=
e: 11pt; font-family: Consolas; color: rgb(17, 85, 204); background-color: =
transparent; font-variant-ligatures: normal; font-variant-east-asian: norma=
l; font-variant-position: normal; text-decoration: underline; text-decorati=
on-skip: none; vertical-align: baseline; white-space: pre-wrap;">https://wi=
ki.yoctoproject.org/wiki/Yocto_2.8_Features</span></a></p><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; font-family: Arial; background-color: transparen=
t; font-variant-ligatures: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; vertical-align: baseline; white-space: pre-wrap;">T=
he Status reports are now stored on the wiki at: </span><a href=3D"https://=
wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-decoration:none;"><=
span style=3D"font-size: 11pt; font-family: Arial; color: rgb(17, 85, 204);=
 background-color: transparent; font-variant-ligatures: normal; font-varian=
t-east-asian: normal; font-variant-position: normal; text-decoration: under=
line; text-decoration-skip: none; vertical-align: baseline; white-space: pr=
e-wrap;">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><b=
r></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; background-color=
: transparent; font-variant-ligatures: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; vertical-align: baseline; white-space: =
pre-wrap;">[If anyone has suggestions for other information you=E2=80=99d l=
ike to see on this weekly status update, let us know!]</span></p>



</body></html>

--=-ni+tJk+lYQBTBjM67SzR--
