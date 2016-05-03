Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0CFF86FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 03:01:45 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id iv1so3482291pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 20:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=xp4X6MGHa0w8U6gNx0hAwx6O1ioVbD9tZuRNy8hcamA=;
	b=h1dT5SA3wVStyVnU25MCQMHhXv7XDtSZpBtCd/HiLjQVCdZDTfm69s2caQ9WxUVk3L
	EkHMuutir9cKf9NAQTk7go6YCJjPqZUpbjFc0121ZOzUhwCjr4okvkX/mzNvkx+9cOxn
	PEcVD2MAFQm8ZaGcvU1qrHiOXFnfUmsQkaSgNYROMDViuz5AjgAkEGEa7GS+fIGlgZ8E
	qsdqgf+FAdd+7qUjKJcLJXtvy8cYAhtzLjLIyylIyyQQOn1PPz2zrMvRh2uM+WUidQfi
	WcC8l3L8onLeHY3dPM7H3BQIgJELbV6oEtz84RQxMrzfeGvBdCqEjXX76X6XwGiInWGn
	jJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=xp4X6MGHa0w8U6gNx0hAwx6O1ioVbD9tZuRNy8hcamA=;
	b=br2gEIypCAnFxKLYIF+RWCs+B9h8Pk/1weeBOJBrBnxjDlvFKP1jg0adERWdil1ius
	Ch+7ex8dJ+0rY93UKJ8mMzDU4hXvvz/bPGylhyPxwrTjFdP2fdFT1y+i9CXnje5YAlwD
	OOoD8DecCuwI1esefrje0VXTEZ3r5XXh9DEyYzkD8/7hOT8sa18mZa0K2g4S6ddfjN2n
	Z5jx/AKh+MaeYUiS2QLH/7OCoRj5WwGSu8N8UsBWABkrexsSwdF+l3673iIXHxg+BTor
	GLdcpPRBEryDDeSmpzJHCCm0dKwF7wf2dBrdm4aPIzzOlt/Utma1i1j2Q4h/nyjMCpXe
	UDHQ==
X-Gm-Message-State: AOPr4FVzDW4KL3Gn2pi26mWWQrHyysYAzTVBLLSHuZCu6ydnvfPRL9yZgbuXzDKAWa0wVQ==
X-Received: by 10.66.72.137 with SMTP id d9mr46193610pav.151.1462244506584;
	Mon, 02 May 2016 20:01:46 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:8dc7:7f44:e6aa:c692?
	([2601:646:8800:5a9a:8dc7:7f44:e6aa:c692])
	by smtp.gmail.com with ESMTPSA id
	s124sm1158571pfb.63.2016.05.02.20.01.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2016 20:01:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CABcZANmsD5jjnZzXaUGa+5Ea7MTrkfn=mR7xeH35De8CQwLMEw@mail.gmail.com>
Date: Mon, 2 May 2016 20:01:40 -0700
Message-Id: <2A94FBAF-96B3-4D23-B57B-5FC28833EBD7@gmail.com>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<B873B241-2AB0-4CDA-B4CF-7AEA166BEE68@gmail.com>
	<CABcZAN=ECJ15QzuHx-a2aovhS3hagRJuo3u-kazjZ4xnHjt=zA@mail.gmail.com>
	<A4EC8338-0993-408B-9D4C-2E388348B3B0@gmail.com>
	<CABcZANmsD5jjnZzXaUGa+5Ea7MTrkfn=mR7xeH35De8CQwLMEw@mail.gmail.com>
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
X-List-Received-Date: Tue, 03 May 2016 03:01:50 -0000
X-Groupsio-MsgNum: 81488
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9F2BFFD3-4E85-40E8-9335-6084D1427FF4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9F2BFFD3-4E85-40E8-9335-6084D1427FF4
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_4CE606BD-985E-4792-B801-28783D8F113A"

