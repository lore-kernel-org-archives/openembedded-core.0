Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U7HVO-0005Ut-Gp
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 04:35:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1I3IpQe025278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 17 Feb 2013 19:18:51 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Sun, 17 Feb 2013 19:18:51 -0800
Message-ID: <51219D96.2070907@windriver.com>
Date: Mon, 18 Feb 2013 11:18:46 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1359362547.git.Qi.Chen@windriver.com>
	<e952e3dadc8a912067a3385aec372e413dc23e02.1359362547.git.Qi.Chen@windriver.com>
	<1360161619.28450.12.camel@ted>
In-Reply-To: <1360161619.28450.12.camel@ted>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] populate-volatile.sh: improve this script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 03:35:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2013 10:40 PM, Richard Purdie wrote:
> On Mon, 2013-01-28 at 17:05 +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Here's a list of improvements:
>> 1) Make it run correctly at rootfs time.
>> 2) Handle link config items more reasonably.
>> 3) Support read-only rootfs.
>> 4) Avoid data loss when removing directories.
>>
>> [YOCTO #3406]
>> [YOCTO #3404]
>> [YOCTO #3181]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../initscripts-1.0/populate-volatile.sh           |  287 ++++++++++----------
>>   1 file changed, 143 insertions(+), 144 deletions(-)
> I'm getting a little annoyed with this patch. Saul keeps sending it to
> me, I keep seeing it and rejecting it.
>
> I will not take code changes mixed in with whitespace reformatting. I've
> said this once already.
>
> This series should have a patch like:
>
> http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=35f3369e5e6365aa06914862ef8a55e21f2fb73b
>
> and then a follow up like:
>
> http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=ca8ca587643caa81a6c6530dfead0db6fa8c27b6
>
> which has the actual code changes in it. I did this just so I could see
> what the patch was doing.
>
> Next problem is that there are too many different code changes in this
> to figure out what is going on and properly review it. It needs to be
> split up further into logical changes with a clear explanation of what
> is happening. Why was the cacheclear mechanism removed? Why isn't the
> background parallelisation important (I know why when I think about it
> but the commit message says nothing about it)?
>
> There is also a typo of ROOT_DRI in there.
>
> I will merge the whitespace change, just so I don't have to see it
> again. Please split up the rest of the changes into a logical set and
> resubmit. meld is a good tool for work like that.

Thanks for your advices.
I'll rework on this patch and resubmit it.

Thanks,
Chen Qi

> Cheers,
>
> Richard
>
>
>
>



