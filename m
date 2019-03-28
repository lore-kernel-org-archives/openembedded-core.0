Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 312557CD89
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 13:58:39 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id d1so17287038edd.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZxVpfWcFbbNzCHUWY6o/W+hc0La+G+fBMMh8WiU8yAo=;
	b=oTFoAwqBXoVpV65TbR+VLVZWH1/5pR7p3wwerE1msP0co8R2Lc++J3nlSxAoP9GQoq
	DtDAKAb7c/Rvc2eHQHONT/FQBQE4iWMlLsAyNZG2iZeceOw124b0IDedjsI4FgDryrra
	pWQ7kjQ1b4urR6e1P2F3dEp2TbojCoRF60bME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZxVpfWcFbbNzCHUWY6o/W+hc0La+G+fBMMh8WiU8yAo=;
	b=omlMDwUmbqCGAuudG0yHwvuvQwMQM96XmmYuifsVSzWhrjsLH6AmbnFnbKaseKLqVV
	TTV+p8jqUp2Lp7dx1VvjPJJHdOVKBaV7ZnS1Tky1A/u63srmJ/hgRSiI+OLQaR49nhAC
	nYC+7YgsWoIHnpO5hTt6xtJcOC7JRpZDtEsLGnX1NPdtDy+F94mSYxFbQY2phDRtXla2
	1dp+Q9fLu4CUwBdWuUQGVtYG9LvEDyTM5Pjc78st1rfJsijY4RtOfXftC5WlM3+ebXGt
	R4lEBnJXCPNJq1xiM/Ka0saFCsT5yT4/LrVQp0CHjrW0w55JvDxSrOhhBY40xdXGjKz6
	fOcQ==
X-Gm-Message-State: APjAAAXHyid0ly70cOG4c6AxMHqM/lqQYP5BqeYTGoc+DFejWwd1EVmO
	+S8y7dqRj6n1cJtPbQYvLapWDg==
X-Google-Smtp-Source: APXvYqwCYNzffEBWto7qf1VF9Po0zWttD0DHQcmPRYoBALKFo4ncqPHvrrtPfUU6bBqewVFMnvSS4w==
X-Received: by 2002:a50:bdcc:: with SMTP id z12mr5847712edh.138.1553781519914; 
	Thu, 28 Mar 2019 06:58:39 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id i6sm4272743edn.16.2019.03.28.06.58.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 06:58:38 -0700 (PDT)
Date: Thu, 28 Mar 2019 09:58:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Yongxin Liu <yongxin.liu@windriver.com>
Message-ID: <20190328135834.GL18421@bill-the-cat>
References: <1553683062-24444-1-git-send-email-yongxin.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1553683062-24444-1-git-send-email-yongxin.liu@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic/bootimg-efi.py: add new source parameter "initrd_rename"
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
X-List-Received-Date: Thu, 28 Mar 2019 13:58:39 -0000
X-Groupsio-MsgNum: 122720
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WHpPn4mHPEwODgSf"
Content-Disposition: inline

--WHpPn4mHPEwODgSf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2019 at 06:37:42PM +0800, Yongxin Liu wrote:

> When using initrd in bootloader configuration file, we may want
> the name of initrd to be fixed. However, the actual name of initrd
> may change and depend on distro/machine's name. "initrd_rename"
> gives user a chance to rename initrd in final wic image.
>=20
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>

I'm not nak'ing this patch, but I've long fixed this by just not using
the "efi" plugin to make an EFI system and instead IMAGE_BOOT_FILES to
say what goes where.  There's a lot of cases bootimg-efi doesn't cover
but are handled easily with IMAGE_BOOT_FILES.

--=20
Tom

--WHpPn4mHPEwODgSf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcnNMKAAoJEIf59jXTHXZSSuMP/0YJ5zviMWaI1Im8ynKEcWcE
mvWVl0gnpYMdxoPbT9BX9kOiihd1bITi7QTgeVsYwbpQ7E50blqF9Tc5O2ccr4By
wxTdEX8HkjJqoVcgScOSOU5YhuR7UpxGG59GdnWWimMQryjEANPxqjFyR/ynS6Nh
wYs8rU311alW+Sib8VrYiu7thDTddtWGIAZC7xlYTd8MO7TEqHbAub1buO3lKySx
YSNtNg9VJhaMGvHfgOkwF3GhUqdJgQFCyoOFpUtNMHrBcYhXcwEUdayTAjK+tLex
lUVLSBI96+jN76Rh0DkvvWj+r8rEo3yZm/F7fPAI2+RXm1MPagFU6PwHT+7fapz/
86ROff46YJMSxPiBlWBiJBs7eVUnoud+2xOMfX7iiigvLUCxJ9/wInshFkQcIpHH
8aVXyRkdhzzTJnHtN7eEj2SLfhbcoiPahqctqpxUa4kCXT/iNu4ffmH8BJbUaT1f
Eec8KbGmez6jBfbkZ/EnxtE33eyhO1S7ZBCrOvNg+mq88gTTVWYS2OCaMVs07hHm
A1gFVtUtNPGdwzynFHyfswzXc/Qh5Jq9AXf+lPD9Mj6MTH+GOL6u98uWPl6I0pRQ
CuDg5Dv1fvKpUEDKWFo0MLWRiff03NgIhPNsl7EPNFhy6CC64R8x8UCcRVZVd4MW
4C0l6jLcOLdsy9h4uXPL
=ZiRU
-----END PGP SIGNATURE-----

--WHpPn4mHPEwODgSf--
