Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYcK6-0004Hw-Lo
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 13:44:08 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so156606bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 04:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=u0Q/pr/2suGvCyx9XfW1euwtWdI1GlfmXe7wPObruVc=;
	b=JUEumG0WBYtKqcFxqfr6C/6geLye8l89ohMAGf44oUjbSAMru3qwoymGM0/fumoxvr
	OmGfQ4WADFEh48t+RiJ9I0YXDBpMXRL6RS/79XK+wz+RT+b/SRFZkcXXCgcqmoCmPj0A
	6xZJCD8RB4bCnQ0OL6C2vglwjclYo1wEMyQLoHTi5JpsXPzM9Tc6NO5+CAM+BLjXeqYW
	vtRhDwpWQchlJlfCJSVm9IASkOzH6xPlk8qG0uTkRW9YZkD8y9UMvnbmM9OeqZUrli1T
	7Wckq3z/J5yFddqbW5R2/kd4nnfBvbzw/WgTIFoWlQ9vpbNm2Iq5jdlpgfL+STQd+/eH
	qCCQ==
Received: by 10.204.148.146 with SMTP id p18mr9248991bkv.51.1352896211166;
	Wed, 14 Nov 2012 04:30:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hm4sm5732237bkc.7.2012.11.14.04.30.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 04:30:09 -0800 (PST)
Date: Wed, 14 Nov 2012 13:30:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121114123026.GK3928@jama.jama.net>
References: <1352815159.24487.122.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1352815159.24487.122.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: Add fix for cross compile issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 12:44:08 -0000
X-Groupsio-MsgNum: 31324
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q6mBvMCt6oafMx9a"
Content-Disposition: inline

--q6mBvMCt6oafMx9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 01:59:19PM +0000, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-extended/bash/bash-4.2/crossfix.patch b/meta/re=
cipes-extended/bash/bash-4.2/crossfix.patch
> new file mode 100644
> index 0000000..f587c34
> --- a/dev/null
> +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> @@ -0,0 +1,28 @@

Are you using some special tool to generate git patches or some weird
git version?

Patches from you where you add some file usually does not apply here,
It's caused by:
--- a/dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
which usually looks like
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch

2012-11-14 13:22:27 URL:http://patchwork.openembedded.org/patch/38919/mbox/=
 [2833] -> "pw-am-38919.patch" [1]
Applying: bash: Add fix for cross compile issues
fatal: git apply: bad git-diff - expected /dev/null on line 7
Patch failed at 0001 bash: Add fix for cross compile issues
The copy of the patch that failed is found in:
   /OE/openembedded-core/.git/rebase-apply/patch
When you have resolved this problem, run "git am --resolved".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--q6mBvMCt6oafMx9a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCjjuIACgkQN1Ujt2V2gBwDugCdFEgiYdSqjZExKJjH6BP/qLh/
HjsAnAvfEkX7IZxIhl3nVP14D812ByGQ
=K0sC
-----END PGP SIGNATURE-----

--q6mBvMCt6oafMx9a--
