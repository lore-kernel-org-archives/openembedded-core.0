Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8D21570FA9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Aug 2014 08:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7N8enod012559; Sat, 23 Aug 2014 09:40:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xHdap0Vzmh04; Sat, 23 Aug 2014 09:40:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7N8ehEF012556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 23 Aug 2014 09:40:44 +0100
Message-ID: <1408783244.5457.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Richard Tollerton <rich.tollerton@ni.com>
Date: Sat, 23 Aug 2014 09:40:44 +0100
In-Reply-To: <8761hkpmx0.fsf@weregild.amer.corp.natinst.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
	<53E129D4.3050402@windriver.com>
	<CAP9ODKqt79-1XkYDi01Wn-ZT5f13e4s=BhF08=zj8B==Hcjkpg@mail.gmail.com>
	<53E14013.1000301@windriver.com>
	<8761hkpmx0.fsf@weregild.amer.corp.natinst.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch message guidelines and internal/corporate fields
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
X-List-Received-Date: Sat, 23 Aug 2014 08:41:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-22 at 10:24 -0500, Richard Tollerton wrote:
> Randy MacLeod <randy.macleod@windriver.com> writes:
> 
> > Wind River patches used to include a "CQID" tag but we've changed
> > our process to avoid needing such internal tags. If National
> > Instruments can do so as well, that'd be best.
> >
> > I did check my oe-core email list history and this seems like the
> > first patch from NI that has the tags included so I thought
> > I'd reply and see if we can get the tags dropped.
> 
> IIRC, we pinged Phil a few months ago on this topic, and he thought
> internal tags were OK. I think Wind River might have been cited as an
> example.
> 
> I see that
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines hasn't
> been updated with this requirement. Should it be? Will that require TSC
> approval?

I don't have a strong preference on this to be honest. I can imagine
cases where its useful to have some kind of tracking of issues into the
final commits. 

Obviously it would be better if everyone can understand what the numbers
mean, equally, it seems pointless to force people to strip them when
they might be useful to people contributing to the project.

If they are used as a substitute for a good commit message, that
wouldn't be acceptable. Also, if they were taking over the commit
messages, that would able be unacceptable. So if we can keep them to a
small part of the commit, I'm prepared to let them pass but it can't be
at the expense of good commit messages.

I don't believe we need a TSC decision, that would only be needed if
there were strong disagreements we were unable to resolve and I don't
think we're quite there yet :) I'll let others comment though and see
where we're at.

Cheers,

Richard


