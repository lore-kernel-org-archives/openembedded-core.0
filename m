Return-Path: <adrian.freihofer@neratec.com>
Received: from mail.neratec.com (mail.neratec.com [46.140.151.2])
	by mail.openembedded.org (Postfix) with ESMTP id A3AC17700D;
	Fri, 18 Sep 2015 10:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.neratec.com (Postfix) with ESMTP id 342848BCAA3;
	Fri, 18 Sep 2015 12:33:42 +0200 (CEST)
Received: from mail.neratec.com ([127.0.0.1])
	by localhost (mail.neratec.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id c9PHWHRc5Xz0; Fri, 18 Sep 2015 12:33:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.neratec.com (Postfix) with ESMTP id 0657B8BCA9F;
	Fri, 18 Sep 2015 12:33:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at neratec.com
Received: from mail.neratec.com ([127.0.0.1])
	by localhost (mail.neratec.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IEq9f0CTmxNk; Fri, 18 Sep 2015 12:33:41 +0200 (CEST)
Received: from mail.neratec.com (mail.neratec.com [192.168.11.23])
	by mail.neratec.com (Postfix) with ESMTP id BD6798BCAA3;
	Fri, 18 Sep 2015 12:33:41 +0200 (CEST)
Date: Fri, 18 Sep 2015 12:33:41 +0200 (CEST)
From: Adrian Freihofer <adrian.freihofer@neratec.com>
To: Martin Jansa <martin.jansa@gmail.com>, "," <schnitzeltony@googlemail.com>
Message-ID: <1795284996.34316.1442572421706.JavaMail.zimbra@neratec.com>
In-Reply-To: <CA+chaQfdK4irH2DvnX-c=4pPHv2VXg3Y81mm6RuP845aJy_8yw@mail.gmail.com>
References: <cover.1441929533.git.raj.khem@gmail.com>
	<e4c70967dd05d254bd59bd4f8a49836c3d499bfb.1441929533.git.raj.khem@gmail.com>
	<80e3806f09d6c399ccd4ccdf5f83997386ec85bc.1441929533.git.raj.khem@gmail.com>
	<CALbNGRR=LAdpubkJGdfx=mx5FGiVW=YDTObwRN8JLAnSfiPc=g@mail.gmail.com>
	<CAMKF1so4a85NDgwLOL1RYHyXQTQcAdHJ9FM7yhaJbrnpTzdx0g@mail.gmail.com>
	<2142960116.32810.1442562398390.JavaMail.zimbra@neratec.com>
	<CA+chaQfdK4irH2DvnX-c=4pPHv2VXg3Y81mm6RuP845aJy_8yw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.11.128]
X-Mailer: Zimbra 8.6.0_GA_1182 (ZimbraWebClient - FF40 (Linux)/8.6.0_GA_1182)
Thread-Topic: systemd: Upgrade 219 -> 225
Thread-Index: UYvLMaKX9uDC4fEN8jzj9gf1U9FcSA==
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH V2 2/3] systemd: Upgrade 219 -> 225
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
X-List-Received-Date: Fri, 18 Sep 2015 10:33:43 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_34315_1403435786.1442572421705"

------=_Part_34315_1403435786.1442572421705
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Martin, hi Andreas=20

You are right, my patches are almost obsolete. Just some details might be w=
orth to be noticed:=20

libgudev might be improved by adding:=20
RCONFLICTS_${PN} =3D "systemd (<=3D 220)"=20

NetworkManager and ModemManager depend on udev instead of libgudev as well.=
=20




Von: "Martin Jansa" <martin.jansa@gmail.com>=20
An: "Adrian Freihofer" <adrian.freihofer@neratec.com>=20
CC: "Khem Raj" <raj.khem@gmail.com>, "openembedded-devel" <openembedded-dev=
el@lists.openembedded.org>, "Patches and discussions about the oe-core laye=
r" <openembedded-core@lists.openembedded.org>=20
Gesendet: Freitag, 18. September 2015 11:02:35=20
Betreff: Re: [OE-core] [PATCH V2 2/3] systemd: Upgrade 219 -> 225=20

Hi Adrian,=20
we're not accepting github's pull requests, see README.=20

Andreas already send many fixes for gudev, please check master-next if some=
thing is missing from your changes and resend to ML.=20

On Fri, Sep 18, 2015 at 9:46 AM, Adrian Freihofer < adrian.freihofer@nerate=
c.com > wrote:=20



Hi Andreas=20

Here is a first patchset ready for pulling...=20
https://github.com/openembedded/meta-openembedded/pull/16=20


Von: "Khem Raj" < raj.khem@gmail.com >=20
An: "Andreas M=C3=BCller" < schnitzeltony@googlemail.com >=20
CC: openembedded-devel@lists.openembedded.org , "Patches and discussions ab=
out the oe-core layer" < openembedded-core@lists.openembedded.org >=20
Gesendet: Mittwoch, 16. September 2015 23:18:50=20
Betreff: Re: [OE-core] [PATCH V2 2/3] systemd: Upgrade 219 -> 225=20

