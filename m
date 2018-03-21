Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id C447278974
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:06:51 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id f6so2794465vkh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 04:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=aViO/ZZC8VFnVNR8M1sPQSYuKt78nW78zQEb6PdHnow=;
	b=GFJ5ld3CvT3ipLzglq9ioy5YUVTLXON8ENbLS1D/MH/3TTvY/SPeGu1Jw++0bVDTJL
	LbykCPYEA81wpDYCiT2heR/v5bFu2dLMw5EPpw0/JYmxiNMTqyfKrTV6awXepWltameV
	KTK/7bpA9bkUJgBuWMntnBU0if8ZTOMsxuMhWnxT7knNcjltkv5Q2jmTKkFAWHwn3rcp
	dNFaqfJuXObwtkTaYnxBR/DkATXgQJ1g4/QhLvTzH1NLsYeKGqLO/CA47F4XUlwyHgXd
	f6eBszOt1wfkA1mfDQJ1VXv/rYX460YgCPMyY7pQa+yDqtKbAhFD/DvtmTX4bf9Fasi6
	iNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=aViO/ZZC8VFnVNR8M1sPQSYuKt78nW78zQEb6PdHnow=;
	b=ZzXgNWkfTDt40Kt6nr/sOBH7tiMputvdyOpOoOrvkEkmQtAq868vmrpacbTLg6IPnT
	ehZCi68IFEQQrpuppWNjtdkM0aTh4rsSSWun7CJ/LCXinUXHfJIWkU1lPlf81JndKHbP
	D7TYeK2/91HOB7vLc9tq4T45pzX2OhIkoz3gSabXFFRINkwQf+88UKEEDD/Pst0s6nM8
	mqvDbqsprQNASba97Hmn9rTwqmcR4i/W4AOSEjMpxcSV/HoTAaksmPd7GNFldELa0h0o
	+W+ubH93BnomA3vZgf4yasRQ693VaF5S7nGPcubebaR7/ylpRh2tIGs7hvFOKufJ15qV
	+aRQ==
X-Gm-Message-State: AElRT7E527kXwdqI94LbEOdJZ/R7pSNMw56SsGnx0pyHt9u/lH/tlI1+
	6e9OJaVBBTSBmARJrgLtpO6ENYNuMmI5ufO1wtsCa3Yw
X-Google-Smtp-Source: AG47ELuHx+xlVdHqG/2rI3/4uXRllVPC39c0kUpTtvYdFSEliZTkkeqihJ3fqRkAp3gHp8TagRnDm6TV2FBrOxW0dwY=
X-Received: by 10.31.134.147 with SMTP id i141mr12650617vkd.128.1521630095971; 
	Wed, 21 Mar 2018 04:01:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Wed, 21 Mar 2018 04:01:35 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Wed, 21 Mar 2018 16:31:35 +0530
Message-ID: <CAPGMVzGS2LNAL2nAM7JABJgPF=wrw4+1aeEdXPxAy_xOyekK8A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: meta data error while building
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
X-List-Received-Date: Wed, 21 Mar 2018 11:06:51 -0000
Content-Type: multipart/alternative; boundary="001a1141103859a8600567ea1df3"

--001a1141103859a8600567ea1df3
Content-Type: text/plain; charset="UTF-8"

The below is the error while building core-image-sato, this error popped
after i including the line : PACKAGECONFIG_pn-opencv = "python2"

Please help me with the solution



           ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_configure,
the basehash value changed from 5d45ab9eb20c7583ac1edaab00e92e7d to
bed406587156555087b16ce65e70811f. The metadata is not deterministic and
this needs to be fixed.
ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_compile,
the basehash value changed from 9b38ab297fe83e0397582fc241ec269b to
3e073d16f43dd6d1aafbfc77c0e5c193. The metadata is not deterministic and
this needs to be fixed.
ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_install,
the basehash value changed from 4e71f923f6dce32b7d98e1a016de76c9 to
1cbe08c06c4c74f7f4765b2b5ca43449. The metadata is not deterministic and
this needs to be fixed.
ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_build, the
basehash value changed from 77ff16e3d2d174337fc64b171c35e34c to
f8c231359c972ada4c1acdfeb4139a61. The metadata is not deterministic and
this needs to be fixed.
ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_package,
the basehash value changed from bd69a16a7e8681701ed1bcb838350140 to
609508e260f4448bdecfa6fc14a648fc. The metadata is not deterministic and
this needs to be fixed.
ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_packagedata,
the basehash value changed from 5536cec6dc8957b6d48670b030ca78d4 to
7f342767cb91e19d4718fd437a37e259. The metadata is not deterministic and
this needs to be fixed.
ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_package_write_deb,
the basehash value changed from 87e31ea755f9b76dce7ae72fe34299b1 to
24719e85cf15c36f5b18cd6837841463. The metadata is not deterministic and
this needs to be fixed.
ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_rootfs,
the basehash value changed from d3cb3148fa62977844e3acc707212156 to
41805c6bbbbe7544554ad2887c85ae8e. The metadata is not deterministic and
this needs to be fixed.
ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_image, the
basehash value changed from f6b739ca1cfbc47bd8d14904c64d044b to
e1abbf58b56b9f1614a1f352f715a56f. The metadata is not deterministic and
this needs to be fixed.
ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_image_complete,
the basehash value changed from 2ecdd58b8f372fb25ead31b8b04c47fa to
13be28bfaf5214958bd047d9c7682e24. The metadata is not deterministic and
this needs to be fixed.
ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_image_tar,
the basehash value changed from 7ba819c63a822ea5f5e7ce817c642127 to
36b2b07ea59c24b0e089467790f51829. The metadata is not deterministic and
this needs to be fixed.
ERROR: When reparsing
/home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_image_ext4,
the basehash value changed from 09e97f15239508528e29bb300d6a2c99 to
48adebf1ecd497028b62e8a19fd21e0d. The metadata is not deterministic and
this needs to be fixed.

