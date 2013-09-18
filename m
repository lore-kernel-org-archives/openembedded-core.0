Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D73D26C8E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 02:09:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8I29hLH005477
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Sep 2013 19:09:43 -0700 (PDT)
Received: from [128.224.162.192] (128.224.162.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 17 Sep 2013 19:09:42 -0700
Message-ID: <52390B65.8040402@windriver.com>
Date: Wed, 18 Sep 2013 10:09:41 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1379395520.git.jackie.huang@windriver.com>
	<1a438ef15a7474ce02b355c6c0ea0ea8b2f2477d.1379395520.git.jackie.huang@windriver.com>
	<1379421154.32201.116.camel@ted>
In-Reply-To: <1379421154.32201.116.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libunistring: remove the test to convert euc-jp in configure
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
X-List-Received-Date: Wed, 18 Sep 2013 02:09:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 9/17/2013 8:32 PM, Richard Purdie wrote:
> On Tue, 2013-09-17 at 13:31 +0800, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> Remove the test "Test against HP-UX 11.11 bug:
>> No converter from EUC-JP to UTF-8 is provided"
>> since we don't support HP-UX and if the euc-jp is not
>> installed on the host, libunistring will be built without
>> iconv support and will cause guild-native configure fail.
>
> This information needs to be in the patch header...

Added and v2 is sent.

Thanks,
Jackie

>
> Cheers,
>
> Richard
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   ...conv-m4-remove-the-test-to-convert-euc-jp.patch |   36 ++++++++++++++++++++
>>   .../libunistring/libunistring_0.9.3.bb             |    4 ++-
>>   2 files changed, 39 insertions(+), 1 deletions(-)
>>   create mode 100644 meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
>>
>> diff --git a/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch b/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
>> new file mode 100644
>> index 0000000..3f0f035
>> --- /dev/null
>> +++ b/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
>> @@ -0,0 +1,36 @@
>> +From 8d99a368615656a835f5502326afd31cec2cebfe Mon Sep 17 00:00:00 2001
>> +From: Jackie Huang <jackie.huang@windriver.com>
>> +Date: Mon, 16 Sep 2013 18:16:12 +0800
>> +Subject: [PATCH] remove the test to convert euc-jp
>> +
>> +Upstream-Status: Inappropriate [OE specific]
>> +
>> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> +---
>> + gnulib-m4/iconv.m4 |   11 -----------
>> + 1 files changed, 0 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/gnulib-m4/iconv.m4 b/gnulib-m4/iconv.m4
>> +index f46ff14..de0a5e9 100644
>> +--- a/gnulib-m4/iconv.m4
>> ++++ b/gnulib-m4/iconv.m4
>> +@@ -126,17 +126,6 @@ int main ()
>> +       }
>> +   }
>> + #endif
>> +-  /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
>> +-     provided.  */
>> +-  if (/* Try standardized names.  */
>> +-      iconv_open ("UTF-8", "EUC-JP") == (iconv_t)(-1)
>> +-      /* Try IRIX, OSF/1 names.  */
>> +-      && iconv_open ("UTF-8", "eucJP") == (iconv_t)(-1)
>> +-      /* Try AIX names.  */
>> +-      && iconv_open ("UTF-8", "IBM-eucJP") == (iconv_t)(-1)
>> +-      /* Try HP-UX names.  */
>> +-      && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
>> +-    return 1;
>> +   return 0;
>> + }], [am_cv_func_iconv_works=yes], [am_cv_func_iconv_works=no],
>> +         [case "$host_os" in
>> +--
>> +1.7.4
>> diff --git a/meta/recipes-support/libunistring/libunistring_0.9.3.bb b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
>> index 454a0e6..6cffef4 100644
>> --- a/meta/recipes-support/libunistring/libunistring_0.9.3.bb
>> +++ b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
>> @@ -19,7 +19,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>>
>>   SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
>>              file://parallelmake.patch \
>> -           file://libunistring_fix_for_automake_1.12.patch"
>> +           file://libunistring_fix_for_automake_1.12.patch \
>> +           file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
>> +"
>>
>>   SRC_URI[md5sum] = "db8eca3b64163abadf8c40e5cecc261f"
>>   SRC_URI[sha256sum] = "610d3ec724fbdaa654afe3cff20b9f4d504be3fd296fded2e0f7f764041006a3"
>
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

