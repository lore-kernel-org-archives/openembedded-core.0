Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 884887F7A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 23:02:40 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id p5so1495498qtq.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 15:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RX4o7w6roHmCS27N8ycZtpf26Q0gIXRPnIxHasXEMxc=;
	b=ZU8XZnPQDgSbT2SfmrmVXGPo0uXMdX3R8oQd8rCzKjKRt2PtgV+TeRIIrYtBQlbUaU
	YnOnA/hE5KPAQYLWyXy/tC8YoaOAzbKJGt70EE5JQpJcInvW+/OiPgOO8M/LImAFL2Vg
	4b/NLPiN6dMvriF6tflSkddtj+E+rH3vcdCbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RX4o7w6roHmCS27N8ycZtpf26Q0gIXRPnIxHasXEMxc=;
	b=B38x6u1vTKBVdao+nJIN0NPO0Px1QKtEUXfQOGJ4oEieXdfYETnFT+faE+X7oKbdCm
	pifLdxZ1sMNn4s0jGiC+aq+EAqWaXmO10xXtTuuskgWA2a+bJcnlfJsdWoTkTG1jQiS8
	ULxMBXZizSVb7j1w36WVsXK2NisqjaTt1UprrWb1/qDxcWTBoHxNj2e2gmpQbTt28EXV
	YMiIqK+PaQa4KKYucPQGmkDt3PRf9VzjA4sGbsCT7Yp8Opv1XRGd7xJWrd9XuoYnU7I1
	wLtJ/B46LKohQPOGFwIdv28XV93ZqaG42naDIBGDdPWBAnFwn/dbN/Ya+Oj/vzSuMhwJ
	5SCQ==
X-Gm-Message-State: APjAAAVVZBVnxlqGX1y75ZsPo0254aUJmFzQFtF1IdGuaTtnyf5CAwnm
	IppYaUbY9zuvRv+8CoRLEP/ETA==
X-Google-Smtp-Source: APXvYqyLXiWUzAcCuD6rRMd1L9RxoPd5q0C0q9s3yTJqhj3NuVgKXzcPy4Bs7zeS8wGYyim5t8CiBw==
X-Received: by 2002:ac8:1115:: with SMTP id c21mr5227656qtj.188.1575500561271; 
	Wed, 04 Dec 2019 15:02:41 -0800 (PST)
Received: from bill-the-cat
	(2606-a000-1401-86dd-7932-2583-af8a-646f.inf6.spectrum.com.
	[2606:a000:1401:86dd:7932:2583:af8a:646f])
	by smtp.gmail.com with ESMTPSA id z3sm4394570qts.50.2019.12.04.15.02.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Dec 2019 15:02:39 -0800 (PST)
Date: Wed, 4 Dec 2019 18:02:37 -0500
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191204230237.GE9549@bill-the-cat>
References: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core python minimum version requirement
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
X-List-Received-Date: Wed, 04 Dec 2019 23:02:40 -0000
X-Groupsio-MsgNum: 132173
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Content-Disposition: inline

--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 05:45:03PM +0000, Richard Purdie wrote:

> I just enabled hashequiv's server in local mode by default in poky.
>=20
> This causes an unintended side effect of requiring python 3.5 as the
> minimum version.
>=20
> We had thought that the servers would be 'rare' and a 3.5 version
> requirement for that was fine. It turns out a local server is also
> extremely useful.
>=20
> The code needed the python 3.5 async support and trying to write it any
> other way is a nightmare, we need that performance for the server.
>=20
> At this point I think we just give in and require python 3.5 as a
> minimum. Any objections?

In having to pick a minimum Python 3 for U-Boot, it was noted that
Debian/Stretch is 3.4 and gets end of long term support in 2022.  3.5
was otherwise fine I believe in the end.

--=20
Tom

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3oOwcACgkQh/n2NdMd
dlJpQg//S/21sRjbdhzxLtJG5TBKFWrIjZNuNhZuXm1rs/gQHUTkwa0kHj9iMB4X
kXmp1jvcfSr5MzXthrnWKWjQnWIxypl04CMvQ+XdC3iyXgNVN2eEa4CZ543Xt9c8
g20OCRXCu7Epzon2vn40zixSH1DZt0emwhs1N91FOyMFZeC+wRiZiM6tSXunLWsT
ybYOtbN9fbJeHcv2m6/YOuEmzCjvGGpr6rmbGrFcDawOoUswITHW6PvatRjZBU1G
XF30rNXfWyv1/L0lGa+TjNvLyUnDeA4/+Fr8kJbq8UBvIvGM0BYBt6H7lLadbqWD
27nhX4VCa5nTu7VrAfycgbGffSdmDXJMLg8T5nNqe8Qe6+S85nIsNxUScHP73AiI
7up1uEzPjxb2trGQRQIKgTwYhWbCO5xN8L3gPbIBpuArg+KxkrcrZXPjt6SWrJxU
siorVGsABVNGNdrXDLFA5/qcMV0Q2o8zjid4xdEtBxvghFxjAy0MO+MjR1X7XQCD
X7cB247iDKJ1EAKXOxnFyZX2MOzdqWurkvQ/GVF8gHvFxjB6iZb1iO9/RUDiDJOF
61yY5zHBPazZ/s8nSwiHGWcGRYF7iza48xicGQrHGnXOI2lr4dGdRouws2ggg3nR
7AoNjIe1ZOaTspiw+OZDzBqo6ksa0YgaESjuX7sCz+pjUaieu9Q=
=JaZY
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--
