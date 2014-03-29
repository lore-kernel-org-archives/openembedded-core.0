Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4188060CEB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 06:58:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2T6wd0Y018824
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 23:58:39 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 28 Mar 2014 23:58:39 -0700
Message-ID: <53366F12.9020104@windriver.com>
Date: Sat, 29 Mar 2014 14:58:26 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1395996410.git.hongxu.jia@windriver.com>	
	<4691bff032d8536069f808068e5b477c8f47d213.1395996410.git.hongxu.jia@windriver.com>
	<1396027863.14790.14.camel@ted>
In-Reply-To: <1396027863.14790.14.camel@ted>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] packagegroups: Remove toolchain *-symlinks packages
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
X-List-Received-Date: Sat, 29 Mar 2014 06:58:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/29/2014 01:31 AM, Richard Purdie wrote:
> On Fri, 2014-03-28 at 17:43 +0800, Hongxu Jia wrote:
>> From: Mark Hatle <mark.hatle@windriver.com>
>>
>> We are no longer producing the *-symlinks packages, so remove the dependencies
>> to those items.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb | 4 ----
>>   meta/recipes-core/packagegroups/packagegroup-self-hosted.bb         | 4 ----
>>   2 files changed, 8 deletions(-)
> The binutils-symlinks package was removed however the gcc related ones
> have not been. This patch is therefore not appropriate until that has
> happened.

Got it, I will drop this patch in V2.

//Hongxu


> Cheers,
>
> Richard
>
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
>> index 74ed247..e21f8c1 100644
>> --- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
>> +++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
>> @@ -12,13 +12,9 @@ RDEPENDS_packagegroup-core-buildessential = "\
>>       autoconf \
>>       automake \
>>       binutils \
>> -    binutils-symlinks \
>>       cpp \
>> -    cpp-symlinks \
>>       gcc \
>> -    gcc-symlinks \
>>       g++ \
>> -    g++-symlinks \
>>       gettext \
>>       make \
>>       libstdc++ \
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
>> index 8e3b917..5581d8e 100644
>> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
>> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
>> @@ -69,20 +69,16 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
>>       autoconf \
>>       automake \
>>       binutils \
>> -    binutils-symlinks \
>>       ccache \
>>       coreutils \
>>       cpp \
>> -    cpp-symlinks \
>>       distcc \
>>       eglibc-utils \
>>       eglibc-gconv-ibm850 \
>>       file \
>>       findutils \
>>       g++ \
>> -    g++-symlinks \
>>       gcc \
>> -    gcc-symlinks \
>>       intltool \
>>       ldd \
>>       less \
>> -- 
>> 1.8.1.2
>>
>


