Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.15976.1598975047052836569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 08:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 081FhIkF003780
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 1 Sep 2020 08:43:29 -0700
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 1 Sep
 2020 08:43:08 -0700
Subject: Re: [OE-core] [PATCH v2] base-files: Add directory /var/empty
To: Lachlan Archibald <lachlan.archibald@opengear.com>
CC: Khem Raj <raj.khem@gmail.com>,
        Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>
References: <20200819053439.3241164-1-lachlan.archibald@opengear.com>
 <20200819061323.3247373-1-lachlan.archibald@opengear.com>
 <CAMKF1srZhAkK8UsPvnQDoKiNPM9nac97-B1o8Yyzc_Xdn9Es6A@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <efb11af8-8bfe-647b-77c3-684156adfc36@windriver.com>
Date: Tue, 1 Sep 2020 11:43:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srZhAkK8UsPvnQDoKiNPM9nac97-B1o8Yyzc_Xdn9Es6A@mail.gmail.com>
X-Originating-IP: [172.25.44.2]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-08-19 2:50 a.m., Khem Raj wrote:
> On Tue, Aug 18, 2020 at 11:14 PM Lachlan Archibald
> <lachlan.archibald@opengear.com> wrote:
>>
>> /var/empty is commonly used as the home directory for system users that do not
>> have any other dedicated directory.
>>
> 
> There is no "standard" empty directory specified in FHS so we need to
> justify why we should always create this directory
> which dameons need it or other applications that depend on /var/empty
> 

Lachlan,

Can you resubmit listing the daemons that use /var/empty in
the commit log?

../Randy

> 
>> Signed-off-by: Lachlan Archibald <lachlan.archibald@opengear.com>
>> ---
>>   meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index 94299431f6..ff706637fa 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -39,7 +39,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
>>              ${libdir} ${sbindir} ${datadir} \
>>              ${datadir}/common-licenses ${datadir}/dict ${infodir} \
>>              ${mandir} ${datadir}/misc ${localstatedir} \
>> -           ${localstatedir}/backups ${localstatedir}/lib \
>> +           ${localstatedir}/backups ${localstatedir}/empty ${localstatedir}/lib \
>>              ${localstatedir}/lib/misc ${localstatedir}/spool \
>>              ${localstatedir}/volatile \
>>              ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
>> --
>> 2.26.2
>>
>>
>>
>> 


-- 
# Randy MacLeod
# Wind River Linux
