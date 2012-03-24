Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SBKbN-0007sP-0X
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 07:37:25 +0100
Received: by wgbdr12 with SMTP id dr12so2323795wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 23:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=BsxxUaZKjiVDqHuEdWo2r6XyRqlCaXw4eCus+y9GqL8=;
	b=AcnVsye9kJfoMelZU28Yl+53aXd0KoiL3GsJF2wQbDgnh9kIbK60/W/fEfRyGMZB25
	aspgDB00h0YEiMN/JDesjTYTJO8W4Ya8S5/SdxtWfhL6nIb0Q8pAfbAH0jAN+ZKo9J+C
	tU0ns/v+TC43JgjFdsCq6zHOyT0gillGyzQ+IQVhxeSllJtRgjlb6RT7QvLljPH63UNt
	swW77mTVlrPvnziCLmIEWD/Otz45AueyCXDJPylwSSfOIfvidQhlGt4Zr8QlIZAnUvHf
	YR1mRbpvkYO0kv+o3mfvgXi5sGEiEz1ykEtLCDcMqcZFUiskg0natCnKoD3qCgG02AUW
	+rHQ==
Received: by 10.216.136.149 with SMTP id w21mr8080139wei.90.1332570507869;
	Fri, 23 Mar 2012 23:28:27 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 9sm33299014wid.2.2012.03.23.23.28.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 23:28:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6d8cb56a00a2d0f140b6b569f8577f96c6113e14.1332543292.git.andrei@gherzan.ro>
Date: Sat, 24 Mar 2012 07:28:26 +0100
Message-Id: <52A25C61-A36D-4248-AAF2-B34FF06D060D@dominion.thruhere.net>
References: <cover.1332543292.git.andrei@gherzan.ro>
	<6d8cb56a00a2d0f140b6b569f8577f96c6113e14.1332543292.git.andrei@gherzan.ro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmfiP8qQNWpo7Xjt8dsiX6AOSsdB4fyeMO+2xaEkUvFOlfs1a4rDye6oH43i5NTlUS7vQ8V
Subject: Re: [PATCH 1/2] gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/gdbm
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
X-List-Received-Date: Sat, 24 Mar 2012 06:37:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt. 2012, om 23:57 heeft Andrei Gherzan het volgende geschreven:

> ndbm.h is needed by python for dbm module. This is why =
-enable-libgdbm-compat was added
> to configure.
> The second change is because python is looking for the gdbm headers in =
include/gdbm.
> The easiest way to solve this issue is to add symlinks in =
include/gdbm.
>=20
> [YOCTO #1937]
>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
> meta/recipes-support/gdbm/gdbm_1.10.bb |   11 +++++++++++
> 1 files changed, 11 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb =
b/meta/recipes-support/gdbm/gdbm_1.10.bb
> index 9b2fde4..e9fef6e 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.10.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
> @@ -13,4 +13,15 @@ SRC_URI[sha256sum] =3D =
"23f8134c5b94bbfb06d756a6b78f074fba6e6028cf2fe01341d40b26db
>=20
> inherit autotools gettext lib_package
>=20
> +# Needed for dbm python module
> +EXTRA_OECONF =3D "-enable-libgdbm-compat"
> +
> BBCLASSEXTEND =3D "native nativesdk"
> +
> +do_install_append () {
> +    # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let =
other packages to find
> +    # these headers
> +    install -d ${D}${includedir}/gdbm
> +    ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
> +    ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
> +}
> --=20

Missing PR bump=


