Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46FCC6A39D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 01:20:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6T1Kojw026560
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 28 Jul 2013 18:20:50 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Sun, 28 Jul 2013 18:20:48 -0700
Message-ID: <51F5C36C.9050909@windriver.com>
Date: Mon, 29 Jul 2013 09:20:44 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1374038143-5807-1-git-send-email-ming.liu@windriver.com>
	<51F2BB9D.7030900@linux.intel.com>
In-Reply-To: <51F2BB9D.7030900@linux.intel.com>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Fix multilib header conflict - opensslconf.h
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
X-List-Received-Date: Mon, 29 Jul 2013 01:20:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2013 02:10 AM, Saul Wold wrote:
> On 07/16/2013 10:15 PM, Ming Liu wrote:
>> opensslconf.h conflicts between 32-bit and 64-bit versions.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-connectivity/openssl/openssl.inc |    5 +++--
>>   1 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl.inc 
>> b/meta/recipes-connectivity/openssl/openssl.inc
>> index f5b2432..267eb89 100644
>> --- a/meta/recipes-connectivity/openssl/openssl.inc
>> +++ b/meta/recipes-connectivity/openssl/openssl.inc
>> @@ -5,7 +5,7 @@ BUGTRACKER = 
>> "http://www.openssl.org/news/vulnerabilities.html"
>>   SECTION = "libs/network"
>>
>>   # Big Jump for OpenSSL 1.0 support with meta-oe
>> -INC_PR = "r15"
>> +INC_PR = "r16"
>>
> No PR Bump needed
>
Got it, I will send the V1.
> Sorry I missed this patch.
That doesn't matter.

the best,
thank you
>
> Sau!
>
>>   # "openssl | SSLeay" dual license
>>   LICENSE = "openssl"
>> @@ -31,7 +31,7 @@ export DIRS = "crypto ssl apps"
>>   export EX_LIBS = "-lgcc -ldl"
>>   export AS = "${CC} -c"
>>
>> -inherit pkgconfig siteinfo
>> +inherit pkgconfig siteinfo multilib_header
>>
>>   PACKAGES =+ "libcrypto libssl ${PN}-misc"
>>   FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
>> @@ -145,6 +145,7 @@ do_install () {
>>       cp --dereference -R include/openssl ${D}${includedir}
>>       sed -i -e '1s,.*,#!${bindir}/env perl,' 
>> ${D}${libdir}/ssl/misc/CA.pl
>>
>> +    oe_multilib_header openssl/opensslconf.h
>>   }
>>
>>   BBCLASSEXTEND = "native nativesdk"
>>
>
>


