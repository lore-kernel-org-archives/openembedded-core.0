Return-Path: <pb@pbcl.net>
X-Greylist: delayed 2260 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Sep 2015 22:06:25 UTC
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 908DA77002
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 22:06:25 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZXc3o-0002Mw-Hp; Thu, 03 Sep 2015 23:28:44 +0200
Message-ID: <1441315717.1680.75.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 03 Sep 2015 22:28:37 +0100
In-Reply-To: <CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
	<CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
	<CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 22:06:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-03 at 13:22 -0700, Khem Raj wrote:
> irrespective of this change. I see yet another configuration with this
> into OE-core, overall OE-Core should get smaller
> and case does not sound convincing to me. You dont want to use busybox
> in a fairly large image which has other GPLv2 software in
> it. Thats fine but doesnt look like a common usecase to me

In general, I don't think it is a good idea for oe-core to be entirely
beholden to busybox or any other package, and I would be all in favour
of including an alternative implementation for everything that we depend
on busybox for.

In the specific case of ifupdown, the whole thing seems a little bit
1990s and it's hard to avoid the sense that there are better ways to
solve that particular problem nowadays.  But oe-core does already
include net-tools, which is if anything even more retro (and is in a
similar position vis-a-vis busybox) so there is precedent for including
this kind of thing.

It's also not as if ifupdown is a large piece of software with a complex
web of ABI dependencies that will introduce some huge maintenance burden
in the future.  So I can't see any real downside to adding it to
oe-core.

p.



