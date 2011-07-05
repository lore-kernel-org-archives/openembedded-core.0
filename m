Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1Qe81H-00088y-5P
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 17:58:39 +0200
Received: by iym10 with SMTP id 10so5746747iym.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 08:54:49 -0700 (PDT)
Received: by 10.42.178.3 with SMTP id bk3mr1468685icb.396.1309881289012;
	Tue, 05 Jul 2011 08:54:49 -0700 (PDT)
Received: from [192.168.1.220] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id c2sm1925747ibd.56.2011.07.05.08.54.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 08:54:46 -0700 (PDT)
Message-ID: <4E1333B6.6020500@mvista.com>
Date: Tue, 05 Jul 2011 08:54:30 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.18) Gecko/20110616 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <RFC: Layer tooling brainstorming>	
	<201105201745.29497.paul.eggleton@linux.intel.com>	
	<4DD6A817.6050701@mvista.com>	
	<201107011424.27821.paul.eggleton@linux.intel.com>	
	<4E0E156E.5050301@mvista.com> <1309556232.20015.552.camel@rex>	
	<4E0E6776.8010709@mvista.com> <1309779277.20015.659.camel@rex>
In-Reply-To: <1309779277.20015.659.camel@rex>
X-Enigmail-Version: 1.1.1
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for remote layering.
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
X-List-Received-Date: Tue, 05 Jul 2011 15:58:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> I agree the patch has a use in its own right, standalone. I am however
> asking us all to take a step back and consider the big picture which is
> what I need do with a lot of what we're doing.
> 
> My point is that whilst in isolation its ok, I don't think that approach
> can scale to fulfil all the varying needs of our users. If it can't, we
> need to look at what can, and then how we could include equivalent
> functionality.

Okay.

> Even with the code we're discussing, you need an external tool to create
> the list and to update it at appropriate points from upstream so you
> really might as well have that code actually do the fetch as well
> (calling bitbake's fetchers)?

Well in its current state, you don't need one, but it makes it a lot
easier. OTOH all this discussion more or less centers around BBLAYERS
which is already easy to use.

> I'm much more worried about the workflow and its implications than I am
> about the actual code.

Okay. More ore less this really only expands the options for workflow.

> I think layers are a bit different to a lot of the source code we
> currently fetch. We might want to push things back, transfer commits
> between layers and perform a number of other operations.

Unless we are writing a new set of fetchers(internal or otherwise), the
limitation is the fetchers, since they don't do this.

> These
> operations all require "state" type data that currently we can't store
> in a SRC_URI. I'm not even sure we want to store it there.

Wouldn't you have the same issue with a git repo tracking recipe?

> 
> There has been discussion about this in person at Collab/ELC and on
> the mailing lists/wikis but we probably need to do better at
> communicating this I guess :/

Yes. Been following a long, trying to contribute where it made sense.
OTOH, in the end, if it is insufficient for our needs we can't use it.
> The whole point of Yocto is to collaborate. I'm pleased to have your
> input in the form of the patches and I really do appreciate that.
> 
> This doesn't however guarantee we take them "as is" since we've also
> consulted with a number of other people about what their needs are and
> your solution whilst evidently perfect for you doesn't meet all the
> criteria we established during the planning process. 

I never suggested that anything be taken as is. In the irc discussions
with Paul, we talked about the bits that we wanted to change.

> We're trying to
> write some tools that should work for everyone. It may require some
> changes in process for some people, hopefully these will be logical and
> improve the user experience and understanding.

Understood, otherwise I wouldn't be having this e-mail exchange with you
at all.

> There are a variety of ways I think we could even directly make your use
> case work (such as bitbake automatically calling the external update
> tool if some environment variable is set). 

Okay.


> Collaboration means there are
> more than just your requirements that need to be worked into this at
> this point.

Nor have I suggested that you guys were.

> What's the opinion of fetch2 at this point? I'm hoping we can rely on
> that for all future development work at this point.

From the I am just using fetchers in a more or less rudimentary manner,
it feels more or less the same(which kind a was the point). I have not
really used any of the additional stuff that has been added in, but more
powerful and functionally rich code is always a positive thing.

Also I am currently supporting fetch with our older product so when I
wrote the patch, making it work with fetch seemed a good idea.

> 
> I'm probably confusing this with the first version you sent out I guess,
> sorry.
> 

That was my point, there was only one. Really doesn't matter.

>> We can move the setting of that stuff to the init of the fetchers, and
>> that wouldn't be a big deal.
> 
> I understand that. You're not thinking about what I'm suggesting ;-)
> 

I caught what you were striving for there.

-- 
Jeremy Puhlman
Montavista Sofware, LLC.


