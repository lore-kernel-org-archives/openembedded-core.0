Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 76B1E7F84E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 07:30:35 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id j4so5135948iog.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 00:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UeDg/BLqD1dUXLEleVPB3GN0eity0pC4+XrXBoXHy3o=;
	b=bOXHgYcUe/i8kbJOGC4eB3ZkC/gl/MdlDDrcPCe4bFcISxpQXs3MjspHhfwp13ZBTk
	u1pZ16uwGClcqptF1EenzSbKGe0od9yv/Qa/ypNkOJSKd2Lk0OsU9lul+5yQgJyK31Iu
	QK8vAIF1wMrCx2v16dHDd6TBi+JnnPf4gR2ORITLV4XiidPUFOgkD3pcjdZqU8Wv7fbV
	uGFr5xrl5czWd6RGCUciJ5iBQhKIreeT17dT41sKH4PMihSDdQhrDY4buiN1HEtSzdJo
	x8yarZlLaO9+zHTRW05gDrmRUj5k/+dz5Tr+qiyczzV0k7sy2nO7IBeccxc8IJwJWMoZ
	zegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UeDg/BLqD1dUXLEleVPB3GN0eity0pC4+XrXBoXHy3o=;
	b=GJoZrdU/6JkMa6etMHJDEiRah6E/GGDK2JNHec2dZMMbEDCi98zarq7lROr5rM34YQ
	XDQn1cyeJWW1PY2L4mfqEarkTgXCmC0Euw1YeqfsP3dkIWJDOL0KwfxbW5dFZNhDciNV
	CHDMT6GMD5yitDhLYKw19RKce61QKZ0RnrzHj5p9wD95NQiGhsQvMfEPUN2DXRImxZuu
	tZDXUbekf4N1LqfJUzGJ4+lDHp1U+SeXuJKn6aqoJgWdRko70nhQ5+XycIjBZ8nZ4c9R
	G0GjXoDTkMUJ8yRKW20X72MY6AI8fHzuoTL++t6YgANDN/R6QpHF5KLkLTv01Sfhh5hG
	Zlyg==
X-Gm-Message-State: APjAAAUpBB2zQtmnlh//Af5VgLjVSB9/3Y2Agfva3Zuxqm1xR3MldPsN
	H88nTjxeR/hFSmG4CN6uMa2lkGao1AoQyIa8rKTnrZAgomw=
X-Google-Smtp-Source: APXvYqyvfVwWmjMwFNV+6QyZD4zLvn8wAvo1ChK7M7J3ldKEWSxIngjDoIpSfK1JbvE9ufx4AkVsKTLDSjvhlIZ6Bns=
X-Received: by 2002:a6b:c302:: with SMTP id t2mr2090924iof.217.1568705436308; 
	Tue, 17 Sep 2019 00:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190916070515.31531-1-bunk@stusta.de>
