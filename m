Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TStcI-00058E-L3 for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 18:59:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9THjcuo006558;
	Mon, 29 Oct 2012 17:45:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05714-10; Mon, 29 Oct 2012 17:45:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9THjUUd006552
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 17:45:31 GMT
Message-ID: <1351532730.2828.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <clarson@kergoth.com>
Date: Mon, 29 Oct 2012 17:45:30 +0000
In-Reply-To: <CABcZANmzfXiXA5rdNQpqo33wXyFPz518dCkLe0x7rZGjOZ=Ucw@mail.gmail.com>
References: <1351517628.13864.4.camel@phil-desktop>
	<1351525416.2828.12.camel@ted>
	<CABcZANmzfXiXA5rdNQpqo33wXyFPz518dCkLe0x7rZGjOZ=Ucw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: What is TOOLCHAIN_NEED_CONFIGSITE_CACHE for?
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
X-List-Received-Date: Mon, 29 Oct 2012 17:59:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-29 at 10:33 -0700, Chris Larson wrote:
> On Mon, Oct 29, 2012 at 8:43 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > We ship the "site" cache files with the toolchain. We decided to include
> > the generated cache files as well as the static ones. We currently
> > generate "site" files for libc and ncurses.
> >
> > You can almost certainly just set:
> >
> > TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC}"
> >
> > and be happy since this just lists which generated cache site files to
> > include.
> 
> Shouldn't it be pulled in via depends from the populate_sdk bits,
> rather than a task that's used both for image builds and toolchain
> builds, though?

If we turned these into packaged output then we could do this, yes. As
things stand those files aren't packaged and hence there are no
dependencies from which to infer/pull these in. Converting them to that
isn't a particularly trivial exercise.

We currently only generate them for libc/ncurses which provide most of
the configure cache speedups we'd want so it hasn't been a particularly
pressing problem to solve.

I'm all for improving this and will happily take patches but its not
something on the immediate task list as there are higher priority issues
IMO.

Cheers,

Richard



