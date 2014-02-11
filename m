Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id D2A2E6EEF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 12:35:16 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id i8so12902720qcq.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 04:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=Bj0sdblXYCrISuVn+XkK9tzl3AH1324h/RY0Ax0Y3tI=;
	b=pFo6JRtv3yZZWNtjTFTuRumTCkaTewIBFNOzcaNXO3S4std8VV3M7FTLYF3QTn9iUk
	SSippWREcdqi6QGIDBgQGqnLbtyvBcihEbSxFNxTsGw+XE4dZg3nhOYS1jzGE2GmaqL9
	2MPEDwtDAc1mwSHCNb/fnw9hG9UmF9czlPXEEgnJTtLPjz1sQQe9VHRgojCrEJs9VCC6
	QsyMNIH81EavBEBE5GZb2+Jr/wz6fj6w41szXWhKmci4Kexxa6kDemWMoTUYDBqMx/hz
	Sj86i/Ycz9o80Pw4T4dCdpsMqjyiHFTJgo0uIC3hY7L3r8Ewle+/LgOY8wwoiYyWMFAa
	B4oA==
X-Received: by 10.140.21.179 with SMTP id 48mr53272966qgl.78.1392122117073;
	Tue, 11 Feb 2014 04:35:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 04:34:56 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 10:34:56 -0200
Message-ID: <CAMCfZKE1+RDpEE8HehL_GDp2WxrVWjpjVL0Fb94Y_729Zi0A=w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: qte-4.8.5 missing libQtUiToolsE.a on toolchain
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
X-List-Received-Date: Tue, 11 Feb 2014 12:35:17 -0000
Content-Type: multipart/alternative; boundary=001a11c11fee45b22204f220b00e

--001a11c11fee45b22204f220b00e
Content-Type: text/plain; charset=ISO-8859-1

Folks,

I was trying to use meta-toolchain-qte on dora branch, but when building
some examples from Qt, the compiler raised this error:

/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/libexec/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.8.2/ld:
cannot find -lQtUiToolsE
collect2: error: ld returned 1 exit status
make: *** [calculator] Error 1


If I copy libQtUiToolsE.a
to /usr/local/oecore-x86_64/sysroots/armv7ahf-vfp-neon-angstrom-linux-gnueabi/usr/lib/
the build works.

libQtUiToolsE.a is just present at qt4-embedded-staticdev package.
Shouldn't it needed to be added to meta-toolchain-qte?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

--001a11c11fee45b22204f220b00e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Folks,<div><br></div><div style>I was trying to use meta-t=
oolchain-qte on dora branch, but when building some examples from Qt, the c=
ompiler raised this error:</div><blockquote style=3D"margin:0px 0px 0px 40p=
x;border:none;padding:0px">

/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/libexec/arm-=
angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.8.2/ld: cannot find=
 -lQtUiToolsE<br>collect2: error: ld returned 1 exit status<br>make: *** [c=
alculator] Error 1</blockquote>

<div><br></div><div style>If I copy=A0libQtUiToolsE.a to=A0/usr/local/oecor=
e-x86_64/sysroots/armv7ahf-vfp-neon-angstrom-linux-gnueabi/usr/lib/ the bui=
ld works.</div><div style><br></div><div style>libQtUiToolsE.a is just pres=
ent at=A0qt4-embedded-staticdev package. Shouldn&#39;t it needed to be adde=
d to meta-toolchain-qte?<br>

</div><div><br></div><div><br clear=3D"all"><div><div dir=3D"ltr"><div>Rega=
rds,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do =
Embarcados<br><a href=3D"http://www.embarcados.com.br" target=3D"_blank">ww=
w.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c11fee45b22204f220b00e--
