Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.64.1614706278229483189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 09:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hpM/yQXK;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id v15so20761964wrx.4
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 09:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=5qf8lasSZp7dMARCB2E0ShMlL+irz6lETa4KW58AgUQ=;
        b=hpM/yQXK9H1Bo1Y0VvpSrLy3vhddTbfvKeffAw94YFvyzsTxUlpt5oYMqr07MqzqoO
         Al+ZDYDZRwbqJTkRT8fdUhyLo+01ViMrrrLMoyjCr/V7Qel8y3c8v4gNudQ6T1OztqQf
         iI5/020vJ0Yq/D9MaSyYfIgQJFG+5ugdIkDtLVc/KXWf7gW933wFX8GBFSB1MLL5maj+
         mBcJt+/QBkcD7Ugym7D+qqtmbJwpcrjjKFdU16O+VNHoeeu49SJcSH/GNbD7Cy0q0YZK
         7HI7gbzHmIW4jXCRfqF5B1rQfNzL5MGaYZmSOmG9bRoa451mNnw9TX5ds46YnCEbLmhu
         qciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=5qf8lasSZp7dMARCB2E0ShMlL+irz6lETa4KW58AgUQ=;
        b=HbwjHPUWfFuJSqbie0ACBy8aekFsUUIidSqJ/35xV74Fq+55DAAsrhJJDdkq3Eu/QP
         dJLgMtuS0PnYcfZFVnG5+WTquhqqy8tSl8XNXbObZWo24Ebi8Md1ZQ79aGWHVXZfue6+
         RUQdP6T6BOgn8Io/TI/q7wc0m2WE5KDvMzK3P0n/XFtv/n1zJXg438GAOF4GQ6dr7Tq8
         KWqk/qmbRyQWPMmvw9qOLAzgoeZ8ZdkQBrbGoM7efkcrgf8+ZuNUrwPg/6f/z5EqC222
         2x/vQUPM8UqKiqQfnLyyqvg6a1ZdY3lWgVWGPptreSOHoxY50cia/0oovisJKZf5s+/y
         Y1zw==
X-Gm-Message-State: AOAM533la5r8zCLwvzHMauEUA/8IIuFM4VVtdNtEPE0laAhmCShPLTUy
	QKgzrzb06KT7Hj3iRu3SsbA=
X-Google-Smtp-Source: ABdhPJx1nSW7VZaOpiK5XMxsrz+pVwY7V2AY5+BPzb7WqjyKheJxoQS2/TDfX6+Mrmv9xzc7ZUEFeA==
X-Received: by 2002:adf:ef08:: with SMTP id e8mr24306935wro.200.1614706271863;
        Tue, 02 Mar 2021 09:31:11 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id i10sm17760372wrs.11.2021.03.02.09.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 09:31:09 -0800 (PST)
Message-ID: <a9728ba140214b6c58a3eacb87adf89889272128.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v5] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, bluelightning@bluelightning.org
Date: Tue, 02 Mar 2021 17:31:06 +0000
In-Reply-To: <YDph/MNz185ufMZR@piout.net>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210225153035.1239276-1-luca.boccassi@gmail.com>
	 <YDpcp0FCjX0B2UNo@piout.net> <YDpgUIRQ9vnkUISx@piout.net>
	 <YDph/MNz185ufMZR@piout.net>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 148859
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-r+jh/lFRR0noZ74ff9jZ"

--=-r+jh/lFRR0noZ74ff9jZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2021-02-27 at 16:15 +0100, Alexandre Belloni wrote:
> On 27/02/2021 16:08:02+0100, Alexandre Belloni wrote:
> > On 27/02/2021 15:52:25+0100, Alexandre Belloni wrote:
> > > Hello,
> > >=20
> > > On 25/02/2021 15:30:35+0000, Luca Bocassi wrote:
> > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > >=20
> > > > Recently util-linux gained an (optional) build dependency on libcry=
ptsetup.
> > > > But libcryptsetup build-depends on util-linux for blkid (optional, =
can be disabled)
> > > > and uuid (mandatory).
> > > > Split out util-linux-uuid in a different recipe to break the cycle.
> > > >=20
> > > > https://github.com/karelzak/util-linux/pull/898
> > > >=20
> > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > ---
> > > > v1: util-linux 2.35 is not out yet, but I'd like to get the prepara=
tory work
> > > >     underway as I'm not sure if this is the best approach or if the=
re are
> > > >     alternatives. Suggestions and comments very welcome. Thanks!
> > > > v2: changed packages names to reflect old ones (eg: libuuid1 -> uti=
l-linux-libuuid)
> > > >     and leave uuid build enable in main recipe to allow for uuidgen=
 build to happen,
