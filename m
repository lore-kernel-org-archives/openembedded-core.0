Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id A3817750FC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 15:48:20 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id t39-v6so995952qtc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=XBcZ/qs979i/0T2Crc0a4qDL+UyUK+3bnHkQ1iO/1cM=;
	b=upfaJS0IpKzh03B5P24d8Wi/A2JHrEoMbUTg/vYGIu5MixywccJmMXv7o6SJSoEqN8
	AjQcUxPFV6Y0qH1TFzsSFJoztI2LM3Dr8yuVFpKIu0brJVhDtEiUBzHhtJtMuoVRFang
	jtBqsIsVyv4htWPkKjYGVouMkKBidhQvnpw7ja+VQWvjXbUeELuv7J3+RYb3MEc+54B0
	ZLfNucPwtuEG0y0NKIpDCk86R9HE1iwD5jdIFkjbQr1fhX2ItHFFrlqMDl7BuCYqm8o9
	S8dopc7+BCdFrjR1ybHjsE8ptukkVt97pMfTv/5tlthudo/sTrOnS0lhyhMOAA1S97vu
	N4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=XBcZ/qs979i/0T2Crc0a4qDL+UyUK+3bnHkQ1iO/1cM=;
	b=mKaeYsJACpj36+Kv7wUV+T9YsSecctSSG5DVw2oZfdsEn8Hlr7quZVaPGN/pbe4Y/P
	S87/sDCmNciivJOIMJOqETuChaxET9o7v3bj2bysdCOfirG1qW0XioQwloNT6B/VyeJJ
	IO04cahcdlPY3RXHM1H3H6ZSjfmD+jKL1VpGz+XQ4LAe7Iz3mLctXsX0x4FVjwXcilul
	5Ws6fhqngOiloWO7gAm8gyFPfPyhhS1KeuZns1SK942GDfenHR9CxXSLgD9xQaisWkxa
	DoTrULlW0z4RYE8sVpzxW9IZDKph5PlbVkwZ9unyFvpmqAhKBCF/2vfv8LaM4VP+Sj9G
	fNGg==
X-Gm-Message-State: APzg51AwPJz2mHCOr4Q1EbHF8fvNEqbNCP8vDBubHJb83TWY/x5WTZO5
	xK7ds2epP2C43U4wW82uuw2dwQAJNNIkdJsgqOm4Ag==
X-Google-Smtp-Source: ANB0VdZn1r7+0FXHtsig6zJq5nBIUErkz0sgTB5Blh9CWWjAJNWrxvsx1N6Jv7Fq/uqqmePqjddMFY61+OpRKsD8cak=
X-Received: by 2002:ac8:32ea:: with SMTP id
	a39-v6mr27312019qtb.234.1535989701392; 
	Mon, 03 Sep 2018 08:48:21 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Mon, 3 Sep 2018 17:48:08 +0200
Message-ID: <CAGCTLNTD21z7mws1BD7R5W9_wXpG3CtO0Pa=DUNgUfNOWK+L7g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded][qt5] : Text is hidden in Qt5 apps
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
X-List-Received-Date: Mon, 03 Sep 2018 15:48:20 -0000
Content-Type: multipart/alternative; boundary="00000000000087bd2b0574f978af"

--00000000000087bd2b0574f978af
Content-Type: text/plain; charset="UTF-8"

Hi,
I built custom image based on wayland instead of x11
it support Qt5 apps.
I built simple Qt5 app and tried to build it for the custom image to run it
there.
the application is work but the text is hidden !
The same for the test app "Qt5_Cinematicexperience"
No text at all for all films.

Thanks,
-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--00000000000087bd2b0574f978af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I built custom image based on wayland i=
nstead of x11</div><div>it support Qt5 apps.</div><div>I built simple Qt5 a=
pp and tried to build it for the custom image to run it there.<br></div><di=
v>the application is work but the text is hidden !<br></div><div>The same f=
or the test app &quot;Qt5_Cinematicexperience&quot;<br></div><div>No text a=
t all for all films.</div><div><br></div><div>Thanks,<br></div><div>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatur=
e"><div dir=3D"ltr"><div>=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div></div>

--00000000000087bd2b0574f978af--
