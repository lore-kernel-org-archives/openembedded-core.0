Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 304FD6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 18:29:31 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 123so98550wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/9unkxtsH/phrc2OUmKQxwWhqmPqfSaGTw2hkj0TNR0=;
	b=yPmOyAx2s+A0SQ9QF+PmpQv1F98BCAUu+GHCt/Jo0bYlLo0sNeynw4sIO+7PAzjfGi
	2TdudHmS6BW5NoJDxIIw7kXL9OWlJzT5tb6B7d6QOa72w6QV1Fjp6AUTt+Upmuk56EWt
	FfHkx3mPlViyiZ90wDD3BEW7LlrNilA/AgoahmU+6iyphn1jSxy0Ks2zcC2iQMwfdrQZ
	6QO+Ows90GocEmo7EFFgn/qBJHEuqoIrXMMTDcy0lRe0A+GHnFG0Baq4hLXyiZvPmnhL
	MDLXvs4IAUJIUS+Hs/brQbHrFKgaDuFEO2Ru91AFsCzk8TxeF69gS+5BttTgfUeMYJek
	43mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/9unkxtsH/phrc2OUmKQxwWhqmPqfSaGTw2hkj0TNR0=;
	b=CItQY0rhn1kWdtbuCcFn+3iXkk8xH65qZbntVvvBQZQUeqtZIb2N4xa8BiKvzLVAPM
	hZUpMKk7XO0v69DK84CW7xD532DfGpXmpJ5lTlNeXGlLRUX+An46C4dZzn7VMgRTBI7F
	sDYvhBjnCakI5/jjudqMZbEeA8OXsLzcwccQ7OMn77XL/6FasTmx+wJgt2atkQ5wwSBv
	6QeSmYa3Lnlz2Tr6bZgnMgQXrx+axXlvfgAZSwDpJhf/CSRhhJeuMdhfcVej5/OaQxs2
	UQh57A8wjfR2tdQcOff2wuQFCFYMsAcpe4XbkTuQBcJI5oSsKF7oyUetUomoYpYvzoJF
	uuBQ==
X-Gm-Message-State: AA6/9RmxdFOqFzqUW1svzR5E2ck/cqQG+RHrVBFDS3NB+UtCFfTxIM+ew6fwmRoyIPCFag==
X-Received: by 10.194.146.195 with SMTP id te3mr6784234wjb.51.1476210572909;
	Tue, 11 Oct 2016 11:29:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id a2sm8442368wjn.10.2016.10.11.11.29.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Oct 2016 11:29:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 11 Oct 2016 20:29:33 +0200
To: Kyle Russell <bkylerussell@gmail.com>
Message-ID: <20161011182933.GB2917@jama>
References: <1476195437-24040-1-git-send-email-bkylerussell@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1476195437-24040-1-git-send-email-bkylerussell@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] pixbufcache: Ensure sysroot dependencies are satisfied
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
X-List-Received-Date: Tue, 11 Oct 2016 18:29:32 -0000
X-Groupsio-MsgNum: 88091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline

--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2016 at 10:17:16AM -0400, Kyle Russell wrote:
> Reverts part of b411085fefc8582d24c172db5f6610705eb44c2f
>=20
> Makes sure gdk-pixbuf-native populates the sysroot during setscene;
> otherwise, gdk-pixbuf-query-loaders may not actually be available at the
> time the completion function runs, causing a build failure.
>=20
> Similarly, packages providing loader libraries should append to
> PIXBUFCACHE_SYSROOT_DEPS with their runtime dependencies.

Is this related to
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10102
? Or are you seeing completely different errors?

> Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> ---
>  meta/classes/pixbufcache.bbclass | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.=
bbclass
> index dbe11e1..3c1e398 100644
> --- a/meta/classes/pixbufcache.bbclass
> +++ b/meta/classes/pixbufcache.bbclass
> @@ -65,3 +65,17 @@ pixbufcache_sstate_postinst() {
>  	fi
>  }
> =20
> +# Add all of the dependencies of gdk-pixbuf as dependencies of
> +# do_populate_sysroot_setscene so that pixbufcache_sstate_postinst can w=
ork
> +# (otherwise gdk-pixbuf-query-loaders may not exist or link). Only add
> +# gdk-pixbuf-native if we're not building gdk-pixbuf itself.
> +#
> +# Packages that use this class should extend this variable with their ru=
ntime
> +# dependencies.
> +PIXBUFCACHE_SYSROOT_DEPS =3D ""
> +PIXBUFCACHE_SYSROOT_DEPS_class-native =3D "\
> +    ${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' =
=3D=3D 'gdk-pixbuf']} \
> +"
> +
> +do_populate_sysroot_setscene[depends] +=3D "${PIXBUFCACHE_SYSROOT_DEPS}"
> +do_populate_sysroot[depends] +=3D "${@d.getVar('PIXBUFCACHE_SYSROOT_DEPS=
', True).replace('_setscene','')}"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf9L4wACgkQN1Ujt2V2gBxpKwCgu39sXZ3JqdvJRhxMEBGX84/F
KkAAnRFwmLUE8aceqDYCJZMJUxUXi+U0
=qDSh
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
