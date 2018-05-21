Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5A99874E17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 15:49:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f8-v6so27466015wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:message-id:date:cc:to;
	bh=dhn56/37t+ymdd/PODe3g3e1riKf2FGur5my6ky6ifU=;
	b=uCiZS21QXyP3UcjrfLcV2l8m5WKeWkFpUwXT5bTLHVbyzaXZkwxUUWeKEpjy8K4A+g
	GUjtg3Cxy8q0W2UlJzx8JPOFMRdSrp89+DXFBHGSArTitXnimNmbJgG6h8+D97jC8P+p
	xRQBmHuc3eDsdaWlO+PHOMSaFJB1AWXQwprnO3oXaDKEtt50AJpK9LovSehk4iZYtXhR
	srKPcIiD6x1dCPB1/SNbeG94OY2R3zHURc1e9o+NqqITuB2340UfqIq2PKMjfMthwdyM
	FuipvoN1cJPU0lGnYMLsEdsHcqW0O5djmRdpB7N03ZvhtSLKNvgQ3+/l2IFzGtxu+jNN
	q32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:cc:to;
	bh=dhn56/37t+ymdd/PODe3g3e1riKf2FGur5my6ky6ifU=;
	b=RPduKepg89Ql7HQONmaKNTw8swj7sOJAOcQVLdHqinV1xacOK/33hEmoUWF+xHvv2G
	cndoM9uzaulmTgcVifmA4kXp6zgamS33nl/x7OdDl3SkmQRgHJhdBUET/JmbL3XAQfD6
	Xx4V8pJysDk82+0QZkfPweGXsh9DeQgi+2lYXP6vDvi8c44WdsfppDykzEq5MwRTZKpm
	mSDmWEfy+xOHYOzvmr7oLEx0Vhv7uJ30EE7Z4WA0q4dLgF3o6bVAfrKNJYWTEyhcL/NB
	yVEDt0P62JW0bMdKZ1AjFo4Jmvi5XXi0R7jjCxHE6ORUtfzNWvLiYGzj67uQvCVtkNQN
	hTZA==
X-Gm-Message-State: ALKqPwdO6z4qTTWzPbzsfdeRR+TXtLokb2BPunbCnifn50GePidxe6uh
	BQL7RbqP1KAhuibcUiGOYe5q3cEg
X-Google-Smtp-Source: AB8JxZqHSm/lmeZCxlLBlQ3TEnl0oElPQAXvA0z7IyWhbMvJWEGOI2m855YeKyLYYupFliybACZKmQ==
X-Received: by 2002:a1c:71dc:: with SMTP id
	d89-v6mr10819039wmi.26.1526917764659; 
	Mon, 21 May 2018 08:49:24 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	y81-v6sm14995409wmd.31.2018.05.21.08.49.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 08:49:23 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Message-Id: <D39B1597-8BFC-437F-A9B6-008A41846063@gmail.com>
Date: Mon, 21 May 2018 17:49:22 +0200
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.6.18)
Subject: [PATCH 0/2] Update Perl5 handling
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
X-List-Received-Date: Mon, 21 May 2018 15:49:24 -0000
X-Groupsio-MsgNum: 111562
Content-Type: multipart/signed;
	boundary="Apple-Mail=_80AA7DD4-04B7-42DA-B718-A28F58BFCAFA";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_80AA7DD4-04B7-42DA-B718-A28F58BFCAFA
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

ens Rehsack (2):
  cpan_build.bbclass: adopt to recent EU::MM
  cpan_build.bbclass: tell Module::Build the replacement

 meta/classes/cpan.bbclass       | 3 +--
 meta/classes/cpan_build.bbclass | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_80AA7DD4-04B7-42DA-B718-A28F58BFCAFA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsC6oIACgkQRJmWrtzl
Cp3SCw//bgEuIt7l8QQ/aDoBvpc3gprZq0P4H4qQjfNPoWUxoNB5S8xwr4niMVvt
ENdsHNKhTM4fmVvowWitA3/Sv5sUw+jhXySk628vYDMGXdlNXh0P0zl7dL7JIf9d
S/IkC6n07ayZFwk/7V90Okv3RUw2sOXFr13RdpqO2jX0SiolOuDoPAamBk941apo
SsDjHFjaJ72Nve9WGgGIiBwBuhZ3OGjv9MI6sRXzDrD65F/3lXoRGWuG9OUeGm6y
z0GcfcfmQ9XaJeRSxKhVRFnXCX5jTG/VKe8inR0RNlGAph8zSqVFtw+4U5K6Amfy
d0f2u3kTKIoG52XJJsKh/iaR4gf6/SeMN+4x+3DtoyaXagZ6h3mf3Aufseghb58m
tqe5U4zyBgSoHrbC+mxgNYGabaUWdGabZgpLC/EZnijjXMU2YCgZlosLebp0smv1
+svRT52J7UMcLC3bMeoumfkWhxFHYedB8cvXA+NTJYatIzRSjucnW+hHVpJ0XAi2
15DW7PLH5t9tHd8cIzUENhVRwDn3hhRdX2fZvfTrOhpWK+YDOk/3XEzwlyuU3kVj
aII6TmNBwXTDG7HpSyGiGMSC88GAIJjm3Ev8vDpmdSTve/1RQJF4NnwwigSpFZD6
AO5YjfMuK8xPRBKUaPdoG2gL9WYJt7cNsIGOLSwJrCZfism6jzU=
=BXp0
-----END PGP SIGNATURE-----

--Apple-Mail=_80AA7DD4-04B7-42DA-B718-A28F58BFCAFA--
