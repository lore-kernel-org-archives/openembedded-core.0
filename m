Return-Path: <seebs@seebs.net>
X-Greylist: delayed 521 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Aug 2018 16:33:50 UTC
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id C38A379202
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 16:33:50 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 3B2F42E892B;
	Wed, 15 Aug 2018 11:25:10 -0500 (CDT)
Date: Wed, 15 Aug 2018 11:25:08 -0500
From: Seebs <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180815112508.24653d84@seebsdell>
In-Reply-To: <3e94bc10f20abef1db6b1d89d8d2359f20c920d0.camel@linuxfoundation.org>
References: <518a17b5-60af-42dc-4b3b-b0dc76589fb1@prevas.dk>
	<3e94bc10f20abef1db6b1d89d8d2359f20c920d0.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [pseudo] [RFC 1/2] pseudo_ipc.c: Use MSG_NOSIGNAL if available
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
X-List-Received-Date: Wed, 15 Aug 2018 16:33:51 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Aug 2018 10:27:29 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2018-08-15 at 08:59 +0200, Rasmus Villemoes wrote:
> > On 2018-07-11 16:30, Rasmus Villemoes wrote:
> > > MSG_NOSIGNAL has been in Linux since 2.2, and has been
> > > standardized in
> > > POSIX 2008. Using that when available avoids the overhead of the
> > > two
> > > syscalls to set and restore the SIGPIPE handler. Moreover, we can
> > > eliminate one write() call by making use of sendmsg() to do
> > > scatter-gather I/O.
> > 
> > Ping. The README in the pseudo repo says to use the
> > openembedded-core list for pseudo patches, so I assume this is the
> > right place. I have other ideas for improving pseudo's performance
> > on both client and server
> > side, but there's no point sending patches to /dev/null.
> 
> Pseudo maintenance is a little tricky right now and I'd guess Peter is
> unavailable. Would you be able to format these as additional patches
> to the pseudo recipe? That way we could test and include them in
> builds and then Peter will review them when he has time.

Hi! Sorry about the delay, I wanted to review these more carefully.
They looked reasonable to me, I just haven't had a chance to look more
closely. They're still in my "I need to respond to this" mailbox.

-s

