Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id A143C60667
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 15:43:46 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id x3so85070975pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=3pGBGuVwNGBo8PJnbVoVRAgKYySbfj0P+ctFzJ7FNlM=;
	b=B3PpnANpZVsZz3YdZZFqY6fin+HcMoPGUsrkG6FcesokIhgdkGsKecq0lzKMaFyHJ0
	BnX1aat7ICB4HJQL6p7I9DmVKuRNFtM1u6PmggsC+QsnkkT1/GeRXUQiyNW+Qt7JtGnO
	HogmGWQS7wx1BXWLaxngzxvSEN93wNM3UDbYnSi5iduc87334V8cSj/u74xQrpyC1kyF
	HbRmLr8e0jXQDEcn/gOBNvsMJdByObNuCdKa42OvrokcZsjjJE78r2JXPjg4OW/sJIQd
	vGYgYdBKzxQGVCYumvlulk2P40akrLe2kbOmHbDciGo2M0pKEonGUdzA2h84NmVq45gW
	xRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3pGBGuVwNGBo8PJnbVoVRAgKYySbfj0P+ctFzJ7FNlM=;
	b=EsCqUWaka134yoxjThUHPlCzq2gurob+lY3YBnUCYyyBZKD7tiRBMp/UBL0k0re5oY
	QkwE0mfq2Tto7mIb34bOlIApD2EO5s7uuOw3lhVI9zau3V2CEN7oGJpJnyk0EC1eVwuD
	wNXvJ7Kbm4ko4XvrCOpDdQDYU21BwHSfRUjAl1Py4n6JBMgyHDZuQZM0vLYptMZs2EJA
	LMm1KQAsMBP77CI8g+6YQF2oJx3Tz3prd9IvGIumR5YqwoIqVTO11VGzsx0lDtnq8V1S
	1bSF0jFKTdSmz7i1XPnhRc3gmE2ZZ0RVmq5TW4UiwYWfUdmtKWxpTzNXbU+/UMm0co7b
	egLw==
X-Gm-Message-State: AD7BkJLVpLii2m7T7CdYfqCUmGOgfLuStFGoJtN353ygUX7VENdBcSs+uh3IZgptWn35fw==
X-Received: by 10.98.89.129 with SMTP id k1mr22111427pfj.66.1458920627141;
	Fri, 25 Mar 2016 08:43:47 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:19a:36c7:1ab2:7027?
	([2601:646:8800:5a9a:19a:36c7:1ab2:7027])
	by smtp.gmail.com with ESMTPSA id
	yx1sm17313039pac.29.2016.03.25.08.43.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Mar 2016 08:43:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1458894419.3073.41.camel@linuxfoundation.org>
Date: Fri, 25 Mar 2016 08:43:40 -0700
Message-Id: <3E1653F2-219C-418A-ABB6-B537303842D2@gmail.com>
References: <DB3PR04MB0684386FD5BEA86D54DDA26EEE830@DB3PR04MB0684.eurprd04.prod.outlook.com>
	<1458894419.3073.41.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: LE and BE build for the same machine in Yocto
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
X-List-Received-Date: Fri, 25 Mar 2016 15:43:50 -0000
X-Groupsio-MsgNum: 80155
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3FAB7B9B-F83B-46E1-B7DC-341DC866A747";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3FAB7B9B-F83B-46E1-B7DC-341DC866A747
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Mar 25, 2016, at 1:26 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Fri, 2016-03-25 at 06:07 +0000, Zhenhua Luo wrote:
>> If the multilib feature is enabled in Yocto, two cross-compile gcc
>> binaries will be generated to do both 32b and 64b build for the same
>> machine.  Currently we have requirement to build LE u-boot and BE
>> kernel/rootfs for the same machine, may I know if there is similar
>> multilib mechanism in Yocto to support BE and LE build for the same
>> machine?
>=20
> If u-boot doesn't need any support libs, the existing compiler can
> likely cope with that. If you need libgcc, then you will need =
multilib.
>=20
> I'd like to get to a point where we can support this using multilib
> however it might not all work correctly today. It would be interesting
> to try it! The intent is to get to the point where it would work but
> its not currently a priority as not many people have been asking for
> it.
>=20

Do you mean having BE/LE as a multilib option ? that might be a =
possibility
and would probably make sense for this kind of limited scenario.

u-boot, kernel, are standalone apps, but some of them do need gcc =
runtime at
various stages, some need startup files some need libgcc as well. Good =
thing
is they won=E2=80=99t require libgcc_s but static libgcc, which can come =
from gcc-cross area and
we don=E2=80=99t have to worry about packaging it for target. I wonder
if we could tool the multilib configuration of cross-gcc separately from =
the rootfs

however, that might work for startup files since they are only needed =
during build
and are not packaged into target package like libgcc is.

If we can limit ourselves to startup files and static libgcc then a =
solution could
become possible.

--Apple-Mail=_3FAB7B9B-F83B-46E1-B7DC-341DC866A747
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb1XLAACgkQuwUzVZGdMxSs7wCdEqe5g0nVeE/fyFT2DmSZJEZM
8X4An2ILD0pzAyWN59oeflPwZ/XBwJnO
=H8HY
-----END PGP SIGNATURE-----

--Apple-Mail=_3FAB7B9B-F83B-46E1-B7DC-341DC866A747--
