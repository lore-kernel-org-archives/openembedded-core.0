Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 51DFB601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 07:51:11 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so21896977wgh.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 23:51:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=6mScGb6sBYihf1xG0szDsD0pQbmbPQaHHsdiZlpXFQg=;
	b=RTPDSfqaOg+8NOZCHAkhyNhDqdk2WNdCPaV2OL6XJ4PMMjBvjSl+yK2VcCnz/SyZXp
	Zli/atyCX3AsvikKu+/mIinxW1Ye9S5RJ50zztIwm6YO7PvxAlqvi2lQmLmiBVM8YjFR
	WpVr5wU02pfHzINDmYZ3rk785+UFWQUPQWj3uHkmEMLJVoARu1h3o5X8PC0d846gGqYZ
	l2+1DK8CNqKlUrZo+R9sR5K7DJniDomsp0NZlLt+GoqWP4Roni2gRVyOcNvWpqWxp+A6
	aCAdWuTfySp9c/FvgArjHc56YJ8ni09ABI+AkR7rvomZAmt1AlbZEbIMp/2j0yERP9br
	HgRQ==
X-Gm-Message-State: ALoCoQnjQ2OoMdjRFhn38V8TRwdhCwYLf320jywWQimowz8/UjZbYnlTsZQwEqaaqsC1xp+Jl7Yl
X-Received: by 10.194.193.2 with SMTP id hk2mr13168958wjc.40.1417679471417;
	Wed, 03 Dec 2014 23:51:11 -0800 (PST)
Received: from ?IPv6:2001:610:612::8d41:3f1a:353f:4ea4?
	([2001:610:612:0:8d41:3f1a:353f:4ea4])
	by mx.google.com with ESMTPSA id p1sm39367596wjy.22.2014.12.03.23.51.10
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Dec 2014 23:51:10 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1417661007-32636-1-git-send-email-sgw@linux.intel.com>
Date: Thu, 4 Dec 2014 08:51:08 +0100
Message-Id: <04DA94C3-B069-48B6-B14B-CD8658FD29EE@dominion.thruhere.net>
References: <1417661007-32636-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] procps: Upgrade to 3.3.10
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
X-List-Received-Date: Thu, 04 Dec 2014 07:51:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 4 dec. 2014, om 03:43 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:
>=20
> This is now the procps-ng version
>=20
> cleaned up patches
> added to fix up usrbin_execprefix in OE-Core
>=20
> Add CPPFLAGS to allow seperate build directory works
>=20
> [YOCTO #6952]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> Git was not able to detect a rename unfortunatly in this case.
>=20
> .../procps/{procps-3.2.8 =3D> procps}/sysctl.conf    |   0

So a rename instead of a deletion, good, but...

>=20
> +++ b/meta/recipes-extended/procps/procps_3.3.10.bb

[..]

> +
> +SRC_URI =3D =
"http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-$=
{PV}.tar.xz \
> +           file://fix-configure.patch \
> +          "

... sysctl.conf not in SRC_URI, nor is it being installed in =
do_install(_append).=

