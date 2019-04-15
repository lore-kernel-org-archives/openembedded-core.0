Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id D1E327D279
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 21:54:45 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id o129so10872307qke.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 14:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o21KT5Vg2nwlKE6tDARSHA4A1qIBPuMNx3T6BAWuiz4=;
	b=G2OQereWv3I5FnVdeRsYIj/fVQ7MAdXJVvF/DxQS++FKJ5vxh+FkH/yAmPL28W75Op
	Xk8KChCvEi+G/oqkXTtAIY60eZhAGWPiCGmefXpTPQzRdPoTqoEDHio2NehL4/w2zzE4
	+IoOc/t05DCpCyxCl2G8SC2aAh3PTASyVZNkjNXRh+swtM0TOA0meIQ2Q6uD2FGmLa0U
	EdkEERZQwfBQ9ipYAqjE+H5VQGUa2re2yUNiozrf2b1+zd3RuVA8D2cCLzs5IgzfQUzB
	KSDiCLofFbyAbmjLhOpihM9etcj3yRsqionxOlkh4IF0tVuN7RCmMFIyVge3eY7lclxy
	pMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o21KT5Vg2nwlKE6tDARSHA4A1qIBPuMNx3T6BAWuiz4=;
	b=iCnRQmctvo6GOACpNRJmRnmigptfpwCr4fhOAu1FYkeY8u58eOkAGdcpYSdPjyIR2E
	vBjnzcILzNapdyICYKzTI8oOVcJcQ9pzHnOsvlEQq9pTytBkdwM/mT8MDOKkasoHuCjo
	F+DrFBNH1wfkVPVWk7npCmQsF6MNmSwj7I5AAFM854YluIOmY1/4C3Tqd79Qqk093b3i
	di7CAVPqy1PXujcRPG59yR3QxH2Noi7/Z/kr4l4JVn7BtYERcUWN8CrKoMM+eX/MrFam
	Q0n1QqfsK7gLiJY7WmJcdmnqYaDWLuVEWBvIBToCTrAfqrSr/1924n7NVImF74xwP071
	Jv2A==
X-Gm-Message-State: APjAAAX1BBzSIlj1XtiX2Tqaaiq8zoOIiRN3mGqn0cp1VT9F4nDMlc50
	Ty9m8v8W1LNX5Bj08SUUgLbCVwOwvkO8RkGI5P/vBVQU
X-Google-Smtp-Source: APXvYqxlxmh5VoyHq+BBp/2k+ABA0ZafmMu3NgAZcx8HZMujETTto6rx7imjwtkmVATnC6uJd+rBKyhiMqVwtNY5cbc=
X-Received: by 2002:a37:9d84:: with SMTP id g126mr56389851qke.22.1555365286255;
	Mon, 15 Apr 2019 14:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190415201348.19946-1-vernon.mauery@linux.intel.com>
In-Reply-To: <20190415201348.19946-1-vernon.mauery@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Apr 2019 14:54:35 -0700
Message-ID: <CAMKF1sq9jTgsv8ry9dyJhAGE7n8cedATPiFtjNeB2vg50Kwu9g@mail.gmail.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Update ipmitool to use new active source
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
X-List-Received-Date: Mon, 15 Apr 2019 21:54:46 -0000
Content-Type: multipart/alternative; boundary="000000000000622198058698b3ba"

--000000000000622198058698b3ba
Content-Type: text/plain; charset="UTF-8"

We still need to set pv

On Mon, Apr 15, 2019 at 1:23 PM Vernon Mauery <vernon.mauery@linux.intel.com>
wrote:

