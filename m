Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2F43C78469
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:57:23 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 83so25605576pfr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=yq25SskO/U+W7fj0ielTBFhJ7RyBmOcLZuWMAt8O+mI=;
	b=ad97E1inQiRzlC5Bev9zo7qdzYe4tattrY9lPX7aJBkB6uKX9s/iLYo/REBO4jlnIs
	TJTFCENSgRzcvbNDfF/TirY1q9xz9pHydLqeXSecyzb54TAz5jCu6EhLF56IdaPdMBq/
	9spRXxFpiRutdQxY510Z8h+J6nFUB+Fa+amYqMLxYFrLJmsD7yaDm6zQlhGBSx/Oau+w
	vxCa+/puqAWtMvcqUn+/QlI6NecMSpyC6/9MmmAnApWJV4Wfo5iokV9c7setRbHFUfXR
	IRZkuBhYW3SkJmyDiwC3ICNvdNJ2a6d89sRsccaJx6bRzOdPrUms2GU/cFlXiO1KQ28E
	ZgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=yq25SskO/U+W7fj0ielTBFhJ7RyBmOcLZuWMAt8O+mI=;
	b=errXSQWs//nGsSsibPzLbcVq4DDvjT0OO940QxA1+QVaoSPf2i9mVV6Q4TDXxnSgtG
	k5L4rt0C3f1iN8SlXTlNmD4a1yK1S99l5xB+JBzHK0+GOKiqRCkZnqv24XQnuX1OxiPk
	FxX2fXHXmXPqSd5NEzHbkvzF3HCfsecxr85hN1Yze2+30C4jP46bfttX/Aw+u/DCn3G7
	566fHRv7ZHSpPz4f1i4u246q4uzTGDU06ycvFEZt0slyFvRIQgp4z4F0a1jQkY6KMovp
	ahgOBQ7gmdftnvGsVoZkXtEQ9BbNmlT5db1/CfZIdVmdY/lZuPJxpcOE3VGo2PaMp5j9
	LKQg==
X-Gm-Message-State: AKS2vOxNA7ZFwMW6TxG7BlonhryW0YYIaJYAoQdyL/SsCk0QESrWALvL
	LjX7wgYieu23wLyFUcI=
X-Received: by 10.98.55.199 with SMTP id e190mr4608943pfa.15.1497635844695;
	Fri, 16 Jun 2017 10:57:24 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:745f:c6ab:d92d:5f3f?
	([2601:646:8882:b8c:745f:c6ab:d92d:5f3f])
	by smtp.gmail.com with ESMTPSA id
	t82sm5823994pfe.88.2017.06.16.10.57.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jun 2017 10:57:23 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
	<671fa9c476269908cd092f0d033e03ae477119c7.1497615866.git.alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <3606dfa4-74a6-d44d-f902-1733cbdf6e1a@gmail.com>
Date: Fri, 16 Jun 2017 10:57:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <671fa9c476269908cd092f0d033e03ae477119c7.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 28/32] gettext: relocate msgfmt utility for all recipes
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
X-List-Received-Date: Fri, 16 Jun 2017 17:57:24 -0000
X-Groupsio-MsgNum: 99006
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="7mNmxnPJDnWbNmc4f30LrPqbRMAIWvkgv"

--7mNmxnPJDnWbNmc4f30LrPqbRMAIWvkgv
Content-Type: multipart/mixed; boundary="JDBEtGN02fakjJMu8bxRPx0pnrDtGUKSR";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <3606dfa4-74a6-d44d-f902-1733cbdf6e1a@gmail.com>
Subject: Re: [OE-core] [PATCH 28/32] gettext: relocate msgfmt utility for all
 recipes
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
 <671fa9c476269908cd092f0d033e03ae477119c7.1497615866.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <671fa9c476269908cd092f0d033e03ae477119c7.1497615866.git.alexander.kanavin@linux.intel.com>

--JDBEtGN02fakjJMu8bxRPx0pnrDtGUKSR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/16/17 5:28 AM, Alexander Kanavin wrote:
>  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 4 ++++
>  meta/recipes-kernel/sysprof/sysprof_3.24.1.bb | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recip=
es-core/gettext/gettext_0.19.8.1.bb
> index 83edffe530f..e080e76bf77 100644
> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> @@ -119,6 +119,10 @@ do_install_append_class-native () {
>  	rm ${D}${datadir}/gettext/config.rpath
>  	rm ${D}${datadir}/gettext/po/Makefile.in.in
>  	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
> +
> +        create_wrapper ${D}${bindir}/msgfmt \
> +                GETTEXTDATADIR=3D"${STAGING_DATADIR_NATIVE}/gettext-0.=
19.8/"
> +
while here, perhaps it will be worth looking at automating the partial
PV use here


--JDBEtGN02fakjJMu8bxRPx0pnrDtGUKSR--

--7mNmxnPJDnWbNmc4f30LrPqbRMAIWvkgv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAllEHAEACgkQuwUzVZGdMxQ3mACaA/gOjh0Ldoruu/jSSQDGYbg6
jtgAn0YP7bH2iHZi9mQ9ns4cW8UjHCrw
=hZFc
-----END PGP SIGNATURE-----

--7mNmxnPJDnWbNmc4f30LrPqbRMAIWvkgv--
