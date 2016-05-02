Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 235F976A51
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 21:37:47 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id xk12so589015pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=wwNXG735bOjdzHCRNCfDlVFZ/gFb8hflKWAt+ohYGFo=;
	b=fsgPPGhIQrvkL6Z/ZWz5HhiX2K/ws0iIKz6MdBeu4xhGOzyAwkJGSjHq9kMwJPUdT7
	ZDPkBRnJjAVltOWGQyWjSC6RFMUcKlTfCDZeTwgq/a0ar4ZtME6ni30k00gYgdlumyph
	YmvLlatPdnQYV6b6RqjpnOkqMtJRE1ta0lJPU0LoGD214twF7KhxTmcp5HkBXbFMbLxi
	vTUbZThYkqxAd3Ovqiiv51hyIrKlXawyAF7EGYDi6J1pHCC1ol6XAknKYjn1qkhZ17g/
	h5p+nCN2TfWYLQHFVEpbgprMc9VuX/Grm3rXq5+4ut6D3unbXhISWEoEZDk5TQoaTwCv
	F4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=wwNXG735bOjdzHCRNCfDlVFZ/gFb8hflKWAt+ohYGFo=;
	b=KiQUcA7yO78bvMoHmoz3waNQ2XS8XqKyM8TI5vjdBgoamzG4rvZQQAhGzW5F/dZK5n
	jrr1XsmKBdjB9WkAqZvRAXvl1IkzKCbCS81NZ7+faKSgnqEIi/Ra4PRhgPDOnO4fYGhk
	nrvMsoi41y3TLgXdiagX4faT3aeOQJwWrdEtzIzeLGdZ2fXvRimnfPCSWSvxAPqahrIW
	YfOqzsTmlVaIK2vg1N/Llh33CTAKvKoPE4H1gqWt51FHX0G+A77+xUFrVt8j8DDAgVes
	H7Q18w16s0q4zP9fyppZsKUlhXSi7Qpei0BrtySrdgxV7HF6QhOEKQi3O4wiFEhz1Lsf
	5WxQ==
X-Gm-Message-State: AOPr4FUVEnX8Ek1lZv0zVi2ah+5mi+AZ6BA9xFQj5JhH0eQ9J8piws3zXTEomMbt1MAD2Q==
X-Received: by 10.66.21.102 with SMTP id u6mr51867455pae.118.1462225068325;
	Mon, 02 May 2016 14:37:48 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:8dc7:7f44:e6aa:c692?
	([2601:646:8800:5a9a:8dc7:7f44:e6aa:c692])
	by smtp.gmail.com with ESMTPSA id
	fh14sm113395pab.31.2016.05.02.14.37.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2016 14:37:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CABcZAN=ECJ15QzuHx-a2aovhS3hagRJuo3u-kazjZ4xnHjt=zA@mail.gmail.com>
Date: Mon, 2 May 2016 14:37:43 -0700
Message-Id: <A4EC8338-0993-408B-9D4C-2E388348B3B0@gmail.com>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<B873B241-2AB0-4CDA-B4CF-7AEA166BEE68@gmail.com>
	<CABcZAN=ECJ15QzuHx-a2aovhS3hagRJuo3u-kazjZ4xnHjt=zA@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Mon, 02 May 2016 21:37:48 -0000
X-Groupsio-MsgNum: 81483
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7E5AAF30-31CA-48D7-B0C7-5CC54FEA2B8E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7E5AAF30-31CA-48D7-B0C7-5CC54FEA2B8E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_34C4EB9A-4A24-47C8-B0C8-20433E441DEC"

--Apple-Mail=_34C4EB9A-4A24-47C8-B0C8-20433E441DEC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 2, 2016, at 1:37 PM, Christopher Larson <kergoth@gmail.com> =
wrote:
>=20
>=20
>=20
> On Mon, May 2, 2016 at 8:34 PM, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
>=20
> > On May 2, 2016, at 1:09 PM, Christopher Larson <kergoth@gmail.com =
<mailto:kergoth@gmail.com>> wrote:
> >
> > From: Christopher Larson <chris_larson@mentor.com =
<mailto:chris_larson@mentor.com>>
> >
> > We explicitly set the hash style to gnu in our LDFLAGS. Setting the =
default to
> > this in the toolchain, while convenient, actually hides bugs, as a =
failure to
> > obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to =
how we
> > poison the sysroot -- rather than relying on the default, notice =
right away if
> > somoeone isn't obeying the needed flags.
> >
> > This will result in a failure to obey LDFLAGS causing a GNU_HASH QA =
failure,
> > which is what's often seen with external toolchains. This brings us =
all on the
> > same page, and makes sure a failure to obey LDFLAGS is seen early.
> >
>=20
>=20
> Default or gnu linkers is to use sysv for legacy reasons and by =
passing this option
> to configuring the toolchain we want to make sure that components are =
using sane defaults
> even if they have not configured these options.
>=20
> But that's not what we want. We want to know when we're not passing =
arguments we need to be passing. For example, the sysroot is poisoned =
today, so we *know* when the user is trying to run it without =
--sysroot=3D.

