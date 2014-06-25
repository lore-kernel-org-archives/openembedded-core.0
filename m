Return-Path: <sadlife1990@gmail.com>
Received: from mail-vc0-f195.google.com (mail-vc0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8965860D8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 06:22:44 +0000 (UTC)
Received: by mail-vc0-f195.google.com with SMTP id id10so351557vcb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=sVHD/ZqxQJcNQ7CvL50JCWGznotUjeIge9493dfOVg0=;
	b=kAWh1ptFJbZ8hACwPsQnO08PpgL6QscpfYoJaLDTH1CySg91VTV+E73uWDt1uDkIFz
	dmYsyLGZz0jW/kXPddfHuMtR/0wKQv9zAkbAQUz3TgRbbioytdyc4dcCUOay9CiW8642
	SqkePLH45yNtkldvjAQeXElMSR8b0FT6RcHZutp2572utDYdWglfgPN2yU4LAu6I8m9/
	FK1ivGtDnuoQ5EcCGpdzW88Uac8Gfn9xEGxc1tsvbQ2+yA4BYNQYWr//EFHfO/rSEIof
	032eke6UYS82NfwKS3ERxnwgh6ks7q5z45H9jPIP1l4WWVyWdrgrFD1at/UsPSv5o3HM
	NuaQ==
MIME-Version: 1.0
X-Received: by 10.53.0.135 with SMTP id ay7mr4244674vdd.11.1403677365051; Tue,
	24 Jun 2014 23:22:45 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Tue, 24 Jun 2014 23:22:45 -0700 (PDT)
Date: Wed, 25 Jun 2014 09:22:45 +0300
Message-ID: <CAAHuHfw=XA0dyV_3pym85WZt2B_+DPoP5B40vwG2wKgip5p+Hg@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: bitbake hob QT4 lib problem
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
X-List-Received-Date: Wed, 25 Jun 2014 06:22:47 -0000
Content-Type: multipart/alternative; boundary=001a1133c548b9270704fca31acf

--001a1133c548b9270704fca31acf
Content-Type: text/plain; charset=UTF-8

Hello,

I'm newbie, I'm testing beaglebone black. My setup and instruction following

git clone git://github.com/Angstrom-distribution/setup-scripts.git
cd setup-scripts
MACHINE=beaglebone ./oebb.sh config beaglebone
MACHINE=beaglebone ./oebb.sh update
MACHINE=beaglebone ./oebb.sh
after I run this command

MACHINE=beaglebone ./oebb.sh bitbake -u hob and start hob GUI TOOL
and select beaglebone and QT-embedded package and build image but I cant
see my rootfs in qt lib. Please help.

--001a1133c548b9270704fca31acf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"im" style=3D"font-family:arial,sans-serif;fo=
nt-size:13px">Hello,<br><br>I&#39;m newbie, I&#39;m testing beaglebone blac=
k. My setup and instruction following<br><br>git clone git://<a href=3D"htt=
p://github.com/Angstrom-distribution/setup-scripts.git" target=3D"_blank">g=
ithub.com/Angstrom-<u></u>distribution/setup-scripts.git</a></div>
<div class=3D"" style=3D"font-family:arial,sans-serif;font-size:13px"><div =
class=3D"im">cd setup-scripts<br>MACHINE=3Dbeaglebone ./oebb.sh config beag=
lebone<br>MACHINE=3Dbeaglebone ./oebb.sh update<br>MACHINE=3Dbeaglebone ./o=
ebb.sh<br>
after I run this command<br><br>MACHINE=3Dbeaglebone ./oebb.sh bitbake -u h=
ob and start hob GUI TOOL<br>and select beaglebone and QT-embedded package =
and build image but I cant see my=C2=A0rootfs in qt lib. Please help.</div>=
</div>
</div>

--001a1133c548b9270704fca31acf--
