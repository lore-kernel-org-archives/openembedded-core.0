Return-Path: <tdhammer99@gmail.com>
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail.openembedded.org (Postfix) with ESMTP id E1297601F6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 15:28:36 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id w25so21465261otm.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 07:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=/zmmzBUB9pA0tAzAQybpFzpA6nRdpo8erGsiTq/4AYg=;
	b=jRaBMOt5GEub6q52bi2p3LskXqr4reaw0fbE1i0mvszPBvblPVTiZrdF9/BwSv146U
	0g9C7r7EbW9sb1UWeFz17tZHgB1Pdy3771iNYEVJReEsavWeO7D8gjct5ozKN2TtCIsS
	NK1dMqWpTDBqBJ3UD8vcoXcPviuf0V9skuDQtcON+WUk4YIfLgMEb3AW7u6aHlEI832D
	0HY7N+AyLq9gxIua9HATOolOPk/CwWminuUESKjb+hlczOwPL11XfBPKpEicP1LZcmDO
	jtq2qiEb7X2a98u8gTxrs9eaGWvUF04GHp55qlX58m/kfxxs2I/3JTNR47CarOkIeuBS
	YwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=/zmmzBUB9pA0tAzAQybpFzpA6nRdpo8erGsiTq/4AYg=;
	b=GUAxQgUPhRi5JoEpht+Nhz1kqG1wC0XIbggT05WzeFo5eyw25mvL8jSKmfJJUGhctL
	XhmtOFJvvo/D9tgpjjUjpvx6faD9tQheoCI8nRU4ljYn6H2WYpo0LBee2qjYJgnVL4pU
	zIPrCYwqGMAtDWD+HRKOo2c26A5cSeMhUebPw+bjsJaGBI82G28R0jlyyYcLR1fC6/Ie
	QTk7LMF7J0ECJ3KYCjn3CC1gy6FLc+7pp2+4aozsFvIA5hAYflAR6tYO7hoJME4pa13H
	c8XC6qtKKXLr9CO4AwkZbgICp0I/uRsrgHlBLVFBBq8JOMuCKwruiqGz0WM1ZFiEs9v+
	C/Vw==
X-Gm-Message-State: AHQUAuZmHAennIeJmF/0Yf3vLnPJdZnecQxIRakUuy1TG8c3rODUb9Wj
	o4xMeZP5BamxGhcnaoDzSkDiTccIvf21/alYJscR8l4cZwI=
X-Google-Smtp-Source: AHgI3IYkCw4yq+pKNJqXjK1Ut7zL9xSEEy5w+gcMtfTfP8cW3ner4WOt13ZJ/1vTOdT8b+7uEBGWX6002jG8qE8n6pA=
X-Received: by 2002:aca:cf8d:: with SMTP id f135mr9362313oig.14.1550330917691; 
	Sat, 16 Feb 2019 07:28:37 -0800 (PST)
MIME-Version: 1.0
From: Tim Hammer <tdhammer99@gmail.com>
Date: Sat, 16 Feb 2019 10:28:26 -0500
Message-ID: <CALh9vaUZ1CEYJYO7B2SBN1k57kmXqKQEkz6uwhwKLMFYepdT3g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: U-Boot FW utilities
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
X-List-Received-Date: Sat, 16 Feb 2019 15:28:37 -0000
Content-Type: multipart/alternative; boundary="000000000000a22a950582048bb4"

--000000000000a22a950582048bb4
Content-Type: text/plain; charset="UTF-8"

Building the u-boot-fw-utils recipe fails on the default configuration for
my custom board, e.g.
     | ***
     | *** Can't find default configuration
"arch/../configs/myboard_defconfig"
     | ***
     | scripts/kconfig/Makefile:121: recipe for target 'myboard_defconfig'
failed

I can modify this recipe to add the same patches that are in the u-boot
recipe append, but am wondering if I am missing something "simpler" that
would share the patches already in u-boot?


Alternatively, I attempted to build the envtools target in the u-boot
recipe append file, but some include/generated/ header files were missing.
I am guessing I could also modify the configure step, but am not confident
enough in understanding OE processing to think this will be easy/simple.

Any other options I have not considered?
Thanks!
-- 
.Tim

--000000000000a22a950582048bb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Building the u-boot-fw-utils recipe fails on the default c=
onfiguration for my custom board, e.g.<div>=C2=A0 =C2=A0 =C2=A0| ***</div><=
div>=C2=A0 =C2=A0 =C2=A0| *** Can&#39;t find default configuration &quot;ar=
ch/../configs/myboard_defconfig&quot;</div><div>=C2=A0 =C2=A0 =C2=A0| ***</=
div><div>=C2=A0 =C2=A0 =C2=A0| scripts/kconfig/Makefile:121: recipe for tar=
get &#39;myboard_defconfig&#39; failed</div><div><div><br></div><div>I can =
modify this recipe to add the same patches that are in the u-boot recipe ap=
pend, but am wondering if I am missing something &quot;simpler&quot; that w=
ould share the patches already in u-boot?</div><div><br></div><div><br></di=
v><div>Alternatively, I attempted to build the envtools target in the u-boo=
t recipe append file, but some include/generated/ header files were missing=
. I am guessing I could also modify the configure step, but am not confiden=
t enough in understanding OE processing to think this will be easy/simple.<=
/div><div><br></div><div>Any other options I have not considered?</div></di=
v>Thanks!<div>--=C2=A0<div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><span style=3D"font-family:arial =
narrow,sans-serif">.Tim</span><br></div></div></div></div>

--000000000000a22a950582048bb4--
