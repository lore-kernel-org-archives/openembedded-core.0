Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF657DAEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 14:41:27 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id h18so4146586wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version;
	bh=RuxaipJbuoENCNSXyiSJaRUxNrVImOFzXCO/dztvt4E=;
	b=NWEM4OIQRBrxmNxYrJ1tSy844bylftPkK60svEoBwFRUkRypfGikXDCfDLKjcP5XO2
	vlaYSs7Rw0TMjlobJUIkSm4goGGNRJaFe615Djk1B1jbeqrtYVPsnNe5OouD9HYtNLGA
	amP1hGNi7q4GehCje67LRWoVO91OzsOhvJf/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version;
	bh=RuxaipJbuoENCNSXyiSJaRUxNrVImOFzXCO/dztvt4E=;
	b=jvTxhn35m1hKBw+xxpU9XXEXBHTodDWU5x5nk1Dp5A62kyHFd7sfb2/YvqcT1KJ7K5
	1txFG5HjIli1NtadxEZqR2xD/VjhzQxSfdrJlyyfxXaHSwp/bwdJrho/h3VtE3MYSFjX
	I4GM99mqwR3OEt0IfTydh+vaBvZfaH/MT2nsvEwnaMyxXnREA0SsLxHqYCNAXeOSPegI
	knmia0Xkrk0E+JKexxTG6GoQmjfbRZCEiqnCKd1NUMQj3Nb/3li3Yh8juxn4uOQZf/qx
	KNJDvU1X7hM/p4cCpvq8ltYfo6n6G3ZD9iY10e/JjItYmwd1a5Z1IowmZ1EEMgbsxSL5
	AMiw==
X-Gm-Message-State: APjAAAXLaHJxaOTTMfIcvxFbPPB3MeGjaDHmYKiBvYXjBu87Juw0DX+b
	sjyTBQtqjNlrs1tdr3672jW7RX+zzMQ=
X-Google-Smtp-Source: APXvYqyl6qUVnciJSclOWSKGQJLN0u89mOSGmZMqj52bUC9+dfMXNBMn4uh5X8m28rwffyf3ZpKXXQ==
X-Received: by 2002:a05:600c:2206:: with SMTP id
	z6mr3618040wml.80.1556635287747; 
	Tue, 30 Apr 2019 07:41:27 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s16sm10921934wrg.71.2019.04.30.07.41.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 07:41:26 -0700 (PDT)
Message-ID: <a33ebf77bd6cab3a2cdf8f032aea5a9099977dc2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 15:41:25 +0100
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Yocto Project Status WW18'19
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
X-List-Received-Date: Tue, 30 Apr 2019 14:41:27 -0000
Content-Type: multipart/alternative; boundary="=-XfK5PC/sJyP9NXRT6x5Q"

--=-XfK5PC/sJyP9NXRT6x5Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.7 M4 (2.7 rc2 release being discussed)
Next Deadline: YP 2.7 Release Target April 26, 2019

