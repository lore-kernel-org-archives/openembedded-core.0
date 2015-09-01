Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id EC94F76FC9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 23:45:59 +0000 (UTC)
Received: by padhy1 with SMTP id hy1so11173107pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 16:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=/jxx+p7pBZfuoyOHJzV122aFMec2qOvxqlIEpGIdkvY=;
	b=S5Bc7kq+LvggGfZy1RuwSbGkNCDusykwFBkcHVSo9AUCW3RGl/fEUQlYBGXMuiGD3V
	rLKOJM7n4mA1NldP+YmSpyalgab6ZbqQTcj9fNURZCo2mX5RI2KUOe/qClt1BD3/CVom
	KcdQm4MHfvbVm3s1j3KbXVQSQTX1TfcthEOHKzPg2mqLW3YiqfHHbNdN4ggNpDgfxMBv
	QpwnKn+OaNEgOQ/8NUsYmvty0Lpxi/ng+IE7DiaFPWes5r7goX8uYU1TUyJTBj0d5xn9
	3C1AL/gZ7s9fN7w/v3G99N7/n86cBmF/z2iOqIi/vcnZRI5c4uvycyJHC44C4YOQVCvB
	vbCQ==
X-Received: by 10.68.131.33 with SMTP id oj1mr48639025pbb.96.1441151159408;
	Tue, 01 Sep 2015 16:45:59 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:49fd:b69d:583d:d543?
	([2601:646:8601:4580:49fd:b69d:583d:d543])
	by smtp.gmail.com with ESMTPSA id
	fs13sm19432684pdb.29.2015.09.01.16.45.58
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Sep 2015 16:45:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441142126.24871.21.camel@linuxfoundation.org>
Date: Tue, 1 Sep 2015 16:45:49 -0700
Message-Id: <E9B6BF0B-EC31-4CF5-8756-9A338258CFF7@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
	<87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
	<1441142126.24871.21.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/17] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Tue, 01 Sep 2015 23:46:05 -0000
X-Groupsio-MsgNum: 70455
Content-Type: multipart/signed;
	boundary="Apple-Mail=_32909450-8146-4FAA-AEEE-32FA3EE5EC8C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_32909450-8146-4FAA-AEEE-32FA3EE5EC8C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 1, 2015, at 2:15 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Mon, 2015-08-24 at 13:03 -0700, Khem Raj wrote:
>> Drop patches that were straight backports from upstream
>>=20
>> MIT licence was unused and dropped from systemd sources
>> for more details see
>> =
https://github.com/systemd/systemd/commit/8f1e0c5f38cdf7e401ab4d2bb93ad816=
d08e7715
>>=20
>> Drop gtkdoc dependency since libudev API documentation has been =
converted from gtkdoc into man pages
>> Remove packaging gudev as it has moved to separate repository outside
>> systemd
>>=20
>> For more details see
>> =
https://github.com/systemd/systemd/commit/2375607039517c88df51ef16ddbb624e=
c1c10654
>>=20
>> package newly added script for xorg to be usable with systemd --user
>> intance
>> For more details see
>> =
https://github.com/systemd/systemd/commit/1401ec2d34bcde406ced531a72dc46eb=
af332594
>>=20
>> For complete differences between two releases run
>> git log --oneline v219..v224
>> in systemd git clone
>=20
> This patch seems to cause the build failures in:
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/buil=
ds/466
>=20
> (two different sanity test failures)


thanks for the info. Looking at the two tests.

setting up date using date -s seems to be assuming that Automatic time =
synchronization is not enabled
that test could be improved for systemd by using systemd utils.

timedatectl set-time "yyyy-MM-dd hh:mm:ss=E2=80=9D

and I don=E2=80=99t believe its passing with systemd-219 since locally I =
executed same commands on my minnow board running 219
and it failed.

Second test failure is a good one when mixing sysvinit scripts with =
systemd which is what systemctl disable avahi-daemon.service is doing

CHANGES WITH 221:

        * Support for chkconfig (--enable-chkconfig) was removed in =
favour of
          calling an abstraction /lib/systemd/systemd-sysv-install. This =
needs
          to be implemented for your distribution. See "SYSV INIT.D =
SCRIPTS" in
          README for details.

This needs implementing  /lib/systemd/systemd-sysv-install for OE and I =
will update the patch to fix this one.


>=20
> Cheers,
>=20
> Richard
>=20


--Apple-Mail=_32909450-8146-4FAA-AEEE-32FA3EE5EC8C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXmOLUACgkQuwUzVZGdMxRQOQCfeZ3G+2B8AI9SVH7iuTABINPs
ZtcAn3LT/+EPLQxnCy/Lt203nTpnZAQ0
=58Lz
-----END PGP SIGNATURE-----

--Apple-Mail=_32909450-8146-4FAA-AEEE-32FA3EE5EC8C--