application makefiles can ignore environment e.g. CC, CXX, LD etc and =
get into same situations.
as an application writer I may not be interested in using cross =
compilation specific nuances.  We may not
be able to solve it completely

>=20
> if you do not pass the right linker flags from compiler driver and =
also ignore
> the LDFLAGS then you now have a safe pass for the app to build without =
GNU hash
> while I understand it will spread the external toolchain=E2=80=99s =
pains into internal toolchain
> I fail to understand the benefit of doing this otherwise.
>=20
> Silently ignoring the fact that recipes ignore LDFLAGS is not good =
default behavior, and this is precisely what oe-core is doing today. If =
you know of a better way to detect that in another QA check, I'm =
certainly open to hearing it.

linker would emit .hash for sysv and .gnu.hash section for gnu hash in =
final ELF, may be adding a QA check for that would be enough ?

> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--Apple-Mail=_34C4EB9A-4A24-47C8-B0C8-20433E441DEC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On May 2, 2016, at 1:37 PM, Christopher Larson &lt;<a =
href=3D"mailto:kergoth@gmail.com" class=3D"">kergoth@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D""><br class=3D""><div class=3D"gmail_extra"><br =
class=3D""><div class=3D"gmail_quote">On Mon, May 2, 2016 at 8:34 PM, =
Khem Raj <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br =
class=3D"">
&gt; On May 2, 2016, at 1:09 PM, Christopher Larson &lt;<a =
href=3D"mailto:kergoth@gmail.com" class=3D"">kergoth@gmail.com</a>&gt; =
wrote:<br class=3D"">
&gt;<br class=3D"">
&gt; From: Christopher Larson &lt;<a =
href=3D"mailto:chris_larson@mentor.com" =
class=3D"">chris_larson@mentor.com</a>&gt;<br class=3D"">
&gt;<br class=3D"">
&gt; We explicitly set the hash style to gnu in our LDFLAGS. Setting the =
default to<br class=3D"">
&gt; this in the toolchain, while convenient, actually hides bugs, as a =
failure to<br class=3D"">
&gt; obey LDFLAGS isn't noticed. By removing this, it's not dissimilar =
to how we<br class=3D"">
&gt; poison the sysroot -- rather than relying on the default, notice =
right away if<br class=3D"">
&gt; somoeone isn't obeying the needed flags.<br class=3D"">
&gt;<br class=3D"">
&gt; This will result in a failure to obey LDFLAGS causing a GNU_HASH QA =
failure,<br class=3D"">
&gt; which is what's often seen with external toolchains. This brings us =
all on the<br class=3D"">
&gt; same page, and makes sure a failure to obey LDFLAGS is seen =
early.<br class=3D"">
&gt;<br class=3D"">
<br class=3D"">
<br class=3D"">
</span>Default or gnu linkers is to use sysv for legacy reasons and by =
passing this option<br class=3D"">
to configuring the toolchain we want to make sure that components are =
using sane defaults<br class=3D"">
even if they have not configured these options.<br =
class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">But that's not what we want. We want to know when we're not =
passing arguments we need to be passing. For example, the sysroot is =
poisoned today, so we *know* when the user is trying to run it without =
--sysroot=3D.</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>application makefiles can ignore environment e.g. =
CC, CXX, LD etc and get into same situations.</div><div>as an =
application writer I may not be interested in using cross compilation =
specific nuances. &nbsp;We may not</div><div>be able to solve it =
completely&nbsp;</div>&nbsp;<br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D""><br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
if you do not pass the right linker flags from compiler driver and also =
ignore<br class=3D"">
the LDFLAGS then you now have a safe pass for the app to build without =
GNU hash<br class=3D"">
while I understand it will spread the external toolchain=E2=80=99s pains =
into internal toolchain<br class=3D"">
I fail to understand the benefit of doing this =
otherwise.</blockquote></div><br clear=3D"all" class=3D""><div =
class=3D"">Silently ignoring the fact that recipes ignore LDFLAGS is not =
good default behavior, and this is precisely what oe-core is doing =
today. If you know of a better way to detect that in another QA check, =
I'm certainly open to hearing =
it.</div></div></div></div></blockquote><div><br =
class=3D""></div><div>linker would emit .hash for sysv and .gnu.hash =
section for gnu hash in final ELF, may be adding a QA check for that =
would be enough ?</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra">-- <br class=3D""><div =
class=3D"gmail_signature"><div dir=3D"ltr" class=3D"">Christopher =
Larson<br class=3D"">kergoth at gmail dot com<br class=3D"">Founder - =
BitBake, OpenEmbedded, OpenZaurus<br class=3D"">Maintainer - Tslib<br =
class=3D"">Senior Software Engineer, Mentor Graphics</div></div>
</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_34C4EB9A-4A24-47C8-B0C8-20433E441DEC--

--Apple-Mail=_7E5AAF30-31CA-48D7-B0C7-5CC54FEA2B8E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcnyKoACgkQuwUzVZGdMxSp5QCgjOvuKEVmbdIDKD6QLUl0+LbA
UqEAnAt6XOMShjbHNC6QUwKCkIJymdb1
=SpJN
-----END PGP SIGNATURE-----

--Apple-Mail=_7E5AAF30-31CA-48D7-B0C7-5CC54FEA2B8E--
