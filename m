Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id DC3EC78055
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 23:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 05B6520A3B;
	Tue, 17 Oct 2017 23:56:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id T3khtKwpPwDO; Tue, 17 Oct 2017 23:56:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CE557204B1;
	Tue, 17 Oct 2017 23:56:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 617F2162706; Tue, 17 Oct 2017 19:56:07 -0400 (EDT)
Date: Tue, 17 Oct 2017 19:56:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171017235607.GP9221@denix.org>
References: <1507836933-142066-1-git-send-email-denis@denix.org>
	<CAJTo0LZOauk809g+8dCqk2t0sp24v6HJA6fGSQtYH0On1mC6Kg@mail.gmail.com>
	<20171013162825.GN9221@denix.org> <20171016174814.GV9221@denix.org>
	<CAJTo0LZMbLTY8v-yob9SBazYDpM_4QVDYKAuV6VreUmymcJVZw@mail.gmail.com>
	<20171016205422.GY9221@denix.org>
	<CAJTo0LYmZqnU-Mo1hcheUcfkr+ZRvU4ps8g3oUtgUOReyyUwdA@mail.gmail.com>
	<20171017225325.GM9221@denix.org>
MIME-Version: 1.0
In-Reply-To: <20171017225325.GM9221@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wayland-protocols: upgrade to 1.11
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
X-List-Received-Date: Tue, 17 Oct 2017 23:56:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 17, 2017 at 06:53:25PM -0400, Denys Dmytriyenko wrote:
> On Mon, Oct 16, 2017 at 09:56:56PM +0100, Burton, Ross wrote:
> > On 16 October 2017 at 21:54, Denys Dmytriyenko <denis@denix.org> wrote:
> > 
> > > On Mon, Oct 16, 2017 at 09:31:49PM +0100, Burton, Ross wrote:
> > > > On 16 October 2017 at 18:48, Denys Dmytriyenko <denis@denix.org> wrote:
> > > >
> > > > > On Fri, Oct 13, 2017 at 12:28:25PM -0400, Denys Dmytriyenko wrote:
> > > > > > On Fri, Oct 13, 2017 at 12:33:35PM +0100, Burton, Ross wrote:
> > > > > > > On 12 October 2017 at 20:35, Denys Dmytriyenko <denis@denix.org>
> > > > > wrote:
> > > > > > >
> > > > > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > > > > >
> > > > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > > >
> > > > > > >
> > > > > > > One day I'll figure out why quilt appears to be non-deterministic
> > > about
> > > > > > > this but:
> > > > > > >
> > > > > > > ERROR: wayland-protocols-1.11-r0 do_patch: Command Error: 'quilt
> > > > > --quiltrc
> > > > > > > /data/poky-tmp/master/build/work/all-poky-linux/wayland-
> > > > > protocols/1.11-r0/recipe-sysroot-native/etc/quiltrc
> > > > > > > push' exited with 0  Output:
> > > > > > > Applying patch usesysrootprefixforpkgdatadirvariable.patch
> > > > > >
> > > > > > I don't see this patch in master. Works fine in distroless and poky
> > > from
> > > > > > master.
> > > > >
> > > > > Ping.
> > > >
> > > > The patch fails here, so I'm waiting for a v2.
> > >
> > > As I said above - there's no usesysrootprefixforpkgdatadirvariable.patch
> > > in
> > > wayland-protocols recipe in master, master-next or rocko branches:
> > >
> > > http://cgit.openembedded.org/openembedded-core/tree/meta/
> > > recipes-graphics/wayland/wayland-protocols_1.10.bb
> > >
> > > Are you sure you don't have something in your local tree?
> > >
> > 
> > Damnit, yes.  There's an earlier series to remove the nasty hacks. I
> > realised this when I saw your first reply to my patch but then forgot
> > again, sorry!
> > 
> > One of them needs to land first, and they won.  Wait for master to re-open,
> > or rebase on top of ross/mut.
> 
> I'm not sure how this is possible, when new revisions of that patch are still 
> coming in - v5 was just submitted yesterday, while ross/mut shows the patch 
> was merged 6 hours ago (unless you rebased your branch, of course)...
> 
> Anyway, looks like the patch that breaks for you is a backport from version 
> 1.11, for which I submitted the update, so it simply needs to be dropped.

v2 has been posted.