> The ipmitool project has moved from sourceforge to github and is under
> new management. This updates the source so that it pulls directly from
> git rather than a tarball. Eventually, once the next release is tagged,
> the new SRCREV can be updated to that. But for now, the project is under
> active development and could probably benefit from periodic updates
> anyway.
>
> The SRCREV and SRC_URI links point to code that already has been patched
> to work with the new openssl 1.1 APIs, so the patch is no longer needed.
>
> Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> ---
>  .../0001-Migrate-to-openssl-1.1.patch         | 152 ------------------
>  .../{ipmitool_1.8.18.bb => ipmitool_git.bb}   |   9 +-
>  2 files changed, 3 insertions(+), 158 deletions(-)
>  delete mode 100644
> meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
>  rename meta-oe/recipes-kernel/ipmitool/{ipmitool_1.8.18.bb =>
> ipmitool_git.bb} (80%)
>
> diff --git
> a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
> b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
> deleted file mode 100644
> index 394aa16ad..000000000
> ---
> a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
> +++ /dev/null
> @@ -1,152 +0,0 @@
> -From c9dcb6afef9c343d070aaff208d11a997a45a105 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 5 Sep 2018 22:19:38 -0700
> -Subject: [PATCH] Migrate to openssl 1.1
> -
> -Upstream-Status: Backport [
> https://sourceforge.net/p/ipmitool/source/ci/1664902525a1c3771b4d8b3ccab7ea1ba6b2bdd1/
> ]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/plugins/lanplus/lanplus_crypt_impl.c | 50 ++++++++++++++----------
> - 1 file changed, 29 insertions(+), 21 deletions(-)
> -
> -diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c
> b/src/plugins/lanplus/lanplus_crypt_impl.c
> -index d5fac37..9652a5e 100644
> ---- a/src/plugins/lanplus/lanplus_crypt_impl.c
> -+++ b/src/plugins/lanplus/lanplus_crypt_impl.c
> -@@ -164,11 +164,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
> -                                                       uint8_t       *
> output,
> -                                                       uint32_t        *
> bytes_written)
> - {
> --      EVP_CIPHER_CTX ctx;
> --      EVP_CIPHER_CTX_init(&ctx);
> --      EVP_EncryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
> --      EVP_CIPHER_CTX_set_padding(&ctx, 0);
> --
> -+      EVP_CIPHER_CTX *ctx = NULL;
> -
> -       *bytes_written = 0;
> -
> -@@ -182,6 +178,14 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
> -               printbuf(input, input_length, "encrypting this data");
> -       }
> -
> -+      ctx = EVP_CIPHER_CTX_new();
> -+      if (ctx == NULL) {
> -+              lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
> -+              return;
> -+      }
> -+      EVP_CIPHER_CTX_init(ctx);
> -+      EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
> -+      EVP_CIPHER_CTX_set_padding(ctx, 0);
> -
> -       /*
> -        * The default implementation adds a whole block of padding if the
> input
> -@@ -191,28 +195,28 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
> -       assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
> -
> -
> --      if(!EVP_EncryptUpdate(&ctx, output, (int *)bytes_written, input,
> input_length))
> -+      if(!EVP_EncryptUpdate(ctx, output, (int *)bytes_written, input,
> input_length))
> -       {
> -               /* Error */
> -               *bytes_written = 0;
> --              return;
> -       }
> -       else
> -       {
> -               uint32_t tmplen;
> -
> --              if(!EVP_EncryptFinal_ex(&ctx, output + *bytes_written,
> (int *)&tmplen))
> -+              if(!EVP_EncryptFinal_ex(ctx, output + *bytes_written, (int
> *)&tmplen))
> -               {
> -+                      /* Error */
> -                       *bytes_written = 0;
> --                      return; /* Error */
> -               }
> -               else
> -               {
> -                       /* Success */
> -                       *bytes_written += tmplen;
> --                      EVP_CIPHER_CTX_cleanup(&ctx);
> -               }
> -       }
> -+      /* performs cleanup and free */
> -+      EVP_CIPHER_CTX_free(ctx);
> - }
> -
> -
> -@@ -239,11 +243,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
> -                                                       uint8_t       *
> output,
> -                                                       uint32_t        *
> bytes_written)
> - {
> --      EVP_CIPHER_CTX ctx;
> --      EVP_CIPHER_CTX_init(&ctx);
> --      EVP_DecryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
> --      EVP_CIPHER_CTX_set_padding(&ctx, 0);
> --
> -+      EVP_CIPHER_CTX *ctx = NULL;
> -
> -       if (verbose >= 5)
> -       {
> -@@ -252,12 +252,20 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
> -               printbuf(input, input_length, "decrypting this data");
> -       }
> -
> --
> -       *bytes_written = 0;
> -
> -       if (input_length == 0)
> -               return;
> -
> -+      ctx = EVP_CIPHER_CTX_new();
> -+      if (ctx == NULL) {
> -+              lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
> -+              return;
> -+      }
> -+      EVP_CIPHER_CTX_init(ctx);
> -+      EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
> -+      EVP_CIPHER_CTX_set_padding(ctx, 0);
> -+
> -       /*
> -        * The default implementation adds a whole block of padding if the
> input
> -        * data is perfectly aligned.  We would like to keep that from
> happening.
> -@@ -266,33 +274,33 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
> -       assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
> -
> -
> --      if (!EVP_DecryptUpdate(&ctx, output, (int *)bytes_written, input,
> input_length))
> -+      if (!EVP_DecryptUpdate(ctx, output, (int *)bytes_written, input,
> input_length))
> -       {
> -               /* Error */
> -               lprintf(LOG_DEBUG, "ERROR: decrypt update failed");
> -               *bytes_written = 0;
> --              return;
> -       }
> -       else
> -       {
> -               uint32_t tmplen;
> -
> --              if (!EVP_DecryptFinal_ex(&ctx, output + *bytes_written,
> (int *)&tmplen))
> -+              if (!EVP_DecryptFinal_ex(ctx, output + *bytes_written,
> (int *)&tmplen))
> -               {
> -+                      /* Error */
> -                       char buffer[1000];
> -                       ERR_error_string(ERR_get_error(), buffer);
> -                       lprintf(LOG_DEBUG, "the ERR error %s", buffer);
> -                       lprintf(LOG_DEBUG, "ERROR: decrypt final failed");
> -                       *bytes_written = 0;
> --                      return; /* Error */
> -               }
> -               else
> -               {
> -                       /* Success */
> -                       *bytes_written += tmplen;
> --                      EVP_CIPHER_CTX_cleanup(&ctx);
> -               }
> -       }
> -+      /* performs cleanup and free */
> -+      EVP_CIPHER_CTX_free(ctx);
> -
> -       if (verbose >= 5)
> -       {
> diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
> b/meta-oe/recipes-kernel/ipmitool/ipmitool_git.bb
> similarity index 80%
> rename from meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
> rename to meta-oe/recipes-kernel/ipmitool/ipmitool_git.bb
> index b7f1aa914..cf6b9065d 100644
> --- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
> +++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_git.bb
> @@ -14,7 +14,7 @@ Log (SEL), printing Field Replaceable Unit (FRU)
> information, reading and \
>  setting LAN configuration, and chassis power control. \
>  "
>
> -HOMEPAGE = "http://ipmitool.sourceforge.net/"
> +HOMEPAGE = "https://github.com/ipmitool/ipmitool"
>  SECTION = "kernel/userland"
>
>  LICENSE = "BSD-3-Clause"
> @@ -22,11 +22,8 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=9aa91e13d644326bf281924212862184"
>
>  DEPENDS = "openssl readline ncurses"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/ipmitool/ipmitool-${PV}.tar.bz2 \
> -           file://0001-Migrate-to-openssl-1.1.patch \
> -           "
> -SRC_URI[md5sum] = "bab7ea104c7b85529c3ef65c54427aa3"
> -SRC_URI[sha256sum] =
> "0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01"
> +SRC_URI = "git://github.com/ipmitool/ipmitool.git;protocol=https"
> +SRCREV = "b0d84e0f15b2120eaf9fe1301cf02c24eebcfb37"
>
>  inherit autotools
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000622198058698b3ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">We still need to set pv=C2=A0</div></div><div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr =
15, 2019 at 1:23 PM Vernon Mauery &lt;<a href=3D"mailto:vernon.mauery@linux=
.intel.com">vernon.mauery@linux.intel.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">The ipmitool project has moved from sourceforge to gi=
thub and is under<br>
new management. This updates the source so that it pulls directly from<br>
git rather than a tarball. Eventually, once the next release is tagged,<br>
the new SRCREV can be updated to that. But for now, the project is under<br=
>
active development and could probably benefit from periodic updates<br>
anyway.<br>
<br>
The SRCREV and SRC_URI links point to code that already has been patched<br=
>
to work with the new openssl 1.1 APIs, so the patch is no longer needed.<br=
>
<br>
Signed-off-by: Vernon Mauery &lt;<a href=3D"mailto:vernon.mauery@linux.inte=
l.com" target=3D"_blank">vernon.mauery@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Migrate-to-openssl-1.1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 152 ------------------<br>
=C2=A0.../{<a href=3D"http://ipmitool_1.8.18.bb" rel=3D"noreferrer" target=
=3D"_blank">ipmitool_1.8.18.bb</a> =3D&gt; <a href=3D"http://ipmitool_git.b=
b" rel=3D"noreferrer" target=3D"_blank">ipmitool_git.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 =C2=A09 +-<br>
=C2=A02 files changed, 3 insertions(+), 158 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migr=
ate-to-openssl-1.1.patch<br>
=C2=A0rename meta-oe/recipes-kernel/ipmitool/{<a href=3D"http://ipmitool_1.=
8.18.bb" rel=3D"noreferrer" target=3D"_blank">ipmitool_1.8.18.bb</a> =3D&gt=
; <a href=3D"http://ipmitool_git.bb" rel=3D"noreferrer" target=3D"_blank">i=
pmitool_git.bb</a>} (80%)<br>
<br>
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-opens=
sl-1.1.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-ope=
nssl-1.1.patch<br>
deleted file mode 100644<br>
index 394aa16ad..000000000<br>
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.=
patch<br>
+++ /dev/null<br>
@@ -1,152 +0,0 @@<br>
-From c9dcb6afef9c343d070aaff208d11a997a45a105 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Wed, 5 Sep 2018 22:19:38 -0700<br>
-Subject: [PATCH] Migrate to openssl 1.1<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://sourceforge.net/p/ipmitool/s=
ource/ci/1664902525a1c3771b4d8b3ccab7ea1ba6b2bdd1/" rel=3D"noreferrer" targ=
et=3D"_blank">https://sourceforge.net/p/ipmitool/source/ci/1664902525a1c377=
1b4d8b3ccab7ea1ba6b2bdd1/</a>]<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- src/plugins/lanplus/lanplus_crypt_impl.c | 50 ++++++++++++++----------<br=
>
- 1 file changed, 29 insertions(+), 21 deletions(-)<br>
-<br>
-diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplu=
s/lanplus_crypt_impl.c<br>
-index d5fac37..9652a5e 100644<br>
---- a/src/plugins/lanplus/lanplus_crypt_impl.c<br>
-+++ b/src/plugins/lanplus/lanplus_crypt_impl.c<br>
-@@ -164,11 +164,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t=C2=A0 =C2=A0 =C2=A0=
 =C2=A0* output,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * bytes_written)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX ctx;<br>
