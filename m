Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 220A177117
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:26:55 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g202so20440413pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=f+jvrmlDaST3F3IKfSWCrcEcvcm46pPOE4D1044Pn2o=;
	b=emYvBHHAyxqHioYt17a86ZUtWQ6ieqiGsEMRF2wPU9Mo69GYA2DbABDq/dSJkR/4Sg
	wUdnM6Vmp60tZtQjyrUyGv0PB22LejUNpwanUI5X6WVGYJTWt6GhvCtpnMxT7kktruzq
	VA4Ik4A7QpDCU1uPmp9Le04pcoUcy7In/kzaKwoH5+t1hhFvvkpn2XfzhFfIiZ7Gstua
	gsfMirTdrZszjgmZ4YaA5QBQseVO3zKznRNfa6RZHMo3Cqy9yoed4TrUXvB/OZS0fnPb
	uwpVUrreDlufZDtvL7p7ii/Q9PjwkK9jBsnirCu9VaoV3rc4dB/mbQW8xwbaW3w3uhR1
	b72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=f+jvrmlDaST3F3IKfSWCrcEcvcm46pPOE4D1044Pn2o=;
	b=AB6wQmILY8SPLPFfV/zK3umTlMBkUisI/NZ2j380TDSvTVBLsK1dAJyFmGjgYECptB
	SQDBG4Y/RBn4cjiYzk8++SVSm4WrlVjLwCx31bg2TDQ+fMFTTHfJ8XovrVjdcylUK+56
	OYi+K7bZox/RE2SiDkSbl9PxPSno2+xFj01w/tqW26bQCwYzFiUgvVuAIU+h7ctBJur9
	BbmQf6xj1zn97Z5/q1+q9pWpcvkY5o5diWia2jJc7saj1W1LDJQEn7HlAa4GqS9vXNtS
	O00+9Wu2ufSbF5Hze9S1iLSY0ZennfaNt9GOBBDeISapuPJDoJIBXkRqISGVXTA29PS3
	Te1g==
X-Gm-Message-State: AEkoout9NvLOmxzkrJDdjfeBZpBXsj+MoREO87a1loxSwRBLgYSC/BdAbdt8famgNxypeQ==
X-Received: by 10.98.61.24 with SMTP id k24mr136854275pfa.100.1470414416423;
	Fri, 05 Aug 2016 09:26:56 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:41d7:99c1:5cc6:c627?
	([2601:646:8882:b8c:41d7:99c1:5cc6:c627])
	by smtp.gmail.com with ESMTPSA id
	y3sm29178435pfd.65.2016.08.05.09.26.54
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 09:26:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470414156.8166.18.camel@linuxfoundation.org>
Date: Fri, 5 Aug 2016 09:27:15 -0700
Message-Id: <135E4083-59F9-4A16-A738-7F737F19F62D@gmail.com>
References: <1469821981-6456-1-git-send-email-anibal.limon@linux.intel.com>
	<04e8b0bc-8834-52db-8fe7-da7af806a1ba@gmail.com>
	<1470414156.8166.18.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: alexander.kanavin@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apt: Upgrade to 1.2.12
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
X-List-Received-Date: Fri, 05 Aug 2016 16:26:57 -0000
X-Groupsio-MsgNum: 85384
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5BB5763F-D659-449D-9A7E-127D656D7FB8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5BB5763F-D659-449D-9A7E-127D656D7FB8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 5, 2016, at 9:22 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Fri, 2016-08-05 at 08:44 -0700, Khem Raj wrote:
>>=20
>> On 7/29/16 12:53 PM, An=C3=ADbal Lim=C3=B3n wrote:
>>> Test was made building core-image-sato with package_deb on qemux86
>>> and
>>> qemuarm then run for two of them testimage and install packages
>>> with
>>> apt-get using PACKAGE_FEED_URI's configuration.
>>>=20
>>> Now apt support drop priviligies for install packages using a
>>> sandbox
>>> with _apt user, the useradd class was inherit and configured to
>>> install
>>> _apt user and group.
>>>=20
>>> Rebased patches:
>>>=20
>>> 	- 0001-Revert-always-run-dpkg-configure-a-at-the-end-of
>>> -our.patch
>>>        - 0001-fix-the-gcc-version-check.patch
>>> 	- 0001-remove-Wsuggest-attribute-from-CFLAGS.patch
>>> 	- disable-test.patch
>>> 	- no-curl.patch
>>=20
>> This breaks on musl. Another plea to add a world build on AB for
>> atleast
>> 1 target for musl.
>=20
> We have nightly-musl which builds "core-image-minimal core-image-full
> -cmdline core-image-sato":
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-musl/builds/
> 207/steps/BuildImages/logs/stdio
>=20
> Is world known to work for musl now?

yes. With security flags enabled as well. Except 1 issue for qemuarm I =
have described in prior email.

>=20
> Cheers,
>=20
> Richard
>=20


--Apple-Mail=_5BB5763F-D659-449D-9A7E-127D656D7FB8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlekvmMACgkQuwUzVZGdMxQ1vgCfYYWAGylhEUxC/jf0BAEITzFS
ldsAn236+I2/OZsyvDYirLNmOB7CYiuj
=1T6M
-----END PGP SIGNATURE-----

--Apple-Mail=_5BB5763F-D659-449D-9A7E-127D656D7FB8--
