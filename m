Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3496AF13
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 02:17:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r652HYwp013288
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jul 2013 19:17:34 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 4 Jul 2013 19:17:33 -0700
Message-ID: <51D62CDB.3090105@windriver.com>
Date: Fri, 5 Jul 2013 10:18:03 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1372819132.git.Qi.Chen@windriver.com>
	<940ededa8463ccd87790197f33f330d602772f7d.1372819132.git.Qi.Chen@windriver.com>
	<51D5FE3B.5070306@linux.intel.com>
In-Reply-To: <51D5FE3B.5070306@linux.intel.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] busybox: upgrade to stable 1.21.1
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
X-List-Received-Date: Fri, 05 Jul 2013 02:17:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2013 06:59 AM, Saul Wold wrote:
> On 07/02/2013 07:39 PM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Merged or backported patches are dropped.
>> The wget_dl_dir_fix.patch was submitted more than 1 year ago, it's
>> about the -P option behavior, and it's not accepted, so I dropped
>> this patch too.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../poky-tiny/defconfig                            |    0
>>   ...box_1.20.2.bbappend => busybox_1.21.1.bbappend} |    0
> These two need to go to the meta-yocto (poky@yoctoproject.org).
>
> Thanks
>    Sau!
Got it.

I'll split this patch and send out a V2.

Thanks,
Chen Qi