--=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX_init(&amp;ctx);<br>
--=C2=A0 =C2=A0 =C2=A0 EVP_EncryptInit_ex(&amp;ctx, EVP_aes_128_cbc(), NULL=
, key, iv);<br>
--=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX_set_padding(&amp;ctx, 0);<br>
--=C2=A0 =C2=A0 =C2=A0 <br>
-+=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX *ctx =3D NULL;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*bytes_written =3D 0;<br>
- <br>
-@@ -182,6 +178,14 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printbuf(input, inp=
ut_length, &quot;encrypting this data&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 ctx =3D EVP_CIPHER_CTX_new();<br>
-+=C2=A0 =C2=A0 =C2=A0 if (ctx =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lprintf(LOG_DEBUG, &quot=
;ERROR: EVP_CIPHER_CTX_new() failed&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX_init(ctx);<br>
-+=C2=A0 =C2=A0 =C2=A0 EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key=
, iv);<br>
-+=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX_set_padding(ctx, 0);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The default implementation adds a whole bloc=
k of padding if the input<br>
-@@ -191,28 +195,28 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0assert((input_length % IPMI_CRYPT_AES_CBC_128_B=
LOCK_SIZE) =3D=3D 0);<br>
- <br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 if(!EVP_EncryptUpdate(&amp;ctx, output, (int *)bytes=
_written, input, input_length))<br>
-+=C2=A0 =C2=A0 =C2=A0 if(!EVP_EncryptUpdate(ctx, output, (int *)bytes_writ=
ten, input, input_length))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Error */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*bytes_written =3D =
0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t tmplen;<br=
>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(!EVP_EncryptFinal_ex(=
&amp;ctx, output + *bytes_written, (int *)&amp;tmplen))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(!EVP_EncryptFinal_ex(=
ctx, output + *bytes_written, (int *)&amp;tmplen))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Error */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*bytes_written =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return; /* Error */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Success */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*bytes_written +=3D tmplen;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 EVP_CIPHER_CTX_cleanup(&amp;ctx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 /* performs cleanup and free */<br>
-+=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX_free(ctx);<br>
- }<br>
- <br>
- <br>
-@@ -239,11 +243,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t=C2=A0 =C2=A0 =C2=A0=
 =C2=A0* output,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * bytes_written)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX ctx;<br>
--=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX_init(&amp;ctx);<br>
--=C2=A0 =C2=A0 =C2=A0 EVP_DecryptInit_ex(&amp;ctx, EVP_aes_128_cbc(), NULL=
, key, iv);<br>
--=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX_set_padding(&amp;ctx, 0);<br>
--<br>
-+=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX *ctx =3D NULL;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (verbose &gt;=3D 5)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-@@ -252,12 +252,20 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printbuf(input, inp=
ut_length, &quot;decrypting this data&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*bytes_written =3D 0;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (input_length =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 ctx =3D EVP_CIPHER_CTX_new();<br>
-+=C2=A0 =C2=A0 =C2=A0 if (ctx =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lprintf(LOG_DEBUG, &quot=
;ERROR: EVP_CIPHER_CTX_new() failed&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX_init(ctx);<br>
-+=C2=A0 =C2=A0 =C2=A0 EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key=
, iv);<br>
-+=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX_set_padding(ctx, 0);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The default implementation adds a whole bloc=
k of padding if the input<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * data is perfectly aligned.=C2=A0 We would li=
ke to keep that from happening.<br>
-@@ -266,33 +274,33 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0assert((input_length % IPMI_CRYPT_AES_CBC_128_B=
LOCK_SIZE) =3D=3D 0);<br>
- <br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 if (!EVP_DecryptUpdate(&amp;ctx, output, (int *)byte=
s_written, input, input_length))<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!EVP_DecryptUpdate(ctx, output, (int *)bytes_wri=
tten, input, input_length))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Error */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lprintf(LOG_DEBUG, =
&quot;ERROR: decrypt update failed&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*bytes_written =3D =
0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t tmplen;<br=
>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!EVP_DecryptFinal_ex=
(&amp;ctx, output + *bytes_written, (int *)&amp;tmplen))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!EVP_DecryptFinal_ex=
(ctx, output + *bytes_written, (int *)&amp;tmplen))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Error */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0char buffer[1000];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ERR_error_string(ERR_get_error(), buffer);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0lprintf(LOG_DEBUG, &quot;the ERR error %s&quot;, buffer);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0lprintf(LOG_DEBUG, &quot;ERROR: decrypt final failed&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*bytes_written =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return; /* Error */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Success */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*bytes_written +=3D tmplen;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 EVP_CIPHER_CTX_cleanup(&amp;ctx);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 /* performs cleanup and free */<br>
-+=C2=A0 =C2=A0 =C2=A0 EVP_CIPHER_CTX_free(ctx);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (verbose &gt;=3D 5)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
diff --git a/meta-oe/recipes-kernel/ipmitool/<a href=3D"http://ipmitool_1.8=
.18.bb" rel=3D"noreferrer" target=3D"_blank">ipmitool_1.8.18.bb</a> b/meta-=
oe/recipes-kernel/ipmitool/<a href=3D"http://ipmitool_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">ipmitool_git.bb</a><br>
similarity index 80%<br>
rename from meta-oe/recipes-kernel/ipmitool/<a href=3D"http://ipmitool_1.8.=
18.bb" rel=3D"noreferrer" target=3D"_blank">ipmitool_1.8.18.bb</a><br>
rename to meta-oe/recipes-kernel/ipmitool/<a href=3D"http://ipmitool_git.bb=
" rel=3D"noreferrer" target=3D"_blank">ipmitool_git.bb</a><br>
index b7f1aa914..cf6b9065d 100644<br>
--- a/meta-oe/recipes-kernel/ipmitool/<a href=3D"http://ipmitool_1.8.18.bb"=
 rel=3D"noreferrer" target=3D"_blank">ipmitool_1.8.18.bb</a><br>
+++ b/meta-oe/recipes-kernel/ipmitool/<a href=3D"http://ipmitool_git.bb" re=
l=3D"noreferrer" target=3D"_blank">ipmitool_git.bb</a><br>
@@ -14,7 +14,7 @@ Log (SEL), printing Field Replaceable Unit (FRU) informat=
ion, reading and \<br>
=C2=A0setting LAN configuration, and chassis power control. \<br>
=C2=A0&quot;<br>
<br>
-HOMEPAGE =3D &quot;<a href=3D"http://ipmitool.sourceforge.net/" rel=3D"nor=
eferrer" target=3D"_blank">http://ipmitool.sourceforge.net/</a>&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/ipmitool/ipmitool" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/ipmitool/ipmitool</a>&quo=
t;<br>
=C2=A0SECTION =3D &quot;kernel/userland&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
@@ -22,11 +22,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D9aa91e13=
d644326bf281924212862184&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;openssl readline ncurses&quot;<br>
<br>
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/ipmitool/ipmitool-${PV}.tar.bz2 \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Migrate-to-openssl-1.=
1.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;bab7ea104c7b85529c3ef65c54427aa3&quot;<br>
-SRC_URI[sha256sum] =3D &quot;0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918=
f07189eeedfc8b81e01&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/ipmitool/ipmitool.git=
;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/ipmitool=
/ipmitool.git;protocol=3Dhttps</a>&quot;<br>
+SRCREV =3D &quot;b0d84e0f15b2120eaf9fe1301cf02c24eebcfb37&quot;<br>
<br>
=C2=A0inherit autotools<br>
<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000622198058698b3ba--
