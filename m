Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 435A560557
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 12:42:33 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id l6so2376200qcy.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 04:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MdXAqARtulohBzhAAX+ofHl8iVvW9obK74xDyxQDdl4=;
	b=irQhFw0C6ThWZj1+m8QNChuf1AAK1owNG7wiXXZkDHmisDM5TrYiP1+V49HNuUe2ri
	k7P6UbsxM6ezLO6HFOETItZuQX6lTDFOcgehzPSF17q3jBhC4vev9dRNitQtq88zpVfE
	iff+ZC6lQeeZEXfXlyz9VR6A/gnazy/dd7VweOXA75GBUQUla1RviF1UMV8YoXU3ApoI
	ukmkqT9LpM/ryuFh17YUG85OQ2rZurnY++kyCM06UMy8DeD4E9PHCER8ObPGDtEyuCO/
	NWhEzvUKhpR5gnizgq/Qr2aWhXWVZnA2Glwt23dJASb5pHy1fuLcXwZRjuenw0EyFfa3
	GBXw==
X-Gm-Message-State: ALoCoQlyMEY2RfFa28y0IWMQX62zPCww2pyHuLJS4KB/sIAt8TSjHtXbx5TKMiL90p/hfNxGjdnd
X-Received: by 10.224.28.193 with SMTP id n1mr16728032qac.93.1415364154564;
	Fri, 07 Nov 2014 04:42:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 04:42:14 -0800 (PST)
In-Reply-To: <1415077496-11116-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1415077496-11116-1-git-send-email-qianl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 12:42:14 +0000
Message-ID: <CAJTo0LZ2FL--UchK7pVPUJFtsQJtH35_a0aJwYUSnWh34nCf-A@mail.gmail.com>
To: Qian Lei <qianl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Bluez5: Add gatttool to new package bluez5-tools
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
X-List-Received-Date: Fri, 07 Nov 2014 12:42:43 -0000
Content-Type: multipart/alternative; boundary=001a11c2ca30a93fd7050744250f

--001a11c2ca30a93fd7050744250f
Content-Type: text/plain; charset=UTF-8

On 4 November 2014 05:04, Qian Lei <qianl.fnst@cn.fujitsu.com> wrote:

>         # at_console doesn't really work with the current state of OE, so
> punch some more holes so people can actually use BT
> +        install -m 0755 ${S}/attrib/gatttool ${D}/${bindir}/
>         install -m 0644 ${WORKDIR}/bluetooth.conf
> ${D}/${sysconfdir}/dbus-1/system.d/
>  }
>

Because of where you put the install, it looks like installing gatttool is
related to the DBus configuration.


>  ALLOW_EMPTY_libasound-module-bluez = "1"
> -PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex"
> +PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex
> ${PN}-tools"
>

Two questions:
1) If we're installing gatttool, why not the other tools that are noinst
(obex-client-tool, obexctl, etc).  Patching the makefile would install all
the tools that upstream build.
2) Do these deserve a separate package, or as they're for testing should
they go into PN-testtools?

Ross

--001a11c2ca30a93fd7050744250f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 November 2014 05:04, Qian Lei <span dir=3D"ltr">&lt;<a href=3D"mailto:=
qianl.fnst@cn.fujitsu.com" target=3D"_blank">qianl.fnst@cn.fujitsu.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":zy" class=
=3D"a3s" style=3D"overflow:hidden">=C2=A0 =C2=A0 =C2=A0 =C2=A0 # at_console=
 doesn&#39;t really work with the current state of OE, so punch some more h=
oles so people can actually use BT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/attrib/gatttool ${D}/${bi=
ndir}/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/=
${sysconfdir}/dbus-1/system.d/<br>
=C2=A0}<br></div></blockquote><div><br></div><div>Because of where you put =
the install, it looks like installing gatttool is related to the DBus confi=
guration.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
zy" class=3D"a3s" style=3D"overflow:hidden">
=C2=A0ALLOW_EMPTY_libasound-module-bluez =3D &quot;1&quot;<br>
-PACKAGES =3D+ &quot;libasound-module-bluez ${PN}-testtools ${PN}-obex&quot=
;<br>
+PACKAGES =3D+ &quot;libasound-module-bluez ${PN}-testtools ${PN}-obex ${PN=
}-tools&quot;<br></div></blockquote><div><br></div><div>Two questions:</div=
><div>1) If we&#39;re installing gatttool, why not the other tools that are=
 noinst (obex-client-tool, obexctl, etc).=C2=A0 Patching the makefile would=
 install all the tools that upstream build.</div><div>2) Do these deserve a=
 separate package, or as they&#39;re for testing should they go into PN-tes=
ttools?=C2=A0<br></div><div><br></div><div>Ross</div></div></div></div>

--001a11c2ca30a93fd7050744250f--
