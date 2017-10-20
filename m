Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 558E3719B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 13:15:06 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id j4so6310604ywb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 06:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nGhITeuqaVr9BNwrsKb/US05IA8YGNsOtAU1JsDXluU=;
	b=c3QIlExW/5fdetp46vOVimZlk5GOorqRjNfKOJhREc9EkAzoylrN1Y5DZVe6w3sp36
	zwOXBT6jROcVsdmBHbvVHtSP6prHVIoEMOWj/zyE173ZtcZTe+rxilZBJUPpeNhG4cQ3
	A3lq2PYwIBp0F7BqKYItJSP8q5VA6vON7tt78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nGhITeuqaVr9BNwrsKb/US05IA8YGNsOtAU1JsDXluU=;
	b=aBSLAFDMAhs7lsQx4GbTaQnlbcdEsD3LvgdqQHIakmW7iChI0y1UfIb3Hj1UbH6Bbf
	aXTmKk4zRlHeioyGTB4OHiVXIa7nLxMrKrUEcYAuiP2s+Zk1K6zlWTnWG3XwMuiA4Q0i
	NusfHPHqpJYl/ZCd6ecYqIE/2qQcR6BKLSlrxoWVGOzHMuBbmPdWMcC19vGoebTfkGu5
	4tiEZ2q9eIrmhj5v2jO75YIDFNAT7h5tJMBp9KMbnadVVu2tYLk/qpWvk6Zz2jIf9Niw
	ijzALv9r/vc8d+QAzu8WvpkyKwApPablu9itgfBAuvGWnkw+NnsfEt2ljL0X8XfFgmh1
	K2QA==
X-Gm-Message-State: AMCzsaVBBAh6Ud7DYbS3JxHVyet+4ONEOree6b1i2w6IIzAryQXmhlID
	jTvW6WN0CLqa8YGOTXafYXrYP45zFZA=
X-Google-Smtp-Source: ABhQp+RE69J6BrhJcpmdDRBax5qga2YZXRfGK1JMoBljNxbTpNFV2UB/AR1z+HgIhqwCM9Nf5CaGuw==
X-Received: by 10.129.78.72 with SMTP id c69mr3174719ywb.212.1508505307944;
	Fri, 20 Oct 2017 06:15:07 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:5808:f0c4:2c30:431b])
	by smtp.gmail.com with ESMTPSA id z8sm394169ywl.61.2017.10.20.06.15.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Oct 2017 06:15:07 -0700 (PDT)
Date: Fri, 20 Oct 2017 09:15:05 -0400
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20171020131505.GG12015@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20171010210149.GE12015@bill-the-cat>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Fri, 20 Oct 2017 13:15:07 -0000
X-Groupsio-MsgNum: 104146
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vZw0zaBP6OGB9eta"
Content-Disposition: inline

--vZw0zaBP6OGB9eta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 05:01:49PM -0400, Tom Rini wrote:
> On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
> > When we have been told to use the UUID we should also update the fstab
> > to make use of PARTUUID instead of hard-coding the device in question.
> > This will make the resulting image much more portable.
> >=20
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> >  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> Where we did we end up with this?  Ed pointed out that you can tell wic
> to use a specific UUID, so reproducible images are not a problem.  And
> making images that are readily portable is why other distros use
> UUID/LABEL and not device names as much as possible.  I personally enjoy
> being able to put an image on uSD for minnow and have it work :)
> Thanks!

ping?

--=20
Tom

--vZw0zaBP6OGB9eta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZ6fbZAAoJEIf59jXTHXZSECsP/AnPu3XwUK3Dedcjhg3xV2u6
bhgu5Z3s1QqGqnVUCFUdpQ5HYuz5+KflMlmAnvIqLrfLXvT8imDf20z9TSYnAFrj
1sEJun8O9avRKdjF+4w95S2o6SvcNgmCcMHBK1nLZbt6HUqpF5fHXo6VzNq2IOwI
HOhUHBHZI8AmYPCltOicwluO7a0XRlPErJZ8evL/5bPkRLSf6TIzVOjz+GOI2wb8
xMYqQ0YoIIZHlRl4OIRIxKKxYYGY1fXg/Pxw5V1AOY6bPahNNljGCHh3PWe9ltWR
ZLMadMCeqMhJGq/qLS46jMR5WXNvnM15ytbdGdT8OtV/6RttOA7/MFq+itHUBIgF
UK8Yv5rof1RVyRTr3J6fheVFZwCxWDus+zk1rDhl9u6OwsITyi4V7S15/422yTbz
mq7bSZRfxBgZiIrtW3p6kRpC3NfGRCPSpML21LdhJccY4G8atilFQ20Azw5e6T+f
7iS/plv4vy61fNyZZ/HSHClvf5+dHiQFUjlRdi2moQpVEzC2nlK38cmxjayH0ONR
KQLhw3Tzte7r2A8Qs6q97N19E5pUgt9oJKnQss5pbRWGJPBDOkZonEm81utizzKd
lz6I1ZPEKpVHsyG3qm5k6qhDjRDl7vJw03Y55Z3qBo7FLSpNxtzjlyscBM6Dm0Vq
+carY7IYKVzwwXQgFqlh
=1Js4
-----END PGP SIGNATURE-----

--vZw0zaBP6OGB9eta--
