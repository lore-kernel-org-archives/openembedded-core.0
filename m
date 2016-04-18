Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4B23B605BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 22:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3IMjwu7027588; Mon, 18 Apr 2016 23:45:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DsgmfyWpfTwI; Mon, 18 Apr 2016 23:45:58 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3IMjrYj027585
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Apr 2016 23:45:54 +0100
Message-ID: <1461019553.9308.223.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Mon, 18 Apr 2016 23:45:53 +0100
In-Reply-To: <CAP9ODKpZc=zKfUHtbJOJt5sTdXDkrEOMdKOZXBkxPUJCwmxFyg@mail.gmail.com>
References: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LaVL04OQaipNFn1hyCGruFZ7itmrxH00i=L+OkcsZexQw@mail.gmail.com>
	<20160325105025.GC2555@jama>
	<1458905339.3073.53.camel@linuxfoundation.org>
	<20160325115503.GE2555@jama>
	<CAP9ODKpZc=zKfUHtbJOJt5sTdXDkrEOMdKOZXBkxPUJCwmxFyg@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Mon, 18 Apr 2016 22:46:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-04-18 at 19:31 -0300, Otavio Salvador wrote:
> On Fri, Mar 25, 2016 at 8:55 AM, Martin Jansa <martin.jansa@gmail.com
> > wrote:
> > On Fri, Mar 25, 2016 at 11:28:59AM +0000, Richard Purdie wrote:
> > > On Fri, 2016-03-25 at 11:50 +0100, Martin Jansa wrote:
> > > > On Wed, Mar 02, 2016 at 12:40:31PM +0000, Burton, Ross wrote:
> > > > > On 27 February 2016 at 22:09, Martin Jansa <
> > > > > martin.jansa@gmail.com>
> > > > > wrote:
> > > > > 
> > > > > > * add separate variable for configuration options generated
> > > > > > from
> > > > > >   PACKAGECONFIG setting, this helps other bbclasses and
> > > > > > recipes
> > > > > >   to take advantage of PACKAGECONFIG mechanism, without
> > > > > > including
> > > > > >   other options from EXTRA_OECONF
> > > > > > * e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get
> > > > > > options
> > > > > >   from PACKAGECONFIG:
> > > > > >   EXTRA_QMAKEVARS_PRE +=
> > > > > >   but with
> > > > > >   conf/distro/include/no-static-libs.inc
> > > > > >   it means getting --disable-static as invalid option
> > > > > > inside
> > > > > >   EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who
> > > > > > tried
> > > > > >   to use poky with meta-qt5.
> > > > > > * once we migrate all bbclasses and recipes to
> > > > > > EXTRA_CONF_PACKAGECONFIG
> > > > > >   we should also restrict EXTRA_OECONF append only to
> > > > > > autotools.bbclass
> > > > > >   like I did for cmake.bbclass
> > > > > > 
> > > > > 
> > > > > Sorry, some of us have been a bit busy trying to get M3
> > > > > stable.
> > > > >  This does
> > > > > look good and I'm for squeezing it into M3.
> > > > 
> > > > Any update on squeezing this?
> > > > 
> > > > meta-qt5 is still broken with default poky config
> > > 
> > > I'm a little confused, was there going to be another version with
> > > some
> > > tweaked variable names?
> > 
> > Was there some agreement about variable name?
> 
> meta-qt5 5.6 is using this so we need a final decision if it will be
> merged or not. I am in favor it as I think it is clear enough.

It was an RFC and I still don't get a good feeling about the names
used.

I suggested:

PACKAGECONFIG_CONFPARAMS
or
PACKAGECONFIG_CONFARGS

as it then makes things slightly clearer these things are coming from
PACKAGECONFIG. We have a namespace which is a bit of a mess and I'd
prefer to try and improve with new things if we can...

The fact meta-qt5 is already using this is bad, it really shouldn't be.
We're also very close to the final build of 2.1 right now so this would
be a very late change :/.

Cheers,

Richard