SWAT Team Rotation:
SWAT lead is currently: PaulSWAT team rotation: Paul -> Anuj on May. 3,
2019SWAT team rotation: Anuj -> Ross on May. 10, 2019
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
Next Team Meetings:
Bug Triage meeting Thursday May 2nd at 7:30am PDT (
https://zoom.us/j/454367603)YP 2.8 Planning meeting Tuesday May 7th at
8am PDT (https://zoom.us/j/990892712) 
Key Status/Updates:
Stephen is going to be unavailable for several weeks, please refer any
queries to RichardYP 2.5.3 was released.YP 2.7 is out of QA but pending
answers to some questions on the QA report and the final pieces of
release process.Huge kudos this week go to Armin for work on test
automation of some of the manual testsWe’ve merged ltp test automation
which is now being run automatically on the autobuilder on a-full
builds.Master continues to take patches, somewhat slowed by host
specific build issues with vte-nativeWDD, our bug tracking metric is
high and there are few people helping with bugs.The 2.8 planning
discussions are starting and there is a google doc summarising the
discussions so far: 
https://docs.google.com/document/d/1CNEKA4d0eT6-e0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/If
people are planning to work on specific things in 2.8 please let us
know so we can incorporate this into our plans. If you’re interested in
working on anything in the document, please also let us know or talk
with us in one of the planning meetings.
We have a new “newcomer” bug category which are bugs suited to someone
new to the project. These can be seen here: 
https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs
Planned Releases for YP 2.7:
YP 2.7 M4 Cutoff was Apr. 1, 2019YP 2.7 M4 Release Target is Apr. 26,
2019
Planned upcoming dot releases:
YP 2.6.3 (Thud) is in planning
Tracking Metrics:
WDD 2593 (last week 2598) (
https://wiki.yoctoproject.org/charts/combo.html)Poky Patch Metrics
 Total patches found: 1565 (last week 1553)Patches in the Pending
State: 655 (42%) [last week 654 (42%)]
Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features

The Status reports are now stored on the wiki at: 
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you’d like to see on
this weekly status update, let us know!]


--=-XfK5PC/sJyP9NXRT6x5Q
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div><div><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt;" id=3D"docs-internal-guid-706d3ec3-7fff-1921-8600-b7ea3a168d1=
b"><span style=3D"font-size: 11pt; font-family: Arial; background-color: tr=
ansparent; font-variant-ligatures: normal; font-variant-east-asian: normal;=
 font-variant-position: normal; vertical-align: baseline; white-space: pre-=
wrap;">Current Dev Position: YP 2.7 M4 (2.7 rc2 release being discussed)</s=
pan></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; background-col=
or: transparent; font-variant-ligatures: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; vertical-align: baseline; white-space=
: pre-wrap;">Next Deadline: YP 2.7 Release Target April 26, 2019</span></p>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"=
 id=3D"docs-internal-guid-830dfce1-7fff-925e-1bd8-059df03a3160"><br></p><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><s=
pan style=3D"font-size: 11pt; font-family: Arial; background-color: transpa=
rent; font-variant-ligatures: normal; font-variant-east-asian: normal; font=
-variant-position: normal; vertical-align: baseline; white-space: pre-wrap;=
">SWAT Team Rotation:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0=
pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-=
family: Arial; background-color: transparent; font-variant-ligatures: norma=
l; font-variant-east-asian: normal; font-variant-position: normal; vertical=
-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backg=
round-color: transparent; font-variant-ligatures: normal; font-variant-east=
-asian: normal; font-variant-position: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;">SWAT lead is currently: Paul</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Aria=
l; background-color: transparent; font-variant-ligatures: normal; font-vari=
ant-east-asian: normal; font-variant-position: normal; vertical-align: base=
line; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color:=
 transparent; font-variant-ligatures: normal; font-variant-east-asian: norm=
al; font-variant-position: normal; vertical-align: baseline; white-space: p=
re-wrap;">SWAT team rotation: Paul -&gt; Anuj on May. 3, 2019</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-fam=
ily: Arial; background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; vertical-al=
ign: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgrou=
nd-color: transparent; font-variant-ligatures: normal; font-variant-east-as=
ian: normal; font-variant-position: normal; vertical-align: baseline; white=
-space: pre-wrap;">SWAT team rotation: Anuj -&gt; Ross on May. 10, 2019</sp=
an></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt=
; font-family: Consolas; background-color: transparent; font-variant-ligatu=
res: normal; font-variant-east-asian: normal; font-variant-position: normal=
; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoc=
toproject.org/wiki/Yocto_Build_Failure_Swat_Team" style=3D"text-decoration:=
none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204); background-=
color: transparent; font-variant-ligatures: normal; font-variant-east-asian=
: normal; font-variant-position: normal; text-decoration: underline; text-d=
ecoration-skip: none; vertical-align: baseline; white-space: pre-wrap;">htt=
ps://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a></p=
></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; ba=
ckground-color: transparent; font-variant-ligatures: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; vertical-align: baseline;=
 white-space: pre-wrap;">Next Team Meetings:</span></p><ul style=3D"margin-=
top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc;=
 font-size: 11pt; font-family: Arial; background-color: transparent; font-v=
ariant-ligatures: normal; font-variant-east-asian: normal; font-variant-pos=
ition: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D=
"font-size: 11pt; background-color: transparent; font-variant-ligatures: no=
rmal; font-variant-east-asian: normal; font-variant-position: normal; verti=
cal-align: baseline; white-space: pre-wrap;">Bug Triage meeting Thursday Ma=
y 2nd at 7:30am PDT (</span><a href=3D"https://zoom.us/j/454367603" style=
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
an: normal; font-variant-position: normal; vertical-align: baseline; white-=
space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent=
; font-variant-ligatures: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; vertical-align: baseline; white-space: pre-wrap;">YP=
 2.8 Planning meeting Tuesday May 7th at 8am PDT (</span><a href=3D"https:/=
/zoom.us/j/990892712" style=3D"text-decoration:none;"><span style=3D"font-s=
ize: 11pt; color: rgb(17, 85, 204); background-color: transparent; font-var=
iant-ligatures: normal; font-variant-east-asian: normal; font-variant-posit=
ion: normal; text-decoration: underline; text-decoration-skip: none; vertic=
al-align: baseline; white-space: pre-wrap;">https://zoom.us/j/990892712)</s=
pan></a><span style=3D"font-size: 11pt; background-color: transparent; font=
-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-p=
osition: normal; vertical-align: baseline; white-space: pre-wrap;"> </span>=
</p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial;=
 background-color: transparent; font-variant-ligatures: normal; font-varian=
t-east-asian: normal; font-variant-position: normal; vertical-align: baseli=
ne; white-space: pre-wrap;">Key Status/Updates:</span></p><ul style=3D"marg=
in-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: di=
sc; font-size: 11pt; font-family: Arial; background-color: transparent; fon=
t-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-=
position: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">Stephen is going to be unav=
ailable for several weeks, please refer any queries to Richard</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-fa=
mily: Arial; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre-wrap;">YP 2.5.3 was released.</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgro=
und-color: transparent; font-variant-ligatures: normal; font-variant-east-a=
sian: normal; font-variant-position: normal; vertical-align: baseline; whit=
e-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transpare=
nt; font-variant-ligatures: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; vertical-align: baseline; white-space: pre-wrap;">=
YP 2.7 is out of QA but pending answers to some questions on the QA report =
and the final pieces of release process.</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; vertical-align: baseline; white-=
space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent=
; font-variant-ligatures: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; vertical-align: baseline; white-space: pre-wrap;">Hu=
ge kudos this week go to Armin for work on test automation of some of the m=
anual tests</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; =
font-size: 11pt; font-family: Arial; background-color: transparent; font-va=
riant-ligatures: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"=
font-size: 11pt; background-color: transparent; font-variant-ligatures: nor=
mal; font-variant-east-asian: normal; font-variant-position: normal; vertic=
al-align: baseline; white-space: pre-wrap;">We=E2=80=99ve merged ltp test a=
utomation which is now being run automatically on the autobuilder on a-full=
 builds.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; fon=
t-size: 11pt; font-family: Arial; background-color: transparent; font-varia=
nt-ligatures: normal; font-variant-east-asian: normal; font-variant-positio=
n: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fon=
t-size: 11pt; background-color: transparent; font-variant-ligatures: normal=
; font-variant-east-asian: normal; font-variant-position: normal; vertical-=
align: baseline; white-space: pre-wrap;">Master continues to take patches, =
somewhat slowed by host specific build issues with vte-native</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-fam=
ily: Arial; background-color: transparent; font-variant-ligatures: normal; =
font-variant-east-asian: normal; font-variant-position: normal; vertical-al=
ign: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; backgrou=
nd-color: transparent; font-variant-ligatures: normal; font-variant-east-as=
ian: normal; font-variant-position: normal; vertical-align: baseline; white=
-space: pre-wrap;">WDD, our bug tracking metric is high and there are few p=
eople helping with bugs.</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type: disc; font-size: 11pt; font-family: Arial; background-color: transpa=
rent; font-variant-ligatures: normal; font-variant-east-asian: normal; font=
-variant-position: normal; vertical-align: baseline; white-space: pre;"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><s=
pan style=3D"font-size: 11pt; background-color: transparent; font-variant-l=
igatures: normal; font-variant-east-asian: normal; font-variant-position: n=
ormal; vertical-align: baseline; white-space: pre-wrap;">The 2.8 planning d=
iscussions are starting and there is a google doc summarising the discussio=
ns so far: </span><a href=3D"https://docs.google.com/document/d/1CNEKA4d0eT=
6-e0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/" style=3D"text-decoration:none;"><span s=
tyle=3D"font-size: 11pt; color: rgb(17, 85, 204); background-color: transpa=
rent; font-variant-ligatures: normal; font-variant-east-asian: normal; font=
-variant-position: normal; text-decoration: underline; text-decoration-skip=
: none; vertical-align: baseline; white-space: pre-wrap;">https://docs.goog=
le.com/document/d/1CNEKA4d0eT6-e0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/</span></a><=
/p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt;margin-left: 36pt;"><span style=3D"font-size: 11pt; font-family=
: Arial; background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; vertical-align=
: baseline; white-space: pre-wrap;">If people are planning to work on speci=
fic things in 2.8 please let us know so we can incorporate this into our pl=
ans. If you=E2=80=99re interested in working on anything in the document, p=
lease also let us know or talk with us in one of the planning meetings.</sp=
an></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" styl=
e=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; background=
-color: transparent; font-variant-ligatures: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; vertical-align: baseline; white-s=
pace: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent;=
 font-variant-ligatures: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; vertical-align: baseline; white-space: pre-wrap;">We =
have a new =E2=80=9Cnewcomer=E2=80=9D bug category which are bugs suited to=
 someone new to the project. These can be seen here: </span><a href=3D"http=
s://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs" style=3D"text-deco=
ration:none;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204); back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; text-decoration: underline;=
 text-decoration-skip: none; vertical-align: baseline; white-space: pre-wra=
p;">https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs</span></a><=
/p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; =
background-color: transparent; font-variant-ligatures: normal; font-variant=
-east-asian: normal; font-variant-position: normal; vertical-align: baselin=
e; white-space: pre-wrap;">Planned Releases for YP 2.7:</span></p><ul style=
=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-=
type: disc; font-size: 11pt; font-family: Arial; background-color: transpar=
ent; font-variant-ligatures: normal; font-variant-east-asian: normal; font-=
variant-position: normal; vertical-align: baseline; white-space: pre;"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><sp=
an style=3D"font-size: 11pt; background-color: transparent; font-variant-li=
gatures: normal; font-variant-east-asian: normal; font-variant-position: no=
rmal; vertical-align: baseline; white-space: pre-wrap;">YP 2.7 M4 Cutoff wa=
s Apr. 1, 2019</span></p></li><li dir=3D"ltr" style=3D"list-style-type: dis=
c; font-size: 11pt; font-family: Arial; background-color: transparent; font=
-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-p=
osition: normal; vertical-align: baseline; white-space: pre;"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; background-color: transparent; font-variant-ligatures:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">YP 2.7 M4 Release Target is=
 Apr. 26, 2019</span></p></li></ul><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt=
; font-family: Arial; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline; white-space: pre-wrap;">Planned upcoming dot relea=
ses:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"l=
tr" style=3D"list-style-type: disc; font-size: 11pt; font-family: Arial; ba=
ckground-color: transparent; font-variant-ligatures: normal; font-variant-e=
ast-asian: normal; font-variant-position: normal; vertical-align: baseline;=
 white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: tran=
sparent; font-variant-ligatures: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; vertical-align: baseline; white-space: pre-wr=
ap;">YP 2.6.3 (Thud) is in planning</span></p></li></ul><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span sty=
le=3D"font-size: 11pt; font-family: Arial; background-color: transparent; f=
ont-variant-ligatures: normal; font-variant-east-asian: normal; font-varian=
t-position: normal; vertical-align: baseline; white-space: pre-wrap;">Track=
ing Metrics:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li =
dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-family: A=
rial; background-color: transparent; font-variant-ligatures: normal; font-v=
ariant-east-asian: normal; font-variant-position: normal; vertical-align: b=
aseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; background-col=
or: transparent; font-variant-ligatures: normal; font-variant-east-asian: n=
ormal; font-variant-position: normal; vertical-align: baseline; white-space=
: pre-wrap;">WDD 2593 (last week 2598)</span><span style=3D"font-size: 11pt=
; font-family: Consolas; background-color: transparent; font-variant-ligatu=
res: normal; font-variant-east-asian: normal; font-variant-position: normal=
; vertical-align: baseline; white-space: pre-wrap;"> (</span><a href=3D"htt=
ps://wiki.yoctoproject.org/charts/combo.html" style=3D"text-decoration:none=
;"><span style=3D"font-size: 11pt; color: rgb(17, 85, 204); background-colo=
r: transparent; font-variant-ligatures: normal; font-variant-east-asian: no=
rmal; font-variant-position: normal; text-decoration: underline; text-decor=
ation-skip: none; vertical-align: baseline; white-space: pre-wrap;">https:/=
/wiki.yoctoproject.org/charts/combo.html</span></a><span style=3D"font-size=
: 11pt; font-family: Consolas; background-color: transparent; font-variant-=
ligatures: normal; font-variant-east-asian: normal; font-variant-position: =
normal; vertical-align: baseline; white-space: pre-wrap;">)</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 11pt; font-famil=
y: Consolas; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-fa=
mily: Arial; background-color: transparent; font-variant-ligatures: normal;=
 font-variant-east-asian: normal; font-variant-position: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">Poky Patch Metrics &nbsp;</span></p=
></li><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=
=3D"list-style-type: circle; font-size: 11pt; font-family: Arial; backgroun=
d-color: transparent; font-variant-ligatures: normal; font-variant-east-asi=
an: normal; font-variant-position: normal; vertical-align: baseline; white-=
space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt;"><span style=3D"font-size: 11pt; background-color: transparent=
; font-variant-ligatures: normal; font-variant-east-asian: normal; font-var=
iant-position: normal; vertical-align: baseline; white-space: pre-wrap;">To=
tal patches found: 1565 (last week 1553)</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type: circle; font-size: 11pt; font-family: Consolas; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline; w=
hite-space: pre;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Arial; back=
ground-color: transparent; font-variant-ligatures: normal; font-variant-eas=
t-asian: normal; font-variant-position: normal; vertical-align: baseline; w=
hite-space: pre-wrap;">Patches in the Pending State: 655 (42%) [last week 6=
54 (42%)]</span></p></li></ul></ul><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt=
; font-family: Arial; background-color: transparent; font-variant-ligatures=
: normal; font-variant-east-asian: normal; font-variant-position: normal; v=
ertical-align: baseline; white-space: pre-wrap;">Key Status Links for YP:</=
span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_=
Status" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; fon=
t-family: Consolas; color: rgb(17, 85, 204); background-color: transparent;=
 font-variant-ligatures: normal; font-variant-east-asian: normal; font-vari=
ant-position: normal; text-decoration: underline; text-decoration-skip: non=
e; vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoproj=
ect.org/wiki/Yocto_Project_v2.7_Status</span></a></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://=
wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule" style=3D"text-decoration:non=
e;"><span style=3D"font-size: 11pt; font-family: Consolas; color: rgb(17, 8=
5, 204); background-color: transparent; font-variant-ligatures: normal; fon=
t-variant-east-asian: normal; font-variant-position: normal; text-decoratio=
n: underline; text-decoration-skip: none; vertical-align: baseline; white-s=
pace: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule</spa=
n></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features=
" style=3D"text-decoration:none;"><span style=3D"font-size: 11pt; font-fami=
ly: Consolas; color: rgb(17, 85, 204); background-color: transparent; font-=
variant-ligatures: normal; font-variant-east-asian: normal; font-variant-po=
sition: normal; text-decoration: underline; text-decoration-skip: none; ver=
tical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoproject.or=
g/wiki/Yocto_2.7_Features</span></a></p><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size:=
 11pt; font-family: Arial; background-color: transparent; font-variant-liga=
tures: normal; font-variant-east-asian: normal; font-variant-position: norm=
al; vertical-align: baseline; white-space: pre-wrap;">The Status reports ar=
e now stored on the wiki at: </span><a href=3D"https://wiki.yoctoproject.or=
g/wiki/Weekly_Status" style=3D"text-decoration:none;"><span style=3D"font-s=
ize: 11pt; font-family: Arial; color: rgb(17, 85, 204); background-color: t=
ransparent; font-variant-ligatures: normal; font-variant-east-asian: normal=
; font-variant-position: normal; text-decoration: underline; text-decoratio=
n-skip: none; vertical-align: baseline; white-space: pre-wrap;">https://wik=
i.yoctoproject.org/wiki/Weekly_Status</span></a></p><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 11pt; font-family: Arial; background-color: transparent; fon=
t-variant-ligatures: normal; font-variant-east-asian: normal; font-variant-=
position: normal; vertical-align: baseline; white-space: pre-wrap;">[If any=
one has suggestions for other information you=E2=80=99d like to see on this=
 weekly status update, let us know!]</span></p></div><div></div></div>
</body></html>

--=-XfK5PC/sJyP9NXRT6x5Q--
