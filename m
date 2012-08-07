Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SykV8-0004VS-AT
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 16:11:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q77DxQo8020058
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Aug 2012 06:59:26 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 7 Aug 2012 06:59:26 -0700
Message-ID: <50211F3B.6010601@windriver.com>
Date: Tue, 7 Aug 2012 09:59:23 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1344338236.9756.218.camel@ted> <50211706.1050707@windriver.com>
	<1344347435.9756.251.camel@ted>
In-Reply-To: <1344347435.9756.251.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-3.4: Disable extra slang header search path
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
X-List-Received-Date: Tue, 07 Aug 2012 14:11:14 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-07 09:50 AM, Richard Purdie wrote:
> On Tue, 2012-08-07 at 09:24 -0400, Bruce Ashfield wrote:
>> On 12-08-07 07:17 AM, Richard Purdie wrote:
>>> Add in a workaround to avoid host infection detection build failures
>>> from the slang include directory in perf. I'll defer to Bruce to
>>> fix this properly but we need a workaround now as this is breaking
>>> builds.
>>
>> I just followed up on a patch from 3 days ago, but I'll follow up here
>> as well .. just to make sure the message gets through.
>>
>> We had a pending patch to fix this issue from Liang Li here @ windriver.
>>
>> Did that patch not fix the problem, or did it fall through the cracks ?
>
> It is not correct. It adds in another search path and just hides the
> issue. We should *never* be putting -I/usr/include/slang on the compiler
> commandline at all period.

I'd argue that it's more correct than commenting out the upstream
include path.

It fixes the problem, doesn't require a patch to the kernel and give
us time to work upstream and get a real fix.

So I'd really prefer that we take that fix, versus the kernel patch
if it actually fixes the problem.

>
> I'd assumed in all the email traffic that this was clear and that
> another solution was being worked on that would be acceptable upstream
> too.

Exactly what I referred to above. But we don't want a temporary
kernel path, we want the temporary recipe patch.

>
> Perhaps a better option might be: -I=/usr/include/slang ? That assumes
> that all kernel gcc versions would accept the = notation, that should be
> true by now?

Not in my experience when dealing with the upstream kernel and tools,
there are plenty of old compilers floating around.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
>
>



