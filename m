Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 87CB67FA28
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 19:14:33 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id i190so3130731ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 11:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5dc6sMsdK43B2wjfJf8S3pBQYOavUYvbvXcwBoMB3Co=;
	b=hikojCVtS/EqmeSfAh93KG07yegC+bkNPW783mdgJg6KUcpqg9JMJZ3zlZSk7zL9L4
	yjEHhOE6z6JzVM7GStf/UQ6uQNAPlp/v0AdenodxuiYXpYku+Tlq08GK+h79pmgH8pSl
	14U5yZjuMV/pNc58MGFbvw9WEFwQWlr4lHZ4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5dc6sMsdK43B2wjfJf8S3pBQYOavUYvbvXcwBoMB3Co=;
	b=QCbubnke0fJeLcB5CZqaHn5fcP0mxsOcyWYFrLI3Q1UbSQx9MOd/KLj0kXLF36+4cA
	JURTemN+Hp63jG8+imzzxCUL9VfvVyMJd5DOIIPSDcUqoxxqVsh1zKAUfeELg9BU7KGH
	pJnKGjtyO4NMjppK+/WKUp4XjezO7VjgUa96a1ZEua7fFfz/6DV25lWEKqoO+z+ZkT1x
	4lVV1MDlY4WarNtJlcdZME30F5qRL6Ig5J+31YAHg76GgSXmw2S8Qus9e5mLs11JIJCb
	S6DDAXs1BKhJEv+/9+NfsgCmiZqZG0mQZ9/7yjKAUImLUJBYQQOfZAf4W804d8Inwy5y
	QwJg==
X-Gm-Message-State: APjAAAWnhZi9ku24D7pJwMY9f5ZVoKhyiIso2P//VR02ppBKl1+P837F
	WfBRnVwJqpA+LaZypcH8bEMxfA==
X-Google-Smtp-Source: APXvYqyToiIfN5o5hYc0XxZ9JyzvlYcC4id1xuXfZL2i+SoRpDmtgk13mxFlY6HfS6MtvPqvEI27gw==
X-Received: by 2002:a0d:ed03:: with SMTP id w3mr11015785ywe.215.1575659674293; 
	Fri, 06 Dec 2019 11:14:34 -0800 (PST)
Received: from bill-the-cat
	(2606-a000-1401-86dd-d558-5e40-3af2-2592.inf6.spectrum.com.
	[2606:a000:1401:86dd:d558:5e40:3af2:2592])
	by smtp.gmail.com with ESMTPSA id
	w71sm6399860ywd.57.2019.12.06.11.14.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Dec 2019 11:14:33 -0800 (PST)
Date: Fri, 6 Dec 2019 14:14:31 -0500
From: Tom Rini <trini@konsulko.com>
To: Daisuke Yamane <yamane07ynct@gmail.com>
Message-ID: <20191206191431.GV9549@bill-the-cat>
References: <1575627191-12947-1-git-send-email-yamane07ynct@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1575627191-12947-1-git-send-email-yamane07ynct@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] u-boot-fw-utils: Add capability of building from out-of-tree
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
X-List-Received-Date: Fri, 06 Dec 2019 19:14:33 -0000
X-Groupsio-MsgNum: 132282
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mo5R/H9UGRM/aoK7"
Content-Disposition: inline

--Mo5R/H9UGRM/aoK7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2019 at 10:13:11AM +0000, Daisuke Yamane wrote:

> This patch also helps to build with EXTERNALSRC.
>=20
> Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--Mo5R/H9UGRM/aoK7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3qqJcACgkQh/n2NdMd
dlI5dw//SEaZt93rENtw7kyT6MSGvd5+z6NFmyDUWWb5Jq8JOdnQsA3QvmHIkrmg
/VBbtKP3cyZFHKT7uHrygQRPF82dMKtBytMN0JfFAUU7LUa1sstOqNGvHLP0KNP3
QTEFD1aGv2PYz+WNsu8SBAyKjTuf+vjTQAnLKm4mq9rR96UzjJpjnsZKaGyqTzZW
mITenGqZQbIfbbcay7xjQxBScF1EbrS+gvMkUTP8/oht5WjqLCpp/+Qtl6hKv+lL
dN/khazDawMSmRzEJ9gMvueq6yHMsU2CbcOryv+nOIIzWE1GU2SFxPXpOZMfWbRN
9Q+45A6jvlS6VeS2jAv9I/roxPCGVecRZ3zAcHOrFhJ0PC/77jaQ20WPDS086eo+
8EJnb04dxKPpo3JB5Qot2l6meUP7D1ZGsNMcgj0WXle0jLKaZNiqsZPJu5m1XCDs
4H/scvOnaJwZuZfQls9Tvfp2JqQ3avdHPS7ckVC9sEVkLJsKkwnO+RRtTo1w/hL5
33h9DN7ZeUfZV5z5YL9j7I/AezdZaDyfeapYL27mjSip7xE8XDJHm/J1BM8zeUMS
td/gS+WgJ0kUYRpzPrBeueRd5gAfvs0KMR/ubdmwtKMQ1G0Qah05aWvWu1bGNa0X
mh9wPI5l+mFDhHVxUeMp9RqtPyQtR5ovyW0c+AhkZmJEXUpAFco=
=0ume
-----END PGP SIGNATURE-----

--Mo5R/H9UGRM/aoK7--
