Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2BFF373212
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:24:41 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id uo6so262233239pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qGEkZtoXK3e/j/oXNUaQOn9hEF1N365nUw98dcBBqlQ=;
	b=jUpV1Szkhszk6GINdAcQ63S2yjH0QL+V9HbPKBYThMzyXIDVACoHl/q2G85GiTE6rV
	Elx7LwKYPuBuCz1114WJhMSt0SmR+iYLEvSXfhrPKd/Rf6Vmitjisnhe1V7gB7b9pw+8
	vzmqZmu4TRE1tc8AvTvO/2RrKTGjI3aP5qq+LgKPsc0f1MTlzf978T6nupKljVngQGno
	u6mU2JI7ay9rSuRVf60qN3htpct83IS20T5VCl4QXVO/UiNnr89oS8fgclQOhkFZe09V
	A4pHuLRgjk4S1Dsq5HWG1HUPy0jGiFxZod96C0LBqUaazmcCnmkhXEHZFmNEdGuEMio8
	QzEg==
X-Received: by 10.66.162.9 with SMTP id xw9mr157607709pab.46.1452248682721;
	Fri, 08 Jan 2016 02:24:42 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:4934:16a1:ccba:482b?
	([2601:646:8802:5d5c:4934:16a1:ccba:482b])
	by smtp.gmail.com with ESMTPSA id 11sm3694881pfq.87.2016.01.08.02.24.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jan 2016 02:24:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LaTcw38opFWMpoS4Ow+5vkmbNV0QA=SROTHQNSpVRBXZw@mail.gmail.com>
Date: Fri, 8 Jan 2016 02:24:41 -0800
Message-Id: <A1DBD235-088F-4899-9229-D9CE38B52FCD@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<CAJTo0LbtH+=faMv7DpSbhsmaB6A9DmXkDSwAk6YA4cvGi7c_qg@mail.gmail.com>
	<0348DF50-6B9B-4765-9F27-C731D38BBE4C@gmail.com>
	<CAJTo0LaTcw38opFWMpoS4Ow+5vkmbNV0QA=SROTHQNSpVRBXZw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/17] musl fixes phase 2
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
X-List-Received-Date: Fri, 08 Jan 2016 10:24:44 -0000
X-Groupsio-MsgNum: 75701
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0DB97121-DFB0-4E2A-A375-BCEE4C777B60";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0DB97121-DFB0-4E2A-A375-BCEE4C777B60
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F6617AA6-0AC0-47A8-8C21-27C862A9E401"

--Apple-Mail=_F6617AA6-0AC0-47A8-8C21-27C862A9E401
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 8, 2016, at 1:58 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 8 January 2016 at 09:40, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> This is a patch from sabotage linux, I have addressed all other =
issues.
>=20
> Thanks Khem, merged those into my testing branch now.   There's a lot =
pending in your branch, do you have an ETA for when the rest of the =
muslification patches will be sent?
>=20

Please take the request for phase 3 which includes remaining patches =
from phase 2 as well.

> Ross


--Apple-Mail=_F6617AA6-0AC0-47A8-8C21-27C862A9E401
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jan 8, 2016, at 1:58 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 8 January 2016 at 09:40, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"">This =
is a patch from sabotage linux, I have addressed all other =
issues.</div><div class=3D"yj6qo ajU"><div id=3D":51p" class=3D"ajR" =
tabindex=3D"0"></div></div></blockquote></div><br class=3D"">Thanks =
Khem, merged those into my testing branch now. &nbsp; There's a lot =
pending in your branch, do you have an ETA for when the rest of the =
muslification patches will be sent?</div><div class=3D"gmail_extra"><br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>Please take the request for phase 3 which includes =
remaining patches from phase 2 as well.&nbsp;</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_F6617AA6-0AC0-47A8-8C21-27C862A9E401--

--Apple-Mail=_0DB97121-DFB0-4E2A-A375-BCEE4C777B60
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaPjmkACgkQuwUzVZGdMxTZywCeMiI8KC70E/ihVhx1LNqJzNxY
LJYAnA0swnd6IAMyArclefNwy7jomMaL
=olti
-----END PGP SIGNATURE-----

--Apple-Mail=_0DB97121-DFB0-4E2A-A375-BCEE4C777B60--
