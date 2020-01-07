Return-Path: <avirupbanerjee@gmail.com>
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 101217FAAA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 23:59:08 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id u10so690195qvi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2020 15:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=5XZUP3zIlPngGVss0zIxAHDm0yUZiUFALtorbhaWyf8=;
	b=C1Rq272bRgdo2klAt6q6UUYI2Swcq/pjwvIxUJW8G7A0piXiSDNd8u3rAEn8FdkcDg
	TnfH1DiXsXynI42EQtTbuYOJ7LIoT8BBMoQz0dKY9HbDUt6OHLkTuNViOzTJCZGy7KfZ
	dvjslHWYirwDaSAjjHNRoN2TzQ2iyqriS6GTLaUu0rOdajwBaX1sgwi3rh1ENujZi3yf
	mAtQy4+tHT1K9kZ8d1lsA54CMIon4BvjCqT6O50/numFqc6enPlKvfGeQBcSqsJxxSWc
	veiEHLcyRYXDpkChHUyARMgcy5xLP/iwshPZAT1F1EDo9DdXD8uoh+T6QpDP6SrocXrP
	qTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=5XZUP3zIlPngGVss0zIxAHDm0yUZiUFALtorbhaWyf8=;
	b=OTKo9PN4Jo82s5hxsTbw1HBIRJmW0m/bTKQZacrJC4bLTqWGCQb/88BkYzUxO/LYBp
	p0yhGhtAUvPNR889e7VY8/FicBD1ySHTBzjHvu2QpxFWdNIbvZ/9BOeq2IeJo3mJt/U6
	W/LW3ZclvYICyPdbjOFVHYn6kT2Bzen+o0QoXES/3YGClgkLCyWWpxUt3Mi3yXedj5cC
	yQOF3eNF+tKhP8529Lzhiiyt8ohVqKgu3YE6mQNUyF/lZ8bNbFlMcIt2kK8XBfEkaweh
	TGNZ3C0q2BDWWrcbarEb9ZXDX+yrS+/y2Jz8bTKsYG0lcT4gH0P6ggkWoWVjOjSs1gWB
	obcA==
X-Gm-Message-State: APjAAAWfyJLXGJWHlsman/qJv4LQ5k45XoPFycXAh0+/pgYmFmC90qKl
	X4AcNJUV8Hb56IjxEkr+kzXSrq4ZDv0mAxmGLMKlTQ==
X-Google-Smtp-Source: APXvYqwpGYv9gRlILiknaWWWuyAj02OmPirAfZaH0Y/zDnVBMt5rVAUaMJpBDALAT/5H8bxdF1jdTaSERVkGDpVi3mw=
X-Received: by 2002:a05:6214:1907:: with SMTP id
	er7mr1793654qvb.199.1578441548896; 
	Tue, 07 Jan 2020 15:59:08 -0800 (PST)
MIME-Version: 1.0
From: avirup banerjee <avirupbanerjee@gmail.com>
Date: Tue, 7 Jan 2020 15:58:58 -0800
Message-ID: <CABX72JsdeVnq+VfV7ONRZvVT1FMt3kn2Bfr5p5EhVW=h=wy7=w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: How to include coccinelle for linux-backports natively and not from hosttools.
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
X-List-Received-Date: Tue, 07 Jan 2020 23:59:09 -0000
Content-Type: multipart/alternative; boundary="000000000000d21e8f059b958f11"

--000000000000d21e8f059b958f11
Content-Type: text/plain; charset="UTF-8"

Hi

I am building coccinelle as native. Was expecting linux-backports to pick
it up natively instead from /tmp/hosttools. However I see backports always
picks it up from the host. If I remove it from /tmp/hostools the
linux-backports compilation fails with the error "You have unfulfilled
binary requirements". and asks to install spatch on host.

my linux-backports recipe DEPENDS on coccinelle-native.

*-Avi*
-- 




*Avirup BanerjeeUnion CityCalifornia 94587Mob : +19256834651*

--000000000000d21e8f059b958f11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:1rem;color:rgb(49,49,49);word-spacing:1px" dir=
=3D"auto">Hi=C2=A0<br></div><div style=3D"color:rgb(49,49,49);word-spacing:=
1px" dir=3D"auto"><br></div><div style=3D"font-size:1rem;color:rgb(49,49,49=
);word-spacing:1px" dir=3D"auto">I am building coccinelle as native. Was ex=
pecting linux-backports to pick it up natively instead from /tmp/hosttools.=
 However I see backports always picks it up from the host. If I remove it f=
rom /tmp/hostools the linux-backports compilation fails with the error &quo=
t;You have unfulfilled binary requirements&quot;. and asks to install spatc=
h on host.</div><div style=3D"color:rgb(49,49,49);word-spacing:1px" dir=3D"=
auto"><br></div><div style=3D"font-size:1rem;color:rgb(49,49,49);word-spaci=
ng:1px" dir=3D"auto">my linux-backports recipe DEPENDS on coccinelle-native=
.<br></div><div style=3D"color:rgb(49,49,49);word-spacing:1px" dir=3D"auto"=
><br></div><div style=3D"color:rgb(49,49,49);word-spacing:1px" dir=3D"auto"=
><font color=3D"#660000"><i style=3D"font-size:1rem">-Avi</i></font></div>
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><div><p style=3D"text-align:left"><em><fon=
t color=3D"#660000">Avirup Banerjee<br>Union City<br>California 94587<br>Mo=
b : +19256834651</font></em></p></div></div></div>

--000000000000d21e8f059b958f11--
