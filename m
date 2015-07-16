Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8BD75FF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 19:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6GJlLKE015119; Thu, 16 Jul 2015 20:47:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Rnzalo0kwxYm; Thu, 16 Jul 2015 20:47:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6GJlAm0015085
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Jul 2015 20:47:21 +0100
Message-ID: <1437076030.3310.135.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Jul 2015 20:47:10 +0100
In-Reply-To: <20150716142027.GD2134@jama>
References: <1432207395-31589-1-git-send-email-Martin.Jansa@gmail.com>
	<20150701132356.GJ2409@jama> <20150716142027.GD2134@jama>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [daisy][PATCH] squashfs-tools: enable building unsquashfs and fix squashfs-4.2-fix-CVE-2012-4025.patch
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
X-List-Received-Date: Thu, 16 Jul 2015 19:47:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-16 at 16:20 +0200, Martin Jansa wrote:
> On Wed, Jul 01, 2015 at 03:23:56PM +0200, Martin Jansa wrote:
> > On Thu, May 21, 2015 at 01:23:15PM +0200, Martin Jansa wrote:
> > > * build unsqaushfs, useful when debuging corrupt squashfs from
> > >   mksquashfs
> > > * squashfs-4.2-fix-CVE-2012-4025.patch fixes CVE in unsquashfs which we
> > >   weren't building and it actually breaks building it, because someone
> > >   missed squashfs_fs.h change from the original change
> > > * add git headers in all patches and fix references to new github
> > >   repository
> > 
> > Ping
> 
> PING (It's almost 2 months :/)

I've just gone ahead and merged it.

If we want to get better at this, it would help if backport patches list
whether they're needed on other releases. E.g. here, listing "master,
fido, dizzy use 4.3" would speed things up from my perspective.

Cheers,

Richard


