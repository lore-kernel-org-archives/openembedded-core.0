Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 484507597C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6TCqDko028116; Wed, 29 Jul 2015 13:52:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uhjjLspyZojP; Wed, 29 Jul 2015 13:52:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6TCpx8q028110
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Jul 2015 13:52:10 +0100
Message-ID: <1438174319.11208.63.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Jul 2015 13:51:59 +0100
In-Reply-To: <20150728134825.GB2465@jama>
References: <cover.1438049511.git.liezhi.yang@windriver.com>
	<edf889b1140dcb63168fe1c0dd2368ea3d6d1875.1438049511.git.liezhi.yang@windriver.com>
	<CAJTo0Lbz+MGPLHZCc4jphi3os9Nk8RvUpnonBThxpz0tR3btKw@mail.gmail.com>
	<20150728134825.GB2465@jama>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] file: 5.23 -> 5.24
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
X-List-Received-Date: Wed, 29 Jul 2015 12:52:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-07-28 at 15:48 +0200, Martin Jansa wrote:
> On Tue, Jul 28, 2015 at 02:08:20PM +0100, Burton, Ross wrote:
> > On 28 July 2015 at 03:12, Robert Yang <liezhi.yang@windriver.com> wrote:
> > 
> > > * Use git repo rather than tarball since the original SRC_URI is not
> > >   stable, it is not reachable sometimes.
> > >
> > 
> > Personally speaking I see this as a recipe for a release of file which just
> > happens to use git to fetch the tarball (and presumably that hash is the
> > 5.24 tag).  In situations like this I prefer to see the recipe called
> > file_5.24.bb as there's no point having a giant PV including git SHAs when
> > it's just the release.
> 
> until someone sets SRCREV_pn-file = "${AUTOREV}" somewhere and git SHAs
> in PV suddenly gets very useful.
> 
> Personally speaking I prefer recipes with git SCM in SRC_URI named
> <foo>_git.bb and PV set to "A.B.C+gitr${SRCPV}".

Having thought a bit about this, I have to admit I have a preference for
not doing this, just so we can know it is meant to be file 5.24 and not
that version plus some random git commits. If you override SRCREV, you
can override PV too to match the SRCREV.

Perhaps more importantly, its also more useful for the version
comparisons in the update tracking tooling. That might tip the balance.

Cheers,

Richard


