Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9E84A65C89
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 13:23:34 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so45326380wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 06:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nPaWbyCVtcb+hbZzi//L0eAB3N/0XJUfaVWF8OJ511M=;
	b=VpVNNVqaVXmec23v4ql6fTjxna9RtPmsNM0XeKE7Hp8KCSyiMOkKE2mkuH8GWoH8ii
	MKJjsFmUXZBFPT7/gdvUzg/K1GwmSeZbVWzp5x4P4KqaeUxOg9sS9D8H7l9oDcset8il
	tHcOJuqtTs+1Rwx7vzbYMlwGSvrtaEFzZHkHa4k9QzFr8xORdF+mI1Ln2OYoQ3Qns+6/
	XWC/3CxOR84yKkZrBYGAvUlpoxq28rgHYTvxSaXblUCzdiYlOXUAuKRUTLK1K201qbBd
	oKLI5dTDyzbmvKgC7QL8CAIkYQwz+pE/SvbROVOS79f+q++f7887TNRg9rWMAMWtd0cG
	/0KA==
X-Received: by 10.180.20.198 with SMTP id p6mr6612407wie.38.1435757014628;
	Wed, 01 Jul 2015 06:23:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ma15sm22078653wic.20.2015.07.01.06.23.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 06:23:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Jul 2015 15:23:56 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150701132356.GJ2409@jama>
References: <1432207395-31589-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1432207395-31589-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [daisy][PATCH] squashfs-tools: enable building unsquashfs and fix squashfs-4.2-fix-CVE-2012-4025.patch
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
X-List-Received-Date: Wed, 01 Jul 2015 13:23:34 -0000
X-Groupsio-MsgNum: 67413
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iK/wEI4vkfDmI6Zw"
Content-Disposition: inline

--iK/wEI4vkfDmI6Zw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2015 at 01:23:15PM +0200, Martin Jansa wrote:
> * build unsqaushfs, useful when debuging corrupt squashfs from
>   mksquashfs
> * squashfs-4.2-fix-CVE-2012-4025.patch fixes CVE in unsquashfs which we
>   weren't building and it actually breaks building it, because someone
>   missed squashfs_fs.h change from the original change
> * add git headers in all patches and fix references to new github
>   repository

Ping

--iK/wEI4vkfDmI6Zw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWT6esACgkQN1Ujt2V2gByiEwCeO4qo4TUqr9rNwTb9uB4CjuXE
kNMAn1SY4Z83oKN78UXiwGLrc+Zxv33s
=/WOC
-----END PGP SIGNATURE-----

--iK/wEI4vkfDmI6Zw--
