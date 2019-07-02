Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 26A6F7E774
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 15:39:50 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id n4so18410618wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RO04tvFjUnXu5rNNDKfOI5Rp5pHMS2wBTXDT8J4/8ZQ=;
	b=GmrqHL90P+YSLB4Pi6TrULAAH6PV1o0VOhtRCYNd8NDMv5Do7EiUuuyTKDqwt2Wluw
	Mh7T5ROVwQkw/zoSOl+UzoOKmy71Onhv4X84yOLjknDo9AOcGX4wz8JMARA3EM+xtQ5w
	OpgIhWd/xZwuh0/pOPaXNTjOMn4jNdJbwVU9tzNd364kxedRCcbeFJ0FCJhu6qiVdMYY
	yBqqU55NHxH5JeOyN7pM6kgL7KwgBcJgS5Td263inN0xBAZGSdCghrwDSbHHafCSY+DU
	nce7AGw3Xt7j284T2F5qoNW7oQGVmRgvToitk59+RAAYeKPmtYGuKLZT6sXfwuZKGGED
	igUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RO04tvFjUnXu5rNNDKfOI5Rp5pHMS2wBTXDT8J4/8ZQ=;
	b=QpnjCTD0PFhlp68hUvLIsvWdUuYbF5DDGzAghQWE0Xri32IS1LgormcUi5clTTs3UD
	uNgSr8cGLRKIbMNhql4IdO/8UqFD8URzqqgYONexNf7V2mL+djzDhbVeoJgkT+DMsucS
	uyHhNxgIkaq7TPryVJ4LgyeHwHb78/XPdvpxjSJBbEW5XbAPLn6cQeAfxyVjTOp6rsZb
	itrt0zWDcQQGQJsvdVKyqVPI1vepv9Nrg+531L0AR8gJz6HkIM2D9dMnLzxluMSzVD9/
	BkIDdk5g/RcOph2dBH7uYF1MBvR4fOVe6KwxC+efwrQ3pEYVz+eteqXv0bd3As4BqCXq
	8utQ==
X-Gm-Message-State: APjAAAV1ny8ob9H9XnsdsscwWbCSqSiNX/o1JZpnQCLmgxoxSo4V/YE3
	UL+HYHeor/W+Gq2VMXiUwIA=
X-Google-Smtp-Source: APXvYqzupUnWCvJLdxOuC8b670gP5fXvvly0TzQXypI+WdXpZViygdQt9Wj38vuzaC2Ql0azvZ8WEQ==
X-Received: by 2002:a5d:4909:: with SMTP id x9mr8175734wrq.226.1562081990920; 
	Tue, 02 Jul 2019 08:39:50 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	w6sm13062254wrp.67.2019.07.02.08.39.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 08:39:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 2 Jul 2019 17:39:50 +0200
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20190702153950.GB1484@jama>
References: <ba3936e9-0582-4187-89d7-0a8f1dd4c550@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ba3936e9-0582-4187-89d7-0a8f1dd4c550@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: The state of reproducible Builds
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
X-List-Received-Date: Tue, 02 Jul 2019 15:39:51 -0000
X-Groupsio-MsgNum: 126485
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline

--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2019 at 10:58:04AM -0500, Joshua Watt wrote:
> I'm curious what people thing about all this; How important is=20
> reproducibility? How reproducible do we want to be? How hard should it=20
> be to have reproducible builds? What trade-offs are willing to be made=20
> for reproducible builds? Are there smart ways we can mitigate some of=20
> the potential performance impacts of reproducible builds?

For me 100% reproducibility isn't hard requirement, but every
reproducible bit makes it more useful.

Once we upgrade to newer Yocto which includes more of these fixes my
plan is to achieve these milestones.

1) no changes in buildhistory reports (especially files-in-image.txt)
between 2 clean builds on the same host
2) same as above, but on different hosts, but with the same OS (now we use
Ubuntu 18.04 on all LGE builds)
3) same of above but with different OS on host (not important to us, but
interesting to see which host differences cause differences in the
target image).

A) no changes in installed files (not only in their ls -l shown in the
buildhistory reports), again on the same host and after it works on the
same host, than maybe different hosts with the same OS and maybe then
also different OS

B) no changes in the .ipk files (after the packaged bits are identical)

C) with the hash equivalence server we might get rid of .ipk files
having different EXTENDPRAUTO from PRserv when they are rebuilt just
because some dependency changed the signature.

And all these milestones also have another scope axis (it's great to
have everything reproducible in core-image-minimal, but there might be
still a lot of differences in bigger images and our images are really
big) - but again every reproducible bit helps, once the low hanging
fruits are fixed, it will be easier to see what next is causing a lot of
differences or even filter-out the known to be not-reproducible bits
when comparing 2 images.

We don't hide any source code in salt mines, so reproducing some very
old binary (on possibly very different host OS) is less important for
us. Similarly detecting the maliciously modified binaries is less
important for us because we control the whole pipeline from source to
the bits installed on the TVs.

Being able to see that the diff between 2 official builds doesn't contain
any unexpected changes is probably the most important aspect for us.

Also in the opposite direction when QA reports new issue in the latest
build and we need to compare with previous one to find the cause of it
and now there is too many random changes just because the recipes were
rebuilt makes it difficult to spot the significant difference which
caused the new issue.

> Thanks for your time. I know this was a long e-mail.

Thanks for working on this, I believe this issue is really important and
I really like your changes. Once we get closer to master I hope I'll be
able to contribute some fixes back.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXRt6xQAKCRA3VSO3ZXaA
HOQ3AJwLvAq7KCQ5lxPqAnLUfN3n6lh3mACeLt+NYyEEd2coVh2TNzL2NIS2XBA=
=I8bm
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
