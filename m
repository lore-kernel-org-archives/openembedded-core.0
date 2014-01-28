Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id BC06F6E82D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 13:32:26 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id to1so341643ieb.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 05:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=4GH6THanCHcgkWQpAC5KBE/LOq71hodYbGiy5ilFD68=;
	b=wpj6bszFJ6P7FubVerpG+eD4srW9d3Py2biZm6T38SCCDTlPkgWNq9oNIfbnzbJ9eq
	lv6/zWUI2sr8xrwEDoB0iNMHrc2UCBVK2E+h+TrnDuu7UfLPRhieSSa0S2sfqVZgFdyz
	WRRPCww9Zq6w0aL+B3U/0E1SldthDN5JRwx1s8XT7+rxMQvP2U7gQ7kaBj3c1RWHz1OR
	RdtCOUiXZB0bYIkPUUcQqdd+FVUAbXM22H85Bcj93x+EUl8/BjG21Jqd6cpUl1vmrI/m
	1v2ZM4kkLYrmWOEMMboGpxPzeCMcdPhSYzCVdZZfyoYRprAKvnSTvGxA374498sE08iC
	EO4A==
MIME-Version: 1.0
X-Received: by 10.50.72.36 with SMTP id a4mr23122258igv.40.1390915947181; Tue,
	28 Jan 2014 05:32:27 -0800 (PST)
Sender: sebmennetrier@gmail.com
Received: by 10.43.141.70 with HTTP; Tue, 28 Jan 2014 05:32:27 -0800 (PST)
Date: Tue, 28 Jan 2014 14:32:27 +0100
X-Google-Sender-Auth: TWeeJenflIigx3jJ6PXkieryDLU
Message-ID: <CABgO3_MAX9SC7uB=vBV3Q5ZDCO90K9x_JvroS1Rpe1FoxdUAwg@mail.gmail.com>
From: Sebastien MENNETRIER <s.mennetrier@innotis.org>
To: openembedded-core@lists.openembedded.org
Subject: Incompatibility between compat-wireless and linux-firmware ??
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
X-List-Received-Date: Tue, 28 Jan 2014 13:32:28 -0000
Content-Type: multipart/alternative; boundary=047d7bdcab2cf1bb8004f107da0b

--047d7bdcab2cf1bb8004f107da0b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,

I use dora branch and I would like to use the TiWi-ble wifi module in
multirole mode with linux kernel 3.0.35.
The module works thanks to the wl12xx driver. The default driver in the
kernel 3.0.35 doesn't work in multirole mode...

So, I build compat-wireless-all from meta-openembedded with linux-firmware
from poky in order to use the wl12xx driver in compat-wireless.

But when I start my board, the driver doesn't work and I have this error :
wl12xx: ERROR Your WiFi FW version (6.3.10.0.133) is outdated.
Please use at least FW 6.3.10.2.115.
You can get more information at:
http://wireless.kernel.org/en/users/Drivers/wl12xx

Is it an issue of incompatibility between this two recipes ? Or must I use
others recipes to use wl12xx driver in multirole mode ?

Thank for your help.
--=20

Regards,
S=E9bastien

--047d7bdcab2cf1bb8004f107da0b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi all,<br><br></div>I use dora branch and I wou=
ld like to use the TiWi-ble wifi module in multirole mode with linux kernel=
 3.0.35.<br></div>The module works thanks to the wl12xx driver. The default=
 driver in the kernel 3.0.35 doesn&#39;t work in multirole mode...<br>
<div><div><br>So, I build compat-wireless-all from meta-openembedded with l=
inux-firmware from poky in order to use the wl12xx driver in compat-wireles=
s. <br><br></div><div>But when I start my board, the driver doesn&#39;t wor=
k and I have this error :<br>
wl12xx: ERROR Your WiFi FW version (6.3.10.0.133) is outdated.<br>Please us=
e at least FW 6.3.10.2.115.<br>You can get more information at:<br><a href=
=3D"http://wireless.kernel.org/en/users/Drivers/wl12xx">http://wireless.ker=
nel.org/en/users/Drivers/wl12xx</a><br>
</div><div><br><div><div>Is it an issue of incompatibility between this two=
 recipes ? Or must I use others recipes to use wl12xx driver in multirole m=
ode ?<br clear=3D"all"></div><div><br></div><div>Thank for your help.<br>
</div><div>-- <br><div dir=3D"ltr"><div><br>Regards,<br></div>S=E9bastien<b=
r></div></div></div></div></div></div>

--047d7bdcab2cf1bb8004f107da0b--
