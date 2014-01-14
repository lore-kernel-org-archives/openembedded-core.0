Return-Path: <johan.wad@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9699F6A566
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 17:24:03 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k4so5364014qaq.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=YBk49bCO71Lu+KCokCTt4i/BEcV+4m5pLSmLfPEoYzc=;
	b=ITNx3LkFvX/lu1TNavzIXUXSrTXhvEpQkzXdCAZ7R5znonxHOQN6xbHuxTnACh6/2G
	qcv1LQ7GvSc04K81+36+HE8ehb9ulgZZfknxk7JLgLfMYHVGUCzWCY2PGhRQgsvhb+cZ
	g8xwGEqjnk9lkJdcIv5SZXasVx1uL8We7RXJt6q51wJxF5wuHjkADVCjHJaXHJD3+yRw
	EEygTVMro39IBf42bwd21YP6QuPEDPPVfyNvxIHMFyc6ycJMm29wREV7ZgKccutTGF5m
	0gij5xDqEeWfY0ynHyt5kqxek9TQCFKLVAPVJ69Fp1NCLPxkq8kkdUvmlly0PUQe5Mon
	REnA==
MIME-Version: 1.0
X-Received: by 10.229.184.69 with SMTP id cj5mr5024006qcb.8.1389720244018;
	Tue, 14 Jan 2014 09:24:04 -0800 (PST)
Received: by 10.229.241.2 with HTTP; Tue, 14 Jan 2014 09:24:03 -0800 (PST)
Date: Tue, 14 Jan 2014 18:24:03 +0100
Message-ID: <CAHQALceZv29NspjAzN5TEcOV8kiJ9YNyTD8acph-sJTnyfOyVg@mail.gmail.com>
From: johan wadefalk <johan.wad@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: bitbake error
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
X-List-Received-Date: Tue, 14 Jan 2014 17:24:03 -0000
Content-Type: multipart/alternative; boundary=001a11331fb47b62f204eff175cb

--001a11331fb47b62f204eff175cb
Content-Type: text/plain; charset=ISO-8859-1

Hi

My target HW is a Wandboard-quad and I have followed this tutorial (
http://wiki.wandboard.org/index.php/Getting_started_with_Yocto_on_Wandboard
).


My host system is gentoo which isn't a validated system for yocto but if
someone can help me anyway I would be very happy.
I have downgraded make from 3.82 to 3.81 because I couldn't find a patch
for 3.82.

When I try to bitbake the 1.5 DORA branch it fails on eglibc(shlib.lds:150).


Here is the log: http://tny.cz/766db2d2


I work as a software developer but I have very little Linux experience.

Regards

Johan Wadefalk

--001a11331fb47b62f204eff175cb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">Hi</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><br st=
yle=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fam=
ily:arial,sans-serif;font-size:13px">My target HW is a Wandboard-quad and I=
 have followed this tutorial (</span><a href=3D"http://wiki.wandboard.org/i=
ndex.php/Getting_started_with_Yocto_on_Wandboard" target=3D"_blank" style=
=3D"font-family:arial,sans-serif;font-size:13px">http://wiki.wandboard.org/=
index.php/Getting_started_with_Yocto_on_Wandboard</a><span style=3D"font-fa=
mily:arial,sans-serif;font-size:13px">).</span><br style=3D"font-family:ari=
al,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">=A0</span><br s=
tyle=3D"font-family:arial,sans-serif;font-size:13px"><br style=3D"font-fami=
ly:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-s=
erif;font-size:13px">My host system is gentoo which isn&#39;t a validated s=
ystem for yocto but if someone can help me anyway I would be very happy.</s=
pan><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">I have downgrad=
ed make from 3.82 to 3.81 because I couldn&#39;t find a patch for 3.82.</sp=
an><br style=3D"font-family:arial,sans-serif;font-size:13px"><br style=3D"f=
ont-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">When I try to b=
itbake the 1.5 DORA branch it fails=A0on eglibc(shlib.lds:150).</span><br s=
tyle=3D"font-family:arial,sans-serif;font-size:13px"><br style=3D"font-fami=
ly:arial,sans-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">Here is the log:=A0</span><a hre=
f=3D"http://tny.cz/766db2d2" target=3D"_blank" style=3D"font-family:arial,s=
ans-serif;font-size:13px">http://tny.cz/766db2d2</a><br style=3D"font-famil=
y:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">=A0</span><br s=
tyle=3D"font-family:arial,sans-serif;font-size:13px"><br style=3D"font-fami=
ly:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-s=
erif;font-size:13px">I work as a software developer but I have very little =
Linux experience.=A0</span><br style=3D"font-family:arial,sans-serif;font-s=
ize:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">Regards</span><div><font face=3D=
"arial, sans-serif"><br></font><div class=3D"" style=3D"font-family:arial,s=
ans-serif;font-size:13px">
<div id=3D":3fb" class=3D"" tabindex=3D"0">Johan Wadefalk<img class=3D"" sr=
c=3D"https://mail.google.com/mail/u/0/images/cleardot.gif"></div></div><br>=
</div></div>

--001a11331fb47b62f204eff175cb--