--001a1141103859a8600567ea1df3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The below is the error while building core-image-sato=
, this error popped after i including the line : PACKAGECONFIG_pn-opencv =
=3D &quot;python2&quot;<br><br></div>Please help me with the solution<br><d=
iv>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br><br><br=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERROR: When r=
eparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_c=
onfigure, the basehash value changed from 5d45ab9eb20c7583ac1edaab00e92e7d =
to bed406587156555087b16ce65e70811f. The metadata is not deterministic and =
this needs to be fixed.<br>ERROR: When reparsing /home/jarvis/poky/meta/rec=
ipes-sato/images/core-image-sato.bb.do_compile, the basehash value changed =
from 9b38ab297fe83e0397582fc241ec269b to 3e073d16f43dd6d1aafbfc77c0e5c193. =
The metadata is not deterministic and this needs to be fixed.<br>ERROR: Whe=
n reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.d=
o_install, the basehash value changed from 4e71f923f6dce32b7d98e1a016de76c9=
 to 1cbe08c06c4c74f7f4765b2b5ca43449. The metadata is not deterministic and=
 this needs to be fixed.<br>ERROR: When reparsing /home/jarvis/poky/meta/re=
cipes-sato/images/core-image-sato.bb.do_build, the basehash value changed f=
rom 77ff16e3d2d174337fc64b171c35e34c to f8c231359c972ada4c1acdfeb4139a61. T=
he metadata is not deterministic and this needs to be fixed.<br>ERROR: When=
 reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do=
_package, the basehash value changed from bd69a16a7e8681701ed1bcb838350140 =
to 609508e260f4448bdecfa6fc14a648fc. The metadata is not deterministic and =
this needs to be fixed.<br>ERROR: When reparsing /home/jarvis/poky/meta/rec=
ipes-sato/images/core-image-sato.bb.do_packagedata, the basehash value chan=
ged from 5536cec6dc8957b6d48670b030ca78d4 to 7f342767cb91e19d4718fd437a37e2=
59. The metadata is not deterministic and this needs to be fixed.<br>ERROR:=
 When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.=
bb.do_package_write_deb, the basehash value changed from 87e31ea755f9b76dce=
7ae72fe34299b1 to 24719e85cf15c36f5b18cd6837841463. The metadata is not det=
erministic and this needs to be fixed.<br>ERROR: When reparsing /home/jarvi=
s/poky/meta/recipes-sato/images/core-image-sato.bb.do_rootfs, the basehash =
value changed from d3cb3148fa62977844e3acc707212156 to 41805c6bbbbe7544554a=
d2887c85ae8e. The metadata is not deterministic and this needs to be fixed.=
<br>ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-i=
mage-sato.bb.do_image, the basehash value changed from f6b739ca1cfbc47bd8d1=
4904c64d044b to e1abbf58b56b9f1614a1f352f715a56f. The metadata is not deter=
ministic and this needs to be fixed.<br>ERROR: When reparsing /home/jarvis/=
poky/meta/recipes-sato/images/core-image-sato.bb.do_image_complete, the bas=
ehash value changed from 2ecdd58b8f372fb25ead31b8b04c47fa to 13be28bfaf5214=
958bd047d9c7682e24. The metadata is not deterministic and this needs to be =
fixed.<br>ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/=
core-image-sato.bb.do_image_tar, the basehash value changed from 7ba819c63a=
822ea5f5e7ce817c642127 to 36b2b07ea59c24b0e089467790f51829. The metadata is=
 not deterministic and this needs to be fixed.<br>ERROR: When reparsing /ho=
me/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_image_ext4, t=
he basehash value changed from 09e97f15239508528e29bb300d6a2c99 to 48adebf1=
ecd497028b62e8a19fd21e0d. The metadata is not deterministic and this needs =
to be fixed.<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br></div></=
div>

--001a1141103859a8600567ea1df3--
