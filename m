Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 433C577375
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 16:38:55 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id w123so16532947pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 08:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=QDXOmMelPIii3fSF2+kfhbIhVHsILmZs7wljH5jK5KY=;
	b=P40pRwlrnsF/+mdw0tcOokMKnT9bbMeUo0bQzw6YZ5mrvy8ckKPP0osm/OlH6YHMHU
	1YvAQPywtEOJ7fPrh462/uU8/9xaebm/9yX7vd09FKUr9Xs7sZtYZ7sTirGNP+Pdudky
	RJv9XVgxNba9roUYBR665kRLPHz12OAPqb4jADyVMJpWMzfzSsgn5dW9Uj66G0WcdmOG
	E6EV047rkhZ9t/ndjLhh7IxKiYMTg+UmLfctaUeNVusGdjOduIT3CLm1dLn4tovO9O5Z
	biLWtqq+JzmCNcamTvzUNz11yriDe8GlSP2I+MA3MbianhdwJCpo2KV1HL2CTRbedTzY
	rKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=QDXOmMelPIii3fSF2+kfhbIhVHsILmZs7wljH5jK5KY=;
	b=QWD+HlfuxuZGtwsmcMVob45gQL3bvN31Zo/pdJsRx3o3Zq4MIJwNtDh08jc/C+y+hk
	n8K/T9gVpJ0uonJs1KDx0lLBG8cQzmTtXJotWMbDFuwsYlfb4RUJhiQcJgfCZ24xH0cr
	tf1cYc5E/Cw3YqYYRtsMCAT6+Ok47D8uWKagpL/IkNf/27U17DMvD2YcLzicnsB4PO1t
	EgbMym5h/yWhaojmRZsb+RBzsswmfQyUvMSLFRQeckj8Y6h4PxB8p8ynwoTRG75LRZje
	UGmTBmGSozXVRRhJs+NoTnTSI5txZ+YqYBRYeWAqcFtaeHbjPtNcTR7Ri5+nqzQx2il/
	fKdw==
X-Gm-Message-State: AG10YOTe9AcH2/ZTCYakTQsUKYv5YmZHGMMw3mDc2rfVlNgzdyVJBqONBFF3KNaN/SyF6A==
X-Received: by 10.98.13.7 with SMTP id v7mr3589011pfi.150.1454517536487;
	Wed, 03 Feb 2016 08:38:56 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:1024:e2e7:134f:11f6?
	([2601:646:8802:5d5c:1024:e2e7:134f:11f6])
	by smtp.gmail.com with ESMTPSA id
	mj1sm10939907pab.34.2016.02.03.08.38.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 08:38:55 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbL72SbPTh22uJbRPq9G8PJRQ8Tf80bKbjYVZGBaY_kVw@mail.gmail.com>
Date: Wed, 3 Feb 2016 08:38:50 -0800
Message-Id: <852326EB-DC9D-4912-AF5D-6BB837745EBE@gmail.com>
References: <cover.1454480571.git.raj.khem@gmail.com>
	<cf539a03e3ad82336bf24df078174800e7f2c2a5.1454480571.git.raj.khem@gmail.com>
	<CAJTo0LbL72SbPTh22uJbRPq9G8PJRQ8Tf80bKbjYVZGBaY_kVw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] gcc: musl related fixes for unwinding, ppc/secure-plt and gthr
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
X-List-Received-Date: Wed, 03 Feb 2016 16:38:56 -0000
X-Groupsio-MsgNum: 77470
Content-Type: multipart/signed;
	boundary="Apple-Mail=_74AB6D28-EDE1-4CE0-8BB6-94BBBB76E10E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_74AB6D28-EDE1-4CE0-8BB6-94BBBB76E10E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FE09DBAB-9419-44AC-A025-EADC0B309477"

