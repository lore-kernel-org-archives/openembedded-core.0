Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6D273DB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 06:47:53 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so32805642pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 23:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=sU4Ka9XW3dKg5zsfX1me4CN6BgqnHonzTKRroG9U7ag=;
	b=PPbu+Yvp+5kFdRHNiDkdPnETAWVy/wc1OHviWcO4AHRfMGzOzKK5uwKYFbRyUDwCPX
	3rlFIToa8SlBSDC/m8yvBNaS1ANuHtMnskLM5x+FHJCbRw1L2gWd7IO4UBhV0GFy46Tw
	p5NbMFC+W+TUFSusb6i4f6OcF87NRIOhdKsAgmUW6PGwdps8oZDpJfE5coemBvebXgc3
	WNmOL25Bv5OiXG7PF0a9PnBOVGK4vUrcB7H/AbxqQwBwZR4rz7xuQpG7A4Z/beW/Qij4
	dhmA/gxqi96FB6dIkSg9uhktF7rh3zELu1fhC9MhaSLslWAkXhIkmVkiRzeqbC3mk/vC
	kd7w==
X-Received: by 10.66.119.136 with SMTP id ku8mr4410503pab.29.1430981274988;
	Wed, 06 May 2015 23:47:54 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:2019:32dd:e815:cffd?
	([2601:9:3580:84c:2019:32dd:e815:cffd])
	by mx.google.com with ESMTPSA id td3sm1011028pab.46.2015.05.06.23.47.54
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 May 2015 23:47:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1430899916.8074.20.camel@linuxfoundation.org>
Date: Wed, 6 May 2015 23:47:47 -0700
Message-Id: <000AAC87-CE74-45DC-A006-D4704D8841D8@gmail.com>
References: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
	<4ffe99f25368e8b65df327fb9120ebca1c29e925.1430895556.git.raj.khem@gmail.com>
	<1430899916.8074.20.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] gcc-cross: Pass EXTRA_OECONF_GCC_FLOAT to configure
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
X-List-Received-Date: Thu, 07 May 2015 06:47:54 -0000
X-Groupsio-MsgNum: 65233
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9B85CF5D-FAAE-4E67-B3C8-4A189499540B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9B85CF5D-FAAE-4E67-B3C8-4A189499540B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 6, 2015, at 1:11 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> But we build gcc-cross-arm once. This will cause it to rebuild =
depending
> on which machine you target? Worse, it likely will now do this for all
> architectures, not just arm.

only when float ABI changes which may be common across a subset of =
architectures.

although, I think its going to become a severe usability issue. Look
at the archives there are so many issues reported in various forums =
which end up exactly to this problem, since users expect
that once they installed the SDK it works out of box for the default =
architecture which is not
the case. It just seems wrong build optimization to make it common per =
arch it if we can=E2=80=99t have user expectations met.


--Apple-Mail=_9B85CF5D-FAAE-4E67-B3C8-4A189499540B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVLCpkACgkQuwUzVZGdMxSEUACeJaqXWWrSuy71Lfr87/kRwdTq
wSMAnjVvfqn2cG7CDCEgbRBIBrNKeQWM
=HdG6
-----END PGP SIGNATURE-----

--Apple-Mail=_9B85CF5D-FAAE-4E67-B3C8-4A189499540B--
