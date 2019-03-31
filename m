Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5CCC16011C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 20:11:46 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id q14so6357899edr.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 13:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=43WrMqsdPDWQPrJZGoT9hhPG7bBfBuqVmCYSr9b1cLI=;
	b=G4dhsQIr8kKm9KP+s9mdp1vuT8lM18iqXK7KvkgYPY21qqhriCO/FI/YkySnGo2hGj
	aIyLpfoRYhz7TtlNbar6a8YheJ8F5lAXz8lJYOqnsjrmAUOVsXFUfvA8JojCWUkzYsnZ
	f3v3r2/Ks0nFnpf2FF1R+IvLXuL+02+oJmjyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=43WrMqsdPDWQPrJZGoT9hhPG7bBfBuqVmCYSr9b1cLI=;
	b=cCI0iwuVj7+xtz9qiianTCktxL6R+GxbQOmGdapMcO5vmUO8ZZXLPkaKwKp6U4QOsI
	adLauAvV3n4IQgt62yMyc3yw6mF4egued/qLXP8Tc9vSnT1XZYvG7wjSeDyC9q5c54Ep
	YaK6pMXfNESsztvaBySvrN8OL8nxzaz7b/DHBtGbluKlHNrMxPmbwPWLpGgXYRCTvCmX
	wYwAYMIs8BI7ABUnHtLxWT0Z8OyGw/SYUnIseAm/D9nk7kVBu1BKXQM/RlfgMw8/S3q9
	PwLfy5SPjy7/LcxntiHo+kdq2dK15WgYLQjVbrEU8PHoDvPGmfN/w8yV5kg0/KEtwmfX
	UnGQ==
X-Gm-Message-State: APjAAAWoXosPnLM6D/DVXUnM+zwqPUbRefi31m34L2I1Q1kZUqehUCeh
	2ZZObpyZEKWn3xx2H50AEGfYQQ==
X-Google-Smtp-Source: APXvYqyqBu0X928EdL/BNDChrbvnBAjw8ddHltl/06Rd2mcMMT3CNT6N+dBXPiPuf30tSzB5Z+ZLdA==
X-Received: by 2002:a17:906:d20e:: with SMTP id
	w14mr33564127ejz.160.1554063106812; 
	Sun, 31 Mar 2019 13:11:46 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id g3sm1501443ejp.31.2019.03.31.13.11.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 13:11:45 -0700 (PDT)
Date: Sun, 31 Mar 2019 16:11:41 -0400
From: Tom Rini <trini@konsulko.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <20190331201141.GH18421@bill-the-cat>
References: <20190331155012.3085-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
In-Reply-To: <20190331155012.3085-1-open.source@oleksandr-kravchuk.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] vim: update to 8.1.1097
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
X-List-Received-Date: Sun, 31 Mar 2019 20:11:46 -0000
X-Groupsio-MsgNum: 122800
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m8BvB8WNsQtskLOK"
Content-Disposition: inline

--m8BvB8WNsQtskLOK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 31, 2019 at 05:50:12PM +0200, Oleksandr Kravchuk wrote:

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../vim/{vim-tiny_8.1.1017.bb =3D> vim-tiny_8.1.1097.bb}          | 0
>  meta/recipes-support/vim/{vim_8.1.1017.bb =3D> vim_8.1.1097.bb}   | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =3D> vim-tiny_8.1.=
1097.bb} (100%)
>  rename meta/recipes-support/vim/{vim_8.1.1017.bb =3D> vim_8.1.1097.bb} (=
98%)
>=20
> diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1017.bb b/meta/recipes=
-support/vim/vim-tiny_8.1.1097.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim-tiny_8.1.1017.bb
> rename to meta/recipes-support/vim/vim-tiny_8.1.1097.bb
> diff --git a/meta/recipes-support/vim/vim_8.1.1017.bb b/meta/recipes-supp=
ort/vim/vim_8.1.1097.bb
> similarity index 98%
> rename from meta/recipes-support/vim/vim_8.1.1017.bb
> rename to meta/recipes-support/vim/vim_8.1.1097.bb
> index 7627d2844b..4de1bc3807 100644
> --- a/meta/recipes-support/vim/vim_8.1.1017.bb
> +++ b/meta/recipes-support/vim/vim_8.1.1097.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D "git://github.com/vim/vim.git \
>             file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=
=3D.. \
>             file://0001-src-Makefile-improve-reproducibility.patch;patchd=
ir=3D.. \
>  "
> -SRCREV =3D "493fbe4abee660d30b4f2aef87b754b0a720213c"
> +SRCREV =3D "4fc8e2f8bb3eb42df0f72cfcc1f8f8e567e7ce4f"
> =20
>  S =3D "${WORKDIR}/git/src"

Looks better, thanks.  Is there a particular fix / change you're doing
this for?  I ask since every commit is a version bump we might want to
set a guideline of once a month or so for bumping vim to the latest.

--=20
Tom

--m8BvB8WNsQtskLOK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcoR79AAoJEIf59jXTHXZSag0P/24xfPMVuuLYFzd0oC3+G9yI
N6Hibb8L55GfUxwKPuNF2aCq1CG0QhZKspFulYe3pw0etpzSYkuOUZ59v79kEE3Q
q30KNp029011ARhM5rYh581NQE+G7rVXLbypyIApu0WGanM0JfPIUfFyQGYgL1Rr
IGJmaYUiIGSrIIoJFCB8tF/U1wqk2PtGJDKm2Etr891vFm0O5O4PRagRyvwu9wtC
gyxpuJ005Pq6VJ5oF/eZOt2pEOPbS78MCg99zbxurIkjvvgVRTMRMFdJr0Mtqh0i
ZuGw769GktXJjBc/DH9101Wxorq2WM0ximM3WTwLI2hA+YE7BvCHaEMj5Ft10N/7
d1dqtrWa1f57mbdyvUzN3iTGyE1LzcFagwHQ94Wi9bcyCarcTbS6JkMyn5tnS7W7
jBvZ1to0oM3s1UCMiUYwK44peoxLdE3CkuKG2z7da0KQbN04tPIlTpG7MMlxpU2i
UUcBxOpQUDP7sDCsQnvs2IUAplQvCEU2I5mdxMhEkFHhGmcGBIxrbMfhdIb1M3lr
tTJTp0BRpq0bgfrNDBDpxk32rOUGGdK/JaQpHaNxhE0KhaUV7PYpTWUadqK2JoSP
pVtO8iNqpg7jaNtsiMAZsGizAws/5M4MOXqp4PzVu3hvLTYjXH/AmXLVf6+D0XAz
UToGlz71zIYtaAgXDs+z
=kCGF
-----END PGP SIGNATURE-----

--m8BvB8WNsQtskLOK--
