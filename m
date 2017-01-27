Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 48A4760119
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 03:25:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jan 2017 19:25:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,292,1477983600"; d="scan'208";a="813854687"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jan 2017 19:25:09 -0800
Message-ID: <1485487510.41148.67.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Thu, 26 Jan 2017 19:25:10 -0800
In-Reply-To: <1485157551.20333.14.camel@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
	<9d68428a1d2b7234a1a7ea6057e3b027e454db61.1484921498.git-series.patrick.ohly@intel.com>
	<1485156197.41148.8.camel@ranerica-desktop>
	<1485157551.20333.14.camel@intel.com>
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
X-List-Received-Date: Fri, 27 Jan 2017 03:25:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-01-23 at 08:45 +0100, Patrick Ohly wrote:
> > On the other hand, this is a new recipe and this may not be super
> > critical. Especially if you meant that only OVMF will not support
> > installing bios.bin in sysroot. Maybe all is needed is some
> > clarification in the commit message.
> 
> Care to suggest something? ;-) To me, "traditional usage of ovmf ...
> is
> no longer supported" already says that this is a statement about ovmf,
> not the bios parameter, so I'm not sure how to reword this.

Perhaps specifying what "traditional usage" means, both when using
runqemu or qemu directly. I think this is useful as you devoted a fair
amount of effort to enable your work in qemu. Mentioning the qemu
features could be useful to people using qemu directly.

Thanks and BR,
Ricardo