--Apple-Mail=_4CE606BD-985E-4792-B801-28783D8F113A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 2, 2016, at 7:53 PM, Christopher Larson <kergoth@gmail.com> =
wrote:
>=20
>=20
>=20
> On Mon, May 2, 2016 at 9:37 PM, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
>=20
>> On May 2, 2016, at 1:37 PM, Christopher Larson <kergoth@gmail.com =
<mailto:kergoth@gmail.com>> wrote:
>>=20
>>=20
>>=20
>> On Mon, May 2, 2016 at 8:34 PM, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
>>=20
>> > On May 2, 2016, at 1:09 PM, Christopher Larson <kergoth@gmail.com =
<mailto:kergoth@gmail.com>> wrote:
>> >
>> > From: Christopher Larson <chris_larson@mentor.com =
<mailto:chris_larson@mentor.com>>
>> >
>> > We explicitly set the hash style to gnu in our LDFLAGS. Setting the =
default to
>> > this in the toolchain, while convenient, actually hides bugs, as a =
failure to
>> > obey LDFLAGS isn't noticed. By removing this, it's not dissimilar =
to how we
>> > poison the sysroot -- rather than relying on the default, notice =
right away if
>> > somoeone isn't obeying the needed flags.
>> >
>> > This will result in a failure to obey LDFLAGS causing a GNU_HASH QA =
failure,
>> > which is what's often seen with external toolchains. This brings us =
all on the
>> > same page, and makes sure a failure to obey LDFLAGS is seen early.
>> >
>>=20
>>=20
>> Default or gnu linkers is to use sysv for legacy reasons and by =
passing this option
>> to configuring the toolchain we want to make sure that components are =
using sane defaults
>> even if they have not configured these options.
>>=20
>> But that's not what we want. We want to know when we're not passing =
arguments we need to be passing. For example, the sysroot is poisoned =
today, so we *know* when the user is trying to run it without =
--sysroot=3D.
>=20
> application makefiles can ignore environment e.g. CC, CXX, LD etc and =
get into same situations.
> as an application writer I may not be interested in using cross =
compilation specific nuances.  We may not
> be able to solve it completely
>=20
>=20
> I'm not sure what you mean by that. This is only for gcc-cross and =
gcc-cross-canadian. Anyone using those needs to deal with cross issues =
regardless.

I was taking a application developers point of view. not a system =
integrators or OE build masters. applications are supposed to work on =
all kind of env
and cross build env is one of them which large app developer community =
may not use as primary environment for development.

>=20
>> if you do not pass the right linker flags from compiler driver and =
also ignore
>> the LDFLAGS then you now have a safe pass for the app to build =
without GNU hash
>> while I understand it will spread the external toolchain=E2=80=99s =
pains into internal toolchain
>> I fail to understand the benefit of doing this otherwise.
>>=20
>> Silently ignoring the fact that recipes ignore LDFLAGS is not good =
default behavior, and this is precisely what oe-core is doing today. If =
you know of a better way to detect that in another QA check, I'm =
certainly open to hearing it.
>=20
> linker would emit .hash for sysv and .gnu.hash section for gnu hash in =
final ELF, may be adding a QA check for that would be enough ?
>=20
> I don't understand what you mean by this. I don't see how you'd be =
able to distinguish between a gnu.hash used because of the toolchain =
defaults and a gnu.hash used because it obeyed LDFLAGS, which is what =
you'd need to be able to detect the lack of the latter without this =
patch.

I thought you were looking for ways to detect if hash styles are mixed =
or not conforming to default for a given architecture. If the end binary =
is getting build as expected
and we are able to detect if it does not, then it won=E2=80=99t matter =
if the setting came from LDFLAGS or CFLAFS or implicit defaults.

> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


