Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id 53A716FFA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 08:45:55 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 4e0e_33a7_5a82a613_2707_4cea_afbf_19492409a65f;
	Mon, 14 Dec 2015 17:45:50 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BBA5AC00A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 17:45:51 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id DE502AD;
	Mon, 14 Dec 2015 17:45:50 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id C2C281E0089;
	Mon, 14 Dec 2015 17:45:50 +0900 (JST)
To: Sona Sarmadi <sona.sarmadi@enea.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1449821610-29533-1-git-send-email-fan.xin@jp.fujitsu.com>
	<3230301C09DEF9499B442BBE162C5E48ABABB49B@SESTOEX04.enea.se>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <566E8203.7050909@jp.fujitsu.com>
Date: Mon, 14 Dec 2015 17:46:59 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48ABABB49B@SESTOEX04.enea.se>
X-TM-AS-MML: disable
Subject: Re: [PATCH][dizzy][daisy][dylan] openssl: fix for CVE-2015-3195
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
X-List-Received-Date: Mon, 14 Dec 2015 08:45:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sona,

 > How can this patch be applied to dizzy branch?
This patch is for dylan branch.
I will send the patch for dizzy and daisy later.

 > You have only sent patch for CVE-2015-3195, how about CVE-2015-3194?
Actually the patch for CVE-2015-3194 is also needed for dizzy and daisy 
branch.

Thanks for your comment.
I will modify and re-send the patch.

Regards,
Fan

On 2015年12月14日 17:00, Sona Sarmadi wrote:
> Hi Fan,
>
> dizzy branch has Openssl version 1.0.1p now:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivity/openssl/openssl_1.0.1p.bb?h=dizzy
>
> How can this patch be applied to dizzy branch?
>
> You have only sent patch for CVE-2015-3195, how about CVE-2015-3194?
> CVE-2015-3193 does not seem to affect OpenSSL version 1.0.1 according to Mitre:
>
> http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-3193
> CVE-2015-3193 (OpenSSL 1.0.2)
> CVE-2015-3194 (OpenSSL 1.0.1 before 1.0.1q and 1.0.2 before 1.0.2e)
> CVE-2015-3195 (OpenSSL before before 1.0.0t, 1.0.1 before 1.0.1q, and 1.0.2 before 1.0.2e)
>
> Regards
> //Sona
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of Fan Xin
>> Sent: den 11 december 2015 09:14
>> To: openembedded-core@lists.openembedded.org
>> Cc: Fan Xin <fan.xin@jp.fujitsu.com>
>> Subject: [OE-core] [PATCH][dizzy][daisy][dylan] openssl: fix for CVE-2015-
>> 3195
>>
>> This vulnerability  affects OpenSSL versions 1.0.2 and 1.0.1, 1.0.0 and 0.9.8.
>> So the patch also should be merged into dizzy, daisy and dylan.
>>
>> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
>> ---
>>   .../0001-Fix-leak-with-ASN.1-combine.patch         | 65
>> ++++++++++++++++++++++
>>   .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
>>   2 files changed, 66 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/openssl/openssl-
>> 1.0.1e/0001-Fix-leak-with-ASN.1-combine.patch
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-leak-
>> with-ASN.1-combine.patch b/meta/recipes-connectivity/openssl/openssl-
>> 1.0.1e/0001-Fix-leak-with-ASN.1-combine.patch
>> new file mode 100644
>> index 0000000..5bda457
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-leak-wit
>> +++ h-ASN.1-combine.patch
>> @@ -0,0 +1,65 @@
>> +Upstream-Status: Backport
>> +
>> +This patch was imprted from
>> +https://git.openssl.org/?p=openssl.git;a=commit;h=cc598f321fbac9c04da57
>> +66243ed55d55948637d
>> +
>> +Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
>> +
>> +From cc598f321fbac9c04da5766243ed55d55948637d Mon Sep 17
>> 00:00:00 2001
>> +From: Dr. Stephen Henson <steve@openssl.org>
>> +Date: Tue, 10 Nov 2015 19:03:07 +0000
>> +Subject: [PATCH] Fix leak with ASN.1 combine.
>> +
>> +When parsing a combined structure pass a flag to the decode routine so
>> +on error a pointer to the parent structure is not zeroed as this will
>> +leak any additional components in the parent.
>> +
>> +This can leak memory in any application parsing PKCS#7 or CMS structures.
>> +
>> +CVE-2015-3195.
>> +
>> +Thanks to Adam Langley (Google/BoringSSL) for discovering this bug
>> +using libFuzzer.
>> +
>> +PR#4131
>> +
>> +Reviewed-by: Richard Levitte <levitte@openssl.org>
>> +---
>> + crypto/asn1/tasn_dec.c |    7 +++++--
>> + 1 files changed, 5 insertions(+), 2 deletions(-)
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
>> ++                               -1, tt->flags & ASN1_TFLG_COMBINE, opt,
>> ++ ctx);
>> +         if (!ret) {
>> +             ASN1err(ASN1_F_ASN1_TEMPLATE_NOEXP_D2I,
>> ERR_R_NESTED_ASN1_ERROR);
>> +             goto err;
>> +--
>> +1.7.0.4
>> +
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
>> index bc1b944..dbc2da2 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
>> @@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
>>               file://0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch \
>>               file://CVE-2014-0160.patch \
>>               file://openssl-CVE-2014-0198-fix.patch \
>> +            file://0001-Fix-leak-with-ASN.1-combine.patch \
>>              "
>>
>>   SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
>> --
>> 1.8.4.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
=====================================================
株式会社富士通コンピュータテクノロジーズ
組込みシステム技術統括部　第一ファームウェア技術部
樊　昕 Fan Xin
fan.xin@jp.fujitsu.com

┏┓ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┗■ 【ubinux V15】のリリースを開始しました！
「SDN(Open vSwitch)」や「クラウド管理(OpenStack Heat）」などに対応
---------------------------------------------------------------------
詳細＞＞http://elsc.utsfd.cs.fujitsu.co.jp/location_elsc.php?id=0024
※"ubinux"は組込み装置向け当社独自のLinuxディストリビューションです
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

