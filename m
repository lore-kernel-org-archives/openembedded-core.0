Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 974BC7D717
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 18:56:07 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id s57so12132529qte.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 11:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=U9bQ9+xkiiX7EYZjm92xXpyQZLQmkYGF3eNcJ9Oq80o=;
	b=A7BVdvA5l9K7VvdNC4pGBuv4Ebw8q2DkkhnMJgdkiVI1/HlML6z8EdJxlTkrmqpnE4
	ubfxCHs/rmlIjxARz+cMkcJ54tC5x9B033uY/YQ8YSEbbALsQIyvKpMsLhD06PJ8x5hd
	WEz9R/+E1V61QTT4iaktPrCoISnFTiSQ40OsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=U9bQ9+xkiiX7EYZjm92xXpyQZLQmkYGF3eNcJ9Oq80o=;
	b=aYze1y0Ug0RNXJlQr5KFz22PAla5dgMtbQDE8AcIhRqCUGe23Goqtn/yZwBxwIuqyv
	D7LY4T6vYGf0wCmpG01kAdCBlBrO8m+EXX+qSbS+sdnwu9rjdx9ycTgn8ZCxpb76y6di
	Ou9wa557JYexPLZlNQLWS2M/JkxJS74bdKPOAJSViXg3cJeJiyyauoBGWdF+/DItugnP
	wNQyqxEy/IvQ47HBDVVy8XB9wo0mgIsPXvqmY8bESFaAZcv4KeLNl3ptn6KiaRJpWLJU
	PhBrQf9tgbA0MqBqf2yxQRD26Qpo6sell/lkTxCb7UP+2Em4kIle/Otqc5JVkbj08pDf
	s2Dw==
X-Gm-Message-State: APjAAAUn5SfFF2424aJd7zZlKVhzaU6srSKSd0zI4CQWd344kVJqrF72
	kJ24LNEi1LXegiiCoXz0/OJk2g==
X-Google-Smtp-Source: APXvYqw7GViCBVJpgp1OUTIa2PAClqueHg+qTbmUEJwfrEZdtd8jf+64XrsoKy8uYpGgd5NJG0dAyw==
X-Received: by 2002:a0c:d047:: with SMTP id d7mr33396773qvh.64.1559760968424; 
	Wed, 05 Jun 2019 11:56:08 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82DE-1C4D-9455-D8B2-DEBD.dyn6.twc.com.
	[2606:a000:1401:82de:1c4d:9455:d8b2:debd])
	by smtp.gmail.com with ESMTPSA id
	w189sm10301963qkc.38.2019.06.05.11.56.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 11:56:07 -0700 (PDT)
Date: Wed, 5 Jun 2019 14:56:05 -0400
From: Tom Rini <trini@konsulko.com>
To: chee.yang.lee@intel.com
Message-ID: <20190605185605.GC10942@bill-the-cat>
References: <1559749102-44872-1-git-send-email-chee.yang.lee@intel.com>
MIME-Version: 1.0
In-Reply-To: <1559749102-44872-1-git-send-email-chee.yang.lee@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic/engine: include .wks.in in wic search and list
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
X-List-Received-Date: Wed, 05 Jun 2019 18:56:07 -0000
X-Groupsio-MsgNum: 125416
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline

--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 11:38:22PM +0800, chee.yang.lee@intel.com wrote:

> From: Chee Yang Lee <chee.yang.lee@intel.com>
>=20
> allow wic to list and search for kickstart file in .wks.in extension.
> basename show by wic list images to fully exclude extension.
>=20
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc+BBEAAoJEIf59jXTHXZSBv4P/2UES0SCc5GhscOhZzro1pGX
Eivx/RVNoKvijRBsBxkW93mUv7ziRm09g8CxcktwtNw/D2O7vXvG9jN+nrmCRtIZ
BI32UZNiyKkW+iibeAorut3qwgf9JSxzjp+U1WQ3AUpaipL8MbQiEgmepZ+jDr7z
HjNwhaAEBzwcGT+wV35vne2naA+6xsF3T97m4be7LEXgNShtfoRG55/eElV45vgC
cn2h0TadN0UGIUIR0xeDdB6czCah9DpamFyJWo2GzEaDUuCeh71lxnZYGKKkQFMc
6M8vTZGyvulMrCfHCdLTR9Sat9S+UF/i0xBkN11G4Hrum4cFtuWitM2qKAczTfoQ
TMX+dKfEyCd9t+cMErJGcxhIrMw8peDV8TT9OF4hch74IVz38hYsGO7tL0Ruq29V
YFUMV1DSWpIxWLKQW8urY+tQ9cLDajD6vFMbaGLf28r11o+yddV0XbTbxsn4Wz/M
7/PymmacKhSx9zDQ/l0nftHEt3K4T56g4vNIKJqToPUEWOU7n0qyazKjY2WPzqGB
HrxBHDZhbraFXi9KTuqFpG/qlHq6Uf6WaPwzqzaK5Z0ZXRetgas8GVkI3yEa0T0F
REzBTgRqRR52LQa1EciykrYQGWSuJBsZf5uKTz6SFfvJp0DHIBI5w5zvYL5+sxnv
88Yq8w8moJjTinDX7wFU
=asCi
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
