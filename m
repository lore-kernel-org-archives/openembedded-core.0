Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SUNHc-0003rz-W5 for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 21:19:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4FJ9iVE010333
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 20:09:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09693-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 20:09:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4FJ9WvQ010327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 20:09:33 +0100
Message-ID: <1337108972.2711.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 15 May 2012 20:09:32 +0100
In-Reply-To: <CAF6bG8fj59QFg7QqZjOoGBCPwg-D=Ba-wLsGU38X8+n83tZUZQ@mail.gmail.com>
References: <CAOHjBZto_R5S777po-K8mXG-Z9XLYNVzE05-kq_TOCeo4YgyoQ@mail.gmail.com>
	<20120515130625.GD3166@jama.jama.net>
	<CAF6bG8fj59QFg7QqZjOoGBCPwg-D=Ba-wLsGU38X8+n83tZUZQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe] Packages broken URL
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
X-List-Received-Date: Tue, 15 May 2012 19:19:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-15 at 16:13 +0300, Marko Lindqvist wrote:
> On 15 May 2012 16:06, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Tue, May 15, 2012 at 03:02:37PM +0200, Giuseppe Condorelli wrote:
> >> Hi All,
> >>
> >> there are a number of packages having a broken SRC_URI, for example git.
> >> Has someone met this issue?
> >> For sure we can correct those links adding a dedicated .bbappend file for
> >> each failing package but
> >> I think we could also update the main package fixing the errors.
> >
> > This should go to oe-core ML:
> > openembedded-core@lists.openembedded.org
> >
> > And yes it should be fixed in original recipe.
> 
>  Is there some way to disable automatic MIRROR usage that one could
> use to find out all source fetching problems?

PREMIRRORS = ""
MIRRORS = ""

Cheers,

Richard