--Apple-Mail=_FE09DBAB-9419-44AC-A025-EADC0B309477
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 3, 2016, at 8:17 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 3 February 2016 at 06:27, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> These issues are fixing building gcc for target, ppc issue
> helps in fixing discrepency between gcc cmdline and linker cmdline
>=20
> This appears to break glibc builds for me:

is it with security flags enabled or disabled and which arch.
my builds all went ok. I will do a clean build without sstate to see
if I can reproduce your issue. May be its because I have gold linker =
enabled
I will check that independently here.

>=20
> | checking version of bison... 3.0.4, ok
> | checking for libc-friendly stddef.h... yes
> | checking whether we need to use -P to assemble .S files... no
> | checking for .set assembler directive... no
> | checking for assembler gnu_unique_object symbol type... yes
> | checking for .previous assembler directive... yes
> | checking for .protected and .hidden assembler directive... yes
> | checking whether __attribute__((visibility())) is supported... yes
> | checking linker support for protected data symbol... no
> | checking for broken __attribute__((visibility()))... no
> | checking for broken __attribute__((alias()))... no
> | checking whether to put _rtld_local into .sdata section... no
> | checking for .preinit_array/.init_array/.fini_array support... no
> | configure: error: Need linker with .init_array/.fini_array support.
>=20
> Ross


--Apple-Mail=_FE09DBAB-9419-44AC-A025-EADC0B309477
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 3, 2016, at 8:17 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 3 February 2016 at 06:27, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":6ky" class=3D"" =
style=3D"overflow:hidden">These issues are fixing building <span =
class=3D"">gcc</span> for target, ppc issue<br class=3D"">
helps in fixing discrepency between <span class=3D"">gcc</span> cmdline =
and linker cmdline<br class=3D""></div></blockquote></div><br =
class=3D"">This appears to break glibc builds for =
me:</div></div></div></blockquote><div><br class=3D""></div><div>is it =
with security flags enabled or disabled and which arch.</div><div>my =
builds all went ok. I will do a clean build without sstate to =
see</div><div>if I can reproduce your issue. May be its because I have =
gold linker enabled</div><div>I will check that independently =
here.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">| =
checking version of bison... 3.0.4, ok</div><div class=3D"gmail_extra">| =
checking for libc-friendly stddef.h... yes</div><div =
class=3D"gmail_extra">| checking whether we need to use -P to assemble =
.S files... no</div><div class=3D"gmail_extra">| checking for .set =
assembler directive... no</div><div class=3D"gmail_extra">| checking for =
assembler gnu_unique_object symbol type... yes</div><div =
class=3D"gmail_extra">| checking for .previous assembler directive... =
yes</div><div class=3D"gmail_extra">| checking for .protected and =
.hidden assembler directive... yes</div><div class=3D"gmail_extra">| =
checking whether __attribute__((visibility())) is supported... =
yes</div><div class=3D"gmail_extra">| checking linker support for =
protected data symbol... no</div><div class=3D"gmail_extra">| checking =
for broken __attribute__((visibility()))... no</div><div =
class=3D"gmail_extra">| checking for broken __attribute__((alias()))... =
no</div><div class=3D"gmail_extra">| checking whether to put _rtld_local =
into .sdata section... no</div><div class=3D"gmail_extra">| checking for =
.preinit_array/.init_array/.fini_array support... no</div><div =
class=3D"gmail_extra">| configure: error: Need linker with =
.init_array/.fini_array support.</div><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra">Ross</div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_FE09DBAB-9419-44AC-A025-EADC0B309477--

--Apple-Mail=_74AB6D28-EDE1-4CE0-8BB6-94BBBB76E10E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlayLR4ACgkQuwUzVZGdMxSVqQCgh5cnG2+Kkhl4cnWF0HiL9bR1
NREAnAyVm6tg8xLnKHoiIgzSP1idEBG8
=f3pR
-----END PGP SIGNATURE-----

--Apple-Mail=_74AB6D28-EDE1-4CE0-8BB6-94BBBB76E10E--
