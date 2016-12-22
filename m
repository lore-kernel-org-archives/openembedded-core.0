Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 75EBA77684;
	Thu, 22 Dec 2016 15:21:30 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m203so36706055wma.3;
	Thu, 22 Dec 2016 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qc4tELtiJRpYYFytJiuqV0fD8Dl/bJayq0CYZ1ZKnPI=;
	b=MHSpRBPhfjkzTdsFW+uNBmiS9foz6qoZJZxcKvr4hGOrmgop0DltAB7oKkp5Bp9yBz
	0INyh4mbYyQ2DPo8cLYVbf3bo9NH6+jAhx9wDTGFPFlRn09w8D8sGH4zBumDwj+Az6Gw
	g3G+5eEo56vig0dJt6RQVJrWeTHatb+m7S13bYFd8DIzBMTUf2QWGc+hFejp62hZ8mJ1
	OIiljQLb61G9fKQYMiGiRSedH5//a6sMJhJFiUM3PX67A3yNVMF9wWde/uc37D95s9p8
	Bv0uQ+R44phc2oJjNqg/B0ma0mmTOD9pkePKn+eFfUq+gVbgHAICCp9e2uZVGPgtXrqx
	WRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qc4tELtiJRpYYFytJiuqV0fD8Dl/bJayq0CYZ1ZKnPI=;
	b=Dg/Gx2zya9oVF0IGJa0g2Ay+NR8IyccFy7w820cQYGykmokMZTOXtTNi3EvUrULvlj
	V7p2+/Ekh+r7Q4l4JHb8ayimJRNEGQD/sEnJkRhirST13Gxjx4BdCc4+GFQnWneGdkiV
	sYg4FOptyLCTzqa7kz5bjInLcuYtKEvpLIYSy0jkeSGGo8P2MufnD+7QFat9JyngPy51
	x6WPnCOe/lzwxa+lrPxPQbVyzdzHrrc9hvNnt888X6pxUZS1jXWBrcz+Z1vp9NbO9AUe
	qw6GZt9v/ed1Tr5+7TeCxQFkTKFaZzM6TDq1j7dq20o+PI+4cIhOVMLOCyJVE/yQFDWU
	2eqA==
X-Gm-Message-State: AIkVDXLLQ+TIy4rt9xzC6yIoU9dHUA0YzuiTT8Ply6g0laGbPkUGN6OVGmcpH6qy3wm+gw==
X-Received: by 10.28.127.20 with SMTP id a20mr9073761wmd.15.1482420091530;
	Thu, 22 Dec 2016 07:21:31 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k2sm36235213wjv.11.2016.12.22.07.21.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Dec 2016 07:21:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Dec 2016 16:21:30 +0100
To: openembedded-core@lists.openembedded.org, Armin Kuster <akuster@mvista.com>
Message-ID: <20161222152130.GD3544@jama>
References: <20160923222224.3285.13563@opal.openembedded.org>
	<20160923222225.E2A2A50174@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160923222225.E2A2A50174@opal.openembedded.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 02/20: openssl: Security fix CVE-2016-2177
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
X-List-Received-Date: Thu, 22 Dec 2016 15:21:32 -0000
X-Groupsio-MsgNum: 91179
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline

--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2016 at 10:22:26PM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch jethro
> in repository openembedded-core.

This change and CVE-2016-8610.patch seems to be missing in krogoth branch.

OE @ ~/openembedded-core $ git diff origin/jethro  origin/krogoth -- meta/r=
ecipes-connectivity/openssl/openssl_1.0.2h.bb | grep CVE
-            file://CVE-2016-2177.patch \
-            file://CVE-2016-2178.patch \
+           file://CVE-2016-2178.patch \
+            file://CVE-2016-2179.patch \
             file://CVE-2016-2180.patch \
             file://CVE-2016-2181_p1.patch \
             file://CVE-2016-2181_p2.patch \
             file://CVE-2016-6303.patch \
             file://CVE-2016-6304.patch \
             file://CVE-2016-6306.patch \
-            file://CVE-2016-2179.patch \
-            file://CVE-2016-8610.patch \

Is there some pending pull request for krogoth? There is also that tzdata v=
ersion lower in krogoth than jethro I've reported a while ago:

