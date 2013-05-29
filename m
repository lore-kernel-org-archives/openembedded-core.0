Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0FF61A80;
	Wed, 29 May 2013 21:24:41 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TLSvAi023959; Wed, 29 May 2013 22:28:57 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YuWzSWI9v6Ks; Wed, 29 May 2013 22:28:57 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TLSstk023955
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 29 May 2013 22:28:56 +0100
Message-ID: <1369862668.14887.236.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 29 May 2013 22:24:28 +0100
In-Reply-To: <CAP9ODKp1Tu3HXXz-4qOBQa1oY_r338keLFvvP6rZRf+aTyHtxQ@mail.gmail.com>
References: <1369835496-20815-1-git-send-email-mark.hatle@windriver.com>
	<20130529143740.GL3192@jama> <1369838840.14887.220.camel@ted>
	<CAP9ODKp1Tu3HXXz-4qOBQa1oY_r338keLFvvP6rZRf+aTyHtxQ@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC PATCH] base.bbclass: Deprecate the PRINC logic
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
X-List-Received-Date: Wed, 29 May 2013 21:24:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-29 at 14:00 -0300, Otavio Salvador wrote:
> On Wed, May 29, 2013 at 11:47 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         On Wed, 2013-05-29 at 16:37 +0200, Martin Jansa wrote:
>         > On Wed, May 29, 2013 at 08:51:36AM -0500, Mark Hatle wrote:
>         > > Background:
>         > >
>         > > At the recent TSC meeting we were discussing ways of
>         removing the PRINC
>         > > in favor of the PR server, which should now be standard.
>          The first step
>         > > in this process is coming up with a simple patch that
>         declared PRINC as
>         > > deprecated.  If this type of patch is successful, the
>         block of code could
>         > > be replaced with a bb.error eventually.
>         > >
>         > > It is not expected that this patch will go in by itself,
>         but instead
>         > > should be coordinated with changes to the recipes in
>         common layers such
>         > > as openembedded-core, meta-openembedded/meta-* and other
>         community layers.
>         >
>         > This doesn't say what's the process of getting all PR
>         increments
>         > applied.
>         >
>         > Should we send list of recipes and required PR increments
>         per layer (and
>         > someone will sum these increments and create actual PR bump
>         from it). Or
>         > will we take turns and send actual PR bump patches per layer
>         and someone
>         > will define order of layers to go in (so that we prevent
>         many conflicts
>         > while merging)?
>         
>         
>         This is something we need to figure out. The realistic process
>         is
>         probably do this layer by layer. If we can batch some up
>         together that
>         would obviously be better...

> If this is the case, to ensure we have the PR in sync we should have
> it PRINC as a bb.error; this will cause some pain but will avoid
> PRServer picking the layer PRINC and losing it in next build. Or does
> PRServer handle this gracefully?

I proposed this but other TSC members didn't like the approach and would
prefer a grace/warning period, maybe spanning until after the next
release.

I can see the arguments both ways...

Cheers,

Richard



