Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 61B0B7928D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 09:30:17 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id f18-v6so4440835qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 02:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=HCQiooCEdRuYL0QyuZYgtzM/GTQnWVTTLW/qH8LZ9W8=;
	b=OFWgRireNny8ZuE8H4NuBJ2yWe/8CjEJ7PdMZnaai4SUh/u89C26OYThlNE/F2Do2y
	TxmI2Ho57LAYbw0wldzA080i18fsIjC9W369isOGj3R1gYniL6ksmGXVTLrf1Oezs0Jx
	snQhgPttyiPxS7n1feZmBrM+/r8qict1NYovW4huS39KItzcj1WqTjUpKNxeR6/rBXy4
	jTPNgTPXJ60t4nHcOR1y7V6ExTGusVrF8HeUjX6WPUKPL4VdrXs2fmWZZkMirh6Ws1tp
	3SAZaDQBQv1UD4chs8HYndhOgWgbLSCnfWeDyle1yye+YAYqQsNNfIXy2qPAAvJzyCrq
	7qlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=HCQiooCEdRuYL0QyuZYgtzM/GTQnWVTTLW/qH8LZ9W8=;
	b=gNn7UV/w9GGgEZ1iknhhWHpx2QNwFO3QATYBulhxEw4WVkOiNsQLEauZQRoMpljYdr
	/VLj7GgURndYTJrltTu2jrBUCvUuGyEfTsjrtuiNQ8dzivupHFScT14dKSS1Idp+22wO
	uDUSdgP22FfbHF1A6/Y0drvxscmDRFBXJqx/HBu7WFD9TAzDS+/G74eqUGRPnRtbiWy4
	YnrBG7FvZ1w3c6barIyWBkwDxDs4sLl5RhKYxpZyBx6r2EfOtlQcHRJEATkgrHuLLnez
	2OsnoZdiDeX0ueXe8hAVTLGZV96qEecuY3BhJW9d5QUbQpnfQuI6Ledh5AbHEVwzLC7t
	GaeQ==
X-Gm-Message-State: AOUpUlEBj5GkJRCcnxTk49A9s19V43xXICW5/37cu+tyGqSPRDe8dDU+
	r/PNWFLA6+a+u1ABnRIGxatSiCKaByU4/4KbYeRnQjR4
X-Google-Smtp-Source: AA+uWPw/ygiSNtTdWD4vDEbvWlkiU7LLs9pz+faFU6Mi6JCq4dQTeb92SVq866j4BUHBSLc8CVvyHAI2AHvIsaDlgac=
X-Received: by 2002:a0c:c30f:: with SMTP id
	f15-v6mr25517260qvi.104.1534411818127; 
	Thu, 16 Aug 2018 02:30:18 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Thu, 16 Aug 2018 11:30:06 +0200
Message-ID: <CAGCTLNQ+4GHr0CxseFp7qhGbKzrDqDpS2q=270nVnNpCkCc4rQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: running Qt5 applications with wayland
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
X-List-Received-Date: Thu, 16 Aug 2018 09:30:17 -0000
Content-Type: multipart/alternative; boundary="0000000000005bd79c05738a1731"

--0000000000005bd79c05738a1731
Content-Type: text/plain; charset="UTF-8"

Hi,
I need to know the modifications needed to run Qt5 apps on wayland custom
image instead of x11.
I removed x11 and run wayland weston instead.
when i try to run Qt-cinemaexperience as a test I face the following error
:
-----------
This application failed to start because it couldnt find or load the
Qt pltform plugin "xcb".
------------
so, do i need to modify PACKAGECONFIG in qtbase_git.bb to be able to run
qt5 apps on wayland weston ?

Thanks,
-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--0000000000005bd79c05738a1731
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I need to know the modifications needed=
 to run Qt5 apps on wayland custom image instead of x11.<br></div><div>I re=
moved x11 and run wayland weston instead.</div><div>when i try to run Qt-ci=
nemaexperience as a test I face the following error : <br></div><div>------=
-----<br></div><div>This application failed to start because it couldnt fin=
d or load the <br>Qt pltform plugin &quot;xcb&quot;.</div><div>------------=
</div><div>so, do i need to modify PACKAGECONFIG in <a href=3D"http://qtbas=
e_git.bb">qtbase_git.bb</a> to be able to run qt5 apps on wayland weston ?<=
/div><div><br></div><div>Thanks,<br></div><div>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div>=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div></div>

--0000000000005bd79c05738a1731--
