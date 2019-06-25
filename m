Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2957E034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 09:50:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5P9ncXC022609
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Jun 2019 02:49:53 -0700
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 25 Jun 2019 02:49:32 -0700
To: <richard.purdie@linuxfoundation.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
References: <1560243834-266906-1-git-send-email-zhe.he@windriver.com>
	<be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
	<CADkTA4PEz-0ZuFCStXLSXYYwKDgXUuVHUUdMDSrUF0Bx+71d9g@mail.gmail.com>
	<5997ba72-f7b6-fbd6-4e84-42c3f2b34e48@windriver.com>
	<e1f16895a2b9d138b13b672df19ea50b79d55ae3.camel@linuxfoundation.org>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <ba0ea006-3255-b500-859e-c320225aa82e@windriver.com>
Date: Tue, 25 Jun 2019 17:49:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e1f16895a2b9d138b13b672df19ea50b79d55ae3.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.221]
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lttng-modules: Backport patches to fix compilation failures since kernel v5.1
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
X-List-Received-Date: Tue, 25 Jun 2019 09:50:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/25/19 4:04 PM, richard.purdie@linuxfoundation.org wrote:
> On Tue, 2019-06-25 at 15:59 +0800, He Zhe wrote:
>> On 6/12/19 6:57 AM, Bruce Ashfield wrote:
>>> On Tue, Jun 11, 2019 at 6:50 PM Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> On Tue, 2019-06-11 at 17:03 +0800, zhe.he@windriver.com wrote:
>>>>> From: He Zhe <zhe.he@windriver.com>
>>>>>
>>>>> For the moment,
>>>>> 0001~0004 are on master branch only.
>>>>> 0005~0007 are on stable-2.11 branch, but v2.11 has not been
>>>>> released
>>>>> yet.
>>>>>
>>>>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>>>>> ---
>>>>> v2: Correct a typo in SOB for 0001*.patch
>>>> I just discussed this with lttng upstream maintainers a little.
>>>> We're
>>>> going to have continual tension between keeping lttng-modules up
>>>> to
>>>> date and new kernel versions.
>>>>
>>>> How about we also have a git version of this particular recipe
>>>> which
>>>> has a DEFAULT_PREFERENCE = "-1" but people can opt into with a
>>>> PREFERRED_VERSION when using newer kernels?
>>>>
>>>> That should keep people using very recent kernels happy, let us
>>>> use a
>>>> stable release version and avoid us adding/removing large
>>>> patchsets on
>>>> a semi regular basis?
>>>>
>>>> Would you be willing to try/submit such a git recipe?
>>> This makes sense to me as well, since I'm one of the folks that
>>> runs
>>> into this issue the most. In fact, I've been carrying a local _git
>>> version of the lttng recipe for over a year, since I didn't feel
>>> like
>>> getting into the _git versus release tarballs debate. This solution
>>> should avoid that debate and keep all the different versions of
>>> kernels moving along.
>> Hi Bruce and Richard,
>>
>> BTW, how about using git for all cases so that people don't have to
>> maintain a
>> tarball locally? Though I don't have the background knowledge of that
>> git vs
>> tarball debate mentioned above.
> The overhead of tarball releases is much lower than git trees for each
> piece of software so I'd prefer to have tarball recipes where we can,
> it does lead to faster builds.

Got it, thanks.

Zhe

>
> Cheers,
>
> Richard
>
>
>