On Wed, Sep 16, 2015 at 2:17 PM, Andreas M=C3=BCller=20
< schnitzeltony@googlemail.com > wrote:=20
> Is anybody preparing patches for gudev (many packets in meta-oe require i=
t)?=20
>=20
> If not I can do so. Is the home for libgudev oe-core or better meta-oe?=
=20

meta-oe is better for now. I am not working on it.=20
--=20
_______________________________________________=20
Openembedded-core mailing list=20
Openembedded-core@lists.openembedded.org=20
http://lists.openembedded.org/mailman/listinfo/openembedded-core=20

--=20
_______________________________________________=20
Openembedded-core mailing list=20
Openembedded-core@lists.openembedded.org=20
http://lists.openembedded.org/mailman/listinfo/openembedded-core=20






------=_Part_34315_1403435786.1442572421705
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 10pt; color: #000000"><div>Hi Martin, hi Andreas<br></div><div><br dat=
a-mce-bogus=3D"1"></div><div>You are right, my patches are almost obsolete.=
 Just some details might be worth to be noticed:</div><div><br></div><div>l=
ibgudev might be improved by adding:<br data-mce-bogus=3D"1"></div><div>RCO=
NFLICTS_${PN} =3D "systemd (&lt;=3D 220)"</div><div><br data-mce-bogus=3D"1=
"></div><div>NetworkManager and ModemManager depend on udev instead of libg=
udev as well.<br data-mce-bogus=3D"1"></div><div><br data-mce-bogus=3D"1"><=
/div><div data-marker=3D"__SIG_PRE__"><div><hr><br></div><div><br data-mce-=
bogus=3D"1"></div></div><div data-marker=3D"__HEADERS__"><b>Von: </b>"Marti=
n Jansa" &lt;martin.jansa@gmail.com&gt;<br><b>An: </b>"Adrian Freihofer" &l=
t;adrian.freihofer@neratec.com&gt;<br><b>CC: </b>"Khem Raj" &lt;raj.khem@gm=
ail.com&gt;, "openembedded-devel" &lt;openembedded-devel@lists.openembedded=
.org&gt;, "Patches and discussions about the oe-core layer" &lt;openembedde=
d-core@lists.openembedded.org&gt;<br><b>Gesendet: </b>Freitag, 18. Septembe=
r 2015 11:02:35<br><b>Betreff: </b>Re: [OE-core] [PATCH V2 2/3] systemd: Up=
grade 219 -&gt; 225<br></div><div><br></div><div data-marker=3D"__QUOTED_TE=
XT__"><div dir=3D"ltr">Hi Adrian,<br><div>we're not accepting github's pull=
 requests, see README.</div><br><div>Andreas already send many fixes for gu=
dev, please check master-next if something is missing from your changes and=
 resend to ML.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Fri, Sep 18, 2015 at 9:46 AM, Adrian Freihofer <span dir=3D"ltr=
">&lt;<a href=3D"mailto:adrian.freihofer@neratec.com" target=3D"_blank">adr=
ian.freihofer@neratec.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div><div style=3D"font-family:arial,helvetica,sans-serif;font-size:=
10pt;color:#000000"><div>Hi Andreas<br></div><br><div>Here is a first patch=
set ready for pulling...<br></div><div><a href=3D"https://github.com/openem=
bedded/meta-openembedded/pull/16" target=3D"_blank">https://github.com/open=
embedded/meta-openembedded/pull/16</a><br data-mce-bogus=3D"1"></div><br><h=
r><div><b>Von: </b>"Khem Raj" &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br><b>An: </b>"Andreas M=C3=BClle=
r" &lt;<a href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">sc=
hnitzeltony@googlemail.com</a>&gt;<br><b>CC: </b><a href=3D"mailto:openembe=
dded-devel@lists.openembedded.org" target=3D"_blank">openembedded-devel@lis=
ts.openembedded.org</a>, "Patches and discussions about the oe-core layer" =
&lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openembedded.org</a>&gt;<br><b>Gesendet: </b=
>Mittwoch, 16. September 2015 23:18:50<br><b>Betreff: </b>Re: [OE-core] [PA=
TCH V2 2/3] systemd: Upgrade 219 -&gt; 225<br></div><div><div class=3D"h5">=
<br><div>On Wed, Sep 16, 2015 at 2:17 PM, Andreas M=C3=BCller<br>&lt;<a hre=
f=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@g=
ooglemail.com</a>&gt; wrote:<br>&gt; Is anybody preparing patches for gudev=
 (many packets in meta-oe require it)?<br>&gt;<br>&gt; If not I can do so. =
Is the home for libgudev oe-core or better meta-oe?<br><br>meta-oe is bette=
r for now. I am not working on it.<br>-- <br>______________________________=
_________________<br>Openembedded-core mailing list<br><a href=3D"mailto:Op=
enembedded-core@lists.openembedded.org" target=3D"_blank">Openembedded-core=
@lists.openembedded.org</a><br><a href=3D"http://lists.openembedded.org/mai=
lman/listinfo/openembedded-core" target=3D"_blank">http://lists.openembedde=
d.org/mailman/listinfo/openembedded-core</a><br></div></div></div></div></d=
iv><br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div></div><br></div></div></body></html>

------=_Part_34315_1403435786.1442572421705--
