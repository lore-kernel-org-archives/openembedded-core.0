Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1T2moO-0004OS-JE
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 19:27:48 +0200
Received: by qatn12 with SMTP id n12so2789768qat.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2012 10:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qJgJayBpGYbhrzTAEBhjfj0xoFbSZTqx9TRQEs1lrso=;
	b=D7273BFrp8qaCTiklnms5tNr/+ZoThj1vMUOKkP/UNEgnI9ioF+Uh64YDmb/LdIFcz
	UD+ihcOoeqyiA/0M7Ngbo0VvvtyijNHwymRKDTPVgA2V7CWLjb15NyTj49NFoibdovq1
	v8ZjT+htmaXNuDPoZek1uzi87Hao84NCZHs+eDY9K6oyIbHLQ84nx48YlEJm2KjzG7+X
	gso8aJg1uxLk11ibQ0qPfiUsXa4r/TFIgAc75ycS51fgy5m57BHZqc703/sCzjLFr0/s
	2BPtOOT9cN8aOIYfMh9oTu++ZXhpajcTJkKgHjgNbd48aYzmWthTKAfUfXnT9u+hVnoB
	n5gw==
MIME-Version: 1.0
Received: by 10.229.137.140 with SMTP id w12mr7275412qct.8.1345310147932; Sat,
	18 Aug 2012 10:15:47 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Sat, 18 Aug 2012 10:15:47 -0700 (PDT)
In-Reply-To: <1345309072.27428.65.camel@ted>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
	<1345309072.27428.65.camel@ted>
Date: Sat, 18 Aug 2012 13:15:47 -0400
Message-ID: <CADkTA4MeEdF-LK0rFshnZgLNwFuHgQOc7F6q7Sbi1ufzzKab+g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] linux-yocto: consolidated update
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
X-List-Received-Date: Sat, 18 Aug 2012 17:27:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 18, 2012 at 12:57 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-08-15 at 16:06 -0400, Bruce Ashfield wrote:
>> Here's a consolidated update that I've had under test in one
>> way or another for 3 weeks now. Tom Z and others have also been
>> using parts of this for their work, so it has seen a reasonably
>> wide set of testers.
>>
>> This series further streamlines working with linux-yocto* based
>> recipes/repositories by breaking the last branch based triggers
>> in the tooling. Branches were the most important piece of
>> information when working with the tools and a linux-yocto repository,
>> but this has now been generalized, and BSP descriptions (among
>> other things) are now found by MACHINE and kernel type only.
>>
>> With this, KBRANCH now becomes what it was supposed to be, an
>> human readible indication of the branch that is supposed to be
>> built, and one that the kern-tools will validate. If that branch
>> is not validated, an error is thrown. If the default branch is
>> left as-is, then the in-tree description leaves you on the
>> proper branch and all is well.
>>
>> I also have a collection of bug fixes to the tools, including
>> support for having a meta branch not called 'meta'.
>>
>> I'd recommend that this go through some AB tests, and I'll be
>> around if there's a corner case that I managed to miss.
>
> I think
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/199/steps/shell_34/logs/stdio

Judging by the timestamps on your two email, is this not addressed by
the workaround
for git's behaviour ? On the surface, it looks to be the same thing,
since a branch that
should exist in the repository isn't there.

I'll fire of a poky-tiny build for qemu here, to see if I can
reproduce this one.

Cheers,

Bruce

>
> is due to something in this series...
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


