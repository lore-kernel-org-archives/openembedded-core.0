Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0441F78812
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 19:28:58 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id m47so4204844uae.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 12:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=MNtsur4UqSSoZSUOAb1aOsiYEQdy5lRDer6ffuHfHio=;
	b=X4bnlBIQlRX16IH05fcnguPTnIo2ipMte1l18rEb+9KHDqFMPcNgu0NqK6QaU3eBra
	RN87MM0JEnxQZPxigzZhNRxEmeOtX2gQt205lgHGCQ+Jm1Fy5TNYiiN9GPGaOy76jG9U
	2KLPDYduF2npUBEQVrByu6NUUmC2o2Tm/HjKYmG/rqAr/m3BxK0KXgD+XbebDrCKkcxI
	91DEUlKX310tMekI0jTxtRuVVB83IFK7KfxqMjNSRAqtYvyO/BWJr4jHrrtNfzc3QQOf
	WnZx5ORMEanLNeR/q3TFPtg5FyO/36QO2EaK59PGzyFkXP0Jb5msX/IAbrxaKIpj/ySa
	GaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MNtsur4UqSSoZSUOAb1aOsiYEQdy5lRDer6ffuHfHio=;
	b=Ioazv1U51ky5trwffVpULNNzB9HOlLzfBn1ljwlaSknvg8+nQcSpzgySiWtmGruJqa
	KelVKPcP2fj6JRyOcnWR096nAlpNLJ2ImRnZP5pTjt5s0TUS8/3bMjWgsqnlLcT2UF4G
	tCQ7Z1H3bl5aVFi/u1F6Eyqn4l/w3W5e7vh0SBARWfRJ6lDXjnC0DHvCx0iQxPK9fLb5
	fqsJTFZ2l6ThTGumkYE4yT11ipD4m7DkH2grAdJPO8a45eVTWZAyNcZNRyEejVQhB4Oq
	jxHSHA6Ua2PMR0f5sCef9SniAXZ1LI6P7c3ZcXfru24RqMd4A2i9dFDmbZcTNeH2z1qC
	TcEA==
X-Gm-Message-State: AElRT7E5piRdgBYvHYkAn2Hfb7mgT43Yjo+XguwW6vGcqQCETHrTZqWD
	tfYiEOOCV/l7mEnbZ13i1KdKkTWPlGKVny3VNUs=
X-Google-Smtp-Source: AG47ELsugjGLQ6wmYVdSXnGUBGuctqenbbPUWyh45b0hvphCYR91Oe+vWyEkxA8xrhgCIWfF+C6x22qcExjsFDh2Z4A=
X-Received: by 10.176.70.87 with SMTP id z23mr8959010uab.159.1521487739707;
	Mon, 19 Mar 2018 12:28:59 -0700 (PDT)
MIME-Version: 1.0
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Mon, 19 Mar 2018 19:28:48 +0000
Message-ID: <CAPGMVzHyhFkP8Udz8PXT76rW4-ZJAZxm8+vZPa6_2iAPQULqgQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Branch shifting [image-build]
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
X-List-Received-Date: Mon, 19 Mar 2018 19:28:59 -0000
Content-Type: multipart/alternative; boundary="f40304361e1c4165ac0567c8f840"

--f40304361e1c4165ac0567c8f840
Content-Type: text/plain; charset="UTF-8"

What is the reason that we shift to a branch called rocko while installing
poky?
 The reason I ask this is , I was getting an error named classes/.pypi
inherit not found.. So I shifted the branch to master and ran bitbake and
it doesn't show any errors.
Will I have any problems later or is shifting branch fine?
Thanks

--f40304361e1c4165ac0567c8f840
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">What is the reason that we shift to a b=
ranch called rocko while installing poky?</div><div dir=3D"auto">=C2=A0The =
reason I ask this is , I was getting an error named classes/.pypi inherit n=
ot found.. So I shifted the branch to master and ran bitbake and it doesn&#=
39;t show any errors.</div><div dir=3D"auto">Will I have any problems later=
 or is shifting branch fine?</div><div dir=3D"auto">Thanks</div></div>

--f40304361e1c4165ac0567c8f840--
