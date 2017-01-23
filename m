Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9FA70101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 07:23:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 22 Jan 2017 23:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,273,1477983600"; d="scan'208";a="1116460570"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2017 23:23:17 -0800
Message-ID: <1485156197.41148.8.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Sun, 22 Jan 2017 23:23:17 -0800
In-Reply-To: <9d68428a1d2b7234a1a7ea6057e3b027e454db61.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
	<9d68428a1d2b7234a1a7ea6057e3b027e454db61.1484921498.git-series.patrick.ohly@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 05/12] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Mon, 23 Jan 2017 07:23:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-01-20 at 15:12 +0100, Patrick Ohly wrote:
> The traditional usage of ovmf via the qemu bios parameter is no longer
> supported

I don't see dropping support for this option in this series. Is part of
another series? I just checked the poky repo and I still the the option
supported. Or do you mean that only the ovmf recipe will not support
exporting bios.bin?

> and therefore it is not necessary to create a "bios.bin"
> file in the target sysroot.

Wouldn't this particular part of the patch break the existing runqemu.
If this is the case, perhaps the last patch (or a patch towards the end
of the series) can remove this functionality in both places.

On the other hand, this is a new recipe and this may not be super
critical. Especially if you meant that only OVMF will not support
installing bios.bin in sysroot. Maybe all is needed is some
clarification in the commit message.

Thanks and BR,
Ricardo


