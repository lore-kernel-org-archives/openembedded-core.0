Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0627EA65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 14:54:57 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id z11so19151208wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 07:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version;
	bh=0dbAftZ/uuMfkTGbP+fhJ2oic/0SO+x7jtbLsRuoEFg=;
	b=Iis6gKjmkpudyQlgWNvftWxEFsQNY+P0T8Qu92iQxhStOaBSdWdPsmErTAVqnRDId0
	7ArMqGyHgufKoEayIzfv46BIDBF25luOc1imrHhpHs6mw9qAxU+m4tp4kd2h/JBolRFJ
	QYjCzvRtJcJfybXt/QEvtHo0wOwJxLKrc/hik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version;
	bh=0dbAftZ/uuMfkTGbP+fhJ2oic/0SO+x7jtbLsRuoEFg=;
	b=tXvaWALt7jSSW4GhxkQfxI62+j24HPOlURBgVllFVnV0X1tbCvXPB83Uua3xzLhU5g
	4an8mFJ+fcroEjRppW3O1QwZ9d9tq+5Ed3jcAm+zSz2Nxvij3Efzk0Ig0J/2g7o7FIaa
	gt1zRJI0qth/hAnT2sqlPnGR0Ta1fZt3b+Lq9V7QXTxwG4cSfB3hVZsL2fbDsThj5Js9
	k0Qbwj5nHW74FmSTymZxZfgZw1om14jMH8+7OJto6WRjpoQYbEM3hX4GI+M/a/OfcmLe
	mpk7/Cn/1ykdp6C2Qx0bOqW6yng78jcy1OagRULJSvtgRJg4UIen8cpbMnkLo5l/vGtF
	velw==
X-Gm-Message-State: APjAAAUFwwkb6paKtUdoC0M74cZfID7E2jB30YbI1ufkBmZhHrLw7UqM
	JJfKyNtJMHyIUaVslS6o06psyuP0bu+Hmw==
X-Google-Smtp-Source: APXvYqy9QpcFPSO5VGyW9zlPK0hwQhp6XvIz/T7Y5sMMV/j/dMxuwabZ7DAnVrW6QQoqeP8BQPkjzQ==
X-Received: by 2002:a5d:480d:: with SMTP id l13mr708083wrq.321.1566917698448; 
	Tue, 27 Aug 2019 07:54:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 7sm3508180wmj.46.2019.08.27.07.54.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 07:54:57 -0700 (PDT)
Message-ID: <863249df6608405b5ec65eb2126748dffedb4b8c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "<yocto@yoctoproject.org>" <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2019 15:54:56 +0100
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1czNeKAmTE5?=
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
X-List-Received-Date: Tue, 27 Aug 2019 14:54:58 -0000
Content-Type: multipart/alternative; boundary="=-vfnLijxBzEbn9a9fb/PC"

--=-vfnLijxBzEbn9a9fb/PC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.8 M4 Feature Freeze
Next Deadline: YP 3.0 Final Release 25th Oct

