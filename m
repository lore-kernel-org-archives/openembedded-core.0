Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF627E776
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 22:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 85FDD40BE5;
	Wed, 12 Jun 2019 22:23:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2sIIGf3t2lXR; Wed, 12 Jun 2019 22:23:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 66FA940BAC;
	Wed, 12 Jun 2019 22:23:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A8A7A17007F; Wed, 12 Jun 2019 18:23:38 -0400 (EDT)
Date: Wed, 12 Jun 2019 18:23:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190612222338.GN2112@denix.org>
References: <1560289312-19244-1-git-send-email-denis@denix.org>
	<20190612053326.GA12642@localhost>
MIME-Version: 1.0
In-Reply-To: <20190612053326.GA12642@localhost>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mtd-utils: upgrade 2.0.2 -> 2.1.0
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
X-List-Received-Date: Wed, 12 Jun 2019 22:23:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2019 at 08:33:26AM +0300, Adrian Bunk wrote:
> On Tue, Jun 11, 2019 at 05:41:52PM -0400, Denys Dmytriyenko wrote:
> >...
> > * Now requires openssl:
> > | In file included from ../git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c:25:
> > | ../git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h:49:10: fatal error: openssl/rand.h: No such file or directory
> > |  #include <openssl/rand.h>
> > |           ^~~~~~~~~~~~~~~~
> > | compilation terminated.
> > | Makefile:3457: recipe for target 'ubifs-utils/mkfs.ubifs/mkfs_ubifs-mkfs.ubifs.o' failed
> > | make: *** [ubifs-utils/mkfs.ubifs/mkfs_ubifs-mkfs.ubifs.o] Error 1
> >...
> > -DEPENDS = "zlib e2fsprogs util-linux"
> > +DEPENDS = "zlib e2fsprogs util-linux openssl"
> 
> It doesn't (and should not) require it unconditionally.
> 
> Please backport "mkfs.ubifs: fix build without openssl" from
> upstream git instead.
> 
> >...
> > -PV = "2.0.2+${SRCPV}"
> > +PV = "2.1.0+${SRCPV}"
> >...
> 
> This was already wrong before but now is an opportunity to fix:
> Since this is exactly the release, it should be
>   PV = "2.1.0"

So, which is it? Do you want it to be exactly the release, or do you want 
to start backporting fixes from after the release? It doesn't seem to be 
a critical issue to warrant backporting, in my opinion.

-- 
Denys

