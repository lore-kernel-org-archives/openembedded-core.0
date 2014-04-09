Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D86765DF2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 06:41:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s396fSAG028624
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Apr 2014 23:41:28 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 8 Apr 2014 23:41:27 -0700
Message-ID: <5344EB93.1070209@windriver.com>
Date: Wed, 9 Apr 2014 14:41:23 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1396870039-26834-1-git-send-email-ming.liu@windriver.com>
	<1396870039-26834-3-git-send-email-ming.liu@windriver.com>
	<1396870587.24597.35.camel@ted> <53435E81.9060308@windriver.com>
	<1396951390.24597.88.camel@ted>
In-Reply-To: <1396951390.24597.88.camel@ted>
X-Originating-IP: [128.224.163.186]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] binconfig.bbclass: fix multilib file conflicts
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
X-List-Received-Date: Wed, 09 Apr 2014 06:41:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2014 06:03 PM, Richard Purdie wrote:
> On Tue, 2014-04-08 at 10:27 +0800, Ming Liu wrote:
>> On 04/07/2014 07:36 PM, Richard Purdie wrote:
>>> On Mon, 2014-04-07 at 19:27 +0800, Ming Liu wrote:
>>>> In most cases binconfig files conflict among multilib packages, to avoid
>>>> that, use update-alternatives link *-config from real path with a
>>>> PACKAGE_ARCH suffix.
>>>>
>>>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>>>> ---
>>>>    meta/classes/binconfig.bbclass | 65 ++++++++++++++++++++++++++++++++++++------
>>>>    1 file changed, 56 insertions(+), 9 deletions(-)
>>> This isn't going in, its complex and supports a minority use case.
>>> binconfig should be dying out, not being extended and shored up like
>>> this.
>>>
>>> I'd also add this patch is buggy, its pure luck that update-alternatives
>>> is available at rootfs generation time since its not in a visible
>>> dependency.
>>>
>>> So going forward I'd like to see patches which simply delete binconfig
>>> scripts. Where there isn't a .pc alternative we should be adding them
>>> and pushing them upstream.
>> Did you mean we'd better remove all *-config scripts, insteaded by
>> providing .pc files, and send the changes to all upstreams providing and
>> using *-config? That seems a huge work and we need co-operate with a lot
>> of projects.
> Basically, yes, that is what I mean. I might be wrong but I don't think
> there are that many projects which don't ship .pc files now and just
> have a binconfig as a backup.
Yes, I also noticed that many of them are providing .pc files as well as 
binconfig as a backup, so I think there must be reasons binconfig 
remained in their projects, that might be for compliable considering,  
so I am not sure they would like to remove them from their projects, but 
I can try to ping them. Nevertheless, the conflicts still exist, we just 
leave them here so far?

//Ming Liu
>
> Cheers,
>
> Richard
>
>
>
>


