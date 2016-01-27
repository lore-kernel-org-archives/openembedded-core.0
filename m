Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 176DB731C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 19:34:16 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id b35so1140719qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=a/Vmx2yCTwsA7QwAMKi/CjdV04e5rA1Q7I4cjTkcqMs=;
	b=j2MoJmD9WHkZjJ66W04Q0/8rj/H4/qZLPICbW0/dv/R25d2Dc27nxk5ftVipE1z/Y6
	h2Hv9M2iXP7CDskLbRPDIQTrxx4gAitWOlSbddUQLzruAFQ8g8tYB0sL2gNxbIj7Tg3i
	RL4Ct6zS3aHC/FWev0xuNEkRBY+Td0AMm+XP4KC/P3LFgFJ3Ff7Jcg5ryu94wgqz5kLQ
	NRUb9SKWTDePxPP7vy9SczcgLa4xU6QhIK8IPQ7+15UpeJhI2ypvgOA2BG4tP+lhJ9t4
	4sp5cUyHp7g+vjNMRHdV8sfLNLk9dlKHEo0jWGnOLU7/9dqFd7LF7awZYU232l/HMJdd
	Gmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=a/Vmx2yCTwsA7QwAMKi/CjdV04e5rA1Q7I4cjTkcqMs=;
	b=YvnSPvOFJA08pi03vYvHhd3r5P8F2Trek07k+7Uz7sIeEcpwRB4CY+CAbJK5l90I7G
	zFcNkIaJzNn+ZpB6axBZTsT72K4oN0ePOOg2XEWEDwk2jjslJZZNPmWThQdhSzTTrjLK
	5SK7/wdrWHEnWDh0gpRTG3oM9ePadDAK4EqXSi3P8ivznocT01F7vFSRKYD7oY7e+9Sh
	j5lvHiyJSPsuOUvp99h52DHRk0gYm0EK+Wso7Z6eEUgYU5R7VXCach6IuyJBdQmsnOae
	FB8Ii+2Dbi45TTv5lEkwK6fYRfNv8RUJfQmoPXB96YQs6swe3+0Efuu3wxaNApgFaYDE
	NlXQ==
X-Gm-Message-State: AG10YOQ7O7eNn1qIr2mLJ1/VHJ2PS0oWgsfT3P1oDslem+ee2Ap94XhpRdnjxcXOBKJiGQ==
X-Received: by 10.140.105.198 with SMTP id c64mr37753104qgf.94.1453923256700; 
	Wed, 27 Jan 2016 11:34:16 -0800 (PST)
Received: from [172.20.20.20] ([50.153.94.2]) by smtp.gmail.com with ESMTPSA id
	z138sm2935694qhb.7.2016.01.27.11.34.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jan 2016 11:34:15 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1453889810.10340.5.camel@linuxfoundation.org>
Date: Wed, 27 Jan 2016 14:34:11 -0500
Message-Id: <F43BB7C8-5982-46B5-90B1-D11128DEA616@gmail.com>
References: <cover.1453882496.git.hongxu.jia@windriver.com>
	<1453889810.10340.5.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] base/bbclass: use target path to replace build ones in debugging info
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
X-List-Received-Date: Wed, 27 Jan 2016 19:34:18 -0000
X-Groupsio-MsgNum: 76996
Content-Type: multipart/signed;
	boundary="Apple-Mail=_762F4ABD-5952-411C-9E21-8CBAF355FEC6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_762F4ABD-5952-411C-9E21-8CBAF355FEC6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 27, 2016, at 5:16 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> I like the idea of this a lot, I think it makes sense however why not
> just:
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e80ee18..284f7fb 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -546,7 +546,14 @@ EXTRA_OEMAKE_prepend_task-install =3D =
"${PARALLEL_MAKEINST} "
> ##################################################################
> # Optimization flags.
> ##################################################################
> -DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types"
> +DEBUG_FLAGS ?=3D "-g \
> +    -feliminate-unused-debug-types \
> +    -fdebug-prefix-map=3D${B}=3D/usr/src/${BPN} \
> +    -fdebug-prefix-map=3D${S}=3D/usr/src/${BPN}
> +    -gno-record-gcc-switches \

can we leave the switches in ?

> +    -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> +    -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> +"
> # Disabled until the option works properly -feliminate-dwarf2-dups
> FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"
> DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} =
-pipe"
>=20
> ?
>=20
> Cheers,
>=20
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_762F4ABD-5952-411C-9E21-8CBAF355FEC6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlapG7YACgkQuwUzVZGdMxQspgCfYvMdj2K/zTQVvmE1gQu5cyQk
FssAnA9vH0Pw6OxmzSebR7axBR/Z8Ebf
=sX51
-----END PGP SIGNATURE-----

--Apple-Mail=_762F4ABD-5952-411C-9E21-8CBAF355FEC6--
