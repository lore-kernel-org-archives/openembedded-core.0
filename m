Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id CF9C3770C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 06:40:36 +0000 (UTC)
Received: by pabws5 with SMTP id ws5so14398169pab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 23:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=eaGrKcmKuurLBhF7V7QoNCd2OWbpzN+A+n7wxNUdQaY=;
	b=SAOoGTtNGPyD8djMQlNNFatHfrzkpe3+NElLsxFTXYXG+drgJN3DM26YibHy6zoBfM
	M4MKRrxZX+FV78A+Rfht01yASX5utl2OKcLyA83wvdUY6j06N3v7gvHvXbr8cRSD/G/r
	0nqV1qkUGTWCxhrX+7p8YCdilObqT8GwkjfHOr4VQy0M81eY8K+eJm3TKIbChVDSULU1
	U8BpQycZWPSueKkYP+1dVUpQNlXCmHgjXleZSaVSGQe5i3f3ATWjcAjKhTr0J5iqv980
	KVIFGQm1nLxynhOAx11Yo6PfGqMjQfIKFhXUAvxFVA5o6fBdXzvaP2VlXY9tOkN+LwGt
	gKNg==
X-Received: by 10.66.162.227 with SMTP id yd3mr8365619pab.53.1444891236966;
	Wed, 14 Oct 2015 23:40:36 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:fd3d:cb0b:3cd1:e450?
	([2601:646:8601:4580:fd3d:cb0b:3cd1:e450])
	by smtp.gmail.com with ESMTPSA id
	dg2sm13229821pbb.9.2015.10.14.23.40.36
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 23:40:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1444821692-31980-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 14 Oct 2015 23:40:35 -0700
Message-Id: <E583B37D-93A8-4D9E-83BC-B158FE9B5B00@gmail.com>
References: <1405530244-16849-1-git-send-email-Martin.Jansa@gmail.com>
	<1444821692-31980-1-git-send-email-Martin.Jansa@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3096.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] icu: force arm mode
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
X-List-Received-Date: Thu, 15 Oct 2015 06:40:39 -0000
X-Groupsio-MsgNum: 72213
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0806BA22-B763-4891-B965-5C5458221C4D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0806BA22-B763-4891-B965-5C5458221C4D
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Oct 14, 2015, at 4:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> 
> +# http://errors.yoctoproject.org/Errors/Details/20486/
> +ARM_INSTRUCTION_SET_armv4 = "arm"
> +ARM_INSTRUCTION_SET_armv5 = "arm"
> +

would it make sense to have it for armv4t and armv5t only
since thumb may not be possible on sub arches without 't'

--Apple-Mail=_0806BA22-B763-4891-B965-5C5458221C4D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYfSmMACgkQuwUzVZGdMxRGOQCdHp2PMzOOqYkcxbij1OUacPKs
MokAoJAMnZlSi29PwNR2JARzH93r2O1z
=HegA
-----END PGP SIGNATURE-----

--Apple-Mail=_0806BA22-B763-4891-B965-5C5458221C4D--
