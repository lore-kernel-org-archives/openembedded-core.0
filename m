Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 22D78765DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 06:32:14 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0224.002; Fri, 11 Sep 2015 08:32:09 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Armin Kuster <akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH][fido] bind: CVE-2015-1349 CVE-2015-4620
	CVE-2015-5722
Thread-Index: AQHQ6cQbgphCOjY4kUuVq3kKOuNiOJ424l/Q
Date: Fri, 11 Sep 2015 06:32:08 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E4825A3B3A4@SESTOEX04.enea.se>
References: <1441668103-28663-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1441668103-28663-1-git-send-email-akuster808@gmail.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][fido] bind: CVE-2015-1349 CVE-2015-4620	CVE-2015-5722
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
X-List-Received-Date: Fri, 11 Sep 2015 06:32:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

I guess you will backport these to dizzy as well. I created Bug 8281 just t=
o have track of=20
recent bind vulnerabilities:
CVEs, CVE-2015-1349, CVE-2015-4620, CVE-2015-5477, CVE-2015-5722, CVE-2015-=
5986.

I think all have been addressed in master and fido, remaining are only thes=
e three=20
patches in dizzy branch.

//Sona

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Armin Kuster
> Sent: den 8 september 2015 01:22
> To: openembedded-core@lists.openembedded.org;
> joshua.lock@collabora.co.uk
> Cc: Armin Kuster <akuster@mvista.com>
> Subject: [OE-core] [PATCH][fido] bind: CVE-2015-1349 CVE-2015-4620 CVE-
> 2015-5722
>=20
> From: Armin Kuster <akuster@mvista.com>
>=20
> three security fixes.
>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../bind/bind/CVE-2015-1349.patch                  |  60 +++
>  .../bind/bind/CVE-2015-4620.patch                  |  36 ++
>  .../bind/bind/CVE-2015-5722.patch                  | 490 +++++++++++++++=
++++++
>  meta/recipes-connectivity/bind/bind_9.9.5.bb       |   3 +
>  4 files changed, 589 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-
> 1349.patch
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-
> 4620.patch
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-
> 5722.patch
>=20
> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2015-1349.patch
> b/meta/recipes-connectivity/bind/bind/CVE-2015-1349.patch
> new file mode 100644
> index 0000000..dea7aae
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/CVE-2015-1349.patch
> @@ -0,0 +1,60 @@
> +CVE-2015-1349 bind: issue in trust anchor management can cause named to
> +crash
> +
> +commit 2e9d79f169663c9aff5f0dcdc626a2cd2dbb5892
> +Author: Evan Hunt <each@isc.org>
> +Date:   Tue Feb 3 18:30:38 2015 -0800
> +
> +    [v9_9_6_patch] avoid crash due to managed-key rollover
> +
> +    4053.	[security]	Revoking a managed trust anchor and
> supplying
> +    			an untrusted replacement could cause named
> +    			to crash with an assertion failure.
> +    			(CVE-2015-1349) [RT #38344]
> +
> +Upstream Status: Backport from Redhat
> +
> +https://bugzilla.redhat.com/attachment.cgi?id=3D993045
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +Index: bind-9.9.5/CHANGES
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> +--- bind-9.9.5.orig/CHANGES
> ++++ bind-9.9.5/CHANGES
> +@@ -1,3 +1,10 @@
> ++	--- 9.9.6-P2 released ---
> ++
> ++4053.	[security]	Revoking a managed trust anchor and
> supplying
> ++			an untrusted replacement could cause named
> ++			to crash with an assertion failure.
> ++			(CVE-2015-1349) [RT #38344]
> ++
> + 	--- 9.9.5 released ---
> +
> + 	--- 9.9.5rc2 released ---
> +Index: bind-9.9.5/lib/dns/zone.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> +--- bind-9.9.5.orig/lib/dns/zone.c
> ++++ bind-9.9.5/lib/dns/zone.c
> +@@ -8496,6 +8496,12 @@ keyfetch_done(isc_task_t *task, isc_even
> + 					     namebuf, tag);
> + 				trustkey =3D ISC_TRUE;
> + 			}
> ++		} else {
> ++			/*
> ++			 * No previously known key, and the key is not
> ++			 * secure, so skip it.
> ++			 */
> ++			continue;
> + 		}
> +
> + 		/* Delete old version */
> +@@ -8544,7 +8550,7 @@ keyfetch_done(isc_task_t *task, isc_even
> + 			trust_key(zone, keyname, &dnskey, mctx);
> + 		}
> +
> +-		if (!deletekey)
> ++		if (secure && !deletekey)
> + 			set_refreshkeytimer(zone, &keydata, now);
> + 	}
> +
> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2015-4620.patch
> b/meta/recipes-connectivity/bind/bind/CVE-2015-4620.patch
> new file mode 100644
> index 0000000..1a5051e
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/CVE-2015-4620.patch
> @@ -0,0 +1,36 @@
> +CVE-2015-4620 bind: abort DoS caused by uninitialized value use in
> +isselfsigned()
> +
> +issue introduced by git commit
> +
> +https://source.isc.org/cgi-bin/gitweb.cgi?p=3Dbind9.git;a=3Dcommitdiff;h=
=3D44
> +f175a90a855326725439b2f1178f0dcca8f67d
> +
> +which is in this version of bind.
> +
> +Upstream Status: Backport from Redhat
> +
> +https://bugzilla.redhat.com/attachment.cgi?id=3D1044719
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +Index: bind-9.9.5/lib/dns/validator.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> +--- bind-9.9.5.orig/lib/dns/validator.c
> ++++ bind-9.9.5/lib/dns/validator.c
> +@@ -1406,7 +1406,6 @@ compute_keytag(dns_rdata_t *rdata, dns_r
> +  */
> + static isc_boolean_t
> + isselfsigned(dns_validator_t *val) {
> +-	dns_fixedname_t fixed;
> + 	dns_rdataset_t *rdataset, *sigrdataset;
> + 	dns_rdata_t rdata =3D DNS_RDATA_INIT;
> + 	dns_rdata_t sigrdata =3D DNS_RDATA_INIT; @@ -1462,8 +1461,7 @@
> +isselfsigned(dns_validator_t *val) {
> + 			result =3D dns_dnssec_verify3(name, rdataset, dstkey,
> + 						    ISC_TRUE,
> + 						    val->view->maxbits,
> +-						    mctx, &sigrdata,
> +-
> dns_fixedname_name(&fixed));
> ++						    mctx, &sigrdata, NULL);
> + 			dst_key_free(&dstkey);
> + 			if (result !=3D ISC_R_SUCCESS)
> + 				continue;
> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2015-5722.patch
> b/meta/recipes-connectivity/bind/bind/CVE-2015-5722.patch
> new file mode 100644
> index 0000000..af20d5c
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/CVE-2015-5722.patch
> @@ -0,0 +1,490 @@
> +CVE-2015-5722 bind: malformed DNSSEC key failed assertion denial of
> +service
> +
> +Upstream Status: Backport from Redhat
> +
> +https://bugzilla.redhat.com/attachment.cgi?id=3D1069245
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +Index: bind-9.9.5/lib/dns/hmac_link.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> +--- bind-9.9.5.orig/lib/dns/hmac_link.c
> ++++ bind-9.9.5/lib/dns/hmac_link.c
> +@@ -76,7 +76,7 @@ hmacmd5_createctx(dst_key_t *key, dst_co
> + 	hmacmd5ctx =3D isc_mem_get(dctx->mctx, sizeof(isc_hmacmd5_t));
> + 	if (hmacmd5ctx =3D=3D NULL)
> + 		return (ISC_R_NOMEMORY);
> +-	isc_hmacmd5_init(hmacmd5ctx, hkey->key,
> ISC_SHA1_BLOCK_LENGTH);
> ++	isc_hmacmd5_init(hmacmd5ctx, hkey->key,
> ISC_MD5_BLOCK_LENGTH);
> + 	dctx->ctxdata.hmacmd5ctx =3D hmacmd5ctx;
> + 	return (ISC_R_SUCCESS);
> + }
> +@@ -139,7 +139,7 @@ hmacmd5_compare(const dst_key_t *key1, c
> + 	else if (hkey1 =3D=3D NULL || hkey2 =3D=3D NULL)
> + 		return (ISC_FALSE);
> +
> +-	if (isc_safe_memcmp(hkey1->key, hkey2->key,
> ISC_SHA1_BLOCK_LENGTH))
> ++	if (isc_safe_memcmp(hkey1->key, hkey2->key,
> ISC_MD5_BLOCK_LENGTH))
> + 		return (ISC_TRUE);
> + 	else
> + 		return (ISC_FALSE);
> +@@ -150,17 +150,17 @@ hmacmd5_generate(dst_key_t *key, int pse
> + 	isc_buffer_t b;
> + 	isc_result_t ret;
> + 	unsigned int bytes;
> +-	unsigned char data[ISC_SHA1_BLOCK_LENGTH];
> ++	unsigned char data[ISC_MD5_BLOCK_LENGTH];
> +
> + 	UNUSED(callback);
> +
> + 	bytes =3D (key->key_size + 7) / 8;
> +-	if (bytes > ISC_SHA1_BLOCK_LENGTH) {
> +-		bytes =3D ISC_SHA1_BLOCK_LENGTH;
> +-		key->key_size =3D ISC_SHA1_BLOCK_LENGTH * 8;
> ++	if (bytes > ISC_MD5_BLOCK_LENGTH) {
> ++		bytes =3D ISC_MD5_BLOCK_LENGTH;
> ++		key->key_size =3D ISC_MD5_BLOCK_LENGTH * 8;
> + 	}
> +
> +-	memset(data, 0, ISC_SHA1_BLOCK_LENGTH);
> ++	memset(data, 0, ISC_MD5_BLOCK_LENGTH);
> + 	ret =3D dst__entropy_getdata(data, bytes, ISC_TF(pseudorandom_ok !=3D
> + 0));
> +
> + 	if (ret !=3D ISC_R_SUCCESS)
> +@@ -169,7 +169,7 @@ hmacmd5_generate(dst_key_t *key, int pse
> + 	isc_buffer_init(&b, data, bytes);
> + 	isc_buffer_add(&b, bytes);
> + 	ret =3D hmacmd5_fromdns(key, &b);
> +-	memset(data, 0, ISC_SHA1_BLOCK_LENGTH);
> ++	memset(data, 0, ISC_MD5_BLOCK_LENGTH);
> +
> + 	return (ret);
> + }
> +@@ -223,7 +223,7 @@ hmacmd5_fromdns(dst_key_t *key, isc_buff
> +
> + 	memset(hkey->key, 0, sizeof(hkey->key));
> +
> +-	if (r.length > ISC_SHA1_BLOCK_LENGTH) {
> ++	if (r.length > ISC_MD5_BLOCK_LENGTH) {
> + 		isc_md5_init(&md5ctx);
> + 		isc_md5_update(&md5ctx, r.base, r.length);
> + 		isc_md5_final(&md5ctx, hkey->key);
> +@@ -236,6 +236,8 @@ hmacmd5_fromdns(dst_key_t *key, isc_buff
> + 	key->key_size =3D keylen * 8;
> + 	key->keydata.hmacmd5 =3D hkey;
> +
> ++	isc_buffer_forward(data, r.length);
> ++
> + 	return (ISC_R_SUCCESS);
> + }
> +
> +@@ -512,6 +514,8 @@ hmacsha1_fromdns(dst_key_t *key, isc_buf
> + 	key->key_size =3D keylen * 8;
> + 	key->keydata.hmacsha1 =3D hkey;
> +
> ++	isc_buffer_forward(data, r.length);
> ++
> + 	return (ISC_R_SUCCESS);
> + }
> +
> +@@ -790,6 +794,8 @@ hmacsha224_fromdns(dst_key_t *key, isc_b
> + 	key->key_size =3D keylen * 8;
> + 	key->keydata.hmacsha224 =3D hkey;
> +
> ++	isc_buffer_forward(data, r.length);
> ++
> + 	return (ISC_R_SUCCESS);
> + }
> +
> +@@ -1068,6 +1074,8 @@ hmacsha256_fromdns(dst_key_t *key, isc_b
> + 	key->key_size =3D keylen * 8;
> + 	key->keydata.hmacsha256 =3D hkey;
> +
> ++	isc_buffer_forward(data, r.length);
> ++
> + 	return (ISC_R_SUCCESS);
> + }
> +
> +@@ -1346,6 +1354,8 @@ hmacsha384_fromdns(dst_key_t *key, isc_b
> + 	key->key_size =3D keylen * 8;
> + 	key->keydata.hmacsha384 =3D hkey;
> +
> ++	isc_buffer_forward(data, r.length);
> ++
> + 	return (ISC_R_SUCCESS);
> + }
> +
> +@@ -1624,6 +1634,8 @@ hmacsha512_fromdns(dst_key_t *key, isc_b
> + 	key->key_size =3D keylen * 8;
> + 	key->keydata.hmacsha512 =3D hkey;
> +
> ++	isc_buffer_forward(data, r.length);
> ++
> + 	return (ISC_R_SUCCESS);
> + }
> +
> +Index: bind-9.9.5/lib/dns/include/dst/dst.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> +--- bind-9.9.5.orig/lib/dns/include/dst/dst.h
> ++++ bind-9.9.5/lib/dns/include/dst/dst.h
> +@@ -69,6 +69,7 @@ typedef struct dst_context 	dst_context_
> + #define DST_ALG_HMACSHA256	163	/* XXXMPA */
> + #define DST_ALG_HMACSHA384	164	/* XXXMPA */
> + #define DST_ALG_HMACSHA512	165	/* XXXMPA */
> ++#define DST_ALG_INDIRECT	252
> + #define DST_ALG_PRIVATE		254
> + #define DST_ALG_EXPAND		255
> + #define DST_MAX_ALGS		255
> +Index: bind-9.9.5/lib/dns/ncache.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> +--- bind-9.9.5.orig/lib/dns/ncache.c
> ++++ bind-9.9.5/lib/dns/ncache.c
> +@@ -614,13 +614,11 @@ dns_ncache_getsigrdataset(dns_rdataset_t
> + 		dns_name_fromregion(&tname, &remaining);
> + 		INSIST(remaining.length >=3D tname.length);
> + 		isc_buffer_forward(&source, tname.length);
> +-		remaining.length -=3D tname.length;
> +-		remaining.base +=3D tname.length;
> ++		isc_region_consume(&remaining, tname.length);
> +
> + 		INSIST(remaining.length >=3D 2);
> + 		type =3D isc_buffer_getuint16(&source);
> +-		remaining.length -=3D 2;
> +-		remaining.base +=3D 2;
> ++		isc_region_consume(&remaining, 2);
> +
> + 		if (type !=3D dns_rdatatype_rrsig ||
> + 		    !dns_name_equal(&tname, name)) { @@ -632,8 +630,7 @@
> +dns_ncache_getsigrdataset(dns_rdataset_t
> + 		INSIST(remaining.length >=3D 1);
> + 		trust =3D isc_buffer_getuint8(&source);
> + 		INSIST(trust <=3D dns_trust_ultimate);
> +-		remaining.length -=3D 1;
> +-		remaining.base +=3D 1;
> ++		isc_region_consume(&remaining, 1);
> +
> + 		raw =3D remaining.base;
> + 		count =3D raw[0] * 256 + raw[1];
> +Index: bind-9.9.5/lib/dns/openssldh_link.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> +--- bind-9.9.5.orig/lib/dns/openssldh_link.c
> ++++ bind-9.9.5/lib/dns/openssldh_link.c
> +@@ -266,8 +266,10 @@ openssldh_destroy(dst_key_t *key) {
> +
> + static void
> + uint16_toregion(isc_uint16_t val, isc_region_t *region) {
> +-	*region->base++ =3D (val & 0xff00) >> 8;
> +-	*region->base++ =3D (val & 0x00ff);
> ++	*region->base =3D (val & 0xff00) >> 8;
> ++	isc_region_consume(region, 1);
> ++	*region->base =3D (val & 0x00ff);
> ++	isc_region_consume(region, 1);
> + }
> +
> + static isc_uint16_t
> +@@ -278,7 +280,8 @@ uint16_fromregion(isc_region_t *region)
> + 	val =3D ((unsigned int)(cp[0])) << 8;
> + 	val |=3D ((unsigned int)(cp[1]));
> +
> +-	region->base +=3D 2;
> ++	isc_region_consume(region, 2);
> ++
> + 	return (val);
> + }
> +
> +@@ -319,16 +322,16 @@ openssldh_todns(const dst_key_t *key, is
> + 	}
> + 	else
> + 		BN_bn2bin(dh->p, r.base);
> +-	r.base +=3D plen;
> ++	isc_region_consume(&r, plen);
> +
> + 	uint16_toregion(glen, &r);
> + 	if (glen > 0)
> + 		BN_bn2bin(dh->g, r.base);
> +-	r.base +=3D glen;
> ++	isc_region_consume(&r, glen);
> +
> + 	uint16_toregion(publen, &r);
> + 	BN_bn2bin(dh->pub_key, r.base);
> +-	r.base +=3D publen;
> ++	isc_region_consume(&r, publen);
> +
> + 	isc_buffer_add(data, dnslen);
> +
> +@@ -369,10 +372,12 @@ openssldh_fromdns(dst_key_t *key, isc_bu
> + 		return (DST_R_INVALIDPUBLICKEY);
> + 	}
> + 	if (plen =3D=3D 1 || plen =3D=3D 2) {
> +-		if (plen =3D=3D 1)
> +-			special =3D *r.base++;
> +-		else
> ++		if (plen =3D=3D 1) {
> ++			special =3D *r.base;
> ++			isc_region_consume(&r, 1);
> ++		} else {
> + 			special =3D uint16_fromregion(&r);
> ++		}
> + 		switch (special) {
> + 			case 1:
> + 				dh->p =3D &bn768;
> +@@ -387,10 +392,9 @@ openssldh_fromdns(dst_key_t *key, isc_bu
> + 				DH_free(dh);
> + 				return (DST_R_INVALIDPUBLICKEY);
> + 		}
> +-	}
> +-	else {
> ++	} else {
> + 		dh->p =3D BN_bin2bn(r.base, plen, NULL);
> +-		r.base +=3D plen;
> ++		isc_region_consume(&r, plen);
> + 	}
> +
> + 	/*
> +@@ -421,15 +425,14 @@ openssldh_fromdns(dst_key_t *key, isc_bu
> + 				return (DST_R_INVALIDPUBLICKEY);
> + 			}
> + 		}
> +-	}
> +-	else {
> ++	} else {
> + 		if (glen =3D=3D 0) {
> + 			DH_free(dh);
> + 			return (DST_R_INVALIDPUBLICKEY);
> + 		}
> + 		dh->g =3D BN_bin2bn(r.base, glen, NULL);
> + 	}
> +-	r.base +=3D glen;
> ++	isc_region_consume(&r, glen);
> +
> + 	if (r.length < 2) {
> + 		DH_free(dh);
> +@@ -441,7 +444,7 @@ openssldh_fromdns(dst_key_t *key, isc_bu
> + 		return (DST_R_INVALIDPUBLICKEY);
> + 	}
> + 	dh->pub_key =3D BN_bin2bn(r.base, publen, NULL);
> +-	r.base +=3D publen;
> ++	isc_region_consume(&r, publen);
> +
> + 	key->key_size =3D BN_num_bits(dh->p);
> +
> +Index: bind-9.9.5/lib/dns/openssldsa_link.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> +--- bind-9.9.5.orig/lib/dns/openssldsa_link.c
> ++++ bind-9.9.5/lib/dns/openssldsa_link.c
> +@@ -29,8 +29,6 @@
> +  * IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> +  */
> +
> +-/* $Id$ */
> +-
> + #ifdef OPENSSL
> + #ifndef USE_EVP
> + #define USE_EVP 1
> +@@ -137,6 +135,7 @@ openssldsa_sign(dst_context_t *dctx, isc
> + 	DSA *dsa =3D key->keydata.dsa;
> + 	isc_region_t r;
> + 	DSA_SIG *dsasig;
> ++	unsigned int klen;
> + #if USE_EVP
> + 	EVP_MD_CTX *evp_md_ctx =3D dctx->ctxdata.evp_md_ctx;
> + 	EVP_PKEY *pkey;
> +@@ -188,6 +187,7 @@ openssldsa_sign(dst_context_t *dctx, isc
> + 					       ISC_R_FAILURE));
> + 	}
> + 	free(sigbuf);
> ++
> + #elif 0
> + 	/* Only use EVP for the Digest */
> + 	if (!EVP_DigestFinal_ex(evp_md_ctx, digest, &siglen)) { @@ -209,11
> ++209,17 @@ openssldsa_sign(dst_context_t *dctx, isc
> + 					       "DSA_do_sign",
> + 					       DST_R_SIGNFAILURE));
> + #endif
> +-	*r.base++ =3D (key->key_size - 512)/64;
> ++
> ++	klen =3D (key->key_size - 512)/64;
> ++	if (klen > 255)
> ++		return (ISC_R_FAILURE);
> ++	*r.base =3D klen;
> ++	isc_region_consume(&r, 1);
> ++
> + 	BN_bn2bin_fixed(dsasig->r, r.base, ISC_SHA1_DIGESTLENGTH);
> +-	r.base +=3D ISC_SHA1_DIGESTLENGTH;
> ++	isc_region_consume(&r, ISC_SHA1_DIGESTLENGTH);
> + 	BN_bn2bin_fixed(dsasig->s, r.base, ISC_SHA1_DIGESTLENGTH);
> +-	r.base +=3D ISC_SHA1_DIGESTLENGTH;
> ++	isc_region_consume(&r, ISC_SHA1_DIGESTLENGTH);
> + 	DSA_SIG_free(dsasig);
> + 	isc_buffer_add(sig, ISC_SHA1_DIGESTLENGTH * 2 + 1);
> +
> +@@ -446,15 +452,16 @@ openssldsa_todns(const dst_key_t *key, i
> + 	if (r.length < (unsigned int) dnslen)
> + 		return (ISC_R_NOSPACE);
> +
> +-	*r.base++ =3D t;
> ++	*r.base =3D t;
> ++	isc_region_consume(&r, 1);
> + 	BN_bn2bin_fixed(dsa->q, r.base, ISC_SHA1_DIGESTLENGTH);
> +-	r.base +=3D ISC_SHA1_DIGESTLENGTH;
> ++	isc_region_consume(&r, ISC_SHA1_DIGESTLENGTH);
> + 	BN_bn2bin_fixed(dsa->p, r.base, key->key_size/8);
> +-	r.base +=3D p_bytes;
> ++	isc_region_consume(&r, p_bytes);
> + 	BN_bn2bin_fixed(dsa->g, r.base, key->key_size/8);
> +-	r.base +=3D p_bytes;
> ++	isc_region_consume(&r, p_bytes);
> + 	BN_bn2bin_fixed(dsa->pub_key, r.base, key->key_size/8);
> +-	r.base +=3D p_bytes;
> ++	isc_region_consume(&r, p_bytes);
> +
> + 	isc_buffer_add(data, dnslen);
> +
> +@@ -479,29 +486,30 @@ openssldsa_fromdns(dst_key_t *key, isc_b
> + 		return (ISC_R_NOMEMORY);
> + 	dsa->flags &=3D ~DSA_FLAG_CACHE_MONT_P;
> +
> +-	t =3D (unsigned int) *r.base++;
> ++	t =3D (unsigned int) *r.base;
> ++	isc_region_consume(&r, 1);
> + 	if (t > 8) {
> + 		DSA_free(dsa);
> + 		return (DST_R_INVALIDPUBLICKEY);
> + 	}
> + 	p_bytes =3D 64 + 8 * t;
> +
> +-	if (r.length < 1 + ISC_SHA1_DIGESTLENGTH + 3 * p_bytes) {
> ++	if (r.length < ISC_SHA1_DIGESTLENGTH + 3 * p_bytes) {
> + 		DSA_free(dsa);
> + 		return (DST_R_INVALIDPUBLICKEY);
> + 	}
> +
> + 	dsa->q =3D BN_bin2bn(r.base, ISC_SHA1_DIGESTLENGTH, NULL);
> +-	r.base +=3D ISC_SHA1_DIGESTLENGTH;
> ++	isc_region_consume(&r, ISC_SHA1_DIGESTLENGTH);
> +
> + 	dsa->p =3D BN_bin2bn(r.base, p_bytes, NULL);
> +-	r.base +=3D p_bytes;
> ++	isc_region_consume(&r, p_bytes);
> +
> + 	dsa->g =3D BN_bin2bn(r.base, p_bytes, NULL);
> +-	r.base +=3D p_bytes;
> ++	isc_region_consume(&r, p_bytes);
> +
> + 	dsa->pub_key =3D BN_bin2bn(r.base, p_bytes, NULL);
> +-	r.base +=3D p_bytes;
> ++	isc_region_consume(&r, p_bytes);
> +
> + 	key->key_size =3D p_bytes * 8;
> +
> +Index: bind-9.9.5/lib/dns/opensslecdsa_link.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> +--- bind-9.9.5.orig/lib/dns/opensslecdsa_link.c
> ++++ bind-9.9.5/lib/dns/opensslecdsa_link.c
> +@@ -14,8 +14,6 @@
> +  * PERFORMANCE OF THIS SOFTWARE.
> +  */
> +
> +-/* $Id$ */
> +-
> + #include <config.h>
> +
> + #ifdef HAVE_OPENSSL_ECDSA
> +@@ -159,9 +157,9 @@ opensslecdsa_sign(dst_context_t *dctx, i
> + 					       "ECDSA_do_sign",
> + 					       DST_R_SIGNFAILURE));
> + 	BN_bn2bin_fixed(ecdsasig->r, r.base, siglen / 2);
> +-	r.base +=3D siglen / 2;
> ++	isc_region_consume(&r, siglen / 2);
> + 	BN_bn2bin_fixed(ecdsasig->s, r.base, siglen / 2);
> +-	r.base +=3D siglen / 2;
> ++	isc_region_consume(&r, siglen / 2);
> + 	ECDSA_SIG_free(ecdsasig);
> + 	isc_buffer_add(sig, siglen);
> + 	ret =3D ISC_R_SUCCESS;
> +Index: bind-9.9.5/lib/dns/opensslrsa_link.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> +--- bind-9.9.5.orig/lib/dns/opensslrsa_link.c
> ++++ bind-9.9.5/lib/dns/opensslrsa_link.c
> +@@ -965,6 +965,7 @@ opensslrsa_fromdns(dst_key_t *key, isc_b
> + 	RSA *rsa;
> + 	isc_region_t r;
> + 	unsigned int e_bytes;
> ++	unsigned int length;
> + #if USE_EVP
> + 	EVP_PKEY *pkey;
> + #endif
> +@@ -972,6 +973,7 @@ opensslrsa_fromdns(dst_key_t *key, isc_b
> + 	isc_buffer_remainingregion(data, &r);
> + 	if (r.length =3D=3D 0)
> + 		return (ISC_R_SUCCESS);
> ++	length =3D r.length;
> +
> + 	rsa =3D RSA_new();
> + 	if (rsa =3D=3D NULL)
> +@@ -982,17 +984,18 @@ opensslrsa_fromdns(dst_key_t *key, isc_b
> + 		RSA_free(rsa);
> + 		return (DST_R_INVALIDPUBLICKEY);
> + 	}
> +-	e_bytes =3D *r.base++;
> +-	r.length--;
> ++	e_bytes =3D *r.base;
> ++	isc_region_consume(&r, 1);
> +
> + 	if (e_bytes =3D=3D 0) {
> + 		if (r.length < 2) {
> + 			RSA_free(rsa);
> + 			return (DST_R_INVALIDPUBLICKEY);
> + 		}
> +-		e_bytes =3D ((*r.base++) << 8);
> +-		e_bytes +=3D *r.base++;
> +-		r.length -=3D 2;
> ++		e_bytes =3D (*r.base) << 8;
> ++		isc_region_consume(&r, 1);
> ++		e_bytes +=3D *r.base;
> ++		isc_region_consume(&r, 1);
> + 	}
> +
> + 	if (r.length < e_bytes) {
> +@@ -1000,14 +1003,13 @@ opensslrsa_fromdns(dst_key_t *key, isc_b
> + 		return (DST_R_INVALIDPUBLICKEY);
> + 	}
> + 	rsa->e =3D BN_bin2bn(r.base, e_bytes, NULL);
> +-	r.base +=3D e_bytes;
> +-	r.length -=3D e_bytes;
> ++	isc_region_consume(&r, e_bytes);
> +
> + 	rsa->n =3D BN_bin2bn(r.base, r.length, NULL);
> +
> + 	key->key_size =3D BN_num_bits(rsa->n);
> +
> +-	isc_buffer_forward(data, r.length);
> ++	isc_buffer_forward(data, length);
> +
> + #if USE_EVP
> + 	pkey =3D EVP_PKEY_new();
> +Index: bind-9.9.5/lib/dns/resolver.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> +--- bind-9.9.5.orig/lib/dns/resolver.c
> ++++ bind-9.9.5/lib/dns/resolver.c
> +@@ -8937,6 +8937,12 @@ dns_resolver_algorithm_supported(dns_res
> +
> + 	REQUIRE(VALID_RESOLVER(resolver));
> +
> ++	/*
> ++	 * DH is unsupported for DNSKEYs, see RFC 4034 sec. A.1.
> ++	 */
> ++	if ((alg =3D=3D DST_ALG_DH) || (alg =3D=3D DST_ALG_INDIRECT))
> ++		return (ISC_FALSE);
> ++
> + #if USE_ALGLOCK
> + 	RWLOCK(&resolver->alglock, isc_rwlocktype_read);  #endif @@ -
> 8956,6
> ++8962,7 @@ dns_resolver_algorithm_supported(dns_res
> + #endif
> + 	if (found)
> + 		return (ISC_FALSE);
> ++
> + 	return (dst_algorithm_supported(alg)); }
> +
> diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-
> connectivity/bind/bind_9.9.5.bb
> index 9f0ab2f..d4fdd21 100644
> --- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
> @@ -22,6 +22,9 @@ SRC_URI =3D "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-
> ${PV}.tar.gz \
>             file://bind-subdirs-run-serially.patch \
>             file://bind-confgen-build-unix.o-once.patch \
>             file://cve-2015-5477.patch \
> +           file://CVE-2015-1349.patch \
> +           file://CVE-2015-4620.patch \
> +           file://CVE-2015-5722.patch \
>  	   "
>=20
>  SRC_URI[md5sum] =3D "e676c65cad5234617ee22f48e328c24e"
> --
> 2.3.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

