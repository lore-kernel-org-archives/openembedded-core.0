Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SHW0S-0002F5-F4; Tue, 10 Apr 2012 10:00:52 +0200
Received: by wgbdr12 with SMTP id dr12so4014843wgb.24
	for <multiple recipients>; Tue, 10 Apr 2012 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fUg7LGCs+tLl9FGjL+xBTfdW7yvm1WynzPtuavhlK+I=;
	b=KhDePXo8PKA59HaPZqOPG+ZSSJSErklhf7j1EWCEM1mBgYKcWxjGY44rLA8iqKmfC0
	ZsOGZAE+jDwaifH1eSeAN9GyyYyg7WnIJAsZs31LyBuvTtY6kiPqykN3X8bK55iog/2H
	Q1r/jcJHZngkQp7pFpuMTKTqdlqgow0i6dDrH4QyV/JD9arYcwHyUOXzIektHCauoojl
	mRZfioflDfaZc2cxVTMR+G6l20CKFlLr0ZWEr450DqUOHNKFn5/bubGGNiH58RsMmi3c
	TWiVQlbCQsggUPr+bU3sDx4yJNSL7QlJzLRK5/ZVRVaGSBIhkdqNO41Co5xfadqik4Oh
	5Hig==
Received: by 10.216.139.25 with SMTP id b25mr5484608wej.41.1334044294911;
	Tue, 10 Apr 2012 00:51:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm35993241wib.4.2012.04.10.00.51.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 00:51:34 -0700 (PDT)
Date: Tue, 10 Apr 2012 09:51:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120410075133.GB3583@jama.jama.net>
References: <1333829385-32212-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1333829385-32212-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] [toolchain-layer][PATCH] gcc-4.6: Update to 2012.03 linaro release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 08:00:52 -0000
X-Groupsio-MsgNum: 20482
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline

--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 07, 2012 at 01:09:45PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106876.patch    |  109 ++++
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106877.patch    |  239 ++++++++
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106878.patch    |   69 +++
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106879.patch    |  643 ++++++++++++++=
++++++
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106882.patch    |   53 ++
>  .../gcc/gcc-4_6-branch-linaro-backports.inc        |    5 +
>  .../recipes-devtools/gcc/gcc-common-4.6.inc        |    2 +-
>  7 files changed, 1119 insertions(+), 1 deletions(-)
>  create mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106876.patch
>  create mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106877.patch
>  create mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106878.patch
>  create mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106879.patch
>  create mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/g=
cc-4.6-linaro-r106882.patch

FWIW: this upgrade again triggered gcc-cross-initiall do_compile errors
for incremental builds, it failed for 3 from 4 archs I'm building and
each with different error. Reexecuting the same target again worked fine,=
=20
so I still belive there is some sort of race condition with shared gcc work=
dir.

I've uploaded cooker and do_compile logs here:
http://build.shr-project.org/tests/jama/gcc-upgrade-issue/

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+D5oUACgkQN1Ujt2V2gBym2ACgsy5oVcJt05tj/N5PuE6Q8T1M
sjoAnidUcqs4hJYHu2J6tF3jv3p9uQXO
=S1dG
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
