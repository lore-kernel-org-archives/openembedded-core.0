Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 34C9178255
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 02:25:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9H2P8gV001004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Oct 2017 19:25:10 -0700 (PDT)
Received: from [128.224.163.189] (128.224.163.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 16 Oct 2017 19:25:07 -0700
To: Denys Dmytriyenko <denis@denix.org>
References: <cover.1508204684.git.Qi.Chen@windriver.com>
	<97121153b1e6d33790c04c5168dbb5eb8e0e6475.1508204684.git.Qi.Chen@windriver.com>
	<20171017021859.GA9221@denix.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <6d41973d-1fb0-8d7e-5554-44dcc0ed8dcc@windriver.com>
Date: Tue, 17 Oct 2017 10:31:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20171017021859.GA9221@denix.org>
X-Originating-IP: [128.224.163.189]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] bitbake.conf: add ssh to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Tue, 17 Oct 2017 02:25:15 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2017 10:18 AM, Denys Dmytriyenko wrote:
> On Tue, Oct 17, 2017 at 09:46:32AM +0800, Chen Qi wrote:
>> We changed to make tools required by testimage to be included conditionally.
>> This resulted in users who use ssh for git fetching having failures.
>>
>> Add ssh to HOSTTOOLS_NONFATAL to make things work for the above situation.
>>
>> [YOCTO #12227]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
> 1. Why don't people specify what has changed between v1 and v2 of the patch?

It's in [OE-core] [PATCH V2 0/1] bitbake.conf: add ssh to 
HOSTTOOLS_NONFATAL.

>
> 2. A corrected/sorted patch already went in earlier:
> http://cgit.openembedded.org/openembedded-core/commit/?id=50e7619aebae5351e9a41fe1b909a31b9e383f0a

Sorry. My carelessness.
I should have checked the latest master.

Best Regards,
Chen Qi
>
>>   meta/conf/bitbake.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 0eefb86..4fba9d6 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -487,7 +487,7 @@ HOSTTOOLS += " \
>>   HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
>>   
>>   # Link to these if present
>> -HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
>> +HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat ssh sudo"
>>   
>>   # Temporary add few more detected in bitbake world
>>   HOSTTOOLS_NONFATAL += "join nl size yes zcat"
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