> > > >     as it does not have its own autoconf switch. Delete the library=
 manualy from
> > > >     the main recipe after build instead, and add dependency.
> > > >     Might help to break loop python3 -> util-linux -> libselinux ->=
 python3, as it's
> > > >     only libuuid that is needed, see https://lists.yoctoproject.org=
/g/yocto/message/47570
> > > > v3: rebased and refactored to have a common util-linux.inc file
> > > > v4: added RDEPENDS on util-linux-libuuid on various packages to fix=
 QA warnings
> > > > v5: remove RDEPENDS and instead have util-linux RDEPEND on util-lin=
ux-uuid.
> > > >     Removed PACKAGES_remove and instead filter out libuuid via the =
package generation
> > > >     regex.
> > > >     Rebased on util-linux 2.36.2.
> > > >=20
> > > >  .../util-linux/util-linux-uuid_2.36.2.bb      | 22 ++++++++
> > > >  meta/recipes-core/util-linux/util-linux.inc   | 41 ++++++++++++++
> > > >  .../util-linux/util-linux_2.36.2.bb           | 53 +++++----------=
----
> > > >  3 files changed, 75 insertions(+), 41 deletions(-)
> > > >  create mode 100644 meta/recipes-core/util-linux/util-linux-uuid_2.=
36.2.bb
> > > >  create mode 100644 meta/recipes-core/util-linux/util-linux.inc
> > > >=20
> > >=20
> > > With this patch, there is a very weird failure on the autobuilders, t=
wo
> > > a-full builds failed with this:
> > >=20
> > > ERROR: musl-1.2.2+gitAUTOINC+e5d2823631-r0 do_package: Error executin=
g a python function in exec_python_func() autogenerated:
> > > The stack trace of python calls that resulted in this exception/failu=
re was:
> > > File: 'exec_python_func() autogenerated', lineno: 2, function: <modul=
e>
> > >      0001:
> > >  *** 0002:extend_recipe_sysroot(d)
> > >      0003:
> > > File: '/home/pokybuild/yocto-worker/poky-tiny/build/meta/classes/stag=
ing.bbclass', lineno: 582, function: extend_recipe_sysroot
> > >      0578:                    if "/bin/" in l or "/sbin/" in l:
> > >      0579:                        # defer /*bin/* files until last in=
 case they need libs
> > >      0580:                        binfiles[l] =3D (targetdir, dest)
> > >      0581:                    else:
> > >  *** 0582:                        staging_copyfile(l, targetdir, dest=
, postinsts, seendirs)
> > >      0583:
> > >      0584:    # Handle deferred binfiles
> > >      0585:    for l in binfiles:
> > >      0586:        (targetdir, dest) =3D binfiles[l]
> > > File: '/home/pokybuild/yocto-worker/poky-tiny/build/meta/classes/stag=
ing.bbclass', lineno: 157, function: staging_copyfile
> > >      0153:        os.symlink(linkto, dest)
> > >      0154:        #bb.warn(c)
> > >      0155:    else:
> > >      0156:        try:
> > >  *** 0157:            os.link(c, dest)
> > >      0158:        except OSError as err:
> > >      0159:            if err.errno =3D=3D errno.EXDEV:
> > >      0160:                bb.utils.copyfile(c, dest)
> > >      0161:            else:
> > > Exception: FileExistsError: [Errno 17] File exists: '/home/pokybuild/=
yocto-worker/poky-tiny/build/build/tmp/sysroots-components/core2-32/libgcc/=
usr/lib/i686-poky-linux-musl/10.2.0/libgcc_eh.a' -> '/home/pokybuild/yocto-=
worker/poky-tiny/build/build/tmp/work/core2-32-poky-linux-musl/musl/1.2.2+g=
itAUTOINC+e5d2823631-r0/recipe-sysroot/usr/lib/i686-poky-linux-musl/10.2.0/=
libgcc_eh.a'
> > > ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/pok=
y-tiny/build/build/tmp/work/core2-32-poky-linux-musl/musl/1.2.2+gitAUTOINC+=
e5d2823631-r0/temp/log.do_package.4051328
> > > NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package: Fa=
iled
> > > ERROR: Task (/home/pokybuild/yocto-worker/poky-tiny/build/meta/recipe=
s-core/musl/musl_git.bb:do_package) failed with exit code '1'
> > >=20
> > > This also happens with glibc-2.33-r0:
> > >=20
> > >=20
> > > ERROR: glibc-2.33-r0 do_package: Error executing a python function in=
 exec_python_func() autogenerated:
