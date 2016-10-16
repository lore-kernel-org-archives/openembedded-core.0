Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 369857197B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 18:15:40 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 128so11224949pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 11:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=t6/HxnSRFn5aFsYi3gq7Fmalu9RP8dskY2suHfbYDWM=;
	b=stT5skz0BWEhOMVcRBaaBf8qYP/l9KvybqNI59dGVUgBj5bwJdK2fc5rERNRvrtSgF
	ytC5aidH5FKAg52MYulENlYfK6WWvleDsuO2nDFVdxSiMtFhPic3ywCEI9EKPn0uBMU4
	Xx6WsYvDsEMyizKA8so1S7G799zG17VToI3FWn2K4nC7M7gqLbkFfIRjupFfIqNmiEqx
	dZQk8TOV8rxb/NBylPVIazTPghDNa5ftyTuCnS85PJq0VBVVjC0989CrNnxp/V5acrhj
	JtT7T0lx3tjHdr6R9mDJ/mGMI7ywSl9WuUfNYExvQuMtTnIYCaiqgj+HVattuZsdgphE
	IRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=t6/HxnSRFn5aFsYi3gq7Fmalu9RP8dskY2suHfbYDWM=;
	b=OP0v9cpG/TPvHxSxU471NlChCJgv9Uw7X5N+a5FZGvdG4TWVnyfx18uBcYV8RxqerZ
	w/Pa0vIQc83noV2Ra63uo/kRGEJehVqQByacgzzdYH73D0dUk1rRXPjlQrnCqK1yhFCS
	hfM50wlfpAHo6lgzeY5Qz5+I3vT+nyq4WS6c/3JKp0j4jW5/Nn4ApJDo/7E0QR5717hk
	zmOYPkMJQBXSA63Rr1ma9Za0wt09BlT5BFTgkITGPBZzDTLY11GZHRPirFU/lznpQrAd
	RTjTCd0/YJ7AeLM2UljBLCc/XscQ3dWr0TzuWpZfzslu04RTwbIzvwoK8CWLG3m5Y88W
	HkJQ==
X-Gm-Message-State: AA6/9Rk2l38mo1HMPn+JhyuG4tW4vouar4Uu+bLpfJ0LVuZdjyIfUtdvBqx0AzzU35OQQg==
X-Received: by 10.99.119.72 with SMTP id s69mr26964710pgc.11.1476641742091;
	Sun, 16 Oct 2016 11:15:42 -0700 (PDT)
Received: from ?IPv6:2600:1010:b026:70df:d54d:70d9:9262:3840?
	([2600:1010:b026:70df:d54d:70d9:9262:3840])
	by smtp.gmail.com with ESMTPSA id
	a78sm42035898pfj.44.2016.10.16.11.15.40
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Oct 2016 11:15:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1476622744.3357.12.camel@linuxfoundation.org>
Date: Sun, 16 Oct 2016 11:15:34 -0700
Message-Id: <4C702885-035D-4AF3-90AD-B5E8733DEFA0@gmail.com>
References: <1476622744.3357.12.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: uninative, older distros and libstdc++ [2.2 uninative issue]
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
X-List-Received-Date: Sun, 16 Oct 2016 18:15:41 -0000
X-Groupsio-MsgNum: 88212
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9EA218E4-026F-4E84-81E6-3D39FF191242";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9EA218E4-026F-4E84-81E6-3D39FF191242
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 16, 2016, at 5:59 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> We've had a lot of success with uninative but in the 2.2-rc2 build
> which I ran last night on two different autobuilders, we saw two
> different failures:
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10441
>=20
> On a system compiling source-highlight-native with gcc 4.9 where =
boost-
> native was built on a gcc 5 system, we see one error. On a system
> compiling source-highlight-native with gcc 4.8 where boost-native was
> built on a gcc 4.9 system, we see a different error.
>=20
> The trouble is that libboost_regex.so in these cases wants the newer
> libstdc++ but at link time of executable, it can only see the host
> system and hence can't see newer symbols like
> std::runtime_error::runtime_error(char const*) or
> std::__throw_out_of_range_fmt(char const*, ...).
>=20
> I have done a lot of experimentation and the only way I can see of
> possibly making this work is to add =
-Wl,--unresolved-symbols=3Dignore-in-
> shared-libs to BUILD_LDFLAGS for source-highlight *and* ensure any
> native binaries get tweaked to use our own uninative loader before
> they're run. The former is horrible and the latter bit is hard.
>=20
> Another option would be to have multiple uninative feeds based on gcc
> version rather than a single uninative one.
>=20
> This close to release, I'm reluctant to poke this too much. We don't
> have many components that using C++, source-highlight is a
> comparatively new one which isn't in our default configuration for =
now.
> I'm therefore tempted to release note and look at this in 2.3.
>=20
> Opinions? Other ideas?

I think it could be related to ABI versions, may be while compiling
libstdc++ with gcc5 should enable --disable-libstdcxx-dual-abi
--with-default-libstdcxx-abi=3Dc++98 for checks and see if it works
its also not best solution since thats now the default but it will
ensure that this is the problem we are running into. Then second option
would be then to use --enable-libstdcxx-dual-abi
--with-default-libstdcxx-abi=3Dc++98

this combination might be better of the two. of course this would then
need testing it with gcc5+ as well.

>=20
> Cheers,
>=20
> Richard
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9EA218E4-026F-4E84-81E6-3D39FF191242
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgDw8oACgkQuwUzVZGdMxTafgCgio93C34Vu9h0Kg470y3LEKFM
wEgAnRP5ezKU83UIiaRPLD5PyojRxGnI
=tNXT
-----END PGP SIGNATURE-----

--Apple-Mail=_9EA218E4-026F-4E84-81E6-3D39FF191242--
