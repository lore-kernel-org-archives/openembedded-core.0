Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id B588B7CF1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 14:49:13 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id a3so10969678wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 07:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version;
	bh=DucdUYewqmAoAnE3xm3mYqaWMEtSajQhwLdxdhRbsII=;
	b=DyLoWmQrzGJ2gj7XMyEXeTJSOXbLRkOHAPs8Ii294rKrymY/5P/9qyOYhxp7BX/Dnl
	Z1vP5mqymFJf+LWN17zkbsF65vFD0CBRDd7USQEyzl+LUnBUGTGrPbKt5vMHrOQ7DcGo
	45uz/SJ3zou9ILpmI8xifNJqkhVJ96yAfRJuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version;
	bh=DucdUYewqmAoAnE3xm3mYqaWMEtSajQhwLdxdhRbsII=;
	b=cJxcqywoNVY4PepI32QR4cJai6njlpwX8L4iYazQbEfnLqVEy/dOGd8m0BbYJR/lob
	8XW+NdRvvCe2dhj3WiJituk1IyhCIAwfUrty8tWDX6fOwlnEtBrAdllfLm4QxjZUS8nI
	6XdlTAFz816G3h6sPRGZtzvcDeHIr1UEyKiRkmSEKq53MUNjT6iBIw0Opoow2Kxp3MQ4
	ZKC1ijGCQnGkk7DLt5dKnjBzRYXw/itaXfYS2RzrJywNDzzqRw8kq84JqPepkoxZqLw7
	Ubyhx1fiGERSz86WlkVBA3FmaGBVh845t0jAkCNeuQO75hkgF6lQrkWd8t8H/SkkoyJ0
	0ICg==
X-Gm-Message-State: APjAAAUHzz5RreQ4aBNgjW7GIb1L+nTlemcMzT4DSWgoM8xEFPpi6+1k
	h5guERgrI+Vwg56GTQnfcB1Nhg==
X-Google-Smtp-Source: APXvYqxCyJw4x58hngcavDOOIJq1hDi2eyuvno4vUCZIdvPMOzMGqNBgsSvlNazvuRuMXmiixNDOdA==
X-Received: by 2002:a5d:68c4:: with SMTP id p4mr8901022wrw.37.1556030953593;
	Tue, 23 Apr 2019 07:49:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id b9sm22207608wmc.9.2019.04.23.07.49.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Apr 2019 07:49:12 -0700 (PDT)
Message-ID: <00aab4a51ad7bff175a36f23664b1811fe2b0503.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 15:49:10 +0100
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Yocto Project Status WW17'19
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
X-List-Received-Date: Tue, 23 Apr 2019 14:49:14 -0000
Content-Type: multipart/alternative; boundary="=-F9qkLbiJ/LCCElzqYkRq"

--=-F9qkLbiJ/LCCElzqYkRq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.7 M4 (2.7 rc2 is in QA)
Next Deadline: YP 2.7 Release Target April 26, 2019

