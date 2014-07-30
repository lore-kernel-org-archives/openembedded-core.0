Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD0D70795
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 13:29:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6UDSYWS025312; Wed, 30 Jul 2014 14:28:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5igcV-ECnYzH; Wed, 30 Jul 2014 14:28:34 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6UDSS3c025068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jul 2014 14:28:30 +0100
Message-ID: <1406726908.13346.135.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Jul 2014 14:28:28 +0100
In-Reply-To: <20140730093244.GK16445@jama>
References: <20140703164708.452165036A@opal.openembedded.org>
	<20140718205012.GT2433@jama> <20140730093244.GK16445@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : qemu: fix qemu-native pkg-config paths
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
X-List-Received-Date: Wed, 30 Jul 2014 13:29:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-07-30 at 11:32 +0200, Martin Jansa wrote:
> On Fri, Jul 18, 2014 at 10:50:12PM +0200, Martin Jansa wrote:
> > On Thu, Jul 03, 2014 at 04:47:08PM +0000, git@git.openembedded.org wrote:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: 68a5ed337f8f7ee8e5bf55542ec82d786eb754db
> > > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=68a5ed337f8f7ee8e5bf55542ec82d786eb754db
> > > 
> > > Author: Cristian Iorga <cristian.iorga@intel.com>
> > > Date:   Thu Jul  3 15:57:32 2014 +0300
> > > 
> > > qemu: fix qemu-native pkg-config paths
> > > 
> > > For qemu-native, the pkg-config paths do not
> > > include build host paths.
> > 
> > This breaks qemu-native builds on hosts without pkg-config.
> > 
> > pkg-config isn't in sanity.bbclass's SANITY_REQUIRED_UTILITIES
> > and this is first recipe which cannot use pkgconfig-native.
> > 
> > Please add test that it exists before forcing recipe to use it.
> 
> PING
> 
> This is broken for almost a month, please at least revert it until it's
> fixed correctly.

Well, if I revert this, I'd then need to revert other things and it
turns into a dependency chain nightmare. So the reality is this needs to
get fixed.

I'm assuming in your case, you probably either don't have or care about
SDL at all, or you have sdl-config available?

So what really needs to happen here is that running the command needs to
become non-fatal as far as I can tell?

Cheers,

Richard


