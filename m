Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE77574EC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 15:49:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f6-v6so26091176wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:message-id:date:cc:to;
	bh=zI2/+ZQNZKKlWCJ5qt6jjR85fJ+5SK2NOV9FyNr5bTw=;
	b=AOfyW4wToAQqp75wQcdy6NpFB8B+BitpZ7lg2Gx4E00BJqhXXysyZWAlOVp6BCr3HY
	JFFnf14qN5OMDhA+qLn9TQZSnbKX5RJ927lNieqzIeNIrDzFgavmbShZr8vX+g3OWi8P
	hR1ZIg1rKvz2W7/p0V3a4V5tgATUS0ckI4SeCBFMSx0qC8J/vc/zdhn1JfZ5zEYTZBtL
	l2r9MndzfKc+YZo4kAod1ckkx+QrZTvtJH1vwGhkPaVhHQhUy74v59XSBZtgnoXNaJ3T
	8PvKzo4zCrViytyBbNbu4Wrcthq9YUGiz5J3WMi87dQGJ8vmvRVVvY0OAhAjYo/l0yIB
	9nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:cc:to;
	bh=zI2/+ZQNZKKlWCJ5qt6jjR85fJ+5SK2NOV9FyNr5bTw=;
	b=VJ/JgLIJCV5S/INy3J8D/IoPcKarQkhFTGhAn+fcGD1oTKsPjTFn6vXfJjkbLgwNHX
	fcvrVcrtJoq3myCiTIN1m0o3I6ekyBjDpf+pfyKmMM1K7TQcdXh6lmJ/1VZtsLyObXG6
	zed/JnjHMkjAT1LvcF/g+Gbad2yr/+LQJRKYVQ0puq5428U/Za7iqfbqRZQjODDLlwTI
	6gcHCdVMAKgi0G2Wn96JbC7VZXgLb5kDlPmUCbwP+ACMN14M5MZn240biDekuCgR5nhd
	ShQCfzAE220onkk9K7mPFnAzVbP+RZHQEWnQeFGTK9B6FamlO0NN3JNdr4kJYPDAmqUh
	7P+w==
X-Gm-Message-State: ALKqPwetG0yVMn6cV8+T+KNs/e8e3s6WShMZ4aTrMhtvVVFSnHM5m7dR
	gnaS9HHpZOlo5jQswIbtNQ7Kdvea
X-Google-Smtp-Source: AB8JxZpAmlSVnH1EzKkAcSrl4jCgqrZNGOnZOdHN+9AhYTCeV4HVO/JccyGsAv70FvkBan0JgzYFeQ==
X-Received: by 2002:a1c:8cc8:: with SMTP id
	o191-v6mr10645217wmd.83.1526917781987; 
	Mon, 21 May 2018 08:49:41 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	y81-v6sm14995409wmd.31.2018.05.21.08.49.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 08:49:41 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Message-Id: <F01F1AFA-0DE4-4153-A28B-04C5756825E8@gmail.com>
Date: Mon, 21 May 2018 17:49:40 +0200
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.6.18)
Subject: [PATCH 2/2] cpan_build.bbclass: tell Module::Build the replacement
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
X-List-Received-Date: Mon, 21 May 2018 15:49:42 -0000
X-Groupsio-MsgNum: 111564
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5EDD033C-C1CD-4E34-9C6B-2CDB61284ABE";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_5EDD033C-C1CD-4E34-9C6B-2CDB61284ABE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Instead of patching Module::Build, maybe Module::Build::Tiny and all =
other
similar tools, use the official way to tell them which is the target =
perl
on target.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/cpan_build.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cpan_build.bbclass =
b/meta/classes/cpan_build.bbclass
index fac074d610..c2491061fa 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -30,7 +30,7 @@ cpan_build_do_configure () {
 }

 cpan_build_do_compile () {
-        perl Build verbose=3D1
+        perl Build --perl "/usr/bin/perl" verbose=3D1
 }

 cpan_build_do_install () {
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_5EDD033C-C1CD-4E34-9C6B-2CDB61284ABE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsC6pQACgkQRJmWrtzl
Cp2+KBAAkOCyg7SiT4edi87qrCq0Ex3FR1x92WR0q3MxtmYDuQCzhAp+RKV27aUD
jtT3VcCPMO0jZkgN74rbItjR6FEwkAtN/icpy/EZj4f9kCRdaShE9k/Hy2pq2279
Ai10bpd7tPWELjF+mgjHQV/PvUBEu5mhYn4/IKOGoAYyfc36WKeb0EmNR7/7aLY9
S6KrhU1Wpa0bf7jzBWYrtjVdkWM3xMjdC/izmfPd77K+eQVT+y8J7RlgrqkGOaNl
wpEntASs7uf0cjeFRIzn+TbVmG5zpdI82TkL8daqNCM1TylMkGJ+qrK5DYebHoQl
5L7MyYd9Ihl2EtrB1X9z+EfDaPNsmBwIhIfVRTNWiNITIBcnLcwytdllaWrE4oak
tYvyXTLVHEWbENi5Dzs+SrlDwiyPzLJ+Y+/Dez7juQZ7K08m2eeJjOhiK9RErIlA
D30EUtlM6zwTUmwQcJqlwoShbHibpBzNsg+SOADZg0fSVo6z5LGEgfHJhs1WpxPV
hoCSVowA73JSsrA77UXpbf3Mc+IjgKtVgh0EM3bt4yJo0qYUDROviRXrMWK2GFhb
38RJj4ajQD0Xe+xCs4Ft4ncmNR8bPrN2tvetWqm0nDcWJtZXiJVf9z8LNxPceTco
/Df3y5PaV53t95hID6ELpmQ5nj13+k00lqmwlZbqYKAaoeRZg9s=
=yDWa
-----END PGP SIGNATURE-----

--Apple-Mail=_5EDD033C-C1CD-4E34-9C6B-2CDB61284ABE--
