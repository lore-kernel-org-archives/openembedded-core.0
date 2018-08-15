Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7BD60721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 12:38:21 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id h4-v6so933698qtj.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 05:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=mxKDyC/wAZMD03tyQJT3k/Q5z70k3K119Cb98QcwpNU=;
	b=i15EjeDJ2VwhLJKA7Gx0PAQaclklQo5S/GC3TfMt4WU83iMND8F6UW6bw3j/9+Wq8f
	3Yr0K8JmWaiKcVnmfGcgCgwQvIsvVjl/kCmqmWWOTsic1fMZUNYgn9K9yhwi9K6PSlm+
	g3LBn0f3T/84R8kHNVxylMdTQsz2VI5vVHYKXsFfDtRJkE+F71Q4SmdwxhsYCKlm2r8a
	c6Y2Av0udbx+3ln9bPq+Z0Fql6JyJO90RQaFQbK3AK80uERdo2WqiV6Ncc5cNVXu8/1w
	ERkvsnY8S9LdZWgLFmqMw8PFvR9n302ioydfxWizs2zKT1jHvAGZ3AXNUasUB22ZZcWh
	naNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=mxKDyC/wAZMD03tyQJT3k/Q5z70k3K119Cb98QcwpNU=;
	b=CXhi04t6R3NzH/yQkVGHtd7eUMZ0D/8UNWduJahbUK7KPlpxTg+NCyptBBwTh57Fsv
	WVTf45UClfvFhWMiyR+oH5/Tqc9gj1Kgg9hkXmoYCpycXROjvxatHpQoZriViVUSv7cm
	iYnPa8pUdLEVfVcl9Q34nauhkGsbuRO6NXrOdw4Va0MS+gFQzLytD2Vz5UYRx/C5AZaW
	eddzNZTu8vtqeFIfLIAqfxh1yQ4gBhV5fxSqoAPsD4Kewb/jexbBs0gQzRaLfBjpKP3a
	gRt72sPgxQrhCJATgObM+erQKwanC+bN31CeEft8Lf7PaX7YUxNyqdzcJDLQCU9x/4zx
	UKdQ==
X-Gm-Message-State: AOUpUlEVz2N6Q1++us/Fj+uA3OoGtGbaWwaumpcX1awuJBXYIhvshSiF
	Z5dcUhmc3a3jGXnhMCxJS0ZpC7Zc/lYCA0l/pWb6ACgB
X-Google-Smtp-Source: AA+uWPyV+grhT/bKhdN6uzmoHECUsALuLlpFu/MUw15Qu+RIbKCUEGMhdBULj4rJImeeQ0jcFVdhNtxSnsqtZHBwDrU=
X-Received: by 2002:ac8:43cb:: with SMTP id
	w11-v6mr25177460qtn.371.1534336702204; 
	Wed, 15 Aug 2018 05:38:22 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Wed, 15 Aug 2018 14:38:11 +0200
Message-ID: <CAGCTLNSTZLXLKQRV7J1twF+a7Dm=WMNRC=0DRhrMWjYeiLO_Uw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe][meta-qt5] : QT5 Packages
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
X-List-Received-Date: Wed, 15 Aug 2018 12:38:21 -0000
Content-Type: multipart/alternative; boundary="00000000000019d1010573789afc"

--00000000000019d1010573789afc
Content-Type: text/plain; charset="UTF-8"

Hi,
I am trying to add Qt5 to my custom image.
I edited bblayer.conf file and created.
Now I want to know what is th packages which i need to append to
IMAGE_INSTALL variable ?
I found many many packages and modules. I can not add them all, because
this will expand my image size.
I need to know how to select the most important modules for my image ?

Thank you,
-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--00000000000019d1010573789afc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I am trying to add Qt5 to my custom ima=
ge.</div><div>I edited bblayer.conf file and created.</div><div>Now I want =
to know what is th packages which i need to append to IMAGE_INSTALL variabl=
e ?<br></div><div>I found many many packages and modules. I can not add the=
m all, because this will expand my image size.<br></div><div>I need to know=
 how to select the most important modules for my image ?<br></div><div><br>=
</div><div>Thank you,<br></div><div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>=C2=A0<=
br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div></div>

--00000000000019d1010573789afc--
