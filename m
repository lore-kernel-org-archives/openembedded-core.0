Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 96CFB6CF0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:33:49 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so945380eaj.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gTf+KAB5c8DJTenZgMAIwDWSQeCztIRFvG8OdaR5+u0=;
	b=dLKadO73DDmxk20+mvEA8tI3djHfshJcQkJ5jKB9xvI+EWqfuuFIODghWjneuRFp4S
	yQ37kRUFSORgVGdzZfxhCbJYxzT1TxwOYIW8kzUCj22Z4kXOAM9iZZ7NknXkPxk/9GiB
	+XYaUtEkvWCoSTA7487LXArWRL40i4NQAxI0PdWVH9uYfpKCQbvV3cTUSBQwpderSpsP
	KqxrVwVZb2i+QWqc9k3nd+ki20FnwQVkhoJtZBYOJGMbNcCAXxCaRB5hlaKllZZUBMQk
	fAWw1fNwMxxWDlm92KvntY1XRD4ebu97W14DCtIPzvtFmA+8LvfdMfvvO2KErEVQKf2/
	RtCg==
X-Received: by 10.14.45.70 with SMTP id o46mr11850055eeb.19.1382006030978;
	Thu, 17 Oct 2013 03:33:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	s3sm27806694eeo.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 03:33:50 -0700 (PDT)
Date: Thu, 17 Oct 2013 12:33:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Message-ID: <20131017103355.GB3930@jama>
References: <1382004192-12678-1-git-send-email-ming.liu@windriver.com>
	<1382004192-12678-2-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1382004192-12678-2-git-send-email-ming.liu@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 2/2] screen: add pkg_postinst to register entry to /etc/shells
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
X-List-Received-Date: Thu, 17 Oct 2013 10:33:50 -0000
X-Groupsio-MsgNum: 45956
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline

--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2013 at 06:03:12PM +0800, Ming Liu wrote:
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  meta/recipes-extended/screen/screen_4.0.3.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-=
extended/screen/screen_4.0.3.bb
> index 1a7eb20..81e418b 100644
> --- a/meta/recipes-extended/screen/screen_4.0.3.bb
> +++ b/meta/recipes-extended/screen/screen_4.0.3.bb
> @@ -41,3 +41,8 @@ do_install_append () {
>  		fi
>  	done
>  }
> +
> +pkg_postinst_${PN} () {
> +	touch $D${sysconfdir}/shells
> +	grep -q "${bindir}/screen" $D${sysconfdir}/shells || echo ${bindir}/scr=
een >> $D${sysconfdir}/shells
                  ^ the same, we don't want to match /usr/bin/screenie
if it's there and "screen" isn't

Is there patch to add this postinst to bash and busybox?

> +}
> --=20
> 1.8.3.3
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJfvRMACgkQN1Ujt2V2gByd5QCgoAJfofAJ1lvCzveZwNQrF3/q
9NsAnjieP8Y9z/NQjCe0eAgBmrvFRywf
=cWZW
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
