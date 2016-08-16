Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 950F8731F7;
	Tue, 16 Aug 2016 18:55:58 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y134so5886300pfg.3;
	Tue, 16 Aug 2016 11:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=s0mVOUr8peSL7yjKVbz6jsRgbjOh54NSigpC6GzHdVU=;
	b=C1vSK+xcg+4ZAA9/xgd/qS11XiHYn+A6CV79G9ShVLF/N8lBB0qkCv9asHEeW0OnSg
	R8846dMSK92ERd2cK+Rj7JYyJnK9QueppTjN9gEJ6puQ6COGZ0akVRmo8/cWUfJ+B7rM
	REfIKs01U6sIIphPkmKeHB46/yPvxSrRxxYQSGAK873/S41mAXudltI79bSCOH8qGr7D
	dxG4BN+obb26g0yT0t2d27YNdlovPTZzuQDXFErbNFjawOpsq+MtpNqCpEvSs98dXRKH
	mSlMRiH0DumROd4H81/FH3lftdXt+w72IYOmXeGDWwwgFcPoc+ciJPU2sbS/d13ucbFo
	sr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=s0mVOUr8peSL7yjKVbz6jsRgbjOh54NSigpC6GzHdVU=;
	b=dwkA26FJEjEZeF0vSGPb2n7X4pNqcsu1g8sDc70gDT89Ncj9+PigyEl/KkVmc1i1FA
	q+g4i2Uakc8rTF/45/JDxo0qj0wIMHbdXN4Pv0HkmpAko/OlIcXpEk8dt0G7T75RDYI9
	Aa8K6CVBsQ8z/c+qgU1ljmjtyZj6S9GjQ4JMB2iQj6vnOGvTIFq6EsFXqoH2Q/WBXrcY
	WQFoSYN3b7U0XSxqOkvu4NTOuOhPS/4V1W7l5pWw0mwhD0I8xCjmWXwFRbw90ORTI2Q0
	z+L/DYha24OBu5rAY9D3jmVDlPxhoPbhIva0ne8nepbZL5D0+cEV2m4zogy4k1fv3UXX
	QDsw==
X-Gm-Message-State: AEkoouvR1OMA/Jo/+R8rF9GRb0UYF7CGowW5MOOhBoId6J7OgePwY4/um+70CWwoP5UG/A==
X-Received: by 10.98.155.17 with SMTP id r17mr66757446pfd.24.1471373759731;
	Tue, 16 Aug 2016 11:55:59 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8111:5203:81eb:cf56?
	([2601:647:4c00:3edf:8111:5203:81eb:cf56])
	by smtp.gmail.com with ESMTPSA id
	wp4sm41239619pab.15.2016.08.16.11.55.57
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 11:55:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Pgp-Agent: GPGMail
Date: Tue, 16 Aug 2016 11:55:52 -0700
Message-Id: <888B09F3-F9A2-49C1-86E8-E33FA1FE6521@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Yocto Discussion Mailing List <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Subject: [RFT] gcc 6.2 RC1 update
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
X-List-Received-Date: Tue, 16 Aug 2016 18:56:00 -0000
X-Groupsio-MsgNum: 85802
Content-Type: multipart/signed;
	boundary="Apple-Mail=_60A181AB-1F40-49E5-9DA6-3E495C0879BE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_60A181AB-1F40-49E5-9DA6-3E495C0879BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi All

I have put together recipe upgrade for upcoming gcc 6.2 release now that =
it entered RC phase. With gcc 6.2 the recipes are using tarballs instead =
of git fetcher as promised :)
Please help testing it out in your setups and report any issues you see.

The commit you need to cherry-pick for OE-core is this one

=
https://github.com/kraj/openembedded-core/commit/0319b603761a16e65d7043361=
12c3709a8bf771c

Thank you for your help

-Khem

--Apple-Mail=_60A181AB-1F40-49E5-9DA6-3E495C0879BE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlezYb0ACgkQuwUzVZGdMxRYUwCffgJEKqKH7GnFY0aUY4sEj7Jq
Kt0An2bD0CIuZBj4U+0pJh6u+Wi+1wLq
=7tzg
-----END PGP SIGNATURE-----

--Apple-Mail=_60A181AB-1F40-49E5-9DA6-3E495C0879BE--
