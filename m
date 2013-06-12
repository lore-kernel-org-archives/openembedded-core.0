Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id D347E6A96F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 13:21:14 +0000 (UTC)
Message-ID: <51B875C8.2080403@communistcode.co.uk>
Date: Wed, 12 Jun 2013 14:21:12 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAGDS+nkMujRn-M+Oja==L+kMynx0-P0WxZWeVaSsAHJGGWPUUA@mail.gmail.com>
	<51FB023E-F4EC-42A6-8230-D40DDD2542AE@dominion.thruhere.net>
	<CAGDS+nnsT3TVesy=k6a0mqTtz1EFG68XGVQcGRqc-o_vbN4sjA@mail.gmail.com>
In-Reply-To: <CAGDS+nnsT3TVesy=k6a0mqTtz1EFG68XGVQcGRqc-o_vbN4sjA@mail.gmail.com>
Subject: Re: Possible to fetch from private github repo?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2013 13:21:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/13 14:09, Steve Sakoman wrote:
> On Wed, Jun 12, 2013 at 6:07 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>
>> Op 12 jun. 2013, om 15:04 heeft Steve Sakoman <sakoman@gmail.com> het volgende geschreven:
>>
>>> I have a client that keeps their app source code in a private github repository.
>>>
>>> I haven't managed to find a way to convince the git fetcher to grab
>>> the source code.
>>>
>>> Has anyone else managed to write a recipe that uses a github private repository?
>>
>> Yes: https://github.com/CircuitCo/meta-circuitco/blob/master/recipes-tester/beagleboneblack/bbbtester_git.bb
>>
>> You need to have your ssh keys in order before trying that, though.
>
> Thanks Koen.
>
> I tried that form, so clearly I must not have my ssh keys in order!
>
> Thanks for confirmation that it can be made to work.
>
> Steve
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

Ditto, I grab from a private repo's using validated ssh-keys without 
issue. Just ensure that the machine you're running bitbake on is the 
machine that has been validated, and you have set the protocol to ssh 
and you should be fine!

Cheers,


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--

