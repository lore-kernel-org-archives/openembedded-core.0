Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0C137135D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 15:31:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s85FV5LW025888
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Sep 2014 08:31:06 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 5 Sep 2014 08:31:05 -0700
Message-ID: <5409D739.1030307@windriver.com>
Date: Fri, 5 Sep 2014 10:31:05 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CACS+7ZQq_tHp0vA0FA8e1W+iLhuzEA3tov0B5QGFaUvGp_cgNg@mail.gmail.com>	<CAJTo0Lb8TdnZqDObaNS5JQROLYF9MG-67+W5i=kFBF8TE+s8-Q@mail.gmail.com>	<CACS+7ZQiCVksBN1FK9wJ56k_hpJhpYFq23sWw3srHQ5ZsE1P9A@mail.gmail.com>
	<CAJTo0LZNo4MxuZoSOvZU-kaL1v=+Wyy2To=s8Dp68ShszTRSbQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZNo4MxuZoSOvZU-kaL1v=+Wyy2To=s8Dp68ShszTRSbQ@mail.gmail.com>
Subject: Re: [PATCH] systemd: Use ${ROOT_HOME} instead of /root
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
X-List-Received-Date: Fri, 05 Sep 2014 15:31:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/14, 10:27 AM, Burton, Ross wrote:
> On 5 September 2014 15:55, Dan McGregor <danismostlikely@gmail.com> wrote:
>> On 5 September 2014 03:14, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 3 September 2014 20:57, Dan McGregor <danismostlikely@gmail.com> wrote:
>>>>    sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
>>>> + sed -i -e 's:"/root":"${ROOT_HOME}":g' \
>>>> +        ${S}/src/core/unit-printf.c \
>>>> +        ${S}/src/nspawn/nspawn.c \
>>>> +        ${S}/src/shared/util.c
>>>
>>> Sedding service files is one thing, but entire C files is another.
>>> Can you please sent this change as a patch to the source?  FWIW for
>>> patches where the context isn't that relevant I've started using
>>> patches without the context lines so there's more chance of them
>>> applying in future releases.
>>
>> I thought that myself, but ${ROOT_HOME} is a variable. I think to do
>> that a patch would
>> need to make the root home directory configurable, and not simply
>> hardcode it. That shouldn't
>> be too hard to do. I'll do that later tonight.
>
> Sed the patch? :)
>
> Creative solutions welcome, I'm just wary of such loose seds in source
> code.  If the only sane way is to sed then that's what we'll have to
> do.

I'd prefer a patch that used a define myself.  I don't like seds of source or 
patches...

--Mark

> Ross
>


