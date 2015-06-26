Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2730C75662
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 17:38:01 +0000 (UTC)
Received: by pdbep18 with SMTP id ep18so56963201pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 10:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=TpGJrUATS6GNz5kjvHeea5uv3dMU7NTNqlCn6AZyV40=;
	b=f4I+DfA1QREFEVpN5QKg0lswgBsW/EVaVLFtBRQfEYZkngHrr6yX6wziIWtba5gaIl
	qHvvbt14oWJnmVHIaYH6BQj1LtzVotU/vu0agIO2pveI5Pk79Ihm6e4u+BECR7YuwP4l
	q57fQr6+B6KgSWrkn9e9/jP3/EqEzRZAgIqZ0agcQWs4fmEAO5XeL/7vY3MBQt0cFJFH
	SimbO/KskLER3Gj+aUITlwXTIgI47L3MXErj9kpzxwWo4jkKFJUVmA8Fq96TABCHTCCZ
	TzSOoGDMiw6owaec6S+LGy4qEqhkRwUkkDR2ibxEEl+VWSPBKkASsRqiMwflBoQ5xH6G
	pGIQ==
X-Received: by 10.70.89.199 with SMTP id bq7mr5463961pdb.168.1435340282786;
	Fri, 26 Jun 2015 10:38:02 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f48c:a1f1:4a1a:6daf?
	([2601:646:8601:4580:f48c:a1f1:4a1a:6daf])
	by mx.google.com with ESMTPSA id q5sm34026453pde.56.2015.06.26.10.38.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Jun 2015 10:38:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYMx1XcXf3TkPpTz3a_pn-z3VOaPG-YheKyJJwOeF_eEw@mail.gmail.com>
Date: Fri, 26 Jun 2015 10:37:57 -0700
Message-Id: <C0962A50-1D80-44B2-AA1C-E03C75459071@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
	<CAHiDW_GjW0PSnNRGekiYkg+qdhg=xbbmiVhWY95cv6GxQPJ1Bw@mail.gmail.com>
	<5E0378F8-62E0-4A7F-AB07-0209CD229BF3@gmail.com>
	<CAJTo0Lb0S_b4Wnb0dWmVae9Ezmn=dB0G2=DFyEjD2nivoa6Jfw@mail.gmail.com>
	<AB12494C-E7B7-4FD0-B3E2-72E5E91F3714@gmail.com>
	<CAJTo0LYMx1XcXf3TkPpTz3a_pn-z3VOaPG-YheKyJJwOeF_eEw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2102)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Fri, 26 Jun 2015 17:38:05 -0000
X-Groupsio-MsgNum: 67218
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E4A878A5-FDE1-4E2F-8CDC-178A39BAA6F7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E4A878A5-FDE1-4E2F-8CDC-178A39BAA6F7
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DB410BEE-1455-4B84-B4C3-62B023E44940"

--Apple-Mail=_DB410BEE-1455-4B84-B4C3-62B023E44940
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 26, 2015, at 9:59 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> On 26 June 2015 at 16:19, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> =46rom a system integrators point of view, I agree with your =
sentiments. =46rom a developers point of view not so much. We already =
have many recipes already fetching from git and more and more switching =
to use it see qt5 lately, there are perfectly fine tarballs released for =
QT5 too, just because its simpler to developer and integrate packages.
>=20
> But oe-core is a system for integrating software...  If you're doing =
lots of work against weston, then a bbappend to change the SRC_URI to a =
git repository isn't exactly hard work.

yes and its done like that and what you are saying is that we limit OE =
to not help there. Its fine. We are now in a phase where we should be =
upstreaming the patches we are hosting in meta data for OE or elsewhere =
and git based workflow makes it easy for such work atleast for =
components which use git upstream. Preparing in same sandbox and test =
them out becomes simpler.

>=20
> Tarballs give us much smaller downloads, the security of checksums, =
and the general assurance that you're building what the maintainer =
expects you to build.

then we patch it on top of tarballs maintainer doesn=E2=80=99t want you =
to do that as well isnt it ?
its lot easier to maintain using a SCM when we have patches and usually =
there are patches in OE. In any case, I will post a tarball version, and =
override the SRC_URI internally its not an issue its just another one =
thing to maintain on top of others. if thats what community wants, but I =
will need more folks to also express there usecase and opinion moving =
forward this is applicable to many components.

>=20
> Ross


--Apple-Mail=_DB410BEE-1455-4B84-B4C3-62B023E44940
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jun 26, 2015, at 9:59 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra">On 26 June 2015 at 16:19, Khem Raj =
<span dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div class=3D"">=46rom a system integrators =
point of view, I agree with your sentiments. =46rom a developers point =
of view not so much. We already have many recipes already fetching from =
git and more and more switching to use it see qt5 lately, there are =
perfectly fine tarballs released for QT5 too, just because its simpler =
to developer and integrate packages.</div><div =
class=3D""></div></blockquote></div><br class=3D"">But oe-core is a =
system for integrating software...&nbsp; If you're doing lots of work =
against weston, then a bbappend to change the SRC_URI to a git =
repository isn't exactly hard =
work.</div></div></div></blockquote><div><br class=3D""></div><div>yes =
and its done like that and what you are saying is that we limit OE to =
not help there. Its fine. We are now in a phase where we should be =
upstreaming the patches we are hosting in meta data for OE or elsewhere =
and git based workflow makes it easy for such work atleast for =
components which use git upstream. Preparing in same sandbox and test =
them out becomes simpler.&nbsp;</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">Tarballs give us much smaller downloads, the =
security of checksums, and the general assurance that you're building =
what the maintainer expects you to =
build.</div></div></div></blockquote><div><br class=3D""></div><div>then =
we patch it on top of tarballs maintainer doesn=E2=80=99t want you to do =
that as well isnt it ?</div><div>its lot easier to maintain using a SCM =
when we have patches and usually there are patches in OE. In any case, I =
will post a tarball version, and override the SRC_URI internally its not =
an issue its just another one thing to maintain on top of others. if =
thats what community wants, but I will need more folks to also express =
there usecase and opinion moving forward this is applicable to many =
components.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_DB410BEE-1455-4B84-B4C3-62B023E44940--

--Apple-Mail=_E4A878A5-FDE1-4E2F-8CDC-178A39BAA6F7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWNjfgACgkQuwUzVZGdMxSY4QCffu7ohcqZ5CV/ka3R9tio5d3s
qxEAn1FaMfqBZINZdaJBef1ktDv1WK+v
=zB1+
-----END PGP SIGNATURE-----

--Apple-Mail=_E4A878A5-FDE1-4E2F-8CDC-178A39BAA6F7--
