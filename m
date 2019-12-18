Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 773EA7FF0F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 16:21:56 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 3CA5D2E891A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 10:21:57 -0600 (CST)
Date: Wed, 18 Dec 2019 10:21:54 -0600
From: Seebs <seebs@seebs.net>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20191218102154.5bbf52e0@seebsdell>
In-Reply-To: <CANNYZj9yLNUhmU0tWcyeWJ7tRXQKGd31X-_GKNKshYzYaE3Auw@mail.gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-13-alex.kanavin@gmail.com>
	<20191218091834.41b49324@seebsdell>
	<CANNYZj9yLNUhmU0tWcyeWJ7tRXQKGd31X-_GKNKshYzYaE3Auw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 13/25] pseudo: adjust for attr 2.4.48
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
X-List-Received-Date: Wed, 18 Dec 2019 16:21:56 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Dec 2019 17:15:34 +0100
Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> On Wed, 18 Dec 2019 at 16:27, Seebs <seebs@seebs.net> wrote:
> 
> > On Wed, 18 Dec 2019 15:37:46 +0100
> > Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > > +Latest versions of attr have removed the xattr.h header,
> > > +with the rationale that libc is providing the same wrappers.
> >
> > I'm a bit concerned about this -- will this still work with *older*
> > versions of xattr?
> >
> 
> It won't, as attr upstream moved the definition of ENOATTR from one
> header file to another.
> 
> attr is supplied by oe-core though, so we have control over which
> version is used.

So basically, if I want to maintain support in pseudo for older xattr,
I need to figure out a way to try both. Thanks, attr devs. :P (Pseudo
is still sometimes used outside of oe-core.)

-s

