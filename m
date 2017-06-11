Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id EC8EA6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 18:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E9C3320879;
	Sun, 11 Jun 2017 18:44:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pZ7o-Rj8LbrS; Sun, 11 Jun 2017 18:44:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C0142207AF;
	Sun, 11 Jun 2017 18:44:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4EA4C1624EA; Sun, 11 Jun 2017 14:44:00 -0400 (EDT)
Date: Sun, 11 Jun 2017 14:44:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170611184400.GP28053@denix.org>
References: <20170611165839.26175-1-net147@gmail.com>
	<CAMKF1spiqofNf6r_0v6Hg208zH38x13-pX09e9OfCTbiGHEyBg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spiqofNf6r_0v6Hg208zH38x13-pX09e9OfCTbiGHEyBg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][pyro][PATCH] bitbake.conf: Add whoami to HOSTTOOLS
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
X-List-Received-Date: Sun, 11 Jun 2017 18:44:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 11, 2017 at 10:22:58AM -0700, Khem Raj wrote:
> On Sun, Jun 11, 2017 at 9:58 AM, Jonathan Liu <net147@gmail.com> wrote:
> > The whoami command is used when building the Linux kernel in
> > scripts/mkcompile_h to embed the build user that is visible
> > in /proc/version.
> >
> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 3ad905c917..4f20aa3d1c 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -465,7 +465,7 @@ HOSTTOOLS += " \
> >      mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
> >      python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
> >      sleep sort split stat strings strip tail tar tee test touch tr true uname \
> > -    uniq wc wget which xargs \
> > +    uniq wc wget which whoami xargs \
> 
> I think it might be better to not use whoami at all to begin with, it
> might be good for reproducibility too.

There was this whole discussion about adding whoami couple months ago - 
Richard won't accept the change:

http://lists.openembedded.org/pipermail/openembedded-core/2017-March/134878.html

-- 
Denys

