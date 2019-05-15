Return-Path: <trini@konsulko.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 261427C89C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 15:34:21 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id v7so2556169iob.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=S9dvB5ArDNeVYCPToxok3/QuZnsINNkNtJlIyNduoT4=;
	b=Us1NEw+wg8603IUPpVZjdPlZS7ZN4oI+svUtWjAheQy9yMcvdcQJNvm9idzJ4PcJGR
	m2C12uEr3D1CVXEh430af+ZpZ+4VDZYvJmBRXuUTXM8Ch7h9zkGfXh8uAfwflmqZ+oR3
	rANVuDe2uyPoc/yyZZX/Shek9eDV9TsXI+YMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=S9dvB5ArDNeVYCPToxok3/QuZnsINNkNtJlIyNduoT4=;
	b=FdyzI1WBOBsIRO/g7pkT1JFOguAu67JrGSZfHE5A21pbu5T0QHSE85AgGFHdsC9H5k
	WcO1DCd5ZZ9BKgpDBv+/6ZSpDtTZq9Cbcyh+jYkpPr+fL73SKDMv1IgGQI/htNomXj8k
	beLzRGMoMpaJTeMyAe3aQkJOT2lilGI58pUjO7j5Nsc93Y6vCPqfDII42QAiE+riiMxc
	6E70xUxnXLY1X5pLxGeLy7T5XIlyc4UDtjjp4t/+Ryg3zFsqt/G6KUfTsArMqhVFkk05
	HTt+7pzHywb0M8cdInPBpAcDScpHEPkvoJ96FDSCT3BphpZnfX9ZKa1tpHV+kylBQ27k
	OuVw==
X-Gm-Message-State: APjAAAUmWiE+ytlRjfQdzCRBNEvRmIW14eT+63jJB8PufpPGiwnNsZiX
	lJqtoPeOtuXwGAnTJmYuHvFL6KHQflvZDw==
X-Google-Smtp-Source: APXvYqz8DkSC7aKqJEAPYQH2zg0d355YSiRLR6HqzBbq/FKbUUS2SyiHEo/F50i2FGAUtUUrvTLhWQ==
X-Received: by 2002:a5d:9bcb:: with SMTP id d11mr2463520ion.247.1557934463062; 
	Wed, 15 May 2019 08:34:23 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	p129sm240270itg.14.2019.05.15.08.34.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 May 2019 08:34:22 -0700 (PDT)
Date: Wed, 15 May 2019 11:34:19 -0400
From: Tom Rini <trini@konsulko.com>
To: chee.yang.lee@intel.com
Message-ID: <20190515153419.GJ22232@bill-the-cat>
References: <1557720429-21169-1-git-send-email-chee.yang.lee@intel.com>
MIME-Version: 1.0
In-Reply-To: <1557720429-21169-1-git-send-email-chee.yang.lee@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] wic/bootimg-efi: replace hardcoded volume name with label
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
X-List-Received-Date: Wed, 15 May 2019 15:34:22 -0000
X-Groupsio-MsgNum: 124481
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vN1VrOpIkjMGbM/7"
Content-Disposition: inline

--vN1VrOpIkjMGbM/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2019 at 12:07:09PM +0800, chee.yang.lee@intel.com wrote:

> From: Chee Yang Lee <chee.yang.lee@intel.com>
>=20
> volume name should refer to --label in .wks.
> Replace the hardcoded volume name  with label.
> set "ESP" as default name when no lable specified.
>=20
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--vN1VrOpIkjMGbM/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc3DF7AAoJEIf59jXTHXZSEtoP/3Ay5cEIdl+06KyxLzCoKJcD
p9A/QSA9lXR931lgvcBM8bfiBadL4UsB/UCEP8oW0gYsv1ah6mJcueD+KqcVjHNg
P3X6Xn35nTwPxgZNiDYA/vIx6OA6JLjoFzDbSlR0Mrw7yYkpIf56LSQlYaraCGtS
cxiTi++geyhPhLFFbkDshLTwZLNrmUAKyo0ZRlNgDBiZorr2/TOKglheT3ZgNAOk
9I9csfg4Nbt8/4hQYiypesdjul42uaaESqZ932E0v5igB0xFGu1IjHXMnsO7IzQn
wi9EQvmEUzU8XGvJToUAE5IzKEuQffpKuqOol6NjjS7PGAmWZVCn+G2SMU3I6P18
c7qMdAdbsZN7Irec756ZV7XoCe7pa//EwfhCwlqZjpQSjoG2zaVwYvRtkMeZ/+y/
ybF6JISDPmd8JS8eB8M9ND3eJ0rz7mr7Ti4gC5IuiNSb7x0BjhuSAekEWUTSQW71
9iErGEnasn5sExoNii3fwHd8WQOIUtI0NAIWPbmHw8BbybKgzS6mxffaR8Ko5r4b
sSAUvwk+7aDeML3xYcDEoUR8ZU21rg9Y2qzUCY7aMrvWe++Zas1fwv2zZpaz3fp8
hoAdkjsOTMyk3sxhNVbvAlHZwF0Id5YDFzGoq/eaQpbtbg8Ui9iBNrIBVJhjK4sD
5CdWm+TArXYkBuKNvCHu
=tTxh
-----END PGP SIGNATURE-----

--vN1VrOpIkjMGbM/7--
