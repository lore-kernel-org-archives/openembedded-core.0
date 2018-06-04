Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8AA6E5E9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:27:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w542REHU003059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Jun 2018 19:27:29 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.139) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 3 Jun 2018 19:27:03 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
	<3441eac59a1e61336e04e0bf1a50b484803c9dc7.1527670923.git.liezhi.yang@windriver.com>
	<cb6ee940d4d8f2b93174e3a5b9ca71701b3488e0.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <497b9bb1-54de-7b26-7ce5-ea31fb1505ea@windriver.com>
Date: Mon, 4 Jun 2018 10:30:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <cb6ee940d4d8f2b93174e3a5b9ca71701b3488e0.camel@linuxfoundation.org>
Subject: Re: [PATCH 05/16] xinetd: add Init Script Actions to xinetd script
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
X-List-Received-Date: Mon, 04 Jun 2018 02:27:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 06/03/2018 11:59 PM, Richard Purdie wrote:
> On Wed, 2018-05-30 at 17:03 +0800, Robert Yang wrote:
>> From: Shan Hai <shan.hai@windriver.com>
>>
>> The chkconfig fails to list the xinetd service because the xinetd
>> lacks Init Script Actions in it, add the actions to fix it.
>>
>> Signed-off-by: Shan Hai <shan.hai@windriver.com>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>   meta/recipes-extended/xinetd/xinetd/xinetd.init | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.init
>> b/meta/recipes-extended/xinetd/xinetd/xinetd.init
>> index 777c2c8..a021410 100644
>> --- a/meta/recipes-extended/xinetd/xinetd/xinetd.init
>> +++ b/meta/recipes-extended/xinetd/xinetd/xinetd.init
>> @@ -1,5 +1,15 @@
>>   #!/bin/sh
>> -#
>> +### BEGIN INIT INFO
>> +# Provides:          inetd
>> +# Required-Start:    $local_fs $remote_fs
>> +# Required-Stop:     $local_fs $remote_fs
>> +# Should-Start:      $syslog
>> +# Should-Stop:       $syslog
>> +# Default-Start:     2 3 4 5
>> +# Default-Stop:      0 1 6
>> +# Short-Description: Start or stop the xinetd daemon.
>> +### END INIT INFO
>> +
> 
> Have we some kind of policy which says all init scripts have to have a
> header like this? I'm wondering why this is just getting applied for
> xinetd when there are probably other init scripts which don't have
> this. Are we planning to add this everywhere?

We added this is because customer requires, and only for this one. We don't
have any plan to add more.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 
> 

