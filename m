Return-Path: <mhm.dawod@gmail.com>
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com
	[209.85.161.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE5878DC9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 12:13:11 +0000 (UTC)
Received: by mail-yw1-f41.google.com with SMTP id w76-v6so2988969ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 05:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=9maZPcsbmeD1GPsFlLp0QTysj/ePoyMwgLMYG1i/8N8=;
	b=LFArFkvdHhcFMnBPJPYOKZYyyQTx+wY0NAZjU9lwY12tDq1h7SNBrs/MYIqjgB7FJA
	+x7v1Kr68O2Ug92RoIo24+91wdij4ajVUrLAcoD2qX/Ew3a6Jqr+JAIc9CAA8Cjmwdcj
	MkrHewWpfBW72STkrQpBYSMgT8BYwyItCdZyN+C0Q07GPum2OUeVn7T5hW+tOMclvTmu
	7NRCVqpEaWNkCjTwQGkVjamWIuLmm5VWBsoyUjU54yYIGIUnNlkEW1T0koWR5t5ACYJA
	TXSo2wOylpdU0GHqtQBUmSBhZTXv6giiNlDjXwNxlwetyrT36j3TyWEfU2E3224Yt3HJ
	EK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=9maZPcsbmeD1GPsFlLp0QTysj/ePoyMwgLMYG1i/8N8=;
	b=jg6Hk+y3ydCMtEspFoMe440ydajelpo0wOZTBhEOG3ZPzS0acPun0576pSP2Zkm4N3
	eltYdc8R6Lx9C6zeMpyv0oLyWjTSoGvtC8zM/dL79ltp+VP4zpFUNrYDE/P4Lm9L457E
	zglgffLFcQm6sdNda19eqeUQjmq/R6dp89AHjsxmmSWYX8gSxZTV3KCidWEgY0upQ3LK
	OFAG+3UjvVoBflRKqh2jrQxeeMl9s5yogSTnbSIfcgSuo4orHVYBsfJioW2WBW8irqlq
	aV0Zjr69nM7a+uRekRKRGecDbG6kEwFms9zleBerjRIw6XHhA0SUuASm4Ej4KFk/PEL7
	MXlA==
X-Gm-Message-State: AOUpUlESL7FZbhtOJh1LFiLbQfYtBWTS2J08jh96nnuGhBmtpwhxd4v7
	b/XfC5cD7taenADHSxu8hRsASY6yVoQV2MeQWguOjefw
X-Google-Smtp-Source: AA+uWPzdHSOt3DpzX/ZVyZfHVDkP8bIXbM2GOAHom/jmByptNpLku1gNW9mdUgyuhxsoloaYYVDaZc7WauYVe9fBjDU=
X-Received: by 2002:aed:24b0:: with SMTP id
	t45-v6mr29639430qtc.86.1534421592264; 
	Thu, 16 Aug 2018 05:13:12 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Thu, 16 Aug 2018 14:13:01 +0200
Message-ID: <CAGCTLNTB92+=Ka32U==opLkTup-jMA7DLXV=hF1_ujhGv26HAw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe][qt5]: running qt5 apps on wayland image
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
X-List-Received-Date: Thu, 16 Aug 2018 12:13:11 -0000
Content-Type: multipart/alternative; boundary="000000000000f1530705738c5db3"

--000000000000f1530705738c5db3
Content-Type: text/plain; charset="UTF-8"

can I run qt5 apps on image supporting wayland without x11?
I removed x11 from image distro variable
and I use wayland weston instead.
can i run qt5 apps in this case ?
Thanks,

-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--000000000000f1530705738c5db3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>can I run qt5 apps on image supporting wayland withou=
t x11?<br></div><div>I removed x11 from image distro variable</div><div>and=
 I use wayland weston instead.<br></div><div>can i run qt5 apps in this cas=
e ?</div><div>Thanks,<br></div><div><br>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><div>=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div></div>

--000000000000f1530705738c5db3--
