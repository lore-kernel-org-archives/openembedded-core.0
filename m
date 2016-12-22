Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 510B277692
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 18:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 707E020A48;
	Thu, 22 Dec 2016 18:34:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id HLHELmP9uZzF; Thu, 22 Dec 2016 18:34:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 511CE204AF;
	Thu, 22 Dec 2016 18:34:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9BE3C1621E5; Thu, 22 Dec 2016 13:34:12 -0500 (EST)
Date: Thu, 22 Dec 2016 13:34:12 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20161222183412.GI30576@denix.org>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
	<20161221191030.GF30576@denix.org>
	<CABcZANnFNKiPLW+nPwJJOGAvoVUCOEM4Ca6C_aOxbs2rr5v4SQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANnFNKiPLW+nPwJJOGAvoVUCOEM4Ca6C_aOxbs2rr5v4SQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] linux-dtb.inc: use absolute upd-alt paths
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
X-List-Received-Date: Thu, 22 Dec 2016 18:34:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Dec 21, 2016 at 01:18:44PM -0700, Christopher Larson wrote:
> On Wed, Dec 21, 2016 at 12:10 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > On Thu, Nov 12, 2015 at 04:41:28PM -0700, Christopher Larson wrote:
> > > From: Christopher Larson <chris_larson@mentor.com>
> > >
> > > This works around a limitation of the chkconfig update-alternatives, so
> > it
> > > works with all our update-alternatives providers.
> >
> > I know this change is old and has been in for over a year...
> >
> > But the side-effect of it is that it breaks NFS-boot due to absolute DTB
> > symlinks. We had to implement a local workaround to switch them back to
> > relative links.
> >
> > Is there another way to fix the original issue w/o absolute links?
> 
> I expect so. I’d be fine with dropping this, it was a workaround more than
> anything else anyway.

Ok, someone just changed it, works for me :)

http://cgit.openembedded.org/openembedded-core/commit/?id=c7bc46b9bc29dd0953ab8d63b50fa105bb66892e

-- 
Denys