In-Reply-To: <20190916070515.31531-1-bunk@stusta.de>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 17 Sep 2019 08:30:24 +0100
Message-ID: <CAO5Uq5QjR4eF-UfjWTJ_UQF6t-zvBUxLvrBdmj5ap9RziD27DA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Upgrade 1.1.1c -> 1.1.1d
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
X-List-Received-Date: Tue, 17 Sep 2019 07:30:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 16, 2019 at 8:05 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> Backported patches removed.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../0001-Fix-broken-change-from-b3d113e.patch | 35 ---------------
>  ...x-build-error-for-aarch64-big-endian.patch | 43 -------------------
>  .../{openssl_1.1.1c.bb => openssl_1.1.1d.bb}  |  6 +--
>  3 files changed, 2 insertions(+), 82 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-broken-change-from-b3d113e.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1c.bb => openssl_1.1.1d.bb} (96%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-broken-change-from-b3d113e.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-broken-change-from-b3d113e.patch
> deleted file mode 100644
> index 6b4789fc70..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/0001-Fix-broken-change-from-b3d113e.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 711a161f03ef9ed7cd149a22bf1203700c103e96 Mon Sep 17 00:00:00 2001
> -From: Pauli <paul.dale@oracle.com>
> -Date: Fri, 29 Mar 2019 09:24:07 +1000
> -Subject: [PATCH] Fix broken change from b3d113e.
> -
> -Reviewed-by: Tim Hudson <tjh@openssl.org>
> -(Merged from https://github.com/openssl/openssl/pull/8606)
> -
> -Running valgrind against code using Openssl v1.1.1c reports a large number of
> -uninitialized memory errors. This fix from upstream solves this problem.
> -
> -Upstream-Status: Backport [https://github.com/openssl/openssl/commit/711a161f03ef9ed7cd149a22bf1203700c103e96]
> -Signed-off-by: Laurent Bonnans <laurent.bonnans@here.com>
> ----
> - crypto/rand/rand_lib.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/crypto/rand/rand_lib.c b/crypto/rand/rand_lib.c
> -index 23abbde156..a298b7515b 100644
> ---- a/crypto/rand/rand_lib.c
> -+++ b/crypto/rand/rand_lib.c
> -@@ -235,8 +235,9 @@ size_t rand_drbg_get_nonce(RAND_DRBG *drbg,
> -     struct {
> -         void * instance;
> -         int count;
> --    } data = { NULL, 0 };
> -+    } data;
> -
> -+    memset(&data, 0, sizeof(data));
> -     pool = rand_pool_new(0, min_len, max_len);
> -     if (pool == NULL)
> -         return 0;
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
> deleted file mode 100644
> index 9a90a68cfd..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 1f8c0f2feea5cdcae0bcd9dfc78198d9e2c4cf09 Mon Sep 17 00:00:00 2001
> -From: Lei Maohui <leimaohui@cn.fujitsu.com>
> -Date: Thu, 13 Jun 2019 12:17:30 +0900
> -Subject: [PATCH] Fix build error for aarch64 big endian.
> -
> -Modified rev to rev64, because rev only takes integer registers.
> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90827
> -Otherwise, the following error will occur.
> -
> -Error: operand 1 must be an integer register -- `rev v31.16b,v31.16b'
> -
> -Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/9151]
> -
> -Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ----
> - crypto/sha/asm/keccak1600-armv8.pl | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/crypto/sha/asm/keccak1600-armv8.pl b/crypto/sha/asm/keccak1600-armv8.pl
> -index dc72f18..6620690 100755
> ---- a/crypto/sha/asm/keccak1600-armv8.pl
> -+++ b/crypto/sha/asm/keccak1600-armv8.pl
> -@@ -731,7 +731,7 @@ $code.=<<___;
> -       blo     .Lprocess_block_ce
> -       ldr     d31,[$inp],#8           // *inp++
> - #ifdef        __AARCH64EB__
> --      rev     v31.16b,v31.16b
> -+      rev64   v31.16b,v31.16b
> - #endif
> -       eor     $A[$j/5][$j%5],$A[$j/5][$j%5],v31.16b
> -       beq     .Lprocess_block_ce
> -@@ -740,7 +740,7 @@ ___
> - $code.=<<___;
> -       ldr     d31,[$inp],#8           // *inp++
> - #ifdef        __AARCH64EB__
> --      rev     v31.16b,v31.16b
> -+      rev64   v31.16b,v31.16b
> - #endif
> -       eor     $A[4][4],$A[4][4],v31.16b
> -
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> similarity index 96%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> index 75159ac725..080d1a8bb7 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
> @@ -16,16 +16,14 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://0001-skip-test_symbol_presence.patch \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
>             file://afalg.patch \
> -           file://0001-Fix-build-error-for-aarch64-big-endian.patch \
> -           file://0001-Fix-broken-change-from-b3d113e.patch \
>             "
>
>  SRC_URI_append_class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[md5sum] = "15e21da6efe8aa0e0768ffd8cd37a5f6"
> -SRC_URI[sha256sum] = "f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90"
> +SRC_URI[md5sum] = "3be209000dbc7e1b95bcdf47980a3baa"
> +SRC_URI[sha256sum] = "1e3a91bc1f9dfce01af26026f856e064eab4c8ee0a8f457b5ae30b40b8b711f2"
>
>  inherit lib_package multilib_header multilib_script ptest
>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

Seems like this has broken FIT image signing:

| Could not obtain signature: error:2406C06E:random number
generator:RAND_DRBG_instantiate:error retrieving entropy
| uboot-mkimage Can't add hashes to FIT blob: -1
| Failed to sign 'signature@1' signature node in
'conf@A335XHUB-0001.dtb' conf node

Not dug into it yet, but reverting this fixes it.

-- 
Alex Kiernan

