Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3A36C12D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:11:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBB9A78O025719
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Dec 2018 01:10:56 -0800
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 11 Dec 2018 01:10:27 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1544408339.git.liezhi.yang@windriver.com>
	<d8d5c615ca2b0527b3927161c2401dc6cbe72512.1544408339.git.liezhi.yang@windriver.com>
	<20181210083836.GA1470@jama>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <38f38d90-a742-784b-c817-68eafe6c9fdd@windriver.com>
Date: Tue, 11 Dec 2018 17:15:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181210083836.GA1470@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] apr/openssl10: Enable ccache for them
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
X-List-Received-Date: Tue, 11 Dec 2018 09:11:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/10/18 4:38 PM, Martin Jansa wrote:
> On Sun, Dec 09, 2018 at 06:24:23PM -0800, Robert Yang wrote:
>> The work well now.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb | 3 ---
>>   meta/recipes-support/apr/apr_1.6.5.bb                 | 1 -
>>   2 files changed, 4 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
>> index 6518dac..1986cf2 100644
>> --- a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
>> @@ -76,9 +76,6 @@ EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'manpages', '', 'OE_DISABL
>>   
>>   export OE_LDFLAGS = "${LDFLAGS}"
>>   
>> -# openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
>> -CCACHE = ""
>> -
>>   TERMIO ?= "-DTERMIO"
>>   TERMIO_libc-musl = "-DTERMIOS"
>>   
>> diff --git a/meta/recipes-support/apr/apr_1.6.5.bb b/meta/recipes-support/apr/apr_1.6.5.bb
>> index c2f5900..ed93a7e 100644
>> --- a/meta/recipes-support/apr/apr_1.6.5.bb
>> +++ b/meta/recipes-support/apr/apr_1.6.5.bb
>> @@ -40,7 +40,6 @@ CACHED_CONFIGUREVARS += "ac_cv_file__dev_zero=yes"
>>   # Otherwise libtool fails to compile apr-utils
>>   # x86_64-linux-libtool: compile: unable to infer tagged configuration
>>   # x86_64-linux-libtool:   error: specify a tag with '--tag'
>> -CCACHE = ""
> 
> Remove the comment as well.

Thanks, will fix it in V2.

// Robert

> 
>>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>>   PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>> -- 
>> 2.10.2
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

