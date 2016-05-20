Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F04306FF25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 02:27:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4K2Rr7b025450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 19 May 2016 19:27:53 -0700
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 19:27:52 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com> <20160518092029.GA2579@jama>
	<573C365D.3070407@windriver.com> <20160518101556.GB2579@jama>
	<573D260D.2020909@windriver.com> <573D2EAF.9010602@windriver.com>
	<1463651156.4578.113.camel@linuxfoundation.org>
	<573D917C.4090002@windriver.com>
	<1463653077.4578.115.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <573E7626.8040605@windriver.com>
Date: Fri, 20 May 2016 10:27:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1463653077.4578.115.camel@linuxfoundation.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Fri, 20 May 2016 02:27:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/19/2016 06:17 PM, Richard Purdie wrote:
> On Thu, 2016-05-19 at 18:12 +0800, Robert Yang wrote:
>> On 05/19/2016 05:45 PM, Richard Purdie wrote:
>>> To be really clear, OE-Core will not have a different signature
>>> policy
>>> on release branches since that differing policy would break user
>>> expectations and also wouldn't get tested apart from on the branch
>>> so
>>> we'd have less confidence it was working.
>>
>> Yes, I agree with this, I just used stable release as an example (big
>> changes won't happen on a stable release).
>>
>>>
>>> Users are free to set their own policies, the system was designed
>>> to do
>>> that. If WindRiver wants to have a much more permissive policy, I'm
>>> more than happy for them to do so.
>>
>> Thanks, frankly speaking, not only WindRiver wants this. After cloud
>> computing and virtualization gets hot, more and more users want to
>> customize their own images (for saving disk space, memory and
>> security
>> reason), oe/yocto is very good at customizing images, so more and
>> more people try to use it to build their own distros, where live
>> upgrades becomes very important.
>
> I understand that. So are we going to get binary diff working? Its the

Thanks everyone, it seems that this is the best way we have, I will
try packagefeed-stability class.

// Robert

> only viable solution we have to the problem at the moment that I know
> of. Randomly hacking bits of the signature generation isn't going to
> help this unfortunately.
>
> Cheers,
>
> Richard
>
>

