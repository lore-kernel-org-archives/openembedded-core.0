Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 974256BD2B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 02:24:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s062OAVK013140
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 Jan 2014 18:24:10 -0800 (PST)
Received: from [128.224.162.207] (128.224.162.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 5 Jan 2014 18:24:09 -0800
Message-ID: <52CA13C8.5070100@windriver.com>
Date: Mon, 6 Jan 2014 10:24:08 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1388741852-17520-1-git-send-email-jackie.huang@windriver.com>
	<20140103101548.GB3707@jama>
In-Reply-To: <20140103101548.GB3707@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] guile: fix the depends for target recipes
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
X-List-Received-Date: Mon, 06 Jan 2014 02:24:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 1/3/2014 6:15 PM, Martin Jansa wrote:
> On Fri, Jan 03, 2014 at 05:37:32PM +0800, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> The depenency on guild-native and libatomics-ops is missing
>> in multilib build, fix the depends with class-target.
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   meta/recipes-devtools/guile/guile_2.0.9.bb |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-devtools/guile/guile_2.0.9.bb
>> index 4c3fe28..cb7c72e 100644
>> --- a/meta/recipes-devtools/guile/guile_2.0.9.bb
>> +++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
>> @@ -33,7 +33,7 @@ BBCLASSEXTEND = "native"
>>
>>   DEPENDS = "libunistring bdwgc gmp libtool libffi"
>>   # add guile-native only to the target recipe's DEPENDS
>> -DEPENDS += "${@['guile-native libatomics-ops', ''][d.getVar('PN', True) != 'guile']}"
>> +DEPENDS_append_class-target += "guile-native libatomics-ops"
>
> Don't use _append together with +=, just add space before guile-native.

Fixed and sent v2 for this, thanks!

Thanks,
Jackie

>
>>
>>   RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