> > > [...]
> > > Exception: FileExistsError: [Errno 17] File exists: '/home/pokybuild/=
yocto-worker/edgerouter/build/build/tmp/sysroots-components/mips64/libgcc/u=
sr/lib/mips64-poky-linux/10.2.0/libgcc.a' -> '/home/pokybuild/yocto-worker/=
edgerouter/build/build/tmp/work/mips64-poky-linux/glibc/2.33-r0/recipe-sysr=
oot/usr/lib/mips64-poky-linux/10.2.0/libgcc.a'
> > > ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/edg=
erouter/build/build/tmp/work/mips64-poky-linux/glibc/2.33-r0/temp/log.do_pa=
ckage.29993
> > > NOTE: recipe glibc-2.33-r0: task do_package: Failed
> > > ERROR: Task (/home/pokybuild/yocto-worker/edgerouter/build/meta/recip=
es-core/glibc/glibc_2.33.bb:do_package) failed with exit code '1'
> > >=20

I see those kind of errors without this patch all the time, when a
build directory is hosed, and normally it means it's time for a rm -rf
and start over. It happens quite often when building in the same
directory multiple times. Are you sure it's related to this particular
patch?

> > Not sure this helps but we also get:
> >=20
> > WARNING: nativesdk-util-linux-2.36.2-r0 do_package_qa: QA Issue: native=
sdk-util-linux rdepends on nativesdk-util-linux-uuid, but it isn't a build =
dependency? [build-deps]

Uhm I don't understand this warning, it _is_ a build dependency? Any
idea?

-DEPENDS =3D "libcap-ng ncurses virtual/crypt zlib"
+DEPENDS =3D "libcap-ng ncurses virtual/crypt zlib util-linux-uuid"

> and I'm adding https://autobuilder.yoctoproject.org/typhoon/#/builders/47=
/builds/3137/steps/12/logs/stdio :
>=20
> ERROR: util-linux-uuid-2.36.2-r0 do_package: QA Issue: util-linux-uuid: F=
iles/directories were installed but not shipped in any package:
>   /usr/lib/libuuid.a
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.

Whops, indeed I forgot the static archive, fixed now.

--=20
Kind regards,
Luca Boccassi

--=-r+jh/lFRR0noZ74ff9jZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmA+dloACgkQSylmgFB4
UWLTPwf+PRh7mRIwfcAUPxVcrB80mTY2liFW2A0cqDMK4R49GrFvTa5z1/aNiD14
0HLxNvapgLBLLQaJe9juvJbNlfY84pJ3JUYFSA06cZ4B4ZU/BnffxzYScBdzuapu
DZxuRcTd1/Z8JoPYBBeR99XmYktWN0XmZtlu+IEHRGJHHKQ+M7S6oW+IhGMen+ZD
EDCFU8pi33t8xEDQxGEFiaBLjH3ozC+4uSjbWbRG1BekbPTn1mwH2Tda2dOmTmNu
FzeV8q8A7JFAf5I6fbmhtXEklzmUwsNyXA2tw3RbCSc2Xn6GkiiHZY2MV9tjTbPk
bwfYDvBVzR/bkjrMOMvr/FXxVyiGeg==
=zVA8
-----END PGP SIGNATURE-----

--=-r+jh/lFRR0noZ74ff9jZ--
