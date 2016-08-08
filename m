Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id E60BC771C8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 21:37:29 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id cf3so24523389pad.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 14:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=GVIAd6I0K8fpoomv5j9TcmRifTDwqYFDzWFvvIYpLz8=;
	b=FCVpQg6NrO/lOlKZzmKUy48o2PYlUui0bXVEdVyUfs1GEMiCmvRnCneYEKh1h3fSjB
	wDSyal7hXkukNHUeRNbjz2zaF2MCDl790Sz+LrXDLmevVR57fsexwhyZz8TqFu7cMlJQ
	VJnx8RfQ7lo+RmIyrNkh1AD5ukCiukkAEo/dJXN2ACr0luzMC8O5KxJAJkEmTrgqe3jw
	BYfKsBm0OZDm4o2EOlpj0LHtUotaieKTLnA913sXJ4tXFJVwdG459WxhYx25NuA3kOv2
	1kWVZ2E//iQFFh+xsNr9WEp6oIeP4K1RlmuTY3LXCmOmMizXnXEHmhGi9n+wGzv2DV9I
	HOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=GVIAd6I0K8fpoomv5j9TcmRifTDwqYFDzWFvvIYpLz8=;
	b=e5+ciWuIMJvVqh0LfrSV1eqoiEhvdZmnlTGsXrGCjdsjvzZboaWAnwvNP8liMCG8yL
	52HVs6Nv46gfRlJgl6kG2/DO/BL8dx2mLqiXa6Y+TLSouqzRbDA/fXQLfg3iaDus0DfL
	sVHbQhqJgHNUu49PW9qTodJNP0Gbfo7SoqoLMNenNVaiEBx0D1VfmuzElRRAP491eVgH
	AgkMaRHoAGduqTWR31gMg5AKTmmwT4Mbs3ofXy6wjVG14MgIfr+6i/vi11mcdhiAeAYc
	+xoCZb/lHxBC0OVvsLxXxgz1FpDd74Tzt8IFGOn0cMu86FFQQu0lpyN2NjMAVlv7vreH
	TH2A==
X-Gm-Message-State: AEkoouuaQkEE5VHZb+LnASv2Vf5HAVJLOSSKNoXN6ZLsnx9Z7NRbI7WxJIC+rhn/cVg6xA==
X-Received: by 10.66.216.69 with SMTP id oo5mr7364995pac.155.1470692250573;
	Mon, 08 Aug 2016 14:37:30 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:8833:ac66:d76e:6708?
	([2601:646:8882:b8c:8833:ac66:d76e:6708])
	by smtp.gmail.com with ESMTPSA id
	15sm50332043pfz.36.2016.08.08.14.37.29
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 14:37:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <4180524.BjivrXu0U0@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 8 Aug 2016 14:38:05 -0700
Message-Id: <5102DD35-71D6-4D0A-BEEB-D1012DDF7982@gmail.com>
References: <cover.1470627445.git.brian.avery@intel.com>
	<db8cc8ef-f243-a2b2-93ed-cd85c8917bce@gmail.com>
	<1470643460.8166.35.camel@linuxfoundation.org>
	<4180524.BjivrXu0U0@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] packagegroup-core-eclipse-debug: add openssh server to support openssh-sftp-server
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
X-List-Received-Date: Mon, 08 Aug 2016 21:37:30 -0000
X-Groupsio-MsgNum: 85519
Content-Type: multipart/signed;
	boundary="Apple-Mail=_82013248-A6D7-400C-B9B2-9110C2D420B6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_82013248-A6D7-400C-B9B2-9110C2D420B6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 8, 2016, at 1:45 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Mon, 08 Aug 2016 09:04:20 Richard Purdie wrote:
>> On Mon, 2016-08-08 at 08:27 +0200, Jacob Kroon wrote:
>>> On 08/08/2016 05:43 AM, bavery wrote:
>>>> The openssh-sftp-server was already part of the pakagegroup. Adding
>>>> the openssh-server
>>>> lets the sftp server start up correctly.
>>>=20
>>> If openssh-sftp-server cannot run without openssh, shouldn't it
>>> RDEPEND
>>> on it instead ?
>>=20
>> I suspect you are right and that it needs an RDEPENDS if it doesn't
>> work without it. It also needs a comment explaining the dependency so
>> someone doesn't remove it.
>=20
> Using openssh-sftp-server with dropbear used to work, so it would be
> interesting to know when it broke and if it's possible to fix it.

yes, in angstrom that is the default combination as well. I think it =
still
is functional.

--Apple-Mail=_82013248-A6D7-400C-B9B2-9110C2D420B6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleo+70ACgkQuwUzVZGdMxRidQCfXVqMvZepMGDGG/TVFl7NoNjP
yxAAnAhWvbEqeRHMUHDDlKfu/CbBV5mV
=0B4+
-----END PGP SIGNATURE-----

--Apple-Mail=_82013248-A6D7-400C-B9B2-9110C2D420B6--