SWAT Team Rotation:
SWAT lead is currently: AnujSWAT team rotation: Anuj -> Armin on Aug.
30, 2019SWAT team rotation: Armin -> Paulj on Sept. 6, 2019
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
Next Team Meetings:
Bug Triage meeting Thursday August 29th at 7:30am PDT (
https://zoom.us/j/454367603)Monthly Project Meeting Tuesday Sept. 3rd
at 8am PDT (https://zoom.us/j/990892712) Twitch - Next event is Tuesday
Sept. 10th at 8am PDT (https://www.twitch.tv/yocto_project)
Key Status/Updates:
We’re now in feature freeze for 3.0 and working on bug fixing for final
releaseThere are the following planned features which are still under
consideration for 3.0:Systemd vs. sysvinit defaults (maybe for the poky
alternative configuration tests)Removal of LSB and poky-lsb and
replacement with alt config testingFinal configuration of hash
equivalencyThe sstate hash equivalency continues to have challenges:we
need to rework the client/server communication to scale to the
autobuilderthere are some bugs in the code the autobuilder continues to
exposewe have cases where its not 100% clear what the correct behaviour
should betest cases are proving to be problematic to write in a
maintainable wayPatch merging has been delayed due to vacations (RP and
Ross) so the final feature patches aren’t resolved yet.If anyone has
any status items for the project they’d like to add to the weekly
reports, please email Richard+Stephen.
Planned Releases for YP 3.0 {2.8}:
M3 Release 6th SeptM4 Cutoff 30th Sept - this will be YP 3.0.YP 3.0
{2.8 (M4)} Final Release 25th Oct
Planned upcoming dot releases:
YP 2.7.2 (Warrior) is planned for after YP 3.0 release.YP 2.6.4 (Thud)
is planned for after YP 2.7.2  release.
Tracking Metrics:
WDD 2485 (last week 2495) (
https://wiki.yoctoproject.org/charts/combo.html)Poky Patch
Metrics  Total patches found: 1474 (last week 1491)Patches in the
Pending State: 613 (42%) [last week 616 (41%)]
Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.8_Features

The Yocto Project’s technical governance is through its Technical
Steering Committee, more information is available at:
https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at: 
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you’d like to see on
this weekly status update, let us know!]

--=-vfnLijxBzEbn9a9fb/PC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align: left; direction: =
ltr; word-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-whi=
te-space;"><pre><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt;" id=3D"docs-internal-guid-d34d6291-7fff-7ca3-1538-09da87d9b=
bbd"><span style=3D"font-family: Arial; font-size: 11pt; white-space: pre-w=
rap; background-color: transparent;">Current Dev Position: YP 2.8 M4 Featur=
e Freeze</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; bac=
kground-color: transparent; font-variant-ligatures: normal; font-variant-ea=
st-asian: normal; font-variant-position: normal; vertical-align: baseline; =
white-space: pre-wrap;">Next Deadline: YP 3.0 Final Release 25th Oct</span>=
</p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; background-col=
or: transparent; font-variant-ligatures: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; vertical-align: baseline; white-space=
: pre-wrap;">SWAT Team Rotation:</span></p><ul style=3D"margin-top:0;margin=
-bottom:0;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt=
; font-family: Arial; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color=
: transparent; font-variant-ligatures: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; vertical-align: baseline; white-space: =
pre-wrap;">SWAT lead is currently: Anuj</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; background=
-color: transparent; font-variant-ligatures: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; vertical-align: baseline;"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre-wrap;">SWAT team rotation: A=
nuj -&gt; Armin on Aug. 30, 2019</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type: disc; font-size: 11pt; font-family: Arial; background-color:=
 transparent; font-variant-ligatures: normal; font-variant-east-asian: norm=
al; font-variant-position: normal; vertical-align: baseline;"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">SWAT team rotation: Armin -=
&gt; Paulj on Sept. 6, 2019</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type: disc; font-size: 11pt; font-family: Consolas, sans-serif; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline;"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a=
 href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team" =
style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(=
17, 85, 204); background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; text-deco=
ration: underline; text-decoration-skip: none; vertical-align: baseline; wh=
ite-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failur=
e_Swat_Team</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; fo=
nt-family: Arial; background-color: transparent; font-variant-ligatures: no=
rmal; font-variant-east-asian: normal; font-variant-position: normal; verti=
cal-align: baseline; white-space: pre-wrap;">Next Team Meetings:</span></p>=
<ul style=3D"margin-top:0;margin-bottom:0;"><li dir=3D"ltr" style=3D"list-s=
tyle-type: disc; font-size: 11pt; font-family: Arial; background-color: tra=
nsparent; font-variant-ligatures: normal; font-variant-east-asian: normal; =
font-variant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"f=
ont-size: 11pt; background-color: transparent; font-variant-ligatures: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; vertica=
l-align: baseline; white-space: pre-wrap;">Bug Triage meeting Thursday Augu=
st 29th at 7:30am PDT (</span><a href=3D"https://zoom.us/j/454367603" style=
=3D"text-decoration:none;"><span style=3D"font-size: 10pt; color: rgb(17, 8=
5, 204); background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; text-decoratio=
n: underline; text-decoration-skip: none; vertical-align: baseline; white-s=
pace: pre-wrap;">https://zoom.us/j/454367603</span></a><span style=3D"font-=
size: 11pt; background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; vertical-al=
ign: baseline; white-space: pre-wrap;">)</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; vertical-align: baseline;"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; vertical-align: baseline; white-space: pre-wrap;">Monthly Project Meet=
ing Tuesday Sept. 3rd at 8am PDT (</span><a href=3D"https://zoom.us/j/99089=
2712" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; color=
: rgb(17, 85, 204); background-color: transparent; font-variant-ligatures: =
normal; font-variant-east-asian: normal; font-variant-position: normal; tex=
t-decoration: underline; text-decoration-skip: none; vertical-align: baseli=
ne; white-space: pre-wrap;">https://zoom.us/j/990892712)</span></a><span st=
yle=3D"font-size: 11pt; background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 vertical-align: baseline; white-space: pre-wrap;">&nbsp;</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family:=
 Arial; background-color: transparent; font-variant-ligatures: normal; font=
-variant-east-asian: normal; font-variant-position: normal; vertical-align:=
 baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent;=
 font-variant-ligatures: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; vertical-align: baseline; white-space: pre-wrap;">Twi=
tch - Next event is Tuesday Sept. 10th at 8am PDT (</span><a href=3D"https:=
//www.twitch.tv/yocto_project" style=3D"text-decoration:none;"><span style=
=3D"font-size: 11pt; color: rgb(17, 85, 204); background-color: transparent=
; font-variant-ligatures: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; text-decoration: underline; text-decoration-skip: no=
ne; vertical-align: baseline; white-space: pre-wrap;">https://www.twitch.tv=
/yocto_project</span></a><span style=3D"font-size: 11pt; background-color: =
transparent; font-variant-ligatures: normal; font-variant-east-asian: norma=
l; font-variant-position: normal; vertical-align: baseline; white-space: pr=
e-wrap;">)</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-fa=
mily: Arial; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">Key Status/Updates:</span></p><ul s=
tyle=3D"margin-top:0;margin-bottom:0;"><li dir=3D"ltr" style=3D"list-style-=
type: disc; font-size: 11pt; font-family: Arial; background-color: transpar=
ent; font-variant-ligatures: normal; font-variant-east-asian: normal; font-=
variant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">We=E2=80=99re now in feature freeze=
 for 3.0 and working on bug fixing for final release</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Aria=
l; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt;"><span style=3D"font-size: 11pt; background-color: transparent; font=
-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-p=
osition: normal; vertical-align: baseline; white-space: pre-wrap;">There ar=
e the following planned features which are still under consideration for 3.=
0:</span></p></li><ul style=3D"margin-top:0;margin-bottom:0;"><li dir=3D"lt=
r" style=3D"list-style-type: circle; font-size: 11pt; font-family: Arial; b=
ackground-color: transparent; font-variant-ligatures: normal; font-variant-=
east-asian: normal; font-variant-position: normal; vertical-align: baseline=
;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t;"><span style=3D"font-size: 11pt; background-color: transparent; font-var=
iant-ligatures: normal; font-variant-east-asian: normal; font-variant-posit=
ion: normal; vertical-align: baseline; white-space: pre-wrap;">Systemd vs. =
sysvinit defaults (maybe for the poky alternative configuration tests)</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11p=
t; font-family: Arial; background-color: transparent; font-variant-ligature=
s: normal; font-variant-east-asian: normal; font-variant-position: normal; =
vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-colo=
r: transparent; font-variant-ligatures: normal; font-variant-east-asian: no=
rmal; font-variant-position: normal; vertical-align: baseline; white-space:=
 pre-wrap;">Removal of LSB and poky-lsb and replacement with alt config tes=
ting</span></p></li><li dir=3D"ltr" style=3D"list-style-type: circle; font-=
size: 11pt; font-family: Arial; background-color: transparent; font-variant=
-ligatures: normal; font-variant-east-asian: normal; font-variant-position:=
 normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgr=
ound-color: transparent; font-variant-ligatures: normal; font-variant-east-=
asian: normal; font-variant-position: normal; vertical-align: baseline; whi=
te-space: pre-wrap;">Final configuration of hash equivalency</span></p></li=
></ul><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font=
-family: Arial; background-color: transparent; font-variant-ligatures: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; vertica=
l-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: tran=
sparent; font-variant-ligatures: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; vertical-align: baseline; white-space: pre-wr=
ap;">The sstate hash equivalency continues to have challenges:</span></p></=
li><ul style=3D"margin-top:0;margin-bottom:0;"><li dir=3D"ltr" style=3D"lis=
t-style-type: circle; font-size: 11pt; font-family: Arial; background-color=
: transparent; font-variant-ligatures: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; vertical-align: baseline;"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">we need to rework the clien=
t/server communication to scale to the autobuilder</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-family: Ar=
ial; background-color: transparent; font-variant-ligatures: normal; font-va=
riant-east-asian: normal; font-variant-position: normal; vertical-align: ba=
seline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent; fo=
nt-variant-ligatures: normal; font-variant-east-asian: normal; font-variant=
-position: normal; vertical-align: baseline; white-space: pre-wrap;">there =
are some bugs in the code the autobuilder continues to expose</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; vertical-align: baseline; white-space: pre-wrap=
;">we have cases where its not 100% clear what the correct behaviour should=
 be</span></p></li><li dir=3D"ltr" style=3D"list-style-type: circle; font-s=
ize: 11pt; font-family: Arial; background-color: transparent; font-variant-=
ligatures: normal; font-variant-east-asian: normal; font-variant-position: =
normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">test cases are proving to be problematic to write in a =
maintainable way</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-ty=
pe: disc; font-size: 11pt; font-family: Arial; background-color: transparen=
t; font-variant-ligatures: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-siz=
e: 11pt; background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; vertical-align=
: baseline; white-space: pre-wrap;">Patch merging has been delayed due to v=
acations (RP and Ross) so the final feature patches aren=E2=80=99t resolved=
 yet.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-s=
ize: 11pt; font-family: Arial; background-color: transparent; font-variant-=
ligatures: normal; font-variant-east-asian: normal; font-variant-position: =
normal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">If anyone has any status items for the project they=E2=
=80=99d like to add to the weekly reports, please email Richard+Stephen.</s=
pan></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; =
background-color: transparent; font-variant-ligatures: normal; font-variant=
-east-asian: normal; font-variant-position: normal; vertical-align: baselin=
e; white-space: pre-wrap;">Planned Releases for YP 3.0 {2.8}:</span></p><ul=
 style=3D"margin-top:0;margin-bottom:0;"><li dir=3D"ltr" style=3D"list-styl=
e-type: disc; font-size: 11pt; font-family: Arial; background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; vertical-align: baseline;"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">M3 Release 6th Sept</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-famil=
y: Arial; background-color: transparent; font-variant-ligatures: normal; fo=
nt-variant-east-asian: normal; font-variant-position: normal; vertical-alig=
n: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparen=
t; font-variant-ligatures: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; vertical-align: baseline; white-space: pre-wrap;">M=
4 Cutoff 30th Sept - this will be YP 3.0.</span></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgrou=
nd-color: transparent; font-variant-ligatures: normal; font-variant-east-as=
ian: normal; font-variant-position: normal; vertical-align: baseline;"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><sp=
an style=3D"font-size: 11pt; background-color: transparent; font-variant-li=
gatures: normal; font-variant-east-asian: normal; font-variant-position: no=
rmal; vertical-align: baseline; white-space: pre-wrap;">YP 3.0 {2.8 (M4)} F=
inal Release 25th Oct</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11=
pt; font-family: Arial; background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 vertical-align: baseline; white-space: pre-wrap;">Planned upcoming dot rel=
eases:</span></p><ul style=3D"margin-top:0;margin-bottom:0;"><li dir=3D"ltr=
" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline;">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
><span style=3D"font-size: 11pt; background-color: transparent; font-varian=
t-ligatures: normal; font-variant-east-asian: normal; font-variant-position=
: normal; vertical-align: baseline; white-space: pre-wrap;">YP 2.7.2 (Warri=
or) is planned for after YP 3.0 release.</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; vertical-align: baseline;"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; vertical-align: baseline; white-space: pre-wrap;">YP 2.6.4 (Thud) is p=
lanned for after YP 2.7.2&nbsp; release.</span></p></li></ul><br><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span sty=
le=3D"font-size: 11pt; font-family: Arial; background-color: transparent; f=
ont-variant-ligatures: normal; font-variant-east-asian: normal; font-varian=
t-position: normal; vertical-align: baseline; white-space: pre-wrap;">Track=
ing Metrics:</span></p><ul style=3D"margin-top:0;margin-bottom:0;"><li dir=
=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Aria=
l; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt;"><span style=3D"font-size: 11pt; background-color: transparent; font=
-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-p=
osition: normal; vertical-align: baseline; white-space: pre-wrap;">WDD 2485=
 (last week 2495)</span><span style=3D"font-size: 11pt; font-family: Consol=
as, sans-serif; background-color: transparent; font-variant-ligatures: norm=
al; font-variant-east-asian: normal; font-variant-position: normal; vertica=
l-align: baseline; white-space: pre-wrap;"> (</span><a href=3D"https://wiki=
.yoctoproject.org/charts/combo.html" style=3D"text-decoration:none;"><span =
style=3D"font-size: 11pt; color: rgb(17, 85, 204); background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; text-decoration: underline; text-decoration-ski=
p: none; vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoc=
toproject.org/charts/combo.html</span></a><span style=3D"font-size: 11pt; f=
ont-family: Consolas, sans-serif; background-color: transparent; font-varia=
nt-ligatures: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; vertical-align: baseline; white-space: pre-wrap;">)</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-fa=
mily: Consolas, sans-serif; background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-famil=
y: Arial; background-color: transparent; font-variant-ligatures: normal; fo=
nt-variant-east-asian: normal; font-variant-position: normal; vertical-alig=
n: baseline; white-space: pre-wrap;">Poky Patch Metrics&nbsp;&nbsp;</span><=
/p></li><ul style=3D"margin-top:0;margin-bottom:0;"><li dir=3D"ltr" style=
=3D"list-style-type: circle; font-size: 11pt; font-family: Arial; backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; vertical-align: baseline;"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 11pt; background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; vertical-align: baseline; white-space: pre-wrap;">Total patches found:=
 1474 (last week 1491)</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype: circle; font-size: 11pt; font-family: Consolas, sans-serif; background=
-color: transparent; font-variant-ligatures: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; vertical-align: baseline;"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; font-family: Arial; background-color: transparen=
t; font-variant-ligatures: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; vertical-align: baseline; white-space: pre-wrap;">P=
atches in the Pending State: 613 (42%) [last week 616 (41%)]</span></p></li=
></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">Key Status Links for YP:</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://=
wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Status" style=3D"text-decorat=
ion:none;"><span style=3D"font-size: 11pt; font-family: Consolas, sans-seri=
f; color: rgb(17, 85, 204); background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; text-decoration: underline; text-decoration-skip: none; vertical-align=
: baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yoct=
o_Project_v2.8_Status</span></a></p><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.o=
rg/wiki/Yocto_2.8_Schedule" style=3D"text-decoration:none;"><span style=3D"=
font-size: 11pt; font-family: Consolas, sans-serif; color: rgb(17, 85, 204)=
; background-color: transparent; font-variant-ligatures: normal; font-varia=
nt-east-asian: normal; font-variant-position: normal; text-decoration: unde=
rline; text-decoration-skip: none; vertical-align: baseline; white-space: p=
re-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule</span></a><=
/p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.8_Features" style=
=3D"text-decoration:none;"><span style=3D"font-size: 11pt; font-family: Con=
solas, sans-serif; color: rgb(17, 85, 204); background-color: transparent; =
font-variant-ligatures: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; text-decoration: underline; text-decoration-skip: none=
; vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoproje=
ct.org/wiki/Yocto_2.8_Features</span></a></p><br><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size:=
 11pt; font-family: Arial; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre-wrap;">The Yocto Project=E2=
=80=99s technical governance is through its Technical Steering Committee, m=
ore information is available at:</span></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctopr=
oject.org/wiki/TSC" style=3D"text-decoration:none;"><span style=3D"font-siz=
e: 11pt; font-family: Arial; color: rgb(17, 85, 204); background-color: tra=
nsparent; font-variant-ligatures: normal; font-variant-east-asian: normal; =
font-variant-position: normal; text-decoration: underline; text-decoration-=
skip: none; vertical-align: baseline; white-space: pre-wrap;">https://wiki.=
yoctoproject.org/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt=
; font-family: Arial; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline; white-space: pre-wrap;">The Status reports are now=
 stored on the wiki at: </span><a href=3D"https://wiki.yoctoproject.org/wik=
i/Weekly_Status" style=3D"text-decoration:none;"><span style=3D"font-size: =
11pt; font-family: Arial; color: rgb(17, 85, 204); background-color: transp=
arent; font-variant-ligatures: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; text-decoration: underline; text-decoration-ski=
p: none; vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoc=
toproject.org/wiki/Weekly_Status</span></a></p><br><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-siz=
e: 11pt; font-family: Arial; background-color: transparent; font-variant-li=
gatures: normal; font-variant-east-asian: normal; font-variant-position: no=
rmal; vertical-align: baseline; white-space: pre-wrap;">[If anyone has sugg=
estions for other information you=E2=80=99d like to see on this weekly stat=
us update, let us know!]</span></p></pre><div></div></body></html>

--=-vfnLijxBzEbn9a9fb/PC--
