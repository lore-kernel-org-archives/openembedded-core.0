Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6076360124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 16:53:33 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l68so4957728wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 08:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nK6Cy4617eKWF1Bb2dK7kWPVQGr0/bYoDuniXQvIJO0=;
	b=uxnV0KdldignGlmggwsCiRb+JImCsoMrYmb+9BZ4JRVYPZuEw3auuZ4Xs4HdVOM3+R
	sz9/n6oR2D6pg2vRFjlbfVka1XJNOEsnqvcbwij7a72Cw/uWntHscXfdLfdN7Z4jJL3h
	enhRIAoTtlkh9dlH/6O2dih2/zqSWD4HqethvTIl1WeMDdfg3jXaQwJJVRhQ5Aeh2Mhe
	1Q0+CTwzsU4teYUccV0s3GGQC7RH4KB5RXzqFM+e53RGaLRlbmAZ0/rMg1M/hRRmSSDw
	7g1/1O5ukXXWq0kMDEqtdAMLqm6nMFpTL1EP8gSYPKVymhp8wjNHUzIY9f9x23p/Voxo
	kQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nK6Cy4617eKWF1Bb2dK7kWPVQGr0/bYoDuniXQvIJO0=;
	b=SwbimwwpFqgJoASlzUINPUtohx5yeBytwVJHQp1RhTlfI/hXDH7DnHiO7rTP2j6z0P
	dE+7IWaY7Ev4r6MmVB9C5p4hSXpWuZOYUIvH+dFzZ5eUyDcUd2iGVMHa7cQwC3tCsUK3
	y82enW3mzNpEWOBlD2qcI8qY58PxMSIFKeDxHBKGSuLbDsTddXwYyRUPbQ+mmvCj6Y+/
	Ehc440u7/xgbsWPv3RHVjX0Esgg/NLQv736ByaXjfQZb0yGpreQKJH8G0gFCKSZnxt11
	pebSc4KNIaXVlcGZ4mrAGV2KYrGqjWWHR6gS/j662byGDZjutSX0cal7t/YtnKsh9NYZ
	d/rA==
X-Gm-Message-State: AD7BkJKUkm0IJkOPxWoVS6syDEsgqRNsB1Dx2GI6iFZpsttu9XwzSfxPRqTEzrnFKdVgdg==
X-Received: by 10.28.153.138 with SMTP id b132mr5298860wme.36.1457628813800;
	Thu, 10 Mar 2016 08:53:33 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	j10sm4342366wjb.46.2016.03.10.08.53.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 08:53:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 17:56:31 +0100
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20160310165631.GK2573@jama>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Thu, 10 Mar 2016 16:53:35 -0000
X-Groupsio-MsgNum: 79414
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iSeZnk6FyAS3EJ1y"
Content-Disposition: inline

--iSeZnk6FyAS3EJ1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2015 at 04:50:22PM +0200, Alexander Kanavin wrote:
> 1. Introduction
>=20
> This patchset adds support for gobject introspection to oe-core.=20
> Gir files go to -dev packages, typelib files go to main packages=20
> (they are packaged together with libraries that are=20
> introspected).
>=20
> The work is based on a meta-gir layer, which was used as a proof of
> concept; overall approach is same and some implementation ideas were=20
> used, but this implementation is otherwise different, and hopefully=20
> simpler and cleaner.

Any idea what could be cause for these failures when testing
master-next?

NOTE: Your conf/bblayers.conf has been automatically updated.
Parsing recipes...NOTE: Building Ne10 for armv7
NOTE: glibc doesn't build cleanly with -Os, adding -Wno-error to SELECTED_O=
PTIMIZATION
NOTE: glibc-initial doesn't build cleanly with -Os, adding -Wno-error to SE=
LECTED_OPTIMIZATION
WARNING: Exception during build_dependencies for do_configure
WARNING: Error during finalise of TOPDIR/oe-core/meta/recipes-gnome/gobject=
-introspection/gobject-introspection_1.46.0.bb
ERROR: ExpansionError during parsing TOPDIR/oe-core/meta/recipes-gnome/gobj=
ect-introspection/gobject-introspection_1.46.0.bb: Failure expanding variab=
le do_configure, expression was         # Write out a qemu wrapper that wil=
l be given to gi-scanner so that it
        # can run target helper binaries through that.
        qemu_binary=3D"${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\$=
GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST//usr/lib','$STAGING_DIR_HOS=
T//lib'])}"
        cat > WORKDIR/gobject-introspection/1.46.0-r0/build/g-ir-scanner-qe=
muwrapper << EOF
#!/bin/sh
$qemu_binary "\$@"
if [ \$? -ne 0 ]; then
    echo "If the above error message is about missing .so libraries, then s=
etting up GIR_EXTRA_LIBS_PATH in the recipe should help."
    echo "(typically like this: GIR_EXTRA_LIBS_PATH=3D\"$""{B}/something/.l=
ibs\" )"
    exit 1
fi
EOF
        chmod +x WORKDIR/gobject-introspection/1.46.0-r0/build/g-ir-scanner=
-qemuwrapper

        # Write out a wrapper for g-ir-scanner itself, which will be used w=
hen building introspection files
        # for glib-based packages. This wrapper calls the native version of=
 the scanner, and tells it to use
        # a qemu wrapper for running transient target binaries produced by =
the scanner, and an include directory
        # from the target sysroot.
        cat > WORKDIR/gobject-introspection/1.46.0-r0/build/g-ir-scanner-wr=
apper << EOF
#!/bin/sh
# This prevents g-ir-scanner from writing cache data to $HOME
export GI_SCANNER_DISABLE_CACHE=3D1

g-ir-scanner --use-binary-wrapper=3DSYSROOTS/MACHINE/usr/bin/g-ir-scanner-q=
emuwrapper --use-ldd-wrapper=3DSYSROOTS/MACHINE/usr/bin/g-ir-scanner-lddwra=
pper --add-include-path=3DSYSROOTS/MACHINE/usr/share/gir-1.0 "\$@"
EOF
        chmod +x WORKDIR/gobject-introspection/1.46.0-r0/build/g-ir-scanner=
-wrapper

        # Write out a wrapper for g-ir-compiler, which runs the target vers=
ion of it through qemu.
        # g-ir-compiler writes out the raw content of a C struct to disk, a=
nd therefore is architecture dependent.
        cat > WORKDIR/gobject-introspection/1.46.0-r0/build/g-ir-compiler-w=
rapper << EOF
#!/bin/sh
SYSROOTS/MACHINE/usr/bin/g-ir-scanner-qemuwrapper SYSROOTS/MACHINE/usr/bin/=
g-ir-compiler "\$@"
EOF
        chmod +x WORKDIR/gobject-introspection/1.46.0-r0/build/g-ir-compile=
r-wrapper

        # Write out a wrapper to use instead of ldd, which does not work wh=
en a binary is built
        # for a different architecture
        cat > WORKDIR/gobject-introspection/1.46.0-r0/build/g-ir-scanner-ld=
dwrapper << EOF
#!/bin/sh
prelink-rtld --root=3D$STAGING_DIR_HOST "\$@"
EOF
        chmod +x WORKDIR/gobject-introspection/1.46.0-r0/build/g-ir-scanner=
-lddwrapper

        # Also tweak the target python scripts so that they don't refer to =
the
        # native version of python binary (the solution is taken from glib-=
2.0 recipe)
        sed -i -e '1s,#!.*,#!/usr/bin/env python,' WORKDIR/gobject-introspe=
ction/1.46.0-r0/gobject-introspection-1.46.0/tools/g-ir-tool-template.in
	( cd WORKDIR/gobject-introspection/1.46.0-r0/gobject-introspection-1.46.0;=
 gtkdocize --docdir WORKDIR/gobject-introspection/1.46.0-r0/gobject-introsp=
ection-1.46.0 )
    set_icecc_env
    autotools_do_configure
 which triggered exception NameError: name 'qemu_wrapper_cmdline' is not de=
fined

Summary: There were 2 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--iSeZnk6FyAS3EJ1y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbhpzwACgkQN1Ujt2V2gBzlLQCfTF/5eHlPn3MV+PvsHMXUbrvP
xj0An356fYT7vvC9QO2U85h82/azyBKU
=hP9t
-----END PGP SIGNATURE-----

--iSeZnk6FyAS3EJ1y--