SWAT Team Rotation:
SWAT lead is currently: ArminSWAT team rotation: Armin -> Anuj on Apr.
26, 2019SWAT team rotation: Armin -> Paul on May. 3, 2019
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
Next Team Meetings:
Bug Triage meeting Thursday April 25th at 7:30am PDT (
https://zoom.us/j/454367603)YP 2.8 Planning meeting Tuesday May 7th at
8am PDT (https://zoom.us/j/990892712) 
Key Status/Updates:
Stephen is going to be unavailable for several weeks, please refer any
queries to RichardYP 2.6.2 was released!YP 2.5.3 is likely to be
released imminentlyYP 2.7 rc2 (warrior) is currently going through
QA.The final two members of the new YP TSC were elected, Denys and
Armin. The TSC will therefore now start to discuss how its going to
establish itself and operate.Huge thanks to Joshua Watt for diving in
and helping file some ptest bugs and helping sort some missing tweaks
with resulttool, it was just appreciatedPatches are continuing to flow
into master, slightly impeded by holidays/vacation in some parts of the
world.WDD, our bug tracking metric is sharply rising as there are few
people helping with bugs.The 2.8 planning discussions are starting and
there is a google doc summarising the discussions so far: 
https://docs.google.com/document/d/1CNEKA4d0eT6-e0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/If
people are planning to work on specific things in 2.8 please let us
know so we can incorporate this into our plans. If you’re interested in
working on anything in the document, please also let us know or talk
with us in one of the planning meetings.

Planned Releases for YP 2.7:
YP 2.7 M4 Cutoff was Apr. 1, 2019YP 2.7 M4 Release Target is Apr. 26,
2019
Planned upcoming dot releases:
YP 2.5.3 (Sumo) is due for release.
Tracking Metrics:
WDD 2598 (last week 2523) (
https://wiki.yoctoproject.org/charts/combo.html)Poky Patch Metrics
 Total patches found: 1553 (last week 1553)Patches in the Pending
State: 654 (42%) [last week 654 (42%)]
Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features

The Status reports are now stored on the wiki at: 
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you’d like to see on
this weekly status update, let us know!]

--=-F9qkLbiJ/LCCElzqYkRq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div><div><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt;" id=3D"docs-internal-guid-830dfce1-7fff-925e-1bd8-059df03a316=
0"><span style=3D"font-size: 11pt; font-family: Arial; background-color: tr=
ansparent; font-variant-ligatures: normal; font-variant-east-asian: normal;=
 font-variant-position: normal; vertical-align: baseline;">Current Dev Posi=
tion: YP 2.7 M4 (2.7 rc2 is in QA)</span></p><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11p=
t; font-family: Arial; background-color: transparent; font-variant-ligature=
s: normal; font-variant-east-asian: normal; font-variant-position: normal; =
vertical-align: baseline;">Next Deadline: YP 2.7 Release Target April 26, 2=
019</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline;">=
SWAT Team Rotation:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt=
;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-fa=
mily: Arial; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">SWAT lead is currently: Armin</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; =
background-color: transparent; font-variant-ligatures: normal; font-variant=
-east-asian: normal; font-variant-position: normal; vertical-align: baselin=
e; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: tr=
ansparent; font-variant-ligatures: normal; font-variant-east-asian: normal;=
 font-variant-position: normal; vertical-align: baseline; white-space: pre-=
wrap;">SWAT team rotation: Armin -&gt; Anuj on Apr. 26, 2019</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-fami=
ly: Arial; background-color: transparent; font-variant-ligatures: normal; f=
ont-variant-east-asian: normal; font-variant-position: normal; vertical-ali=
gn: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; vertical-align: baseline; white-=
space: pre-wrap;">SWAT team rotation: Armin -&gt; Paul on May. 3, 2019</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt;=
 font-family: Consolas; background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoct=
oproject.org/wiki/Yocto_Build_Failure_Swat_Team" style=3D"text-decoration:n=
one;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204); background-c=
olor: transparent; font-variant-ligatures: normal; font-variant-east-asian:=
 normal; font-variant-position: normal; text-decoration: underline; text-de=
coration-skip: none; vertical-align: baseline; white-space: pre-wrap;">http=
s://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a></p>=
</li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; backgrou=
nd-color: transparent; font-variant-ligatures: normal; font-variant-east-as=
ian: normal; font-variant-position: normal; vertical-align: baseline;">Next=
 Team Meetings:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><=
li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family=
: Arial; background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; vertical-align=
: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-=
color: transparent; font-variant-ligatures: normal; font-variant-east-asian=
: normal; font-variant-position: normal; vertical-align: baseline; white-sp=
ace: pre-wrap;">Bug Triage meeting Thursday April 25th at 7:30am PDT (</spa=
n><a href=3D"https://zoom.us/j/454367603" style=3D"text-decoration:none;"><=
span style=3D"font-size: 10pt; color: rgb(17, 85, 204); background-color: t=
ransparent; font-variant-ligatures: normal; font-variant-east-asian: normal=
; font-variant-position: normal; text-decoration: underline; text-decoratio=
n-skip: none; vertical-align: baseline; white-space: pre-wrap;">https://zoo=
m.us/j/454367603</span></a><span style=3D"font-size: 11pt; background-color=
: transparent; font-variant-ligatures: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; vertical-align: baseline; white-space: =
pre-wrap;">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc;=
 font-size: 11pt; font-family: Arial; background-color: transparent; font-v=
ariant-ligatures: normal; font-variant-east-asian: normal; font-variant-pos=
ition: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D=
"font-size: 11pt; background-color: transparent; font-variant-ligatures: no=
rmal; font-variant-east-asian: normal; font-variant-position: normal; verti=
cal-align: baseline; white-space: pre-wrap;">YP 2.8 Planning meeting Tuesda=
y May 7th at 8am PDT (</span><a href=3D"https://zoom.us/j/990892712" style=
=3D"text-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 8=
5, 204); background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; text-decoratio=
n: underline; text-decoration-skip: none; vertical-align: baseline; white-s=
pace: pre-wrap;">https://zoom.us/j/990892712)</span></a><span style=3D"font=
-size: 11pt; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre-wrap;"> </span></p></li></ul><br><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span st=
yle=3D"font-size: 11pt; font-family: Arial; background-color: transparent; =
font-variant-ligatures: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; vertical-align: baseline;">Key Status/Updates:</span><=
/p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D=
"list-style-type: disc; font-size: 11pt; font-family: Arial; background-col=
or: transparent; font-variant-ligatures: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; vertical-align: baseline; white-space=
: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt;"><span style=3D"font-size: 11pt; background-color: transparent; fon=
t-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-=
position: normal; vertical-align: baseline; white-space: pre-wrap;">Stephen=
 is going to be unavailable for several weeks, please refer any queries to =
Richard</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font=
-size: 11pt; font-family: Arial; background-color: transparent; font-varian=
t-ligatures: normal; font-variant-east-asian: normal; font-variant-position=
: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 11pt; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">YP 2.6.2 was released!</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-fa=
mily: Arial; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">YP 2.5.3 is likely to be released imminently</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-=
family: Arial; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backg=
round-color: transparent; font-variant-ligatures: normal; font-variant-east=
-asian: normal; font-variant-position: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;">YP 2.7 rc2 (warrior) is currently going through QA.</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11=
pt; font-family: Arial; background-color: transparent; font-variant-ligatur=
es: normal; font-variant-east-asian: normal; font-variant-position: normal;=
 vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11=
pt; background-color: transparent; font-variant-ligatures: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; vertical-align: bas=
eline; white-space: pre-wrap;">The final two members of the new YP TSC were=
 elected, Denys and Armin. The TSC will therefore now start to discuss how =
its going to establish itself and operate.</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgro=
und-color: transparent; font-weight: 700; font-variant-ligatures: normal; f=
ont-variant-east-asian: normal; font-variant-position: normal; vertical-ali=
gn: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgroun=
d-color: transparent; font-weight: 400; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; vertical-align=
: baseline; white-space: pre-wrap;">Huge thanks to Joshua Watt for diving i=
n and helping file some ptest bugs and helping sort some missing tweaks wit=
h resulttool, it was just appreciated</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; background-=
color: transparent; font-variant-ligatures: normal; font-variant-east-asian=
: normal; font-variant-position: normal; vertical-align: baseline; white-sp=
ace: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent; =
font-variant-ligatures: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; vertical-align: baseline; white-space: pre-wrap;">Patc=
hes are continuing to flow into master, slightly impeded by holidays/vacati=
on in some parts of the world.</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type: disc; font-size: 11pt; font-family: Arial; background-color: t=
ransparent; font-variant-ligatures: normal; font-variant-east-asian: normal=
; font-variant-position: normal; vertical-align: baseline; white-space: pre=
;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t;"><span style=3D"font-size: 11pt; background-color: transparent; font-var=
iant-ligatures: normal; font-variant-east-asian: normal; font-variant-posit=
ion: normal; vertical-align: baseline; white-space: pre-wrap;">WDD, our bug=
 tracking metric is sharply rising as there are few people helping with bug=
s.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size=
: 11pt; font-family: Arial; background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size=
: 11pt; background-color: transparent; font-variant-ligatures: normal; font=
-variant-east-asian: normal; font-variant-position: normal; vertical-align:=
 baseline; white-space: pre-wrap;">The 2.8 planning discussions are startin=
g and there is a google doc summarising the discussions so far: </span><a h=
ref=3D"https://docs.google.com/document/d/1CNEKA4d0eT6-e0hnS2pwi7xdZ5_t6smp=
ZO2HbaJGXbU/" style=3D"text-decoration:none;"><span style=3D"font-size: 11p=
t; color: rgb(17, 85, 204); background-color: transparent; font-variant-lig=
atures: normal; font-variant-east-asian: normal; font-variant-position: nor=
mal; text-decoration: underline; text-decoration-skip: none; vertical-align=
: baseline; white-space: pre-wrap;">https://docs.google.com/document/d/1CNE=
KA4d0eT6-e0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/</span></a></p></li></ul><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;margin-lef=
t: 36pt;"><span style=3D"font-size: 11pt; font-family: Arial; background-co=
lor: transparent; font-variant-ligatures: normal; font-variant-east-asian: =
normal; font-variant-position: normal; vertical-align: baseline;">If people=
 are planning to work on specific things in 2.8 please let us know so we ca=
n incorporate this into our plans. If you=E2=80=99re interested in working =
on anything in the document, please also let us know or talk with us in one=
 of the planning meetings.</span></p><br><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; f=
ont-family: Arial; background-color: transparent; font-variant-ligatures: n=
ormal; font-variant-east-asian: normal; font-variant-position: normal; vert=
ical-align: baseline;">Planned Releases for YP 2.7:</span></p><ul style=3D"=
margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type=
: disc; font-size: 11pt; font-family: Arial; background-color: transparent;=
 font-variant-ligatures: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; vertical-align: baseline; white-space: pre;"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre-wrap;">YP 2.7 M4 Cutoff was =
Apr. 1, 2019</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc;=
 font-size: 11pt; font-family: Arial; background-color: transparent; font-v=
ariant-ligatures: normal; font-variant-east-asian: normal; font-variant-pos=
ition: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D=
"font-size: 11pt; background-color: transparent; font-variant-ligatures: no=
rmal; font-variant-east-asian: normal; font-variant-position: normal; verti=
cal-align: baseline; white-space: pre-wrap;">YP 2.7 M4 Release Target is Ap=
r. 26, 2019</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-f=
amily: Arial; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline;">Planned upcoming dot releases:</span></p><ul style=3D"mar=
gin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: d=
isc; font-size: 11pt; font-family: Arial; background-color: transparent; fo=
nt-variant-ligatures: normal; font-variant-east-asian: normal; font-variant=
-position: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline; white-space: pre-wrap;">YP 2.5.3 (Sumo) is due for=
 release.</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-fam=
ily: Arial; background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; vertical-al=
ign: baseline;">Tracking Metrics:</span></p><ul style=3D"margin-top:0pt;mar=
gin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size:=
 11pt; font-family: Arial; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size:=
 11pt; background-color: transparent; font-variant-ligatures: normal; font-=
variant-east-asian: normal; font-variant-position: normal; vertical-align: =
baseline; white-space: pre-wrap;">WDD 2598 (last week 2523)</span><span sty=
le=3D"font-size: 11pt; font-family: Consolas; background-color: transparent=
; font-variant-ligatures: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; vertical-align: baseline; white-space: pre-wrap;"> (=
</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D=
"text-decoration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, =
204); background-color: transparent; font-variant-ligatures: normal; font-v=
ariant-east-asian: normal; font-variant-position: normal; text-decoration: =
underline; text-decoration-skip: none; vertical-align: baseline; white-spac=
e: pre-wrap;">https://wiki.yoctoproject.org/charts/combo.html</span></a><sp=
an style=3D"font-size: 11pt; font-family: Consolas; background-color: trans=
parent; font-variant-ligatures: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; vertical-align: baseline; white-space: pre-wra=
p;">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-s=
ize: 11pt; font-family: Consolas; background-color: transparent; font-varia=
nt-ligatures: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fon=
t-size: 11pt; font-family: Arial; background-color: transparent; font-varia=
nt-ligatures: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; vertical-align: baseline; white-space: pre-wrap;">Poky Patch Met=
rics &nbsp;</span></p></li><ul style=3D"margin-top:0pt;margin-bottom:0pt;">=
<li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-fam=
ily: Arial; background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; vertical-al=
ign: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgrou=
nd-color: transparent; font-variant-ligatures: normal; font-variant-east-as=
ian: normal; font-variant-position: normal; vertical-align: baseline; white=
-space: pre-wrap;">Total patches found: 1553 (last week 1553)</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type: circle; font-size: 11pt; font-f=
amily: Consolas; background-color: transparent; font-variant-ligatures: nor=
mal; font-variant-east-asian: normal; font-variant-position: normal; vertic=
al-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; fon=
t-family: Arial; background-color: transparent; font-variant-ligatures: nor=
mal; font-variant-east-asian: normal; font-variant-position: normal; vertic=
al-align: baseline; white-space: pre-wrap;">Patches in the Pending State: 6=
54 (42%) [last week 654 (42%)]</span></p></li></ul></ul><br><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D=
"font-size: 11pt; font-family: Arial; background-color: transparent; font-v=
ariant-ligatures: normal; font-variant-east-asian: normal; font-variant-pos=
ition: normal; vertical-align: baseline;">Key Status Links for YP:</span></=
p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status"=
 style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; font-famil=
