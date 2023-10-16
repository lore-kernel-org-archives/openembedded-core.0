Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F1BCDB482
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 15:23:51 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by mx.groups.io with SMTP id smtpd.web10.127384.1697466963260076964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 07:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=Td2vIkz1;
 spf=pass (domain: web.de, ip: 212.227.15.14, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1697466961; x=1698071761; i=jan.claussen10@web.de;
 bh=EusEbwKK/aE1gYgmneI+CK2MgIBweKxSSiecmFmz5Dk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:Subject;
 b=Td2vIkz16Bf3RFehyBUbLunp3dnU1cvhUJFqrnsgcXzr7MCi72/Oxldcn2xj3bOGB5dfF7Su2lq
 fnswxd7MJiB1lm6/cmCJlRmuWI4AOPZAETJFACaNxRETYLuilA0jgy3RJQTYzC6axAdbqzwKu6l3a
 wgyk0f3zHpkuLGisKkpXCva3oPCQYieJT3RGbc/pIEHppG1fEBqJPO5o047dGHxbKLzuLCaKF7vfy
 tsZiSvPbh3Zl841bezfQgWtHISy7BNdvU9R4mG2oC1ju/YuMQZBqodaoxcOKNXQNnpxR9xlxNJ0td
 yYDZlQvs7l67AdCnZufuU+IkVAOyxn88sCPw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([84.46.45.50]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWzD3-1r36400oe1-00XHyN; Mon, 16
 Oct 2023 16:36:01 +0200
Date: Mon, 16 Oct 2023 16:36:00 +0200
From: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "=?utf-8?Q?openembedded-core=40lists.openembedded.org?="
 <openembedded-core@lists.openembedded.org>
Message-ID: <57ABDE7C-6168-452F-9B11-AC2D2F95FBB0@getmailspring.com>
In-Reply-To: <CANNYZj-MH8MMbUT5PAKyyH9xMwYpYD8aqa4Q3QkjyCcPqT0LHw@mail.gmail.com>
References: <CANNYZj-MH8MMbUT5PAKyyH9xMwYpYD8aqa4Q3QkjyCcPqT0LHw@mail.gmail.com>
Subject: Re: [OE-core] Feature request: Add btop resource monitor
X-Mailer: Mailspring
MIME-Version: 1.0
X-Provags-ID: V03:K1:IQqTpthf+98BnQ/AW2208xkuqH9UnGJJRE2AZ3v/OqKe/2SllLx
 3YsXP78e4hHXRx8X9ugombohuO5jNjfjo+GiQdJolqTdXen1lfjc1YfvI+Vn3JfXYCe8cUV
 bd2UuyCod7FtkTB4eniM/qbkWfrAU/jCGqU94cpL9+9FgpHjmEjQCCP1ixc0RQe8KVqRJUm
 suiQcm4b309xIFTxygE5w==
UI-OutboundReport: notjunk:1;M01:P0:Nag4bgrcKW8=;nDjsE+Ol/zdPo71KPVXSedg3es/
 oMdknkKxpSSh6vWCzMEL0GTwBVB1+KeWeKlOfzfXl8RrQOGX+zdachU5X5Vc10/HpFSYLr7ph
 6v3msebWobWlVtJhY9d4X001l4vCPW+ZPofPqSO2qLLgEMSq8y1TepkwX/nScV/z2HMn8/vdm
 9nHsH+FFX2w4wNKW9DhSE1ZMBWzdTku945vGNBwFfRZA0J5EN0x1pQJzBKWAY3cXh07eArKhY
 JSqDO4h0xDIoQntBIHvz500eovmD/oKxlDBVJafO+Ubiqt/s6ejMBO6rEZUGyNjokse7o0hTk
 /+fG3C0guur4aFSqcQyLW0Fg0JaWDFO5tE5JeQFJC3FOpN2FWMrDBb5bNpF7/K2V1GL/Al03Y
 JGSRBTg+GxlClKQbjHy0DfNU9hujdPgt3d3o4t89H8D92ZqKctbprTh6OncXRUtwiKMgr6JIE
 hKqGDU4h+9XXvGOT12HAylmjr2i9+8EmTJYG7zHtd6TsU5CfoPcNlomERMRsmbJ0qxuS3ni37
 kSAKvRNzcCDZy8MyoogkyB07qVgR72PRVTULfOymg8KQZyxJWDQ2D2Ls4SWBPcGKu7pv1VJgf
 u9BbQzxh3H2e+X15IK3p9qwr+YMmMP23pYTGMRqOmI4/Uq5yXpUkW6HMeLq3fsW4x5lByAv+R
 4/Hi9rpAOky2fR14IKBxY9Ob7wUB6RkkacKYovJLHWux0IRepyeYT/dJvbkNPC41wVtTBxkni
 RJNHYrGN1qGzk1/pkr8rT4cibAiyiBoGMrlPg4Z5SUYMHJAXVgQoi+/pryY3HTng5tCtYSI9d
 gPKy6tB3C8fOZrGDTjJbbYolOfL4Iq2uQ58yTrQn0asf39Pfx8nAH5NbjX9hDwH3SiY0BruAc
 8HIVZAexSFvqsdj3QkA19lrJTkB+zjbzGGnqs0UpBOpZ295DJPrpFLNH5wKqHE8VqTnvxwriJ
 QOuleQ==
Content-Type: multipart/alternative; boundary="652d4a50_667317ec_62a44"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 15:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189297

--652d4a50_667317ec_62a44
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I already sent a request to meta-oe. So this request here is cancelled.

On Okt. 16 2023, at 3:41 pm, Alexander Kanavin <alex.kanavin@gmail.com> wro=
te:
> Non-essential utilities like this should be going to one of the layers
> in meta-openembedded.
>
> Alex
>
> On Sat, 14 Oct 2023 at 23:07, Jan Clau=C3=9Fen <jan.claussen10@web.de> wr=
ote:
> >
> > Hi guys,
> >
> > I would like to add btop to the openembedded-core. The package does now=
 support cmake, which eases the maintenance effort.
> > Before it would have involved a lot of patching as seen here. The Cmake=
 support is listed as community maintained though, if that is a show stoppe=
r.
> >
> > tree 7370f6d34c4f1a7d3aed8ef4dc334de1e271e4b3
> > parent d59f6c752927f7846dc11c4aa00a2d0c9860e75c
> > author Jan Clau=C3=9Fen <jan.claussen10@web.de> Sat Oct 14 22:56:45 202=
3 +0200
> > committer Jan Clau=C3=9Fen <jan.claussen10@web.de> Sat Oct 14 22:56:45 =
2023 +0200
> >
> > recipes-support: Add btop
> >
> >
> > diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/reci=
pes-support/btop/btop_1.2.13.bb
> > new file mode 100644
> > index 000000000..f780a993a
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > @@ -0,0 +1,23 @@
> > +SUMMARY =3D "Resource monitor that shows usage and stats for processor=
, memory, disks, network and processes."
> > +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> > +SECTION =3D "console/utils"
> > +
> > +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;b=
ranch=3Dmain"
> > +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
> > +FILES:${PN} +=3D " \
> > + /usr/share/icons \
> > + /usr/share/icons/hicolor \
> > + /usr/share/icons/hicolor/48x48 \
> > + /usr/share/icons/hicolor/scalable \
> > + /usr/share/icons/hicolor/48x48/apps \
> > + /usr/share/icons/hicolor/48x48/apps/btop.png \
> > + /usr/share/icons/hicolor/scalable/apps \
> > + /usr/share/icons/hicolor/scalable/apps/btop.svg \
> > +"
> >
> >
> >=20
> >
>


--652d4a50_667317ec_62a44
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>I already sent a request to meta-oe. So this request here is cancelled=
.</div><br><div class=3D"gmail_quote_attribution">On Okt. 16 2023, at 3:41 =
pm, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:</div><blockquot=
e><div><div>Non-essential utilities like this should be going to one of the=
 layers</div><div>in meta-openembedded.</div><br><div>Alex</div><br><br><di=
v>On Sat, 14 Oct 2023 at 23:07, Jan Clau=C3=9Fen &lt;jan.claussen10@web.de&=
gt; wrote:</div><div>&gt;</div><div>&gt; Hi guys,</div><div>&gt;</div><div>=
&gt; I would like to add btop to the openembedded-core. The package does no=
w support cmake, which eases the maintenance effort.</div><div>&gt; Before =
it would have involved a lot of patching as seen here. The Cmake support is=
 listed as community maintained though, if that is a show stopper.</div><di=
v>&gt;</div><div>&gt; tree 7370f6d34c4f1a7d3aed8ef4dc334de1e271e4b3</div><d=
iv>&gt; parent d59f6c752927f7846dc11c4aa00a2d0c9860e75c</div><div>&gt; auth=
or Jan Clau=C3=9Fen &lt;jan.claussen10@web.de&gt; Sat Oct 14 22:56:45 2023 =
+0200</div><div>&gt; committer Jan Clau=C3=9Fen &lt;jan.claussen10@web.de&g=
t; Sat Oct 14 22:56:45 2023 +0200</div><div>&gt;</div><div>&gt; recipes-sup=
port: Add btop</div><div>&gt;</div><div>&gt;</div><div>&gt; diff --git a/me=
ta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipes-support/btop/bt=
op_1.2.13.bb</div><div>&gt; new file mode 100644</div><div>&gt; index 00000=
0000..f780a993a</div><div>&gt; --- /dev/null</div><div>&gt; +++ b/meta-oe/r=
ecipes-support/btop/btop_1.2.13.bb</div><div>&gt; @@ -0,0 +1,23 @@</div><di=
v>&gt; +SUMMARY =3D "Resource monitor that shows usage and stats for proces=
sor, memory, disks, network and processes."</div><div>&gt; +HOMEPAGE =3D "h=
ttps://github.com/aristocratos/btop"</div><div>&gt; +LICENSE =3D "Apache-2.=
0"</div><div>&gt; +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"</div><div>&gt; +SECTION =3D "console/utils"</div><div>=
&gt; +</div><div>&gt; +SRC_URI =3D "git://github.com/aristocratos/btop.git;=
protocol=3Dhttps;branch=3Dmain"</div><div>&gt; +SRCREV =3D "2a864f6f2ea60df=
16b3f015885eb3c18a48b9b78"</div><div>&gt; +</div><div>&gt; +S =3D "${WORKDI=
R}/git"</div><div>&gt; +</div><div>&gt; +inherit cmake</div><div>&gt; +</di=
v><div>&gt; +FILES:${PN} +=3D " \</div><div>&gt; + /usr/share/icons \</div>=
<div>&gt; + /usr/share/icons/hicolor \</div><div>&gt; + /usr/share/icons/hi=
color/48x48 \</div><div>&gt; + /usr/share/icons/hicolor/scalable \</div><di=
v>&gt; + /usr/share/icons/hicolor/48x48/apps \</div><div>&gt; + /usr/share/=
icons/hicolor/48x48/apps/btop.png \</div><div>&gt; + /usr/share/icons/hicol=
or/scalable/apps \</div><div>&gt; + /usr/share/icons/hicolor/scalable/apps/=
btop.svg \</div><div>&gt; +"</div><div>&gt;</div><div>&gt;</div><div>&gt; <=
/div><div>&gt;</div></div></blockquote>

--652d4a50_667317ec_62a44--

