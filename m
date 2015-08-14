Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 616E37673C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 07:18:30 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so54418034pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 00:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=OBBVT/8Blk0yjvByCcUwK6qKqN4W9Uf3Xwut4fZA5Wg=;
	b=K+FOVxaAFomTNR8w3fVSiSBmths+TTgmBv6yRyPmqerNDL/3uEi1eK2HCWgmKQyG9y
	C5i8d68S5A2t0StmCzWVA2u/QH3UM3TK6yhhl8H7o1ZfWb1AHpYzg3pa7ADCs/fkHBaM
	Vqt8cGliSLQ4HVtqVC8Uvu9KWD8A4UfGE58gOxuNvbGbaYLlwAQmh+Sb+s93px7p5vkw
	KRJCyBTr0CibcuvUEZJAib+XAmuZtjDIeRxbltwWY665a1zMbL/OVvX+WnsfMD4zwUZ6
	AzO5BJxAh5za9/WEBEZbAtkHhX0sGNagREOQ4ODE3yZuBiSiaoOljdEPtJZmAfzqu1Qv
	WLsA==
X-Received: by 10.66.222.103 with SMTP id ql7mr83968137pac.144.1439536710546; 
	Fri, 14 Aug 2015 00:18:30 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:7d4a:3993:27b2:859?
	([2601:646:8601:4580:7d4a:3993:27b2:859])
	by smtp.gmail.com with ESMTPSA id
	is3sm4893029pbc.53.2015.08.14.00.18.29
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Aug 2015 00:18:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMCfZKGuZoHJGAYK4VgRM-q_GXWbn6VaEyrnnUFBvwXEdtMV2w@mail.gmail.com>
Date: Fri, 14 Aug 2015 00:18:23 -0700
Message-Id: <243A6946-9FA7-4FE8-9A38-20ED258D2FE3@gmail.com>
References: <CAMCfZKFgggP5Y21S58+jq8n_se3a3Tg06f2HTFTj8j0Go3ATUA@mail.gmail.com>
	<CAJTo0LadVJPTXNb5MLV6AHhbcS9_rEN1qYz0D+cp0nmB4uv9aQ@mail.gmail.com>
	<CAMCfZKGuZoHJGAYK4VgRM-q_GXWbn6VaEyrnnUFBvwXEdtMV2w@mail.gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5] Issue on linking qtwebengine
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
X-List-Received-Date: Fri, 14 Aug 2015 07:18:32 -0000
X-Groupsio-MsgNum: 69416
Content-Type: multipart/signed;
	boundary="Apple-Mail=_066061F5-A42B-4ED9-B066-9F4CD197D53B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_066061F5-A42B-4ED9-B066-9F4CD197D53B
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_19B87C8F-313D-4192-A806-55A979D3CACD"

--Apple-Mail=_19B87C8F-313D-4192-A806-55A979D3CACD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 9, 2015, at 7:53 AM, Diego Sueiro <diego.sueiro@gmail.com> =
wrote:
>=20
> Ross,
>=20
> 2015-06-09 10:09 GMT-03:00 Burton, Ross <ross.burton@intel.com =
<mailto:ross.burton@intel.com>>:
> On 9 June 2015 at 13:58, Diego Sueiro <diego.sueiro@gmail.com =
<mailto:diego.sueiro@gmail.com>> wrote:
> I'm using fido branch and I'm getting the linker killed due to out of =
memory in a machine with 8GB of RAM.
>=20
> I guess you'll want to pass the same options to the linker that we =
already pass to webkitgtk:
>=20
> LDFLAGS +=3D "-Wl,--no-keep-memory"
>=20
> Thanks, that did the trick.
>=20
> But now I have another issue. :-(
>=20
> When qtwebengine compile task are running in parallel with another =
task I get an "file not recognized: File format not recognized" error.
>=20
> I put PARALLEL_MAKE=3D"" but the compile task still uses all CPUs.

yeah ninja has its own ideas unless you pass -j N to it

>=20
> Is there a way to tell openembedded to run a task without any other in =
parallel?
>=20
>=20
> Regards,
>=20
> --
> *dS
> Diego Sueiro
>=20
> Administrador do Embarcados
> www.embarcados.com.br =
<http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&utm_medium=3D=
e-mail&utm_campaign=3DAssinatura%20Email%20Diego>
>=20
> /*long live rock 'n roll*/
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_19B87C8F-313D-4192-A806-55A979D3CACD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jun 9, 2015, at 7:53 AM, Diego Sueiro &lt;<a =
href=3D"mailto:diego.sueiro@gmail.com" =
class=3D"">diego.sueiro@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra">Ross,</div><div =
class=3D"gmail_extra"><br class=3D""><div class=3D"gmail_quote">2015-06-09=
 10:09 GMT-03:00 Burton, Ross <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank" =
class=3D"">ross.burton@intel.com</a>&gt;</span>:<br class=3D""><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div class=3D"gmail_extra"><span =
class=3D""><div class=3D"gmail_quote">On 9 June 2015 at 13:58, Diego =
Sueiro <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:diego.sueiro@gmail.com" target=3D"_blank" =
class=3D"">diego.sueiro@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div class=3D"">I'm using fido branch and =
I'm getting the linker killed due to out of memory in a machine with 8GB =
of RAM.</div><div class=3D""></div></blockquote></div><br =
class=3D""></span>I guess you'll want to pass the same options to the =
linker that we already pass to webkitgtk:</div><div =
class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">LDFLAGS +=3D "-Wl,--no-keep-memory"<div =
class=3D""><div id=3D":11l" class=3D"" =
tabindex=3D"0"></div></div></div></blockquote></div><br class=3D"">Thanks,=
 that did the trick.</div><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra">But now I have another =
issue. :-(</div><div class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">When qtwebengine compile task are running in =
parallel with another task I get an "file not recognized: File format =
not recognized" error.</div><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra">I put PARALLEL_MAKE=3D"" but =
the compile task still uses all =
CPUs.</div></div></div></blockquote><div><br class=3D""></div><div>yeah =
ninja has its own ideas unless you pass -j N to it</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra">Is there a way to tell =
openembedded to run a task without any other in parallel?</div><div =
class=3D"gmail_extra"><br class=3D""><br clear=3D"all" class=3D""><div =
class=3D""><div class=3D"gmail_signature"><div dir=3D"ltr" class=3D""><div=
 class=3D"">Regards,</div><div class=3D""><br class=3D""></div>--<br =
class=3D"">*dS<br class=3D"">Diego Sueiro<br class=3D""><br =
class=3D"">Administrador do Embarcados<br class=3D""><a =
href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;ut=
m_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" =
target=3D"_blank" class=3D"">www.embarcados.com.br</a><br class=3D""><br =
class=3D"">/*long live rock 'n roll*/<br class=3D""></div></div></div>
</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_19B87C8F-313D-4192-A806-55A979D3CACD--

--Apple-Mail=_066061F5-A42B-4ED9-B066-9F4CD197D53B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXNlkQACgkQuwUzVZGdMxSi5ACdEJFsJWhhsm19gmqkLj/Ee274
j7YAn2ZS7g6fo0IAUwWAuSc0iThOB3AK
=VyyV
-----END PGP SIGNATURE-----

--Apple-Mail=_066061F5-A42B-4ED9-B066-9F4CD197D53B--
