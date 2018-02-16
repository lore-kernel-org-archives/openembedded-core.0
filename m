Return-Path: <andrei@gherzan.ro>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7109C719A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 11:43:15 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id t6so1707423ual.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 03:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=7JlzvzQa8qaiK5hR4e6MBClkErdxm9Ik7ggyFw13ydQ=;
	b=XbmA9JDHdp7B4aFh6KBsw7y1pniuoJUdOL5+usKz4xZB6ohecaaO1lKVriYYGVZHjC
	05qEYfW+dmL19/BDZbUh5EmiamKj/T7vXtR2AKN7Tin+XRJca4tlVhVB+WFSC10ovDST
	B9SfLygnRR86357RT5oxN7Bu2XHsw/xF985UtMVB9p4n3rcKOtk9B1N0dB/30tCWO1XD
	5a+MyPeT4QdeRs+qyZTdj8yjAcKHATdJMR4/9z7vw02wlPAYah5XUyXQG0aE4SP8rygi
	IH9cgMVUQyN/SJfm+qSSGY0FrWuOkiZejvDwXufhtw+qFOv9U1KP9LPffA2gRe7A2Yte
	e1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=7JlzvzQa8qaiK5hR4e6MBClkErdxm9Ik7ggyFw13ydQ=;
	b=D8GMUF6imQu/7q/9rtLshrjJRAC4QRJJNtvPtnMW2RH+ndsIGDvTdn33ctbdk7opXx
	9rygxb90W20PrMgbtFXuh4WznedEjprobyLMRczmbQNPn7VeO26KRFuAEZT+07IAiVOM
	T7MB4doX+C3AAVbEJxamX5KNDxMOGXx8VQvoo5f7Pywn6r2ABVvM/tn0jgdkDOMHy8+A
	ZzETU5LbAbU5gYGj9Q+sfOecD1ALoNzf57jS6bXnw8ghNdsw7Qr/C8NzSywCq9VX5H8n
	VmEaV3r20R/Z5Br7lQ1v0zFAR4ykkB/xbPVmjc6dM8ikdkE5NaJObdM3BdzJwAFGX32i
	Eqrg==
X-Gm-Message-State: APf1xPCnHN5ugtcwG/AzHz2nqGn/cokpSSXtIyQTevd8ODKU5TnibYog
	dvQrZONGJ+aMCVU5lso5CzuB1CFlq53M1vd/zN0ouiwdkFQ=
X-Google-Smtp-Source: AH8x224cGYBEomVquRGFGb9XiBDon9DQk2El7pifns3y3l6ZFbqRy1yvCmfNQpttulaZWGbxAz486Fa3StZFPG7dgpU=
X-Received: by 10.176.79.7 with SMTP id n7mr4551021uah.64.1518781396942; Fri,
	16 Feb 2018 03:43:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.21.226 with HTTP; Fri, 16 Feb 2018 03:42:36 -0800 (PST)
X-Originating-IP: [86.140.154.245]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 16 Feb 2018 11:42:36 +0000
Message-ID: <CAK18fxEEZRnHzobX=Lt2By_VYgEzi36nSU+X_94Etegh8E81mg@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Subject: Linux firmware for iwlwifi 8000c disappeared in pyro
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
X-List-Received-Date: Fri, 16 Feb 2018 11:43:16 -0000
Content-Type: multipart/alternative; boundary="f403043c3924a816e0056552d91b"

--f403043c3924a816e0056552d91b
Content-Type: text/plain; charset="UTF-8"

Hi guys,

I'm using pyro for a set of boards including the Intel NUC one. This has an
integrated WiFi chip which works with iwlwifi 8000c firmware. While
updating the pyro branch of poky lately I saw that the package where this
firmware is available now is changed which is not the case in rocko and
master.

In pyro (
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb?h=pyro)
the 8000c package was completely removed and the firmwares now fall back to
be included in iwlwifi-misc.

In master (
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb?h=master)
that package still exists and everything is fine.

This happened because the removal of the 8000c-19 firmware patch in pyro
removes the package completely as well (
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb?h=pyro&id=3e4b382c0c687a76f824cd84b478c4f778e15e3e).
While the patch that ended up in master only removed that specific firmware
(
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb?id=8d2e66817a6e5cea5a0146f2804e703402de44dc
).

Any idea why this happened? Can we bring back the package in pyro as well?

--
Andrei Gherzan

--f403043c3924a816e0056552d91b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi guys,<div><br></div><div>I&#39;m using pyro for a set o=
f boards including the Intel NUC one. This has an integrated WiFi chip whic=
h works with=C2=A0iwlwifi 8000c firmware. While updating the pyro branch of=
 poky lately I saw that the package where this firmware is available now is=
 changed which is not the case in rocko and master.</div><div><br></div><di=
v>In pyro (<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/m=
eta/recipes-kernel/linux-firmware/linux-firmware_git.bb?h=3Dpyro">http://gi=
t.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/linux-firmwa=
re/linux-firmware_git.bb?h=3Dpyro</a>) the 8000c package was completely rem=
oved and the firmwares now fall back to be included in=C2=A0iwlwifi-misc.</=
div><div><br></div><div>In master (<a href=3D"http://git.yoctoproject.org/c=
git/cgit.cgi/poky/tree/meta/recipes-kernel/linux-firmware/linux-firmware_gi=
t.bb?h=3Dmaster">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/r=
ecipes-kernel/linux-firmware/linux-firmware_git.bb?h=3Dmaster</a>) that pac=
kage still exists and everything is fine.</div><div><br></div><div>This hap=
pened because the removal of the 8000c-19 firmware patch in pyro removes th=
e package completely as well (<a href=3D"http://git.yoctoproject.org/cgit/c=
git.cgi/poky/commit/meta/recipes-kernel/linux-firmware/linux-firmware_git.b=
b?h=3Dpyro&amp;id=3D3e4b382c0c687a76f824cd84b478c4f778e15e3e">http://git.yo=
ctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-kernel/linux-firmware=
/linux-firmware_git.bb?h=3Dpyro&amp;id=3D3e4b382c0c687a76f824cd84b478c4f778=
e15e3e</a>). While the patch that ended up in master only removed that spec=
ific firmware (<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/co=
mmit/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb?id=3D8d2e6681=
7a6e5cea5a0146f2804e703402de44dc">http://git.yoctoproject.org/cgit/cgit.cgi=
/poky/commit/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb?id=3D=
8d2e66817a6e5cea5a0146f2804e703402de44dc</a>).</div><div><br></div><div>Any=
 idea why this happened? Can we bring back the package in pyro as well?</di=
v><div><br clear=3D"all"><div><div class=3D"gmail_signature"><div dir=3D"lt=
r"><div><div dir=3D"ltr"><div>--</div>Andrei Gherzan</div></div></div></div=
></div>
</div></div>

--f403043c3924a816e0056552d91b--
