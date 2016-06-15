Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6706E60589
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 19:19:57 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hf6so2058369pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 12:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=/Z0HFmeDGRyWhCezutjK11qpyd8O9gVF7WCh9i3+9Xs=;
	b=yoLmFud9rNgJbWOfVsCHmANaLUONDhH39ptq8lmOmOhmkkqi0rqZOtHPokxiWtYKFo
	HFCEd3/VMfn4lzoAvR3LdNAaOj4cdxhcbR/00kcnwAIejTSHeuEzwzH00oBR9xhQvN6V
	nTa14rQGMy6pSlnL0AnYtVGToP3XCYDD/rkmz21SId9QEeLwwsBJ42feK9eXfCfeP6lh
	qUv1MzmIcNEu5ITZVC1ZrzBJFVitmsxltq53WgWkGdrAaR1uZKZyfOxz9pLh4qOBnN+4
	Uub5rhelQFcjdMdFS8R8FZhJVfI+gw8bXx7Mq2ndpX6peDEnuDqr3OB10aKGvX97Cl0x
	deRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=/Z0HFmeDGRyWhCezutjK11qpyd8O9gVF7WCh9i3+9Xs=;
	b=jn6SC7CiIdA9aAPxcqXDU5t+TcxiwQ75flcMTB1x9PsJ9Sk7SfAHM1vBw1XrTmrXmO
	iPfe3rg4nWebZYvnfJMTkOswM0NX34B49CPWSoa1VAy7hVhu3j4j1/DNummIvJxNjrc+
	nrTPMUwDQ6nK76XfKFqJMYWGIig0PMnqh1Vw/Ca8c99Rg/RBIALazvMTm7IxQdY3GyK0
	Fiusp1LJIYhV/Duxwwg7w1GVnpadzVr/Zz4bXPhXp5P1x/M13u8HgQ/gQhcMFLlDaHc0
	owwiB91ZOo3pVcZpYhvLMGO6bpbxw49RMmFgKEyxLJ2lYtIRyTOfYoLmYSrVdjmY1kTh
	wyZA==
X-Gm-Message-State: ALyK8tLQZG54BPosF3iUGCVJGWPbD7puJ2EIT3OWrpYUNnSWV+Qw7U773O2QdTvVIn4PAg==
X-Received: by 10.66.142.199 with SMTP id ry7mr393225pab.14.1466018398411;
	Wed, 15 Jun 2016 12:19:58 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:115c:1c9f:7ed3:245b:56cd?
	([2601:647:4c00:115c:1c9f:7ed3:245b:56cd])
	by smtp.gmail.com with ESMTPSA id
	xn3sm54808566pab.32.2016.06.15.12.19.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2016 12:19:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <57614A9B.3090602@siemens.com>
Date: Wed, 15 Jun 2016 12:19:53 -0700
Message-Id: <AD9226CC-8ACA-4C9C-930D-48A1E8455A38@gmail.com>
References: <57614A9B.3090602@siemens.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemuppc kernel doesn't build with GCC 4.9 on korgoth
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
X-List-Received-Date: Wed, 15 Jun 2016 19:20:00 -0000
X-Groupsio-MsgNum: 83477
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2B31EC61-56A4-4043-B5EE-1EE3A67EB366";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2B31EC61-56A4-4043-B5EE-1EE3A67EB366
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 15, 2016, at 5:31 AM, Pascal Bach <pascal.bach@siemens.com> =
wrote:
>=20
> Hi
>=20
> I tried to build qemuppc on the latest korgoth branch using the GCC =
4.9.3 from OE-core.
>=20
> The problem is that i get an error when trying to build the kernel.
> I was able to trace the issue back to this commit:
> =
https://github.com/openembedded/openembedded-core/commit/7a51776a830167e43=
cbd185505f62f328704e271
>=20
> And i can confirm that removing TARGET_CC_KERNEL_ARCH =3D "-mno-spe" =
from qemuppc.conf makes it work again.
>=20
> The question is how to best solve this?
> Do the changes for GCC 5.3.0 that done in the commit mentioned above =
also need to be applied to 4.9?
> Or is it just not supported to build qemuppc with GCC 4.9?
>=20

back port the gcc patch to 4.9

> Thanks for your help
>=20
> Pascal
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_2B31EC61-56A4-4043-B5EE-1EE3A67EB366
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldhql0ACgkQuwUzVZGdMxRhOwCfaJ3zIOwYV/7X5Zk7yO8nEEdW
ux4AniYmOXRRJPuP9XkjoKfUxbw1ojuO
=WLIT
-----END PGP SIGNATURE-----

--Apple-Mail=_2B31EC61-56A4-4043-B5EE-1EE3A67EB366--
