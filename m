Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1T22gb-0005Ka-GU
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 18:12:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7GG0eKG004572
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Aug 2012 09:00:40 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 16 Aug 2012 09:00:40 -0700
Message-ID: <502D1923.2030502@windriver.com>
Date: Thu, 16 Aug 2012 12:00:35 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <20120808033742.GA19078@localhost>
	<20120814021712.GB25748@localhost> <502D12E2.4000808@windriver.com>
	<1345132684.14667.70.camel@ted>
In-Reply-To: <1345132684.14667.70.camel@ted>
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [discussion] perf: specify SLANG_INC dir for perf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 16:12:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-16 11:58 AM, Richard Purdie wrote:
> On Thu, 2012-08-16 at 11:33 -0400, Bruce Ashfield wrote:
>> On 12-08-13 10:17 PM, Liang Li wrote:
>>> Hi Richard,
>>>
>>> Ping ...
>>>
>>> Hopefully you could recall sufficient context from this thread about
>>> the 'include path for slang.h' cause compile error issue that we are
>>> trying to fix here.
>>
>> Bump.
>>
>> I'm holding off on merging a kernel patch for this while this is still
>> outstanding.
>>
>> Can I distill this into the following (in the hope of resolving it).
>>
>>     - do we want to fix this problem for all kernels, or just the linux-yocto
>>       ones ? And by 'fix', I mean without the requirement of porting
>>       a kernel patch to older recipes.
>
> I propose we add a sed expression to the general kernel do_install which
> changes the -I/usr/include/slang ->  -I=/usr/include/slang. That should
> be generic, acceptable to upstream and fixes all kernel versions.

That'll work as well, as long as it is captured in the staging directory
perf will build.

As long as we construct it to check before sed'ing (is that a verb), it'll
adapt to kernels that do and don't have a patch already.

Liang and I can take care of putting something together. Does that work
for you ?

Cheers,

Bruce

>
> Comments?
>
> Cheers,
>
> Richard
>



