Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.5969.1615541717624187854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:35:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: kory.maincent@bootlin.com)
Received: from kmaincent-XPS-13-7390 (92.208.113.78.rev.sfr.net [78.113.208.92])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 69396200002;
	Fri, 12 Mar 2021 09:35:13 +0000 (UTC)
Date: Fri, 12 Mar 2021 10:35:12 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libxcrypt-compat: upgrade 4.4.17 -> 4.4.18
Message-ID: <20210312103512.092257bb@kmaincent-XPS-13-7390>
In-Reply-To: <1614658313-64713-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1614658313-64713-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, 2 Mar 2021 12:11:53 +0800
"zhengruoqin" <zhengrq.fnst@cn.fujitsu.com> wrote:

> When the libxcrypt version is updated, libxcrypt-compat is omitted.
>=20
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../{libxcrypt-compat_4.4.17.bb =3D> libxcrypt-compat_4.4.18.bb}    | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.17.bb =3D>
> libxcrypt-compat_4.4.18.bb} (100%)
>=20
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.17.bb
> b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.18.bb similarity index=
 100%
> rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.17.bb
> rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.18.bb

Got a build error on nativesdk recipe:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/3504/step=
s/11/logs/stdio

ERROR: nativesdk-libxcrypt-compat-4.4.18-r0 do_compile: Execution of
'/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-native=
sdk-pokysdk-linux/nativesdk-libxcrypt-compat/4.4.18-r0/temp/run.do_compile.=
2466'
failed with exit code 1: Makefile:3646: Makefile.deps: No such file or
directory
LC_ALL=3DC /home/pokybuild/yocto-worker/buildtools/build/build/tmp/hosttool=
s/perl
\ ../git/build-aux/gen-crypt-hashes-h
\ ../git/lib/hashes.conf ,bcrypt,bcrypt_a,bcrypt_x,bcrypt_y,bigcrypt,bsdicr=
ypt,descrypt,gost_yescrypt,md5crypt,nt,scrypt,sha1crypt,sha256crypt,sha512c=
rypt,sunmd5,yescrypt,
> crypt-hashes.h.T
> LC_ALL=3DC /home/pokybuild/yocto-worker/buildtools/build/build/tmp/hostto=
ols/perl
> \ ../git/build-aux/gen-crypt-symbol-vers-h \ SYMVER_MIN=3DGLIBC_2.0 \
  SYMVER_FLOOR=3D \
  COMPAT_ABI=3Dyes \
     ../git/lib/libcrypt.map.in > crypt-symbol-vers.h.T
LC_ALL=3DC /home/pokybuild/yocto-worker/buildtools/build/build/tmp/hosttool=
s/perl
\ ../git/build-aux/gen-crypt-h \
  ../git/lib/crypt.h.in config.h \
  ../git/lib/hashes.conf ,bcrypt,bcrypt_a,bcrypt_x,bcrypt_y,bigcrypt,bsdicr=
ypt,descrypt,gost_yescrypt,md5crypt,nt,scrypt,sha1crypt,sha256crypt,sha512c=
rypt,sunmd5,yescrypt,
\ > crypt.h.T
LC_ALL=3DC /home/pokybuild/yocto-worker/buildtools/build/build/tmp/hosttool=
s/perl
\ ../git/build-aux/gen-crypt-h \
  ../git/lib/xcrypt.h.in config.h \
  > xcrypt.h.T
gen-crypt-symbol-vers-h: usage: SYMVER_MIN=3Dvalue SYMVER_FLOOR=3Dvalue
COMPAT_ABI=3Dvalue libcrypt.map.in Makefile:3577: recipe for target
'crypt-symbol-vers.h' failed make: *** [crypt-symbol-vers.h] Error 1
make: *** Waiting for unfinished jobs....
mv -f crypt-hashes.h.T crypt-hashes.h
mv -f crypt.h.T crypt.h
mv -f xcrypt.h.T xcrypt.h
WARNING: exit code 1 from a shell command.


Regards,

K=C3=B6ry
