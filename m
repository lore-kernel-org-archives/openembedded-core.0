Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hchapman-oecore@3gfp.com>) id 1U0eq2-00018t-W0
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 22:04:59 +0100
X-Authority-Analysis: v=2.0 cv=QcjkT7nv c=1 sm=0 a=0BEmelG+NCIkmYz4MtfDKA==:17
	a=KAMKcUAUZugA:10 a=I4j6jzedFl0A:10 a=h1JwTc6auzgA:10
	a=wPDyFdB5xvgA:10 a=cL4bF6sHAAAA:8 a=TDw1hb6CaaEA:10
	a=K6Cbrq60AAAA:8 a=MCaYdwpNrvGrHsxPXZAA:9 a=CjuIK1q_8ugA:10
	a=TRY22jUYQbcA:10 a=_W_S_7VecoQA:10 a=tXsnliwV7b4A:10
	a=ISgXYH8OxHYN34Q6:21 a=0BEmelG+NCIkmYz4MtfDKA==:117
X-Cloudmark-Score: 0
X-Authenticated-User: 
X-Originating-IP: 65.34.9.19
Received: from [65.34.9.19] ([65.34.9.19:38060] helo=blue.3gfp.com)
	by hrndva-oedge03.mail.rr.com (envelope-from
	<hchapman-oecore@3gfp.com>) (ecelerity 2.2.3.46 r()) with ESMTP
	id DE/C1-06396-C4789015; Wed, 30 Jan 2013 20:49:17 +0000
Received: from localhost (localhost [127.0.0.1])
	by blue.3gfp.com (Postfix) with ESMTP id 49F981080591;
	Wed, 30 Jan 2013 15:49:16 -0500 (EST)
X-Virus-Scanned: by amavisd-new-2.6.4 (20090625) (Debian) at 3gfp.com
Received: from blue.3gfp.com ([127.0.0.1])
	by localhost (blue.3gfp.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vMGlNr8Vpnr2; Wed, 30 Jan 2013 15:49:11 -0500 (EST)
Received: from [192.168.0.115] (rrcs-71-43-163-130.se.biz.rr.com
	[71.43.163.130])
	by blue.3gfp.com (Postfix) with ESMTPSA id 33F771080586;
	Wed, 30 Jan 2013 15:49:10 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Harvey Chapman <hchapman-oecore@3gfp.com>
In-Reply-To: <CABcZAN=urVqvHFj_EkRXfkDUpbNb51Lr7taPWiPYXqqU__Cigw@mail.gmail.com>
Date: Wed, 30 Jan 2013 15:49:10 -0500
Message-Id: <3C2BEFD8-C67F-4356-9518-5E91D1B975D4@3gfp.com>
References: <alpine.DEB.2.02.1301290359260.12134@oneiric>
	<20130129094422.GJ16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301290453220.12871@oneiric>
	<20130129112406.GK16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301301520430.3650@oneiric>
	<CABcZANmn_EP_qGszxtsEymkMFe4iHDsWvXGc2wtc0pSieMTjSQ@mail.gmail.com>
	<CABcZAN=urVqvHFj_EkRXfkDUpbNb51Lr7taPWiPYXqqU__Cigw@mail.gmail.com>
To: Chris Larson <clarson@kergoth.com>
X-Mailer: Apple Mail (2.1499)
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: BB_NO_NETWORK = "1" causes fetch to fail for unnecessary u-boot parsing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 21:05:00 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_3ABE12AF-7A1B-49A7-921F-6F84ECB3A2E8"

--Apple-Mail=_3ABE12AF-7A1B-49A7-921F-6F84ECB3A2E8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On Jan 30, 2013, at 3:34 PM, Chris Larson <clarson@kergoth.com> wrote:

> On Wed, Jan 30, 2013 at 1:34 PM, Chris Larson <clarson@kergoth.com> =
wrote:
>=20
> It's worth bringing up the SRCREV_POLICY variable, which lets you =
control how bitbake handles caching of srcrevs. By default, it figures =
it needs to get the mapping every time (value =3D=3D clear, or unset), =
which can make sense in certain cases. But you can tell it to go ahead =
and use the values it has cached from a previous run, as well (value =3D=3D=
 cache). This can be useful if you know you're moving into an offline =
state and want to prepare for it above and beyond the -c fetchall.
>=20
> Erm, s/SRCREV_POLICY/BB_SRCREV_POLICY/

So, should BB_NO_NETWORK=3D1 automatically set BB_SRCREV_POLICY=3Dcache =
because the former implies the latter?


--Apple-Mail=_3ABE12AF-7A1B-49A7-921F-6F84ECB3A2E8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><div><div>On Jan 30, 2013, at 3:34 PM, Chris Larson &lt;<a =
href=3D"mailto:clarson@kergoth.com">clarson@kergoth.com</a>&gt; =
wrote:</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div =
class=3D"gmail_extra"><div class=3D"gmail_quote">On Wed, Jan 30, 2013 at =
1:34 PM, Chris Larson <span dir=3D"ltr">&lt;<a =
href=3D"mailto:clarson@kergoth.com" =
target=3D"_blank">clarson@kergoth.com</a>&gt;</span> wrote:<blockquote =
class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; =
border-left-width: 1px; border-left-color: rgb(204, 204, 204); =
border-left-style: solid; padding-left: 1ex; position: static; z-index: =
auto; "><div class=3D"adM"><div class=3D"h5"><div =
class=3D"gmail_quote"><br></div></div></div>It's worth bringing up the =
SRCREV_POLICY variable, which lets you control how bitbake handles =
caching of srcrevs. By default, it figures it needs to get the mapping =
every time (value =3D=3D clear, or unset), which can make sense in =
certain cases. But you can tell it to go ahead and use the values it has =
cached from a previous run, as well (value =3D=3D cache). This can be =
useful if you know you're moving into an offline state and want to =
prepare for it above and beyond the -c fetchall.</blockquote>

</div><br>Erm, =
s/SRCREV_POLICY/BB_SRCREV_POLICY/<br></div></div></blockquote><div><br></d=
iv><div>So, should BB_NO_NETWORK=3D1 automatically set =
BB_SRCREV_POLICY=3Dcache because the former implies the =
latter?</div><div><br></div></div></body></html>=

--Apple-Mail=_3ABE12AF-7A1B-49A7-921F-6F84ECB3A2E8--
