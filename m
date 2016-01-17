Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 81C07731F1;
	Sun, 17 Jan 2016 11:54:29 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id cy9so418874726pac.0;
	Sun, 17 Jan 2016 03:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=ZgTzfc3yjA8bO7xlGh6+07jGLX5JW21qY+GkSOhudjU=;
	b=A33I85ZlXpqdVbJV27NbJLefVL9xPjZJxDo98s7bSO/cA8DVKlhBGjXPO9vikbLMME
	iBzsR8NscP25yJj6Epq9JKRsabaUD7gOlFdsp9GurToZAp03pER5FwSj3AZXj6WA137j
	mgDvvjSiqC0Qu5KOqbaRilC5ifUrVW/vWxLWxCxE/F8xtqYFVjvNDlXwo6p6bKwjN+RP
	MhzAFTZliENYtWUWRxUFvbelIonDVcjVmHLfw6DZSDOkzkUk+KWvlemBXzek1QZJFW+J
	XrKg0nLf1USkVI+3fiKp2J1XlvnSOVZJH0u8QF+Hqhy1KuQgX7aHoRRzKGx7AacJnGsr
	NTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:to
	:mime-version;
	bh=ZgTzfc3yjA8bO7xlGh6+07jGLX5JW21qY+GkSOhudjU=;
	b=SDZhLPPYUuYYnA1DjVdHrdpAvwJrYQNpY6FgOoVzidu5x6MyRdC479z2Ek7T9twW3i
	B6VPNz8HpMyVnp1TWuLJyWoyB8QBN5jlnk8NcmESpZQQhIJu8WrDoSOTIE1FIkvFl9F8
	+8Fhl+GbOfiY5OZN3W27TLQvWNoQKV28kBk+9hfnxmxOUd+afqNmBsPwyrTdryrb6RsD
	+rSlscAqxW+IxAHddE26iBz9KG7jYtxIDY8Ft9U2nyvf6Y73QaovvVEgHYwfPkj/r6my
	kpBUmirDGgfcrWRGHUe9XyPr2zDxDXc9zNIzO11fBM4uvXw9ez0s5M3JlmEshEvIZcaa
	XKMQ==
X-Gm-Message-State: ALoCoQn+KeX+7gO+ziypbGHLczEKCqYB53qjpRwNJ0EdI82xAlYaazvu2datszWvPJrFdp02sMbGM89yYZ92xrjjt7xVsOxczw==
X-Received: by 10.67.15.73 with SMTP id fm9mr29009372pad.130.1453031670202;
	Sun, 17 Jan 2016 03:54:30 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:551e:cfd2:447c:a7d1?
	([2601:646:8802:5d5c:551e:cfd2:447c:a7d1])
	by smtp.gmail.com with ESMTPSA id
	o4sm26854689pfa.85.2016.01.17.03.54.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 17 Jan 2016 03:54:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Sun, 17 Jan 2016 03:54:24 -0800
Message-Id: <2747032A-1F56-4CA6-860C-484B9292A0B5@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [RFT] Glibc 2.23 and binutils 2.26
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
X-List-Received-Date: Sun, 17 Jan 2016 11:54:30 -0000
X-Groupsio-MsgNum: 76260
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8D4272E7-1A64-4E3A-81C8-91D1D6629844";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8D4272E7-1A64-4E3A-81C8-91D1D6629844
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all

upstream glibc and binutils release branches have been cut out and are =
being made ready for next release
I have put together update patchset for both of them

here are the branches

https://github.com/kraj/openembedded-core/tree/kraj/binutils-2.26
https://github.com/kraj/openembedded-core/tree/kraj/glibc-2.23

FYI These are still using autorev to ensure that we test tip of release =
branches

Please give them a shot in your environments and report any issues you =
encounter.

Thanks for help

-Khem




--Apple-Mail=_8D4272E7-1A64-4E3A-81C8-91D1D6629844
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlabgPQACgkQuwUzVZGdMxS0iQCeMjFZdQcyWnlXTVJ52SSkh4Ov
w08AmwTnRETUMzIELpWrYesmX43wh7ml
=mZoe
-----END PGP SIGNATURE-----

--Apple-Mail=_8D4272E7-1A64-4E3A-81C8-91D1D6629844--
