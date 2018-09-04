Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA4C751D5;
	Tue,  4 Sep 2018 10:12:00 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id z125-v6so1964917qkb.12;
	Tue, 04 Sep 2018 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=wLNe8hUvcVhwIgR0ElGqWC1QW86Fhll/4EAXVmj5uH4=;
	b=ZezVT4SgBtE6eTRCEXZCuWgqxsJlmQkYrkapF7O5CZrLJA6U48Sw2MPk7uG3OC4SGn
	RPCZM0Rw8s6ynF9RUBJS/A9BoanS5jWf0heiWADjMehqXFubmPTnaSN38Zd/Haj3kQ/m
	BpFaNyLQ82EZWPzdsc5sJ/kmjAXHOjU6+o+SQUUn9RKNDAKFEXiXhDquKULclPWbh5Vb
	RpIBOM+6X0ApC8P/s/3+l3ZZHtS8yUjOa35QjrOoKNrtKdUGJjWiiXNnUV8yqnPwKCFj
	5ZhHsrl1vkuchSE3HGgTSLnfbpcknYZ7zpr8lna07IDDrU2g4SPp8M+zVx9R/CDsyegg
	0Bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=wLNe8hUvcVhwIgR0ElGqWC1QW86Fhll/4EAXVmj5uH4=;
	b=LZqn95r7liB6Bd2NTMzexNNZ6z0ylSFH7L/dHn08Maq1RoYFJyw7sHKEDAk4cGtqs7
	THNZnAAPipfVGSRnqjfZy3vxNNo3ZSCtQbGVDGS5wuCFI9H4pE7gPiW0YCeWOg4RqQ+z
	0brnBoLeQpudvIX1Rd3YDbt3391h0oExZKITIqxG7jdVHcgIoTRN7abWAEbeQAvPs/C3
	lxKmGMkU0YAYUWWoh0BPqAZxSo7N714lfhjIbSKbpBPEX9zMgly/a872JlAldhg1z5Ho
	ipljPbt6FljKGYIC94IHpWctXO4JJ9l+Iw9n6bgzxFQPx0fZiU8Klvy4Xhx2jgPyOp+5
	qplw==
X-Gm-Message-State: APzg51Bj9vxM2MjcovH8wsXXf3ZPOres95Yo3bXk/5+takJPMCvIeLt4
	/v24kzPu3u1KOdJF7+3EhlB8tp269C5fJ5KDzWUDnIdv
X-Google-Smtp-Source: ANB0VdYyk932UpNOzVBmpxVS8dgehavZBQqmGBBfxoJoNvResVFoYYJG8gv3DW2X+6+vVUue56YQXZhP74M3/DH69PM=
X-Received: by 2002:a37:4453:: with SMTP id
	r80-v6mr27912060qka.79.1536055921185; 
	Tue, 04 Sep 2018 03:12:01 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Tue, 4 Sep 2018 12:11:49 +0200
Message-ID: <CAGCTLNSmcsfowyhEBXDACoiK4-hfoLAb9RPMius=PKw=Nx8Rwg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 04 Sep 2018 10:12:01 -0000
Content-Type: multipart/alternative; boundary="0000000000008998d7057508e37f"

--0000000000008998d7057508e37f
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

--0000000000008998d7057508e37f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I built custom image based on wayland i=
nstead of x11</div><div>it support Qt5 apps.</div><div>I built simple Qt5 a=
pp and tried to build it for the custom image to run it there.<br></div><di=
v>the application is work but the text is hidden !<br></div><div>The same f=
or the test app &quot;Qt5_Cinematicexperience&quot;<br></div><div>No text a=
t all for all films.</div><div><br></div><div>Thanks,</div><br clear=3D"all=
"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><div>=C2=A0<br>Mohamed Dawod<br></div><div=
>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div>

--0000000000008998d7057508e37f--