OE @ ~/openembedded-core $ git diff origin/jethro  origin/krogoth -- meta/r=
ecipes-extended/tzdata/
diff --git a/meta/recipes-extended/tzdata/tzdata_2016i.bb b/meta/recipes-ex=
tended/tzdata/tzdata_2016g.bb
similarity index 94%
rename from meta/recipes-extended/tzdata/tzdata_2016i.bb
rename to meta/recipes-extended/tzdata/tzdata_2016g.bb

> commit 5781eb9a6e6bf8984b090a488d2a326bf9fafcf8
> Author: Armin Kuster <akuster@mvista.com>
> AuthorDate: Sat Jul 16 16:04:11 2016 -0700
>=20
>     openssl: Security fix CVE-2016-2177
>    =20
>     Affects openssl <=3D 1.0.2h
>     CVSS v2 Base Score: 7.5 HIGH
>    =20
>     Signed-off-by: Armin Kuster <akuster@mvista.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     (cherry picked from commit 2848c7d3e454cbc84cba9183f23ccdf3e9200ec9)
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../openssl/openssl/CVE-2016-2177.patch            | 286 +++++++++++++++=
++++++
>  .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   1 +
>  2 files changed, 287 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patc=
h b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
> new file mode 100644
> index 0000000..df36d5f
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
> @@ -0,0 +1,286 @@
> +From a004e72b95835136d3f1ea90517f706c24c03da7 Mon Sep 17 00:00:00 2001
> +From: Matt Caswell <matt@openssl.org>
> +Date: Thu, 5 May 2016 11:10:26 +0100
> +Subject: [PATCH] Avoid some undefined pointer arithmetic
> +
> +A common idiom in the codebase is:
> +
> +if (p + len > limit)
> +{
> +    return; /* Too long */
> +}
> +
> +Where "p" points to some malloc'd data of SIZE bytes and
> +limit =3D=3D p + SIZE
> +
> +"len" here could be from some externally supplied data (e.g. from a TLS
> +message).
> +
> +The rules of C pointer arithmetic are such that "p + len" is only well
> +defined where len <=3D SIZE. Therefore the above idiom is actually
> +undefined behaviour.
> +
> +For example this could cause problems if some malloc implementation
> +provides an address for "p" such that "p + len" actually overflows for
> +values of len that are too big and therefore p + len < limit!
> +
> +Issue reported by Guido Vranken.
> +
> +CVE-2016-2177
> +
> +Reviewed-by: Rich Salz <rsalz@openssl.org>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2016-2177
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +
> +---
> + ssl/s3_srvr.c  | 14 +++++++-------
> + ssl/ssl_sess.c |  2 +-
> + ssl/t1_lib.c   | 56 ++++++++++++++++++++++++++++++---------------------=
-----
> + 3 files changed, 38 insertions(+), 34 deletions(-)
> +
> +diff --git a/ssl/s3_srvr.c b/ssl/s3_srvr.c
> +index ab28702..ab7f690 100644
> +--- a/ssl/s3_srvr.c
> ++++ b/ssl/s3_srvr.c
> +@@ -980,7 +980,7 @@ int ssl3_get_client_hello(SSL *s)
> +=20
> +         session_length =3D *(p + SSL3_RANDOM_SIZE);
> +=20
> +-        if (p + SSL3_RANDOM_SIZE + session_length + 1 >=3D d + n) {
> ++        if (SSL3_RANDOM_SIZE + session_length + 1 >=3D (d + n) - p) {
> +             al =3D SSL_AD_DECODE_ERROR;
> +             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
> +             goto f_err;
> +@@ -998,7 +998,7 @@ int ssl3_get_client_hello(SSL *s)
> +     /* get the session-id */
> +     j =3D *(p++);
> +=20
> +-    if (p + j > d + n) {
> ++    if ((d + n) - p < j) {
> +         al =3D SSL_AD_DECODE_ERROR;
> +         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
> +         goto f_err;
> +@@ -1054,14 +1054,14 @@ int ssl3_get_client_hello(SSL *s)
> +=20
> +     if (SSL_IS_DTLS(s)) {
> +         /* cookie stuff */
> +-        if (p + 1 > d + n) {
> ++        if ((d + n) - p < 1) {
> +             al =3D SSL_AD_DECODE_ERROR;
> +             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
> +             goto f_err;
> +         }
> +         cookie_len =3D *(p++);
> +=20
> +-        if (p + cookie_len > d + n) {
> ++        if ((d + n ) - p < cookie_len) {
> +             al =3D SSL_AD_DECODE_ERROR;
> +             SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
> +             goto f_err;
> +@@ -1131,7 +1131,7 @@ int ssl3_get_client_hello(SSL *s)
> +         }
> +     }
> +=20
> +-    if (p + 2 > d + n) {
> ++    if ((d + n ) - p < 2) {
> +         al =3D SSL_AD_DECODE_ERROR;
> +         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_TOO_SHORT);
> +         goto f_err;
> +@@ -1145,7 +1145,7 @@ int ssl3_get_client_hello(SSL *s)
> +     }
> +=20
> +     /* i bytes of cipher data + 1 byte for compression length later */
> +-    if ((p + i + 1) > (d + n)) {
> ++    if ((d + n) - p < i + 1) {
> +         /* not enough data */
> +         al =3D SSL_AD_DECODE_ERROR;
> +         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
> +@@ -1211,7 +1211,7 @@ int ssl3_get_client_hello(SSL *s)
> +=20
> +     /* compression */
> +     i =3D *(p++);
> +-    if ((p + i) > (d + n)) {
> ++    if ((d + n) - p < i) {
> +         /* not enough data */
> +         al =3D SSL_AD_DECODE_ERROR;
> +         SSLerr(SSL_F_SSL3_GET_CLIENT_HELLO, SSL_R_LENGTH_MISMATCH);
> +diff --git a/ssl/ssl_sess.c b/ssl/ssl_sess.c
> +index b182998..54ee783 100644
> +--- a/ssl/ssl_sess.c
> ++++ b/ssl/ssl_sess.c
> +@@ -573,7 +573,7 @@ int ssl_get_prev_session(SSL *s, unsigned char *sess=
ion_id, int len,
> +     int r;
> + #endif
> +=20
> +-    if (session_id + len > limit) {
> ++    if (limit - session_id < len) {
> +         fatal =3D 1;
> +         goto err;
> +     }
> +diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
> +index fb64607..cdac011 100644
> +--- a/ssl/t1_lib.c
> ++++ b/ssl/t1_lib.c
> +@@ -1867,11 +1867,11 @@ static void ssl_check_for_safari(SSL *s, const u=
nsigned char *data,
> +         0x02, 0x03,             /* SHA-1/ECDSA */
> +     };
> +=20
> +-    if (data >=3D (limit - 2))
> ++    if (limit - data <=3D 2)
> +         return;
> +     data +=3D 2;
> +=20
> +-    if (data > (limit - 4))
> ++    if (limit - data < 4)
> +         return;
> +     n2s(data, type);
> +     n2s(data, size);
> +@@ -1879,7 +1879,7 @@ static void ssl_check_for_safari(SSL *s, const uns=
igned char *data,
> +     if (type !=3D TLSEXT_TYPE_server_name)
> +         return;
> +=20
> +-    if (data + size > limit)
> ++    if (limit - data < size)
> +         return;
> +     data +=3D size;
> +=20
> +@@ -1887,7 +1887,7 @@ static void ssl_check_for_safari(SSL *s, const uns=
igned char *data,
> +         const size_t len1 =3D sizeof(kSafariExtensionsBlock);
> +         const size_t len2 =3D sizeof(kSafariTLS12ExtensionsBlock);
> +=20
> +-        if (data + len1 + len2 !=3D limit)
> ++        if (limit - data !=3D (int)(len1 + len2))
> +             return;
> +         if (memcmp(data, kSafariExtensionsBlock, len1) !=3D 0)
> +             return;
> +@@ -1896,7 +1896,7 @@ static void ssl_check_for_safari(SSL *s, const uns=
igned char *data,
> +     } else {
> +         const size_t len =3D sizeof(kSafariExtensionsBlock);
> +=20
> +-        if (data + len !=3D limit)
> ++        if (limit - data !=3D (int)(len))
> +             return;
> +         if (memcmp(data, kSafariExtensionsBlock, len) !=3D 0)
> +             return;
> +@@ -2053,19 +2053,19 @@ static int ssl_scan_clienthello_tlsext(SSL *s, u=
nsigned char **p,
> +     if (data =3D=3D limit)
> +         goto ri_check;
> +=20
> +-    if (data > (limit - 2))
> ++    if (limit - data < 2)
> +         goto err;
> +=20
> +     n2s(data, len);
> +=20
> +-    if (data + len !=3D limit)
> ++    if (limit - data !=3D len)
> +         goto err;
> +=20
> +-    while (data <=3D (limit - 4)) {
> ++    while (limit - data >=3D 4) {
> +         n2s(data, type);
> +         n2s(data, size);
> +=20
> +-        if (data + size > (limit))
> ++        if (limit - data < size)
> +             goto err;
> + # if 0
> +         fprintf(stderr, "Received extension type %d size %d\n", type, s=
ize);
> +@@ -2472,18 +2472,18 @@ static int ssl_scan_clienthello_custom_tlsext(SS=
L *s,
> +     if (s->hit || s->cert->srv_ext.meths_count =3D=3D 0)
> +         return 1;
> +=20
> +-    if (data >=3D limit - 2)
> ++    if (limit - data <=3D 2)
> +         return 1;
> +     n2s(data, len);
> +=20
> +-    if (data > limit - len)
> ++    if (limit - data < len)
> +         return 1;
> +=20
> +-    while (data <=3D limit - 4) {
> ++    while (limit - data >=3D 4) {
> +         n2s(data, type);
> +         n2s(data, size);
> +=20
> +-        if (data + size > limit)
> ++        if (limit - data < size)
> +             return 1;
> +         if (custom_ext_parse(s, 1 /* server */ , type, data, size, al) =
<=3D 0)
> +             return 0;
> +@@ -2569,20 +2569,20 @@ static int ssl_scan_serverhello_tlsext(SSL *s, u=
nsigned char **p,
> +                              SSL_TLSEXT_HB_DONT_SEND_REQUESTS);
> + # endif
> +=20
> +-    if (data >=3D (d + n - 2))
> ++    if ((d + n) - data <=3D 2)
> +         goto ri_check;
> +=20
> +     n2s(data, length);
> +-    if (data + length !=3D d + n) {
> ++    if ((d + n) - data !=3D length) {
> +         *al =3D SSL_AD_DECODE_ERROR;
> +         return 0;
> +     }
> +=20
> +-    while (data <=3D (d + n - 4)) {
> ++    while ((d + n) - data >=3D 4) {
> +         n2s(data, type);
> +         n2s(data, size);
> +=20
> +-        if (data + size > (d + n))
> ++        if ((d + n) - data < size)
> +             goto ri_check;
> +=20
> +         if (s->tlsext_debug_cb)
> +@@ -3307,29 +3307,33 @@ int tls1_process_ticket(SSL *s, unsigned char *s=
ession_id, int len,
> +     /* Skip past DTLS cookie */
> +     if (SSL_IS_DTLS(s)) {
> +         i =3D *(p++);
> +-        p +=3D i;
> +-        if (p >=3D limit)
> ++
> ++        if (limit - p <=3D i)
> +             return -1;
> ++
> ++        p +=3D i;
> +     }
> +     /* Skip past cipher list */
> +     n2s(p, i);
> +-    p +=3D i;
> +-    if (p >=3D limit)
> ++    if (limit - p <=3D i)
> +         return -1;
> ++    p +=3D i;
> ++
> +     /* Skip past compression algorithm list */
> +     i =3D *(p++);
> +-    p +=3D i;
> +-    if (p > limit)
> ++    if (limit - p < i)
> +         return -1;
> ++    p +=3D i;
> ++
> +     /* Now at start of extensions */
> +-    if ((p + 2) >=3D limit)
> ++    if (limit - p <=3D 2)
> +         return 0;
> +     n2s(p, i);
> +-    while ((p + 4) <=3D limit) {
> ++    while (limit - p >=3D 4) {
> +         unsigned short type, size;
> +         n2s(p, type);
> +         n2s(p, size);
> +-        if (p + size > limit)
> ++        if (limit - p < size)
> +             return 0;
> +         if (type =3D=3D TLSEXT_TYPE_session_ticket) {
> +             int r;
> +--=20
> +2.3.5
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/r=
ecipes-connectivity/openssl/openssl_1.0.2h.bb
> index ea40275..4135a31 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> @@ -38,6 +38,7 @@ SRC_URI +=3D "file://configure-targets.patch \
>              file://openssl-1.0.2a-x32-asm.patch \
>              file://ptest_makefile_deps.patch  \
>              file://parallel.patch \
> +            file://CVE-2016-2177.patch \
>             "
> =20
>  SRC_URI[md5sum] =3D "9392e65072ce4b614c1392eefc1f23d0"
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFvveQAKCRA3VSO3ZXaA
HHeVAJ9s26pFGwtINRd5OhRAqqwMBG0dRwCghyrxHqAb43uf5VC8l8h3Gvg/jbo=
=4A3b
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
