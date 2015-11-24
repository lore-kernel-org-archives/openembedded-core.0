Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id C8624607AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 15:17:54 +0000 (UTC)
Received: by ioc74 with SMTP id 74so23113976ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 07:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LWeIIelPT25e3V8pXlFpUSJyyKSibdiHxHJ+Z07Dl/U=;
	b=U4PYfRsTgNtYeMqqVfgGP0s9yOf+FvJLa6h+GAuWXaTqcZdY1/RL6W6Xod0SNDLYh5
	mGrvtPL4ybf1mqJJWbLdIV/5QbiGQtAtAiADsQSyA+5bFuMioP+ZgO1H8pfAQ9tb6Bee
	FbS/5hkSzmY8Knp8VuFzodKr4Al8bVjfRWwREs2E4Zfaj1SHm5XQhI9yv993JyLcrIop
	+1KdfRl9cymmNqPpuq+QeOc04cJnL7tlcTlcAZKpWntS+y5aJMKEY2OxN5sIzstF6YsD
	tLPvUaMp7lrWcKkWqX+QowejZA462DaJ20J3V+0N4NPEO2GL04d1J4JBxeiGaXtybAx5
	YqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LWeIIelPT25e3V8pXlFpUSJyyKSibdiHxHJ+Z07Dl/U=;
	b=MizZdN6gifMEToVJgGLnz5zeKmlxgfvJHIllKNrvWS4MZB4JABQGW4hS+8yXPKFqGH
	FV9LNe0UFZ+Pfu4LL/BpPvPAljWAoKQh/sMMK0GCRjg6S/DtNyWx0ppd2IniiQkK0tA8
	UTp/xW/Fk21JasVUPUhDK5Tt+zTEfcP0NMe0yDVaRWoUE9S1CXCMpDI0PRAmJqbv6yRL
	HE0MBwC4JReoCNz3Rdsop0/uc1Dx6FHnjdeTF0cBPAXmSQFESI2rmLCsDVuY4yT/HWj4
	8+kmEo8ZONzqirDjJm82beoUafxMV1/sgkBaT3d4pv7o+ApDmqbJlCabgr7VXj1GO+8e
	OJ+A==
X-Gm-Message-State: ALoCoQnVuYhsGcbHh/wMJjkm71AzbTdAXJkoyJb4QDyYUYmqBxapzziB3oQ5pGf47svWIQsuEGcS
X-Received: by 10.107.130.155 with SMTP id m27mr34482848ioi.133.1448378274970; 
	Tue, 24 Nov 2015 07:17:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 24 Nov 2015 07:17:35 -0800 (PST)
In-Reply-To: <5b0777dd5f120c6235dad62bab0dd8972a7c54be.1448029554.git.andrew.shadura@collabora.co.uk>
References: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
	<5b0777dd5f120c6235dad62bab0dd8972a7c54be.1448029554.git.andrew.shadura@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Nov 2015 15:17:35 +0000
Message-ID: <CAJTo0LYsUF0X1ToOZuk7WhbXZuA4jvkaiK+p_LpmOSc04dxH_Q@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] dbus: update the recipes to 1.10.2
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
X-List-Received-Date: Tue, 24 Nov 2015 15:17:55 -0000
Content-Type: multipart/alternative; boundary=001a113ecd94948ba605254ad8f6

--001a113ecd94948ba605254ad8f6
Content-Type: text/plain; charset=UTF-8

On 20 November 2015 at 14:27, Andrew Shadura <andrew.shadura@collabora.co.uk
> wrote:

> --- a/meta/recipes-core/dbus/dbus-test_1.8.20.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.10.2.bb
> +SRC_URI[md5sum] = "9190f5c0e41e8d220352c058faf5463522378e35"
> +SRC_URI[sha256sum] =
> "aef3f49595df09b0824433ee993cda748ede93693a719a831562ae1616b6bb9e"
>
> --- a/meta/recipes-core/dbus/dbus_1.8.20.bb
> +++ b/meta/recipes-core/dbus/dbus_1.10.2.bb
> +SRC_URI[md5sum] = "2428919cc77b8d0028d65ee4d5dbef31"
> +SRC_URI[sha256sum] =
> "aef3f49595df09b0824433ee993cda748ede93693a719a831562ae1616b6bb9e"
>

One of those checksums was wrong, but I fixed it during testing.

Ross

--001a113ecd94948ba605254ad8f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 20 November 2015 at 14:27, Andrew Shadura <span dir=3D"=
ltr">&lt;<a href=3D"mailto:andrew.shadura@collabora.co.uk" target=3D"_blank=
">andrew.shadura@collabora.co.uk</a>&gt;</span> wrote:<br><div class=3D"gma=
il_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">--- a/m=
eta/recipes-core/dbus/<a href=3D"http://dbus-test_1.8.20.bb" rel=3D"norefer=
rer" target=3D"_blank">dbus-test_1.8.20.bb</a><br>
+++ b/meta/recipes-core/dbus/<a href=3D"http://dbus-test_1.10.2.bb" rel=3D"=
noreferrer" target=3D"_blank">dbus-test_1.10.2.bb</a><br>+SRC_URI[md5sum] =
=3D &quot;9190f5c0e41e8d220352c058faf5463522378e35&quot;<br>
+SRC_URI[sha256sum] =3D &quot;aef3f49595df09b0824433ee993cda748ede93693a719=
a831562ae1616b6bb9e&quot;<br>
<br>--- a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.8.20.bb" rel=3D"n=
oreferrer" target=3D"_blank">dbus_1.8.20.bb</a><br>
+++ b/meta/recipes-core/dbus/<a href=3D"http://dbus_1.10.2.bb" rel=3D"noref=
errer" target=3D"_blank">dbus_1.10.2.bb</a><br>+SRC_URI[md5sum] =3D &quot;2=
428919cc77b8d0028d65ee4d5dbef31&quot;<br>
+SRC_URI[sha256sum] =3D &quot;aef3f49595df09b0824433ee993cda748ede93693a719=
a831562ae1616b6bb9e&quot;<br></blockquote><div><br></div><div>One of those =
checksums was wrong, but I fixed it during testing.</div><div><br></div><di=
v>Ross=C2=A0</div></div></div></div>

--001a113ecd94948ba605254ad8f6--
