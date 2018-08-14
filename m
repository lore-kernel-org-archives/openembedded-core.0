Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1DEF679015
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 14:41:06 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id r21-v6so21376377qtm.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=3KDAkL5iOCJYas/+mD/4yQPdhox1yNlQQQu6iFlfv5Q=;
	b=h2TFntd/mKYD7GxukQ6K6zDBxuUqzKRBJMDlNoAp3ySWS7YEDsQvp+16kkaz+TH68i
	VcPx2mDEnh8chew0EUzwykl/edgLt6mWVJZs3sg5eGuQKD/kFOFa3BbogWYmEtcsEBWf
	mLcD/7aFVZ1rkNKfZLIT75u58lofwcgxtftdItzvbteaaj7JYtL04L4815O/zmF+EoSV
	JPYCqkriJegj5EyN0iq+8bdbnbTJFGSCq8TgxzTCnlGGmTBdy1bpCjcBdoluU58A9JXS
	UJaAvYU+2icgZVS4CsH1g2OK/xvfGEzfZBbw2pIrYwtYfvO5WN+v262vlvk5/sMnM4Nm
	RkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=3KDAkL5iOCJYas/+mD/4yQPdhox1yNlQQQu6iFlfv5Q=;
	b=Uf+pioKP4UKN1dK8hqzl+3QQrEIfq6oIRMyS2IdjIrus5fWEKV5HL+Wc2sEIlxGQwt
	4u9vlO/HBs3CSWJQQJL7pZt0MF9RD6Z3Rt3rCwVkRHtoc5IVQa1FyofsyNPPl2WgOyWe
	46MrbRLGNOCc9ssUR6Qr+s6N3iooU0goa12QUmgpUPf7EKbd6WxTNySnr+6iwBKchjkO
	BRKvXLK4nZ/c/jc7WgdUTV9QPTSPr2CkqvUkpxZintG/qj9U0mlwQmNvrvO10iIEDQgw
	hGhWuOIaC0SBNSHxlpDWCgbbtqnMFSEmivgeJ/k/nC//xirj7jfY3uUDa1wiSa4hOhw5
	TebA==
X-Gm-Message-State: AOUpUlFBe2tEGk40bRND0QVeHqAdUBG8y8FxVuzSFT5uWu79XRn8Beew
	O11fmgn/MWbg0f6K3iq9PKKA5Q1Jxm0t1w+2AyNlW+2M
X-Google-Smtp-Source: AA+uWPziKYCEZGgeff3JP0u71OOrl3foKmOfzvmhxpidZfzgc9DqF8rjn2htbp+RQhKiy3779y6v+dLWnrXVL8ESzQg=
X-Received: by 2002:aed:2aa1:: with SMTP id
	t30-v6mr21965666qtd.28.1534257666915; 
	Tue, 14 Aug 2018 07:41:06 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Tue, 14 Aug 2018 16:40:55 +0200
Message-ID: <CAGCTLNS0Tze1bLt41fNbOSB-Bs2D80XO369ri8AvRpQhBg+rdg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe][meta-qt5]: required packages to run qt5 qml applications
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
X-List-Received-Date: Tue, 14 Aug 2018 14:41:06 -0000
Content-Type: multipart/alternative; boundary="0000000000003b005e05736633c3"

--0000000000003b005e05736633c3
Content-Type: text/plain; charset="UTF-8"

Hi,
I need to know what is the minimum packages which I need to add to
IMAGE_INSTALL_append variable in local.conf file
to be able to run qt5 qml applications in custom image on Minnowboard
Turbot that support wayland without x11. ?

Thank you,


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--0000000000003b005e05736633c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I need to know what is the minimum pack=
ages which I need to add to <br></div><div>IMAGE_INSTALL_append variable in=
 local.conf file <br></div><div>to be able to run qt5 qml applications in c=
ustom image on Minnowboard Turbot that support wayland without x11. ?</div>=
<div><br></div><div>Thank you,</div><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div>=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div>

--0000000000003b005e05736633c3--
