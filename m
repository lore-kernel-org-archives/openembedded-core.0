Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4B33576E5E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 17:40:38 +0000 (UTC)
Received: by padan5 with SMTP id an5so2679061pad.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 10:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=xitMGiRU8QBnJmU0QQaIuKeUXWbM9WDPmIFJrZkfvGk=;
	b=i4+YP2ho3uIXOUvzxKWe7yyLOi78rakk32VniVKfQJgvoloZsyoB01hmd4FcXPOsa2
	mdco1OVek+tVSEsQcfRp834fSv0bd4Wep9r1awSn2ng1oStWZJflAmWGb1MAdkvFnMAs
	hm4cyGegXLWXxiWAsCubV0KhY7asoMVtJOh6LstBpdQ4tLgcZ9USf4ffMq/0u0FMq8hg
	Z8DWn/SorsZPwuOxs0cGRvCN1D/i+wzDTbT4Q8m6CNz1n+UzL9PbMDJTI7do89U9Bpfk
	X8qwSp5mEK9c1vL2eN7EYaK3X5HgyjV9lzq/HBHONyNNO4VX5K1q26+8PmvejvWZ28ZD
	FHaA==
X-Received: by 10.68.236.194 with SMTP id uw2mr48900592pbc.84.1441129238961;
	Tue, 01 Sep 2015 10:40:38 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f406:2324:ffaf:a6f9?
	([2601:646:8601:4580:f406:2324:ffaf:a6f9])
	by smtp.gmail.com with ESMTPSA id n5sm9371548pdk.71.2015.09.01.10.40.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Sep 2015 10:40:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Pgp-Agent: GPGMail 2.5.1
Date: Tue, 1 Sep 2015 10:40:33 -0700
Message-Id: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: Patch merge process
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
X-List-Received-Date: Tue, 01 Sep 2015 17:40:40 -0000
X-Groupsio-MsgNum: 70424
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C49D0847-16CD-4812-BB80-EDD51DF85D7B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C49D0847-16CD-4812-BB80-EDD51DF85D7B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi All,

I thought of bringing this up for discussions, I am seeing that, in some =
pull requests some patches get dropped and I understand
that there might be a reason for that but that reason is not =
communicated in proposed patch mail often. I have experienced with some =
of the
pull requests myself and seen it with some others. I think we are not =
responding to patches as it should be. Since we follow
just mailing list as upstreaming process thats the only channel that =
developer is engaged w.r.t. patches and there should be a conclusion
on the mailing list itself for a given patch. So I would request to =
whoever along with Richard is validating the patches and bringing them =
to OE-Core from mailing lists to respond to the patches especially the =
ones that are not applied with reasons why its not applied and similarly =
to the ones that are applied but has been rejected by some reviewers. It =
would also be good to document the commit criteria somewhere, so =
developer can do rework and ease the pressure on maintainers. Can we =
explore some tools that can help here ? May be failed errors.yp.org =
output can be sent to list of developers whose patches has been part of =
staging ?

I think its extremely important to keep a developer informed and engaged =
about the upstreaming if we want to encourage more voluntary =
participation in the project.

It would be good to identify where we have bottlenecks and how can we =
improve upon the situation, ideas are welcome.

Thanks
-Khem


--Apple-Mail=_C49D0847-16CD-4812-BB80-EDD51DF85D7B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXl4xUACgkQuwUzVZGdMxQU6QCdEKCoIhPflCwYqT6GLZqs1y4q
TRkAn0nei7rgI4SPN3P317QC+5StxErL
=mtua
-----END PGP SIGNATURE-----

--Apple-Mail=_C49D0847-16CD-4812-BB80-EDD51DF85D7B--