--Apple-Mail=_4CE606BD-985E-4792-B801-28783D8F113A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On May 2, 2016, at 7:53 PM, Christopher Larson &lt;<a =
href=3D"mailto:kergoth@gmail.com" class=3D"">kergoth@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D""><br class=3D""><div class=3D"gmail_extra"><br =
class=3D""><div class=3D"gmail_quote">On Mon, May 2, 2016 at 9:37 PM, =
Khem Raj <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
style=3D"word-wrap:break-word" class=3D""><br class=3D""><div =
class=3D""><span class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On May 2, 2016, at 1:37 PM, Christopher Larson &lt;<a =
href=3D"mailto:kergoth@gmail.com" target=3D"_blank" =
class=3D"">kergoth@gmail.com</a>&gt; wrote:</div><br class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><br class=3D""><div =
class=3D"gmail_extra"><br class=3D""><div class=3D"gmail_quote">On Mon, =
May 2, 2016 at 8:34 PM, Khem Raj <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br =
class=3D"">
&gt; On May 2, 2016, at 1:09 PM, Christopher Larson &lt;<a =
href=3D"mailto:kergoth@gmail.com" target=3D"_blank" =
class=3D"">kergoth@gmail.com</a>&gt; wrote:<br class=3D"">
&gt;<br class=3D"">
&gt; From: Christopher Larson &lt;<a =
href=3D"mailto:chris_larson@mentor.com" target=3D"_blank" =
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
--sysroot=3D.</div></div></div></div></div></blockquote><div =
class=3D""><br class=3D""></div></span><div class=3D"">application =
makefiles can ignore environment e.g. CC, CXX, LD etc and get into same =
situations.</div><div class=3D"">as an application writer I may not be =
interested in using cross compilation specific nuances.&nbsp; We may =
not</div><div class=3D"">be able to solve it =
completely&nbsp;</div></div></div></blockquote><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""></div><div class=3D"">I'm =
not sure what you mean by that. This is only for gcc-cross and =
gcc-cross-canadian. Anyone using those needs to deal with cross issues =
regardless.</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>I was taking a application developers point of =
view. not a system integrators or OE build masters. applications are =
supposed to work on all kind of env</div><div>and cross build env is one =
of them which large app developer community may not use as primary =
environment for development.&nbsp;</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D""><br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
style=3D"word-wrap:break-word" class=3D""><div class=3D""><span =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
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
it.</div></div></div></div></blockquote><div class=3D""><br =
class=3D""></div></span><div class=3D"">linker would emit .hash for sysv =
and .gnu.hash section for gnu hash in final ELF, may be adding a QA =
check for that would be enough ?</div></div></div></blockquote><div =
class=3D""><br class=3D""></div><div class=3D"">I don't understand what =
you mean by this. I don't see how you'd be able to distinguish between a =
gnu.hash used because of the toolchain defaults and a gnu.hash used =
because it obeyed LDFLAGS, which is what you'd need to be able to detect =
the lack of the latter without this =
patch.</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>I thought you were looking for ways to detect if =
hash styles are mixed or not conforming to default for a given =
architecture. If the end binary is getting build as =
expected</div><div>and we are able to detect if it does not, then it =
won=E2=80=99t matter if the setting came from LDFLAGS or CFLAFS or =
implicit defaults.</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra">-- <br class=3D""><div =
class=3D"gmail_signature"><div dir=3D"ltr" class=3D"">Christopher =
Larson<br class=3D"">kergoth at gmail dot com<br class=3D"">Founder - =
BitBake, OpenEmbedded, OpenZaurus<br class=3D"">Maintainer - Tslib<br =
class=3D"">Senior Software Engineer, Mentor Graphics</div></div>
</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_4CE606BD-985E-4792-B801-28783D8F113A--

--Apple-Mail=_9F2BFFD3-4E85-40E8-9335-6084D1427FF4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcoFJgACgkQuwUzVZGdMxTHxQCeLuU6zo9Du0PuSNdZatU7pKq7
Z9AAnimFnf4g8KDsx/PhG+zFS+sMyT2E
=IFnl
-----END PGP SIGNATURE-----

--Apple-Mail=_9F2BFFD3-4E85-40E8-9335-6084D1427FF4--