y: Consolas; color: rgb(17, 85, 204); background-color: transparent; font-v=
ariant-ligatures: normal; font-variant-east-asian: normal; font-variant-pos=
ition: normal; text-decoration: underline; text-decoration-skip: none; vert=
ical-align: baseline;">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.=
7_Status</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto=
_2.7_Schedule" style=3D"text-decoration:none;"><span style=3D"font-size: 11=
pt; font-family: Consolas; color: rgb(17, 85, 204); background-color: trans=
parent; font-variant-ligatures: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; text-decoration: underline; text-decoration-sk=
ip: none; vertical-align: baseline;">https://wiki.yoctoproject.org/wiki/Yoc=
to_2.7_Schedule</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wik=
i/Yocto_2.7_Features" style=3D"text-decoration:none;"><span style=3D"font-s=
ize: 11pt; font-family: Consolas; color: rgb(17, 85, 204); background-color=
: transparent; font-variant-ligatures: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; text-decoration: underline; text-decora=
tion-skip: none; vertical-align: baseline;">https://wiki.yoctoproject.org/w=
iki/Yocto_2.7_Features</span></a></p><br><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; f=
ont-family: Arial; background-color: transparent; font-variant-ligatures: n=
ormal; font-variant-east-asian: normal; font-variant-position: normal; vert=
ical-align: baseline;">The Status reports are now stored on the wiki at: </=
span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"=
text-decoration:none;"><span style=3D"font-size: 11pt; font-family: Arial; =
color: rgb(17, 85, 204); background-color: transparent; font-variant-ligatu=
res: normal; font-variant-east-asian: normal; font-variant-position: normal=
; text-decoration: underline; text-decoration-skip: none; vertical-align: b=
aseline;">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><b=
r><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
;"><span style=3D"font-size: 11pt; font-family: Arial; background-color: tr=
ansparent; font-variant-ligatures: normal; font-variant-east-asian: normal;=
 font-variant-position: normal; vertical-align: baseline;">[If anyone has s=
uggestions for other information you=E2=80=99d like to see on this weekly s=
tatus update, let us know!]</span></p></div><div></div></div></body></html>

--=-F9qkLbiJ/LCCElzqYkRq--
