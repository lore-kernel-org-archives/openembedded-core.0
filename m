Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0921C60660
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 01:52:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7M1qDb4010355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Aug 2013 18:52:14 -0700 (PDT)
Received: from [128.224.162.247] (128.224.162.247) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 21 Aug 2013 18:52:12 -0700
Message-ID: <52156ECB.3070007@windriver.com>
Date: Thu, 22 Aug 2013 09:52:11 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1377064624.git.jackie.huang@windriver.com>
	<00b70d017db692cbb7d5965de26726ae0a695f88.1377064624.git.jackie.huang@windriver.com>
	<5214FA18.7050002@linux.intel.com>
In-Reply-To: <5214FA18.7050002@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] nfs-utils: add init.d/nfsserver status command for LSB compliance
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
X-List-Received-Date: Thu, 22 Aug 2013 01:52:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 8/22/2013 1:34 AM, Saul Wold wrote:
> On 08/20/2013 11:15 PM, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> Signed-off-by: Li Wang <li.wang@windriver.com>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   .../nfs-utils/nfs-utils/nfsserver                  |    9 +++++++++
>>   1 files changed, 9 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
>> b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
>> index e460e26..5b4f199 100644
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
>> @@ -14,6 +14,8 @@
>>   #
>>   # Startup script for nfs-utils
>>   #
>> +# Source function library.
>> +. /etc/init.d/functions
>>   #
>>   # The environment variable NFS_SERVERS may be set in /etc/default/nfsd
>>   # Other control variables may be overridden here too
>> @@ -141,6 +143,13 @@ stop)    exportfs -ua
>>       stop_statd
>>       stop_mountd
>>       stop_nfsd;;
>> +status)
>> +    status /usr/sbin/rpc.mountd
>> +    RETVAL=$?
>> +    status nfsd
>> +    rval=$?
>> +    [ $RETVAL -eq 0 ] && exit $rval
>> +    exit $RETVAL;;
>>   reload)    test -r /etc/exports && exportfs -r;;
>>   restart)exportfs -ua
>>       stop_mountd
>>
> Should there also be a usage update or addition?

There was not a usage line existed, that's why the original patch didn't 
have a usage update, I will add it anyway.

Thanks,
Jackie

>
> Sau!
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

