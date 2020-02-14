Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5D96B6108A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=3170; q=dns/txt; s=axis-central1;
	t=1581699673; x=1613235673;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=9SmMQrGmq3i5y89gOkmouCJlz33LB7vQBbg6zGICs+I=;
	b=LPZVCrqim/G7fdOEolW5x9YXiQSvQqGMf6SwytWmJkzikK1j/RLfjaNV
	V0fJOGZWYL4PTNaBgDUxwO+fXu6wxyP81UNH6VN/yVyUOU9vp/FRLogxM
	ZS1s2nCeBvmR4T4DMabDgpZYzzcMYjohEtZFsPe3f2WxHkTEa1swVsjfk
	NDAG0tqif+qNTlLMPM6Wqb0Jr6MeD/jWKMK4K5vfoPoC+WfGi3kmG5t1m
	I1OQVdgGpB9j5MXUL+JFK9jGD2H/WycfNRr03N+RTmA13wCwLyvC8bZkV
	vcSJ8GvzYbgjLgd026RU3RBMYNjZwvT1TtToD/ftdhHBMhP7n+Ag3Hq5o w==;
IronPort-SDR: kpqXKWBgTcsC5LfIW5VuA/Rfce6JO1f2xfrsMC8qWHvihmB0llFrUmYF3gZqwwM1+t8JhoQkBl
	bTMh1I+ncLtAmPf9h4+Zspd0PlicrEFIv3Qpl7ZT89L5LlBwm2IBo5mI6LiHQzd0ycfWTDkAJp
	cjbF3UaT1T6r9sipYPUTMHcZfT2HerfS2NH9YgllR42RxJgY0JpZk4bVlfPU0sP6a+3rZc8U/r
	7qU4qiKhpgyeQIm65LmxYCrXoVkybx5cyoDVRmhOskErfwD2LofogHwLHtjGArJI9qw3gcsUIT
	ndA=
X-IronPort-AV: E=Sophos;i="5.70,441,1574118000"; 
   d="scan'208";a="5437195"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] staging: Handle races between binaries and
	their	libs
Thread-Index: AQHV4zcqrh+7WADTWkiBNxX91tSG/Kga548Q
Date: Fri, 14 Feb 2020 17:01:11 +0000
Message-ID: <a575ebda4ba94882a8e69523471b575d@XBOX03.axis.com>
References: <20200214130238.20381-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200214130238.20381-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Handle races between binaries and their	libs
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
X-List-Received-Date: Fri, 14 Feb 2020 17:01:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 14 februari 2020 14:03
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] staging: Handle races between binaries and
> their libs
>=20
> There is a long standing issue where a binary could be installed into the
> sysroot before its library dependencies. We've always argued nothing shou=
ld
> use the binary until its been installed by a dependency but there are iss=
ues

Change "its" to "it has".

> around binaries which conflict with the host system, for example patch,
> python3, gzip and more.
>=20
> With the recent patch changes we've see issues like:

Change "see" to "seen".

> ERROR: gdb-cross-canadian-powerpc-8.3.1-r0 do_patch: Command Error: 'quil=
t --quiltrc /home/pokybuild/yocto-worker/qemuppc/build/build/tmp/work/x86_6=
4-nativesdk-pokysdk-linux/gdb-cross-canadian-powerpc/8.3.1-r0/recipe-sysroo=
t-native/etc/quiltrc push' exited with 0  Output:
> Applying patch 0009-Change-order-of-CFLAGS.patch
> patch: /lib64/libattr.so.1: version `ATTR_1.3' not found (required by pat=
ch)
> Patch 0009-Change-order-of-CFLAGS.patch does not apply (enforce with -f)
>=20
> which is a symptom of this issue (libattr-native is a dependency of patch=
-native).
>=20
> There are other ways to fix this such as disabling libattr in patch, inst=
alling
> patch to a subdirectory and requiring PATH manipulation and so on.
>=20
> We can simply fix the staging code to handle /bin/ after everything else =
so lets

Change "lets" to "let's".

> do that and avoid all these other complications.

Shouldn't /sbin/ be treated the same way as /bin/?

//Peter

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/staging.bbclass | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index 4dd2ed01010..530e23b1853 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -470,6 +470,7 @@ python extend_recipe_sysroot() {
>          elif os.path.lexists(depdir + "/" + c):
>              os.unlink(depdir + "/" + c)
>=20
> +    binfiles =3D {}
>      # Now handle installs
>      for dep in configuredeps:
>          c =3D setscenedeps[dep][0]
> @@ -562,7 +563,16 @@ python extend_recipe_sysroot() {
>                      if l.endswith("/"):
>                          staging_copydir(l, targetdir, dest, seendirs)
>                          continue
> -                    staging_copyfile(l, targetdir, dest, postinsts, seen=
dirs)
> +                    if "/bin/" in l:
> +                        # defer /bin/* files until last in case they nee=
d libs
> +                        binfiles[l] =3D (targetdir, dest)
> +                    else:
> +                        staging_copyfile(l, targetdir, dest, postinsts, =
seendirs)
> +
> +    # Handle deferred binfiles
> +    for l in binfiles:
> +        (targetdir, dest) =3D binfiles[l]
> +        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
>=20
>      bb.note("Installed into sysroot: %s" % str(msg_adding))
>      bb.note("Skipping as already exists in sysroot: %s" % str(msg_exists=
))
> --
> 2.20.1

//Peter


