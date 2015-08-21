Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1D97391A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 22:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7LMg5C5011031; Fri, 21 Aug 2015 23:42:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cWd2WKbKXGQu; Fri, 21 Aug 2015 23:42:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7LMfqfK011028
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 21 Aug 2015 23:42:03 +0100
Message-ID: <1440196912.12105.279.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Fri, 21 Aug 2015 23:41:52 +0100
In-Reply-To: <CAP9ODKraiRiKPOq1mYDNWjMXex4Cn1jrSjVhxyUU-_jpFbW_nw@mail.gmail.com>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
	<d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
	<1440153906.12105.233.camel@linuxfoundation.org>
	<CAMKF1srDn=2kMGpkn0Pp1fF89PBk+Ex6AonVgur5vSFnkAOfdQ@mail.gmail.com>
	<CAP9ODKraiRiKPOq1mYDNWjMXex4Cn1jrSjVhxyUU-_jpFbW_nw@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Fri, 21 Aug 2015 22:42:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-21 at 18:43 -0300, Otavio Salvador wrote:
> On Fri, Aug 21, 2015 at 2:45 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > All points here are valid. We already see this with distro's which use
> > layers verbatim e.g. angstrom
> > I wish everyone derived their distros that way since that respects the
> > layer boundaries, a good chunk of work
> > there is still we send patches to layers to keep them up to date with
> > changes in other layers and there still are patches
> > pending since every layer maintainer doesnt respond in sam time frame,
> > but this sort of facilities if added is just going to worsen that
> > workload.
> > I think amalgmation of layers start with use of combo-tool itself.
> > This patch just takes it a step further. If we want to preserve
> > the layer model's health we have to work towards respecting layer
> > boundaries and I would even go a step further and suggest to
> > discourage use of combo-tool or any sort of layer squashing.
> 
> I fully agree; in fact Poky itself is a bad example that I often have
> to explain for vendors. People justify putting several layers together
> in same repository saying that Poky does that and this is a
> contradiction which we need to justify as Yocto Project promotes the
> use of layers as one of most preeminent features but Poky does the
> opposite ...

Another way of looking at the issues people are having is that
meta-openembedded is simply too large and it really needs to get split
up into separate repos so people can get more granularity.

That is both technically hard in some ways and controversial and nobody
wants to step up and try and form a consensus about doing it though. I
would note the internal splits are a good start though and there is some
separation of maintainership happened there already.

On the subject of poky, right from the start poky was a subset of
OpenEmbedded, for good reason if we remember OE from those days. That
reason was originally that OpenedHand didn't want to support all of OE
for a customer, only some subset. The OSVs using the Yocto Project still
have this issue today. The big difference between combo-layer and the
whitelist is that in one case you don't ship the recipe. This makes it
really clear to the customer what is and what is not supported. This has
pros and cons, obviously.

I will state for the record that poky only has complete layers in it
though, it doesn't pick components of meta-oe, I've actively avoided it.
Putting layers together in one accessible form is a different topic in
some ways to filtering one layer into a sublayer.

Patrick commented that whitelist and combo-layer both have the same
drawback to metadata quality and that is probably true, I wasn't trying
to suggest otherwise, merely highlight the other options available and
their relative merits (which I didn't do a good job of).

Cheers,

Richard


