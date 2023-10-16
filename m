Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBA5C41513
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 15:23:51 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web11.127518.1697467017926916010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 07:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=GKd80AOa;
 spf=pass (domain: web.de, ip: 217.72.192.78, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1697467015; x=1698071815; i=jan.claussen10@web.de;
 bh=3r08U1b66tW5/Q3QTP0vLC4YhvHLM92fwGr9Xi8lujs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:Subject;
 b=GKd80AOagf2kWHZ6vvCjgLU64/rxBcJS++EwpSXgbLh/iu9GA8dwWNmbUpwasn0JP+ZpgYsCvtm
 Os6kfpl1ojYPR76CrYqoJsdMKL35ZVjjBCcb5G6wU/lsGdnLrYN37a5kr7tHyN2k4by5TB/ZQLCm4
 EnDzEawjlBZOHb9aHFhNWRP0cNpacBPS6AnDbThE+jZqXVCkdYp2Wy1ybWVDKbP8efJOhu5w4Y+v8
 oFurPiGrA4pbi5HFHpNnF9DQH39LaN1bYoPN1Kr8+sg/nYeiY2J+E2MBYmTPxyMNmM6AIZtYiq4ZJ
 hnMDQVrdzzAEVSSmlTpf63UUUjkxN9wXfWIQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([84.46.45.50]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlsKH-1rJF1I1BhL-00izkq; Mon, 16
 Oct 2023 16:36:55 +0200
Date: Mon, 16 Oct 2023 16:36:54 +0200
From: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: "=?utf-8?Q?openembedded-core=40lists.openembedded.org?="
 <openembedded-core@lists.openembedded.org>
Message-ID: <CD489AC6-3625-4B05-8823-DFAC2FB2A3C8@getmailspring.com>
In-Reply-To: <CAO5Uq5T-cX0_pecLmLfB7vjQYK358SupgG0EjKFvhBEEJektsg@mail.gmail.com>
References: <CAO5Uq5T-cX0_pecLmLfB7vjQYK358SupgG0EjKFvhBEEJektsg@mail.gmail.com>
Subject: Re: [OE-core] Feature request: Add btop resource monitor
X-Mailer: Mailspring
MIME-Version: 1.0
X-Provags-ID: V03:K1:OyzM/oEZk3QzH0fIPBEticGFt2LaZM9UJmDVQBWwUL/ZoW/w+8A
 aZM5aD0/vKa+ZR2SjNfyjItlPMBOBlDmczzSiIjSt6gYVvIR41WQtas8tpoqDMtktUXXLaD
 BXiXQpMDRQzlIXeXlYGDdncOUQpVD7WiF0qNxpC1N297N2g0p14OtzK43H5iemDOEZIuU3u
 vDvgV5hS7IOanAXIWXSkg==
UI-OutboundReport: notjunk:1;M01:P0:+55yu7ZZX7g=;WgMFbuwEXGeIK2Sz0+6kzylQR1w
 DSOeQPkmitUpyTFwl3JJ+OXTrPa1g3M6A99/1l4BXJXPZz4u470o9rywEE5PYzWRdGtA+F0ns
 sZe1vZ3y+TmEoQLamTbSQOsUw8d5x+dxGInmyqBwWYZeTFaMvT4Ku1nvV/SimnpxUoUpHMlEc
 UQikR/Fllw8gCmP0dCSBmc7PKAg+zzQd/LE3yyCa1bR8uNckxvMOo+BtBfQ504onHy3ckG+R4
 InuBC6ILoK6sVPq7nSYrSgO3YaSGIcLqgBpPcmcaHx9qT+uO1l9n+K7fVqeA7TvubAeF6NZDL
 DCsNU9zOLJITrNVbAIIYveozoe9NJnKrVZcAtUiBDINpboONDZUK/nVl7uW3KgEaG5842m0eM
 dNCGDoNomhnpZIde+OfbAkFJdwj6PjaV3WEY43B7Ze0nFvXf4kxjks26R9Ut/1LaZ+YUQXYA/
 /8FeH6M1g22J03Xf3ftKcZ15blINdBNolS0nGM+nqdqv+gDv0eXbR46W0jpmjJ5CD2jf2bIEU
 a/E8namZj9nKYfzlTOQPeRfHY3wZIxdBgNtB0OdVm5mTXmJNmHgh2+xBECI8ocPYVhI3BDjND
 kZ/xyDBLDmb+7h7xpIG2L59YlDTloTEvEk3BYOUoTqDNHAlguA0qgqCJf3EHirPaEwluwJgiY
 YdvXuKn6Yd+VWZ1/+egPH5DH1RXArG/PSVmaf6LONdhk2RRFVAigBvLDM4eH7Bc0SUxQ5bCvV
 pBTMa8F+7WDCN6n858SDGzwargJP7StB7/rvH/W0tBPMjcfim1Xx803rFL7ZPw59Ah682Khhq
 kdHz6YT1jgWn8GMvAKroe2tkSvt+vkPbCHEhjpjTBqQpRnNWn4QbxJw1HjbBJOTthOREX/Zxf
 LKgVIRB5m+iwiL6R/Kzrb08GtUDjhqBmkX19kQUY3o7W83R3BJqlGD/Hw2lE/SVCHgz35WOax
 No8R2np8a3Qitec2dBtf7IL+avM=
Content-Type: multipart/alternative; boundary="652d4a86_4e8da301_62a44"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 15:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189298

--652d4a86_4e8da301_62a44
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Yes, I just sent it to the wrong mailing list apparently.

On Okt. 16 2023, at 10:20 am, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> On Sat, Oct 14, 2023 at 10:11=E2=80=AFPM Jan Clau=C3=9Fen <jan.claussen10=
@web.de> wrote:
> >
> > Another thing is that btop is dependent on a utf-8 locale being set. Yo=
u can still run it with the --force-utf8 flag though. Should this be set by=
 the recipe as well?
> >
> > On Okt. 14 2023, at 11:06 pm, Jan Clau=C3=9Fen <jan.claussen10@web.de> =
wrote:
> >
> > Hi guys,
> >
> > I would like to add btop to the openembedded-core. The package does now=
 support cmake, which eases the maintenance effort.
> > Before it would have involved a lot of patching as seen here. The Cmake=
 support is listed as community maintained though, if that is a show stoppe=
r.
> >
>
> Feels more like meta-oe rather than oe-core (and the recipe path you
> have suggests that's what you intended!)
>
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
>
> You only need the top level directory as the packaging recursively
> globs. Also this should be ${datadir}/icons
>
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
> >
> >=20
> >
>
>
> --
> Alex Kiernan
>


--652d4a86_4e8da301_62a44
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Yes, I just sent it to the wrong mailing list apparently. </div><br><d=
iv class=3D"gmail_quote_attribution">On Okt. 16 2023, at 10:20 am, Alex Kie=
rnan &lt;alex.kiernan@gmail.com&gt; wrote:</div><blockquote><div><div>On Sa=
t, Oct 14, 2023 at 10:11=E2=80=AFPM Jan Clau=C3=9Fen &lt;jan.claussen10@web=
.de&gt; wrote:</div><div>&gt;</div><div>&gt; Another thing is that btop is =
dependent on a utf-8 locale being set. You can still run it with the --forc=
e-utf8 flag though. Should this be set by the recipe as well?</div><div>&gt=
;</div><div>&gt; On Okt. 14 2023, at 11:06 pm, Jan Clau=C3=9Fen &lt;jan.cla=
ussen10@web.de&gt; wrote:</div><div>&gt;</div><div>&gt; Hi guys,</div><div>=
&gt;</div><div>&gt; I would like to add btop to the openembedded-core. The =
package does now support cmake, which eases the maintenance effort.</div><d=
iv>&gt; Before it would have involved a lot of patching as seen here. The C=
make support is listed as community maintained though, if that is a show st=
opper.</div><div>&gt;</div><br><div>Feels more like meta-oe rather than oe-=
core (and the recipe path you</div><div>have suggests that's what you inten=
ded!)</div><br><div>&gt; tree 7370f6d34c4f1a7d3aed8ef4dc334de1e271e4b3</div=
><div>&gt; parent d59f6c752927f7846dc11c4aa00a2d0c9860e75c</div><div>&gt; a=
uthor Jan Clau=C3=9Fen &lt;jan.claussen10@web.de&gt; Sat Oct 14 22:56:45 20=
23 +0200</div><div>&gt; committer Jan Clau=C3=9Fen &lt;jan.claussen10@web.d=
e&gt; Sat Oct 14 22:56:45 2023 +0200</div><div>&gt;</div><div>&gt; recipes-=
support: Add btop</div><div>&gt;</div><div>&gt;</div><div>&gt; diff --git a=
/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipes-support/btop=
/btop_1.2.13.bb</div><div>&gt; new file mode 100644</div><div>&gt; index 00=
0000000..f780a993a</div><div>&gt; --- /dev/null</div><div>&gt; +++ b/meta-o=
e/recipes-support/btop/btop_1.2.13.bb</div><div>&gt; @@ -0,0 +1,23 @@</div>=
<div>&gt; +SUMMARY =3D "Resource monitor that shows usage and stats for pro=
cessor, memory, disks, network and processes."</div><div>&gt; +HOMEPAGE =3D=
 "https://github.com/aristocratos/btop"</div><div>&gt; +LICENSE =3D "Apache=
-2.0"</div><div>&gt; +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57"</div><div>&gt; +SECTION =3D "console/utils"</div><d=
iv>&gt; +</div><div>&gt; +SRC_URI =3D "git://github.com/aristocratos/btop.g=
it;protocol=3Dhttps;branch=3Dmain"</div><div>&gt; +SRCREV =3D "2a864f6f2ea6=
0df16b3f015885eb3c18a48b9b78"</div><div>&gt; +</div><div>&gt; +S =3D "${WOR=
KDIR}/git"</div><div>&gt; +</div><div>&gt; +inherit cmake</div><div>&gt; +<=
/div><div>&gt; +FILES:${PN} +=3D " \</div><div>&gt; + /usr/share/icons \</d=
iv><br><div>You only need the top level directory as the packaging recursiv=
ely</div><div>globs. Also this should be ${datadir}/icons</div><br><div>&gt=
; + /usr/share/icons/hicolor \</div><div>&gt; + /usr/share/icons/hicolor/48=
x48 \</div><div>&gt; + /usr/share/icons/hicolor/scalable \</div><div>&gt; +=
 /usr/share/icons/hicolor/48x48/apps \</div><div>&gt; + /usr/share/icons/hi=
color/48x48/apps/btop.png \</div><div>&gt; + /usr/share/icons/hicolor/scala=
ble/apps \</div><div>&gt; + /usr/share/icons/hicolor/scalable/apps/btop.svg=
 \</div><div>&gt; +"</div><div>&gt;</div><div>&gt;</div><div>&gt;</div><div=
>&gt; </div><div>&gt;</div><br><br><div>--</div><div>Alex Kiernan</div></di=
v></blockquote>

--652d4a86_4e8da301_62a44--

