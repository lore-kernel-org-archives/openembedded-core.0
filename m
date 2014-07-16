Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5090F701BF;
	Wed, 16 Jul 2014 22:47:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GMlAUq027158; Wed, 16 Jul 2014 23:47:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ojfywgjLa3hX; Wed, 16 Jul 2014 23:47:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GMl64S027154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 23:47:08 +0100
Message-ID: <1405550821.3668.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 Jul 2014 23:47:01 +0100
In-Reply-To: <20140715165842.GN2433@jama>
References: <cover.1405440532.git.ross.burton@intel.com>
	<20140715165842.GN2433@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [PATCH 0/7][RFC] Remove enforced --foreign in autoreconf
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
X-List-Received-Date: Wed, 16 Jul 2014 22:47:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-07-15 at 18:58 +0200, Martin Jansa wrote:
> On Tue, Jul 15, 2014 at 05:18:30PM +0100, Ross Burton wrote:
> > Hi,
> > 
> > Since 2004 we've been forcibly passing --foreign to automake in autoreconf.
> > This is a change from upstream behaviour and can actually break packages that
> > expect GNU behaviour (admittedly the failure case reported was "interesting"),
> > and I'm on a bit of a mission to remove patches that don't have a solid reason
> > behind them.
> > 
> > Forcing --foreign doesn't seem that important these days as the majority of
> > packages are telling automake they're foreign, There are a few packages that
> > need patches for this change, notably they're mostly packages that haven't seen
> > a release for ten years.
> > 
> > This series is build tested against a world build in oe-core for NUC, so I'd
> > call it a demonstration that the patch is viable and would appreciate others
> > running build tests against other machines or layers.
> 
> world builds from
> http://www.openembedded.org/wiki/Bitbake_World_Status
> already have around ~50 failed recipes per architecture, I don't think
> we need more now :/
> 
> Do we have some volunteers to fix-up meta-oe/* layers?
> 
> I'm going to use PNBLACKLIST more aggressively as agreed on OEDAM, but
> with this speed next meta-oe release will have half of recipes which
> were available in daisy.

I made a quick test and the failures I spotted from meta-oe likely due
to this patch were:

re2c
libsdl-iomage
claws-plugin-gtkhtml2-viewer
claws-plugin-rssyl
libsdl-tiff
libol
ode
dejagnu
memcached
rp-pppoe
ipsec-tools
mtr
hplip
onig

Its probably not a complete list as I have a lot more failures than your
world builds but it gives some idea of number and its not a massive
list.

Cheers,

Richard



