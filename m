Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 71B3A787DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 19:20:05 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id z12so143156qkf.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 11:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=CZ9FodG8YDNvMsP8x87tp2RVleEbsILs9a6858mU4VA=;
	b=ALy9XesdnK2BQfv40y0k89i3CiFfEniap6IHTSjaHll00qNu4vysL8+ECPgapmJa0u
	Y/0EauTj0e8OqGZ0a3HoIIGLBTaiNWwWeNPx5w63Si2vK1dc3hhhb8jV/HvZS9SKLkIq
	G42VeaQr2glXQ2j2ETNnUKz8dqOysI/zZtxdvwd7MKcZx0ovRk05vgMPYNAGDf28I8jv
	wJio+SY0pHL1feeZi3ZR24lHhDJUJgF9G5EHwIb1x+v60Cz6XDq95fMu0flYgjKs8D6E
	erRkByZIDShmQ39KKiym0Xv3fNsddNxM3CZ/yELodz95CQrpZLqwAAX15w8UcTPCCZsK
	LD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=CZ9FodG8YDNvMsP8x87tp2RVleEbsILs9a6858mU4VA=;
	b=AYcAB26lWZQg1XY7oIe2nB3h4TcvrZTIJiR45RFyKq3UI3g19hmKFQecRkVUmpyG7/
	uJd881fVLRM9AEdzQZL0xPjLPy2NuWEbIshuO/BgMIdME8aHGxKa8dXqTQB/B9jU8Znt
	cx2QT2tFmGqAwqGnEqMOpqdFiSNipvpf+JtC9xuo5oCGsLWsYAuRKo/M0ItSXMJdqXKz
	oTNYuiYkxEoCy4lbOqh8a+TZw9z6Lzyn5U0IzGRzJubxsxqj3itdJv8/BORLonhZKwgZ
	x+YA9UkkT2ut8lOFETXrkuwMAOzc2WpC8KgdbrYjoTWi/sWckM7LoV+PxkAkEDXeaX7k
	yy1g==
X-Gm-Message-State: AKwxytftGNQtcoRuQyT7fBctXKNUTDFLB7SPIMkhfk4+puGRQBFcNcaq
	dji//CFaVIiXVGZzPGC8EDNVd4uMWWhhWyc121phDfcw
X-Google-Smtp-Source: ACJfBosYJSwjlFAW/tFRMXEFQaU+5vlra1It0LWPD+oilVdsrQMNxjGlMGfzzl5DeoiTRubFICNUraxfdx/w21c6hpo=
X-Received: by 10.55.119.68 with SMTP id s65mr26693116qkc.357.1515612006117;
	Wed, 10 Jan 2018 11:20:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.84.232 with HTTP; Wed, 10 Jan 2018 11:20:05 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 10 Jan 2018 14:20:05 -0500
Message-ID: <CAHUNapSrfg-6Tx5iL__ymHj6GdkLhSNnuG095Oi+Gsf4Ft9kfQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: uriparser
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
X-List-Received-Date: Wed, 10 Jan 2018 19:20:05 -0000
Content-Type: multipart/alternative; boundary="94eb2c05ff563df636056270eb3c"

--94eb2c05ff563df636056270eb3c
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

Any chance the uriparser recipe from meta-luneui (
https://layers.openembedded.org/layerindex/recipe/32523/) could be added to
openembedded-core (or meta-openembedded?). It's also now needed for the git
version of tpm2-tss in meta-measured.

Best regards,
     Trevor

--94eb2c05ff563df636056270eb3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Martin,<br><br></div>Any chance the urip=
arser recipe from meta-luneui (<a href=3D"https://layers.openembedded.org/l=
ayerindex/recipe/32523/">https://layers.openembedded.org/layerindex/recipe/=
32523/</a>) could be added to openembedded-core (or meta-openembedded?). It=
&#39;s also now needed for the git version of tpm2-tss in meta-measured.<br=
><br></div>Best regards,<br></div>=C2=A0=C2=A0=C2=A0=C2=A0 Trevor<br></div>

--94eb2c05ff563df636056270eb3c--
