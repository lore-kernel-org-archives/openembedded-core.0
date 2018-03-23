Return-Path: <oobitots@cisco.com>
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	by mail.openembedded.org (Postfix) with ESMTP id 395A878771
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3171; q=dns/txt; s=iport;
	t=1521803819; x=1523013419;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=U/Uiz1pCiVej1YMVdsD3D7KukuFNm8VuomT8m5c/U7s=;
	b=K4OYWgioa6f/PbyDoEpOZ+3v5EVe55Ze3wNvi5qsFdlKNksIi7P61+2H
	6bY0pLn1t5Vh/ELNzllrXgU2Lw/j85hUVee40Cp6HJXhTnlqu2+VONL8K
	SUuftx5bKtwJ1DaruZUq/QWJ+BH+291p+Dvb0wfFAV8MFHn1WTM+QaDKQ g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AEAwDy4LRa/5pdJa1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYM9YXAog1yVDoEdV4ERkkqCBgsYC4QWTAKDZiE1FwECAQE?=
	=?us-ascii?q?BAQEBAmsohSUBAQEEAQEhFTYLEAsRAwECAQICJgICJwEnCAYNBgIBAYUKD6h?=
	=?us-ascii?q?rgiCEWINpghoUdIQnghGBVECBLoJkgxMBBIEkgziCVAOHLJAPCAKFT4UFg1M?=
	=?us-ascii?q?GgWhchHqEeYkQhjwCBAsCEwGBJR0BNoFScBU6gkMJghgBF44YPTAMjgSCRQE?=
	=?us-ascii?q?B?=
X-IronPort-AV: E=Sophos;i="5.48,349,1517875200"; d="scan'208";a="364588618"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
	by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2018 11:16:58 +0000
Received: from [10.21.82.62] (sjc-vpn4-574.cisco.com [10.21.82.62])
	(authenticated bits=0)
	by rcdn-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id w2NBGtGi007362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 23 Mar 2018 11:16:57 GMT
To: Khem Raj <raj.khem@gmail.com>
References: <20180322173742.40112-1-oobitots@cisco.com>
	<CAMKF1sojOiyVd8eRcVt=59U6a1+3YhW3DeeDEsW=VhHuT4_ghw@mail.gmail.com>
From: "Oleksiy Obitotskyy (cisco)" <oobitots@cisco.com>
Message-ID: <566d1fb6-3fc6-8bd4-da75-07b5ff798f64@cisco.com>
Date: Fri, 23 Mar 2018 13:16:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sojOiyVd8eRcVt=59U6a1+3YhW3DeeDEsW=VhHuT4_ghw@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: oobitots
Cc: XE-Linux <xe-linux-external@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcp-wrappers: Fix build with clang
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
X-List-Received-Date: Fri, 23 Mar 2018 11:16:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

I would like to clarify your question.
Function fix_options has no prototype into tcpd.c and miscd.c and 
generate warnings
'warning: implicit declaration of function' but links fine.
So should I add prototype for fix_options or leave it as is?

Regards,
Oleksiy

On 23.03.18 07:21, Khem Raj wrote:
> On Thu, Mar 22, 2018 at 10:37 AM, Oleksiy Obitotskyy <oobitots@cisco.com> wrote:
>> Fix non-void function 'fix_options' should return a value.
>>
> this patch is ok. Can you also check if this function signature is needed in
> other source files as well ?
>
>> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
>> ---
>>   .../0001-Fix-build-with-clang.patch                | 30 ++++++++++++++++++++++
>>   .../tcp-wrappers/tcp-wrappers_7.6.bb               |  1 +
>>   2 files changed, 31 insertions(+)
>>   create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
>>
>> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
>> new file mode 100644
>> index 0000000..e601409
>> --- /dev/null
>> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
>> @@ -0,0 +1,30 @@
>> +From 46ade5e6f3bd3e11b6dd25fa0116c39753d2ba06 Mon Sep 17 00:00:00 2001
>> +From: Oleksiy Obitotskyy <oobitots@cisco.com>
>> +Date: Mon, 5 Feb 2018 08:29:10 -0800
>> +Subject: [PATCH] Fix build with clang
>> +
>> +Fix "error: non-void function 'fix_options' should return a value".
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
>> +---
>> + fix_options.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/fix_options.c b/fix_options.c
>> +index b5e81b8..9958ff4 100644
>> +--- a/fix_options.c
>> ++++ b/fix_options.c
>> +@@ -29,7 +29,7 @@ static char sccsid[] = "@(#) fix_options.c 1.6 97/04/08 02:29:19";
>> +
>> + /* fix_options - get rid of IP-level socket options */
>> +
>> +-fix_options(request)
>> ++void fix_options(request)
>> + struct request_info *request;
>> + {
>> + #ifdef IP_OPTIONS
>> +--
>> +2.10.3.dirty
>> +
>> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>> index 5fdbbce..8519da6 100644
>> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>> @@ -44,6 +44,7 @@ SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
>>              file://safe_finger.8 \
>>              file://makefile-fix-parallel.patch \
>>              file://musl-decls.patch \
>> +           file://0001-Fix-build-with-clang.patch \
>>              "
>>
>>   SRC_URI[md5sum] = "e6fa25f71226d090f34de3f6b122fb5a"
>> --
>> 2.10.3.dirty
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


