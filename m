Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3C460169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 19:21:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Dec 2014 09:58:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,509,1413270000"; d="scan'208";a="632108682"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO [10.255.13.107])
	([10.255.13.107])
	by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2014 09:58:32 -0800
Message-ID: <1417629512.2427.3.camel@picadillo>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: akuster808 <akuster808@gmail.com>
Date: Wed, 03 Dec 2014 11:58:32 -0600
In-Reply-To: <547F313D.6020603@gmail.com>
References: <cover.1416585198.git.tom.zanussi@linux.intel.com>
	<547F12C2.5070700@balister.org> <547F313D.6020603@gmail.com>
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6][dizzy] some wic bugfixes
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
X-List-Received-Date: Wed, 03 Dec 2014 19:21:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-12-03 at 07:50 -0800, akuster808 wrote:
> 
> On 12/03/2014 05:40 AM, Philip Balister wrote:
> > On 11/21/2014 11:07 AM, Tom Zanussi wrote:
> >> >From the original posting:
> >>
> >> This patchset fixes a couple serious wic bugs:
> >>
> >> [YOCTO #6863] - Wic fails to create a working image for a large file system
> >> [YOCTO #6290] - Update WIC for gummiboot
> >>
> >> I generated core-image-sdk images for each of the wic image types and
> >> was able to fsck/mount the resulting filesystems.
> >>
> >> These should be applied to the next dizzy point release.
> >>
> >> The following changes since commit e69653b01dd8ad9fda2355b8112a65c813ce7fd5:
> >>
> >>    tzdata: update to 2014j (2014-11-17 08:01:21 -0800)
> >>
> >> are available in the git repository at:
> >>
> >>    git://git.yoctoproject.org/poky-contrib.git tzanussi/dizzy-next
> >>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/dizzy-next
> >>
> >> Tom Zanussi (6):
> >>    wic: Don't allow mkfs to fail silently in partition command
> >>    wic: Use overhead factor when creating partitions from rootfs
> >>      directories
> >
> > It looks like all the patches in this request made it into dizzy, except
> > the overhead factor one.
> 
> Then its not technically _all_ then ; )
> 
> Is there a reason for this?
> No reason. just missed it
> 
> Can we get the
> > overhead one into dizzy also?
> 
> sure.

And while the iron is hot, I'll ask about this one again:

  commit 4c222d3a67bae265ff42b448ef4a643b0131e578 
  Author: He Zhe <zhe.he@windriver.com>
  Date:   Tue Oct 21 17:47:44 2014 +0800

      kernel.bbclass: Create modules directory even if there is no modules
install


> 
> - Armin
> 
> >
> > Philip
> >
> >
> >
> >
> >>    wic: Update the help text to include -D (--debug)
> >>    Revert "wic: set bootimg_dir when using image-name artifacts"
> >>    wic: Remove special-case bootimg_dir
> >>    wic: Update bootimg-partition to use bootimg_dir
> >>
> >>   scripts/lib/image/engine.py                        | 42 +++++-----------------
> >>   scripts/lib/image/help.py                          | 23 ++++++++----
> >>   scripts/lib/wic/imager/direct.py                   |  5 +--
> >>   .../lib/wic/kickstart/custom_commands/partition.py | 24 +++++++++----
> >>   scripts/lib/wic/plugins/imager/direct_plugin.py    | 20 +++++------
> >>   scripts/lib/wic/plugins/source/bootimg-efi.py      |  5 ++-
> >>   .../lib/wic/plugins/source/bootimg-partition.py    |  9 +++--
> >>   scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  3 +-
> >>   scripts/lib/wic/utils/oe/misc.py                   |  1 +
> >>   scripts/wic                                        | 13 +++----
> >>   10 files changed, 68 insertions(+), 77 deletions(-)
> >>



