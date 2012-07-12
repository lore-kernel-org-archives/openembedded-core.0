Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SpPxb-0006Y4-FL
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 22:26:03 +0200
Received: by weyr6 with SMTP id r6so1712124wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 13:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Jz4kObCVAJ6ZIxiaHCb+wMJNwgAzmOQMkWHCBC81lP0=;
	b=S8a8PYV50vsjbbxgKajFUl4xqwgW2ofi1I3xAuFOBUICGzKKfcskg4J8JrCdFuDBzQ
	kQAW3jdtmeOOZrsk6fATmfX19voSyaaw5sPVPJBcgub6+jRX3BWM+optFWjY5y2SayuT
	+0J8vuSMKuh+7HYvYnNVI+6Qgvo4YVgh38gu5/kA1MdFtQbB5SpvYsPaXWa0V431RYiR
	KGD+iiKJ1xRFvQCKVUgqTxA+GrFh8umDNVoZgTpgMo3npcCQ2GC8Pa90aQIPxOKBlAHz
	Uj/RCWrYlcMeatRu7QyvIGd9i5gESsi6Kv/7UaxVDt2y3/ntytAnfgFfEIK/Mp9KnBz3
	BYXQ==
Received: by 10.180.91.1 with SMTP id ca1mr31417572wib.8.1342124090137; Thu,
	12 Jul 2012 13:14:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.30.34 with HTTP; Thu, 12 Jul 2012 13:14:20 -0700 (PDT)
In-Reply-To: <CAK18fxHXKLWdbDOC-ApQdqPtg1DgmYveBqCD9esq_zMqwLBrAQ@mail.gmail.com>
References: <cover.1342116650.git.andrei@gherzan.ro>
	<8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
	<4FFF23E2.5040007@linux.intel.com>
	<CAK18fxHXKLWdbDOC-ApQdqPtg1DgmYveBqCD9esq_zMqwLBrAQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Jul 2012 13:14:20 -0700
Message-ID: <CAMKF1spHBFNnmK5mVWaE+5ykF9cY+ivnpOmr=mQ6vHe7mR9yKw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Fix xz compression command and optimize compression time
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
X-List-Received-Date: Thu, 12 Jul 2012 20:26:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 12, 2012 at 12:59 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> On Thu, Jul 12, 2012 at 10:22 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> On 07/12/2012 11:58 AM, Koen Kooi wrote:
>>>
>>> Any volunteers to test this on a system with >4 real cores?
>>>
>>
>> Koen,
>>
>> Does OE-Core or Poky have an image setup for using .xz by default?
>>
>> I will run it on a machine I have, just want to make sure I am doing the
>> same tests that Andrei is running.
>>
>> I was about to ask what msm asked about the Memory info.


use htop

> That field in results is not from "time". It's from gnome-system-monitor.
> Sorry for being a little confusing.
>
> @g
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


