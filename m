Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QN35a-0001hL-Vd for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 15:16:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JDDWm6008168
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 14:13:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07837-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 14:13:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JDDPJ7008162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 14:13:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTim6=weFcE9PTyZxOHrdpNZOJuEiug@mail.gmail.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
	<BANLkTimrb+YjVGP_eh_i8nDunvye0vApJA@mail.gmail.com>
	<1305804906.3424.480.camel@rex>
	<BANLkTinzLqz6ED+=WpT_wnXkta03OiC0Yw@mail.gmail.com>
	<1305807748.3424.515.camel@rex>
	<BANLkTim6=weFcE9PTyZxOHrdpNZOJuEiug@mail.gmail.com>
Date: Thu, 19 May 2011 14:13:23 +0100
Message-ID: <1305810803.3424.522.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] network based PR service
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
X-List-Received-Date: Thu, 19 May 2011 13:16:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 14:43 +0200, Frans Meulenbroeks wrote:
> 2011/5/19 Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> > On Thu, 2011-05-19 at 14:02 +0200, Frans Meulenbroeks wrote:
> > > 2011/5/19 Richard Purdie <richard.purdie@linuxfoundation.org>
> > >
> > > > On Thu, 2011-05-19 at 13:01 +0200, Frans Meulenbroeks wrote:
> > You could use a local PR server. Obviously connecting to one central
> > server without any network connectivity isn't going to happen so we have
> > to be realistic about expectations.
> >
> > To make a perfect rebuild the local PR server would need a dump of the
> > database on the central server. There isn't code for that at the moment
> > and I don't think its the highest priority task out there or the most
> > important use case but its certainly possible for someone to add.
> >
> 
> I'd say it would already be nice if some caching is being done locally (just
> like is done with e.g. downloads).

The difference is you need all the data, not just a given value. The
equivalent in downloads is downloading every possible download version
in advance just in case so the analogy isn't a good one.  In this case
it would be possible to do that though as the data is smaller.

> > > For layers, one solution could be to allow variable overriding on the
> > > overlay level. I can imagine there are more uses for that (and I
> > understand
> > > this requires changes to the bitbake machinery).
> >
> > There is certainly a use case for something like this. The exact
> > implementation and workings needs a lot more thought and discussion
> > though. I believe its at least already possible in anonymous python (and
> > if not, any extensions needed shouldn't be invasive by comparison).
>
> Hm. you consider this PR change to be non-invasive?

No, this isn't what I said. "allow variable overriding on the
overlay level" is invasive. Adding functionality to allow this kind of
thing from anonymous python is by comparison less invasive.

Its also a tangential issue to the PR part although obviously useful in
connection with it.

> BTW I am not saying it is not good, and I understand the problem that you
> want to solve, but I feel this could require some more thought wrt the
> issues I raised before in this thread (and some more documentation and usage
> info).

At this point, an implementation which we can look at, experiment with
and document is better than none at all :).

Ideally some of these issues would have come up at the design stage but
we'll work through this and I think things area heading the right way.
Nobody is saying this is 100% complete or solves every problem.

I don't believe this code needs to solve every problem straight off but
it does at least need to be extensible to cover them in future by design
as far as possible.

Cheers,

Richard



