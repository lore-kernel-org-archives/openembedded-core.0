Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id B826F6AEA2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 10:43:54 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so2703398eei.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2013 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2rxhffCO6bmfBD9XCIcmalBdRkQeNrkKE6qqY0U/XM4=;
	b=m07GQX9TSg7P5FZqlW0YAE9NSMrfGfLxMrfsouYoSAguaRx5JnDvBPNNV7THwJw2of
	rD0pkbWH5T9FGYb/jZMjr4PyvygVOC87aqGdAuYopttrnAcNCbzT4r8HCh2GmzUFw8cI
	5M9Xf6Xc0TrYEipwNdDo3QI0kX7+Bj++mepfydDx998eZ+C8c/uZHDFT4N12h0n38iMk
	op0wtP5Mi3Ie4buTj1aXEr94XtX2GJzhIFSJIVPxhynJterVJ+YDdoi8EnPq/gTX1ddL
	gFvuAgRKbCdfSI38I3hyfctKbusBFX4w6VfE+9OQ+gpa1dCFftQlI7C39yvFRIlwJoFv
	lZ8Q==
X-Received: by 10.15.67.140 with SMTP id u12mr24285410eex.90.1373280234748;
	Mon, 08 Jul 2013 03:43:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm41099782eeh.11.2013.07.08.03.43.53 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 03:43:54 -0700 (PDT)
Date: Mon, 8 Jul 2013 12:44:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130708104402.GI3288@jama>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<4b305736d4226c770324950a1efca903800fbc9c.1372456294.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4b305736d4226c770324950a1efca903800fbc9c.1372456294.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 19/24] python3-pycurl: Add recipe
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
X-List-Received-Date: Mon, 08 Jul 2013 10:43:55 -0000
X-Groupsio-MsgNum: 41601
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HuXIgs6JvY9hJs5C"
Content-Disposition: inline

--HuXIgs6JvY9hJs5C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 03:04:04PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../python/python3-pycurl/no-static-link.patch     |   16 +++++++++
>  .../python/python3-pycurl_7.19.0.bb                |   35 ++++++++++++++=
++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-pycurl/no-static=
-link.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pycurl_7.19.0.bb

There is some overlap with python-curl:

WARNING: The recipe python-pycurl is trying to install files into a
shared area when those files already exist. Those files and their
manifest location are:
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/python2.7/site-packages/pycurl.so
   Matched in manifest-qemuarm-python3-pycurl
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/python2.7/site-packages/pycurl-7.19.0-py2.7.egg-info
   Matched in manifest-qemuarm-python3-pycurl
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/python2.7/site-packages/curl/__init__.py
   Matched in manifest-qemuarm-python3-pycurl
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/python2.7/site-packages/curl/__init__.pyc
   Matched in manifest-qemuarm-python3-pycurl
Please verify which package should provide the above files.

Should python3-curl install also in python2.7 libdir?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HuXIgs6JvY9hJs5C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHal/IACgkQN1Ujt2V2gBzN1QCcDDWOLv/4rAd16wU+c+Pa17fJ
/kIAn2DAVTM1rqT+DBnpue1RIWvnvKzP
=8jJL
-----END PGP SIGNATURE-----

--HuXIgs6JvY9hJs5C--
