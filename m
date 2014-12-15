Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F3FB77113B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 17:05:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 15 Dec 2014 09:04:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="429202333"
Received: from unknown (HELO [10.255.13.117]) ([10.255.13.117])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Dec 2014 08:53:44 -0800
Message-ID: <1418663085.25212.13.camel@picadillo>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Mon, 15 Dec 2014 11:04:45 -0600
In-Reply-To: <1418211958-27738-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1418211958-27738-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	Rifenbark Scott <scott.m.rifenbark@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] wic: glob support & minor fixes
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
X-List-Received-Date: Mon, 15 Dec 2014 17:05:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-12-10 at 12:45 +0100, Maciej Borzecki wrote:
> This patch series adds changes that enable globbing in IMAGE_BOOT_FILES.
> Effectivey this makes use of with with Raspberry Pi a tad easier, when a
> lengthy list of boot files can be replaced with just one entry. A related
> change to meta-raspberrypi will be sent to the Yocto mailing list.
> 

Looks ok to me, and I tried it out with your raspberrypi layer changes
which generated the image (I didn't try any other image types to check
against regressions there, though nothing in here looks like it would
touch anything related to the other source plugins, so I'm not worried -
in the next milestone I hope to have some automated wic testing going to
make checking easy).

I do think, though, that we need to have the documentation for this in
the tool itself.  As it stands, the IMAGE_BOOT_FILES variable is
documented in the manual, but even then, there's no context that ties it
to the bootimg-partition plugin.  I think we need to add a mechanism so
that help text can be added to each plugin, which would be automatically
picked up and merged probably into a plugin-specific 'help plugins'
section in the tool.

The other thing I noticed, which has nothing to do with this patchset,
but along the same lines, is that the plugin machinery does find the
sdimage-raspberrypi.wks file to generate the image, as expected, but it
doesn't show up in 'wic list source-plugins', as you'd expect.

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>

> Maciej Borzecki (3):
>   wic: IMAGE_BOOT_FILES format checks in bootimg-partition source
>   wic: add globbing support in IMAGE_BOOT_FILES entries
>   ref-manual: update IMAGE_BOOT_FILES entry
> 
>  documentation/ref-manual/ref-variables.xml         | 37 +++++++++++++++----
>  .../lib/wic/plugins/source/bootimg-partition.py    | 43 +++++++++++++++++-----
>  2 files changed, 64 insertions(+), 16 deletions(-)
> 
> -- 
> 1.9.3
> 



