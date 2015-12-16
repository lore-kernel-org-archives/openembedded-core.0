Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4607319C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 06:49:14 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 4a5a_61a4_2d1f796f_9982_45c0_8bf9_e2c44b88ff89;
	Wed, 16 Dec 2015 15:49:11 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B790AC0269
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:49:11 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 603FE10F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:49:11 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 3D8301E0088
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:49:11 +0900 (JST)
References: <1450174068-18106-1-git-send-email-sona.sarmadi@enea.com>
	<A8FC939F80655644A89BB21CCD3741E80140909C16@G08CNEXMBPEKD02.g08.fujitsu.local>
To: OE-core <openembedded-core@lists.openembedded.org>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <567109AD.8030602@jp.fujitsu.com>
Date: Wed, 16 Dec 2015 15:50:21 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E80140909C16@G08CNEXMBPEKD02.g08.fujitsu.local>
X-TM-AS-MML: disable
Subject: Re: [PATCH][dizzy] openssl: CVE-2015-3194, CVE-2015-3195
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
X-List-Received-Date: Wed, 16 Dec 2015 06:49:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Armin

Please merge this patch to daisy branch.
Thanks.

Fan

>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Sona Sarmadi
>> Sent: Tuesday, December 15, 2015 6:08 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH][dizzy] openssl: CVE-2015-3194, CVE-2015-3195
>>
>> Fixes following vulnerabilities:
>> Certificate verify crash with missing PSS parameter (CVE-2015-3194)
>> X509_ATTRIBUTE memory leak (CVE-2015-3195)
>>
>> References:
>> https://openssl.org/news/secadv/20151203.txt
>> http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3194
>> http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3195
>>
>> Upstream patches:
>> CVE-2015-3194:
>> https://git.openssl.org/?p=openssl.git;a=commit;h=
>> d8541d7e9e63bf5f343af24644046c8d96498c17
>>
>> CVE-2015-3195:
>> https://git.openssl.org/?p=openssl.git;a=commit;h=
>> b29ffa392e839d05171206523e84909146f7a77c
>>
>> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
>> ---
>> .../CVE-2015-3194-Add-PSS-parameter-check.patch    | 37 +++++++++++++
>> ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch | 61
>> ++++++++++++++++++++++  .../recipes-connectivity/openssl/openssl_1.0.1p.bb |
>> 2 +
>> 3 files changed, 100 insertions(+)
>> create mode 100644
>> meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-c
>> heck.patch
>> create mode 100644
>> meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-
>> combine.patch
>>
>> diff --git
>> a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-paramete
>> r-check.patch
>> b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-paramete
>> r-check.patch
>> new file mode 100644
>> index 0000000..a6697ca
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-pa
>> +++ rameter-check.patch
>> @@ -0,0 +1,37 @@
>> +From d8541d7e9e63bf5f343af24644046c8d96498c17 Mon Sep 17 00:00:00 2001
>> +From: "Dr. Stephen Henson" <steve@openssl.org>
>> +Date: Fri, 2 Oct 2015 13:10:29 +0100
>> +Subject:Add PSS parameter check.
>> +
>> +Avoid seg fault by checking mgf1 parameter is not NULL. This can be
>> +triggered during certificate verification so could be a DoS attack
>> +against a client or a server enabling client authentication.
>> +
>> +Thanks to Loïc Jonas Etienne (Qnective AG) for discovering this bug.
>> +
>> +CVE-2015-3194
>> +
>> +Upstream-Status: Backport
>> +
>> +Reviewed-by: Matt Caswell <matt@openssl.org>
>> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
>> +---
>> + crypto/rsa/rsa_ameth.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/crypto/rsa/rsa_ameth.c b/crypto/rsa/rsa_ameth.c index
>> +93e071d..c7f1148 100644
>> +--- a/crypto/rsa/rsa_ameth.c
>> ++++ b/crypto/rsa/rsa_ameth.c
>> +@@ -279,7 +279,7 @@ static RSA_PSS_PARAMS *rsa_pss_decode(const
>> X509_ALGOR *alg,
>> +     if (pss->maskGenAlgorithm) {
>> +         ASN1_TYPE *param = pss->maskGenAlgorithm->parameter;
>> +         if (OBJ_obj2nid(pss->maskGenAlgorithm->algorithm) == NID_mgf1
>> +-            && param->type == V_ASN1_SEQUENCE) {
>> ++            && param && param->type == V_ASN1_SEQUENCE) {
>> +             p = param->value.sequence->data;
>> +             plen = param->value.sequence->length;
>> +             *pmaskHash = d2i_X509_ALGOR(NULL, &p, plen);
>> +--
>> +1.9.1
>> +
>> diff --git
>> a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.
>> 1-combine.patch
>> b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.
>> 1-combine.patch
>> new file mode 100644
>> index 0000000..be705c0
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-w
>> +++ ith-ASN.1-combine.patch
>> @@ -0,0 +1,61 @@
>> +commit b29ffa392e839d05171206523e84909146f7a77c
>> +Author: Dr. Stephen Henson <steve@openssl.org>
>> +Date: Tue, 10 Nov 2015 19:03:07 +0000
>> +Subject: Fix leak with ASN.1 combine.
>> +
>> +When parsing a combined structure pass a flag to the decode routine so
>> +on error a pointer to the parent structure is not zeroed as this will
>> +leak any additional components in the parent.
>> +
>> +This can leak memory in any application parsing PKCS#7 or CMS structures.
>> +
>> +CVE-2015-3195.
>> +
>> +Upstream-Status: Backport
>> +
>> +Thanks to Adam Langley (Google/BoringSSL) for discovering this bug
>> +using libFuzzer.
>> +
>> +PR#4131
>> +
>> +Reviewed-by: Richard Levitte <levitte@openssl.org>
>> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
>> +---
>> + crypto/asn1/tasn_dec.c | 7 +++++--
>> + 1 file changed, 5 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/crypto/asn1/tasn_dec.c b/crypto/asn1/tasn_dec.c index
>> +febf605..9256049 100644
>> +--- a/crypto/asn1/tasn_dec.c
>> ++++ b/crypto/asn1/tasn_dec.c
>> +@@ -180,6 +180,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const
>> unsigned char **in, long len,
>> +     int otag;
>> +     int ret = 0;
>> +     ASN1_VALUE **pchptr, *ptmpval;
>> ++    int combine = aclass & ASN1_TFLG_COMBINE;
>> ++    aclass &= ~ASN1_TFLG_COMBINE;
>> +     if (!pval)
>> +         return 0;
>> +     if (aux && aux->asn1_cb)
>> +@@ -500,7 +502,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const
>> +unsigned char **in, long len,
>> +  auxerr:
>> +     ASN1err(ASN1_F_ASN1_ITEM_EX_D2I, ASN1_R_AUX_ERROR);
>> +  err:
>> +-    ASN1_item_ex_free(pval, it);
>> ++    if (combine == 0)
>> ++        ASN1_item_ex_free(pval, it);
>> +     if (errtt)
>> +         ERR_add_error_data(4, "Field=", errtt->field_name,
>> +                            ", Type=", it->sname); @@ -689,7 +692,7 @@
>> +static int asn1_template_noexp_d2i(ASN1_VALUE **val,
>> +     } else {
>> +         /* Nothing special */
>> +         ret = ASN1_item_ex_d2i(val, &p, len, ASN1_ITEM_ptr(tt->item),
>> +-                               -1, 0, opt, ctx);
>> ++                               -1, tt->flags & ASN1_TFLG_COMBINE,
>> opt,
>> ++ ctx);
>> +         if (!ret) {
>> +             ASN1err(ASN1_F_ASN1_TEMPLATE_NOEXP_D2I,
>> ERR_R_NESTED_ASN1_ERROR);
>> +             goto err;
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
>> index 3f61790..1d0242f 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb
>> @@ -34,6 +34,8 @@ SRC_URI += "file://configure-targets.patch \
>>              file://Makefiles-ptest.patch \
>>              file://ptest-deps.patch \
>>              file://run-ptest \
>> +            file://CVE-2015-3194-Add-PSS-parameter-check.patch \
>> +            file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
>>             "
>>
>> SRC_URI[md5sum] = "7563e92327199e0067ccd0f79f436976"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>


