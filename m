Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 05DA07730C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 10:24:51 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p63so20350478wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 02:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:cc:to:mime-version;
	bh=m00vyj1hHRHdtQdeVPDb07TwDLowwCIJ9e8aZoYO8e0=;
	b=llqAiAuyLOicayW+xTLhPRj24fTvWFiY5laNwk/ku3gSQtb1W1wgV+z/MIQ4NGHgT7
	owx5s7XnS4JFZnI+FNnKu3844XThsBLK5JZcY41vumB6+DrllqaPypMN/HM+Q5y9l40Z
	jUupCoYK3IN2R1qU6LkTqd9GsFmCphC+isU72Y7qHl2b7D3152muH3P5JqsPyXw+5geD
	KElTkGCocmaoOfHyuWB1UdCsqUv/UAK+w0RqOKpb6RaimnFkcgDRF1rY1m4DPMsJmKIk
	qpYQnpUHYxO30MwQGR/DJtopQKKffogkvG2U6/q2ctw0RA8eVCuISmJ6ruaoHoPMpX6x
	C4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:cc:to
	:mime-version;
	bh=m00vyj1hHRHdtQdeVPDb07TwDLowwCIJ9e8aZoYO8e0=;
	b=azApQM19AZmDDqxI39XYQxQ+9u4v2IP93W8brPB1/UF72KSzIRhTG1aGE9wRHDQ5zd
	5+0qJYNjftMGrCztDTZsXAsZlt25g5NRsjGdlOCV6fYqJ7nsAL4KKKJGGDyBH3UYzqoz
	LXTKiDmIlxOy+ag7drevLku36iFyfKSth024aIz8j7jAEMeWRsEbGFH9ZEN4udX5+Mz5
	5ZabSMe1b76GclvozzcER2TefLSSCpZ+lmoRsxPxn6c2i90KoVEpRKh1E7rwnItFgUHf
	OjgIVWtZuTtAcJq9kqZrRSpHQF2tUHtm5X0fH9sz0rR+9nht0zODw84EzaulY5Bg3k/X
	SqBQ==
X-Gm-Message-State: AG10YOTV8ySaotpc3JOy1Hyf74dqE0pCgNllRCSekKhNFAk/BZHIx+uPiMUFsU0XZCSgVA==
X-Received: by 10.28.57.68 with SMTP id g65mr21709213wma.56.1454667891949;
	Fri, 05 Feb 2016 02:24:51 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	c185sm30229106wma.5.2016.02.05.02.24.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Feb 2016 02:24:51 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Fri, 5 Feb 2016 11:24:50 +0100
Message-Id: <4CAACA4A-EFF1-44AF-8074-0B21B2929DA3@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [OE][jethro] Backport Perl Upgrade to 5.22.1
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
X-List-Received-Date: Fri, 05 Feb 2016 10:24:53 -0000
X-Groupsio-MsgNum: 77596
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E5CD8343-AB83-48E8-9CE7-E60FDA30037F";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_E5CD8343-AB83-48E8-9CE7-E60FDA30037F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Please backport the following from oe-core/master to jethro:

55a8df2056024acf714f47c85267c1eba8b7b6be
perl: Upgrade to 5.22.1

According to http://search.cpan.org/dist/perl-5.22.1/pod/perldelta.pod =
no incompatible changes but a lot of serious bugs fixed.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_E5CD8343-AB83-48E8-9CE7-E60FDA30037F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWtHhyAAoJEESZlq7c5QqdpNQP/0mnUuFZuS6hevzAG0qOkfN5
uWUj3HSGkxVDOQQdn6F/LJqYHKGbr9ycixkJlX5SDf9c7Fj4r0qiKZKtnMB/uGsL
++bWfCA6KblpxlcrDE7novfxzwxJPPlYLAiiMXszUMmOJqjePYUQlwIXsgZ6WfmY
KihcTBDN6nLbkkboyjz/4XPicjHNKHgRpYT4S73QuYYpq2FDGqJZLK+9ZWeyP8uS
XZAvBIX5SqHyshQbuxAxL4CTaa3WIoM9myQHabAMFcOfNKbxH+yTFjyPu3+kyQDN
81RUL6n8f4lQubpywLyWLmMXKJtIEZmnmUCu7Hcue5lMLEToeocNPwy88eg8FahW
iM50nuybNqXiB3gD6kX/v7UlNv0kJhsuozhDHoqtXV+LlD/ZMEZ27k9jf0/h0rB2
DVmuVRPObzkBPihRexJSRT0CkgowpCV60TiW6gMYULJNXlqXjS1m/hch2WYIPG5e
1272ji+1D8OuMvimepYSuUoGpX+QZpa9Pr/WBb127PTVP5DcvC89HN+1+hHrzrTb
kH2Imo4KzmlhMR6vziRJeQfNV5VZu9ysmvkbE0FuzSLvnGXuQQdTtMzYkE85h4d1
AMONgccok1fmpsBwFltPoi7XHsmUSGCCZGHnEcetFEMzc5qXRNt0kdKZnIyIGmkX
jAZyt+1P1Uk0t1ZGMzsM
=BjJ/
-----END PGP SIGNATURE-----

--Apple-Mail=_E5CD8343-AB83-48E8-9CE7-E60FDA30037F--
