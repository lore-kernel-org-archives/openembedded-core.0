Received: from mail-ie0-f170.google.com ([209.85.223.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <erik.boto@pelagicore.com>) id 1TlhJO-0003IO-Fo
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 15:41:33 +0100
Received: by mail-ie0-f170.google.com with SMTP id k10so4660334iea.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 06:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=AoMeYZFA4z0N4Ao0glp2aKqtUzLdJG+Nu9dSEtk4WTk=;
	b=iZ9BIfe3zZaRktRwnzOLoUCQmxZdy3WhCm60VLBR8Lz52GnJE32cOxqckb2l1+6xsM
	W/gEnm5c/4qiutanBEM8T1kGvRUwoAmuoos1jLQ3JcOcRcVNZ5MQreV42UCRgSF4uwrW
	uoRieDwSP3O6oAElikAgvu8yQu/Yw2fKXzaky3fOYexW4X3tTyZa/EFAAV+0gDBv6jah
	isSPyhnpoUSxDbcIypfNHUVIQkY7L3JuYdfMqXwzAvKfHR6lt5dEJ/CbT3g4U7w1myZB
	wcf9lDzEG0HNep6ZkCPTMTL5tiOfcfypnPnXr+eyqSXy9RKA2gAlHxXsWWfm5OwGYmEI
	TNeg==
MIME-Version: 1.0
Received: by 10.50.154.227 with SMTP id vr3mr10674725igb.43.1356013601310;
	Thu, 20 Dec 2012 06:26:41 -0800 (PST)
Received: by 10.50.20.39 with HTTP; Thu, 20 Dec 2012 06:26:41 -0800 (PST)
Date: Thu, 20 Dec 2012 15:26:41 +0100
Message-ID: <CA+AhUGw+4ysoS5PGBp6J_DJcHxLeO6BbB_iK9k8z2arv=81G+g@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQnPE9lUYRku0mehPUHufJYygWf3hjKU6ivV12ub6oeZLYgxTGRzmRRDZs202VCFToXkQvG2
Subject: meta-qt5 - problems with pkgconfig-0.25
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 14:41:35 -0000
Content-Type: multipart/alternative; boundary=14dae934085304461404d149856c

--14dae934085304461404d149856c
Content-Type: text/plain; charset=ISO-8859-1

Hi,

(This message was previously posted to openembedded-devel, but I got
feedback that it might belong here)

When I build qtbase using https://github.com/meta-qt5/meta-qt5 I get cross
compiler badness warnings, it uses some includes from my host machine
instead of from sysroot. I have seen this before when cross compiling qt5
manually, and then the fix was to upgrade my host pkgconfig from 0.22 to
0.26 (I didn't really try the versions in between, just built a more recent
version).

I did a quick hack by building pkgconfig 0.26 in yocto by simply removing
the patches and using upstream vanilla 0.26 and then qtbase builds properly
without using host includes.

But it feels kind of strange that a bug like this hasn't affected any other
packages? Has anyone else seen something like this and can shed more light
on what's happening?

Best Regards,
Erik

--14dae934085304461404d149856c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span style=3D"font-family:arial,sans-serif;font-size:13px">Hi,=A0</span><d=
iv style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div sty=
le=3D"font-family:arial,sans-serif;font-size:13px">(This message was previo=
usly posted to openembedded-devel, but I got feedback that it might belong =
here)</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">When I build qtbase us=
ing=A0<a href=3D"https://github.com/meta-qt5/meta-qt5" target=3D"_blank">ht=
tps://github.com/meta-qt5/meta-qt5</a>=A0I get cross compiler badness warni=
ngs, it uses some includes from my host machine instead of from sysroot. I =
have seen this before when cross compiling qt5 manually, and then the fix w=
as to upgrade my host pkgconfig from 0.22 to 0.26 (I didn&#39;t really try =
the versions in between, just built a more recent version).=A0</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">I did a quick hack by =
building pkgconfig 0.26 in yocto by simply removing the patches and using u=
pstream vanilla 0.26 and then qtbase builds properly without using host inc=
ludes.=A0</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">But it feels kind of s=
trange that a bug like this hasn&#39;t affected any other packages? Has any=
one else seen something like this and can shed more light on what&#39;s hap=
pening?</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">Best Regards,</div><di=
v style=3D"font-family:arial,sans-serif;font-size:13px">Erik</div>

--14dae934085304461404d149856c--
