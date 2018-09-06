Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 46A357955B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 13:27:42 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id o17-v6so4105675yba.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RKJ8QDpt93gjKXI0pW1E8iNf34cG1mu4MTDfCkd2Mqw=;
	b=jqV0nSQH71c/h+imAorCTTl39nsnwXT3ZchPZ6NUFjCfK9OT607cOvHln+Y2I0GViP
	pbFPi7Khalm8e7cIbAmbIEdV3W5V2HwiXW5UmYZnSApdSWAIp33aoGGz2DU4DaYrsHQN
	CfJjfnpy0cK8HuroUcTDgcZwm+JxiUsLd3MnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RKJ8QDpt93gjKXI0pW1E8iNf34cG1mu4MTDfCkd2Mqw=;
	b=oj81+8TXUXWEwIljRu1Po1N3ribBESHkK15pGDSockbFHmFcHSh4jbdElGNUlDa5Cj
	9RVu0V8QRkY1ns10yhD3z6ZD4j1+U7b3PVJtARlTeV6nR3b4i+g1TF91l6JOM/C5fxSt
	L9NF/0OhhNHpuuo+Kk6mvXDeey6dJDp/fhWmkdwQ1NQImxJLa4AcPXnXmGjdhQALEP0X
	6O7scb+WXWLw2Y/dF187kaHHilL7b9Rqm7qYdU3GBQn3SdFHC7maOyIHENpiNOluhCae
	Oitlne87LeHAiHIQMwalPoz29ujuL8L9YN4TbUlNn6evNOzHVl/L1ba//M6s3fde91vf
	vA6w==
X-Gm-Message-State: APzg51ArMqZ+M26S425cvMTjqByvtbuG1shYxZ6RtptRPgH2Qz2elEUK
	MMjDtqBodcwU92vzgPq6aGzH5A==
X-Google-Smtp-Source: ANB0VdadwuG/QYYfIjVyu06pwVXQECM/Ozb2rEd6+V6t3c4bADtu5K2eb3CHVTItvDw2RY8yQDt/Tg==
X-Received: by 2002:a25:5205:: with SMTP id g5-v6mr994021ybb.238.1536240463028;
	Thu, 06 Sep 2018 06:27:43 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	r3-v6sm3115474ywr.80.2018.09.06.06.27.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 06:27:41 -0700 (PDT)
Date: Thu, 6 Sep 2018 09:27:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Kevin Hao <kexin.hao@windriver.com>
Message-ID: <20180906132739.GR26633@bill-the-cat>
References: <20180906131120.87405-1-kexin.hao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20180906131120.87405-1-kexin.hao@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: Introduce the --use-label partition parameter
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
X-List-Received-Date: Thu, 06 Sep 2018 13:27:42 -0000
X-Groupsio-MsgNum: 115978
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O/qINEs9E1FHj6Mi"
Content-Disposition: inline

--O/qINEs9E1FHj6Mi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 06, 2018 at 09:11:20PM +0800, Kevin Hao wrote:

> We can use this parameter to make the wic use the label to name a
> partition in /etc/fstab.
>=20
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

A few minor things below:

[snip]
> @@ -945,6 +945,14 @@ DESCRIPTION
>                          label is already in use by another filesystem,
>                          a new label is created for the partition.
> =20
> +         --use-label: This option is specific to wic. It makes wic to us=
e the
> +                      label in /etc/fstab to specify a partition. If the
> +                      --use-label and --use-uuid are used at the same ti=
me,
> +                      we prefer the uuid because it is less likely to ca=
use
> +                      name confliction. We don't support to use this par=
ameter
> +                      on a root partition since the kernel can't underst=
and the
> +                      LABEL syntax.

I think we should have the last sentence read more like:
We don't support using this parameter on the root partition since it
requires an initramfs to parse this value and we do not currently
support that.

Only because while what you said is correct, this makes it clear what
would be needed to support it.

> @@ -197,10 +198,14 @@ class KickStart():
>                                               (confpath, lineno, err))
>                      if line.startswith('part'):
>                          # SquashFS does not support UUID
> -                        if parsed.fstype =3D=3D 'squashfs' and parsed.us=
e_uuid:
> +                        if parsed.fstype =3D=3D 'squashfs' and (parsed.u=
se_uuid or parsed.use_label):
>                              err =3D "%s:%d: SquashFS does not support UU=
ID" \
>                                    % (confpath, lineno)
>                              raise KickStartError(err)

This hunk is going to conflict with Emmanuel's patch.  Further I think
it should be a separate check on fstype =3D=3D squashfs and (label &&
use_label) with a label-specific error message.  Thanks!

--=20
Tom

--O/qINEs9E1FHj6Mi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbkStLAAoJEIf59jXTHXZSqwIP/3T+DmIzV315OL6yvNorhh05
rQFpUwniQ0IsGnN5p5k5blJFK0FyquSblkMr8H8jeYvhg3RJJ2Zx5D6h58LxG1qT
EBES7kKDLidnW1+kFSgw1eMrbDU//V5LIY7M3f9CJDKhhSn9w4h9zdMKinO3Lf64
oZmATKkLj8vT+WePMtO92HxDj41FvkXce0tqSEcqriBOVK6m37Oh0k+KuOIPkeKP
fiF74Vm6gKZSrl25GxF0XMVflp6EYFUVQrgXZv15wvZsz/C3hvkykwHpT3f9L7ti
JZWG7fzSVb1tF1YPmn/nNE9M7XtEBzSIID808aDHKDdZ9VKn/KYFJn5XR/2b/2pC
SArvquMG3XSMozSMIJ1k8MawY8d+014Bz74ItcWIZG3yHauFYFMQHUgsQJjrxAdd
Dp2KO5EX8Ir3P2B6kb9MW4kI4Y3xP4LJQ+QJ7np96WTHEJ5gYEudqhKop08OiUMB
eSFvxrr46TRRCmIlmqJHdlpoF9mxNo0gPty+wV70Pv6CJ2apnS39AXu3R5kf1ZYg
pY4yyJyUyVoDXRxwrlEW/1dO6mVY7CBAX0IVX0qEl3oFj15iSZ5ORr1g2mQiBtVu
NxsJPf9oXZoTIH2KB3RwSJEitmKxHMZwSFcGpHAWRh19/bDK3wl9oKC4vUp31RbA
pEo0O65xBvJbISgi2Daj
=zYw+
-----END PGP SIGNATURE-----

--O/qINEs9E1FHj6Mi--
