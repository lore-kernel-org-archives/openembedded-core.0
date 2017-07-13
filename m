Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D138671BE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 02:12:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6D2ChTd012745
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 12 Jul 2017 19:12:44 -0700
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 19:12:41 -0700
To: Lans Zhang <lans.zhang2008@gmail.com>, Mark Hatle
	<mark.hatle@windriver.com>
References: <1499748183-17886-1-git-send-email-lans.zhang2008@gmail.com>
	<0fa800ab-be41-1791-0862-b2b727ee0ab8@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <abc80950-0ed8-4335-f6b2-0db434c6203f@windriver.com>
Date: Thu, 13 Jul 2017 10:12:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <0fa800ab-be41-1791-0862-b2b727ee0ab8@gmail.com>
Cc: jzhang0 <jia.zhang@windriver.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gpg_sign.py: fix overwriting the RPM macro __gpg in a wrong way
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
X-List-Received-Date: Thu, 13 Jul 2017 02:12:45 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/13/2017 09:54 AM, Lans Zhang wrote:
> Hi Robert,
>
> Could you help me to review this RR?

I've looked at the patches, looks fine to me.

// Robert

>
> Thanks,
>
> Jia
>
>
> On 07/11/2017 12:43 PM, Jia Zhang wrote:
>> From: Lans Zhang <jia.zhang@windriver.com>
>>
>> The RPM macro used in --define option should not be prefixed by %%.
>>
>> Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
>> ---
>>   meta/lib/oe/gpg_sign.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
>> index 7ce767e..c53df54 100644
>> --- a/meta/lib/oe/gpg_sign.py
>> +++ b/meta/lib/oe/gpg_sign.py
>> @@ -36,7 +36,7 @@ class LocalSigner(object):
>>               gpg_args += ' --pinentry-mode=loopback'
>>           cmd += "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args
>>           if self.gpg_bin:
>> -            cmd += "--define '%%__gpg %s' " % self.gpg_bin
>> +            cmd += "--define '__gpg %s' " % self.gpg_bin
>>           if self.gpg_path:
>>               cmd += "--define '_gpg_path %s' " % self.gpg_path
>>
>
>

