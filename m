Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 098C3758DB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 13:03:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 08 Aug 2016 06:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="152358874"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2016 06:03:30 -0700
Message-ID: <1470661408.2138.69.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, "Maxin B. John"
	<maxin.john@intel.com>
Date: Mon, 08 Aug 2016 16:03:28 +0300
In-Reply-To: <CAJTo0LYCYsUFZ3_W-vRCh=TtmZe33zm-RFyukxbr84CQfi2+tQ@mail.gmail.com>
References: <1470654788-8717-1-git-send-email-maxin.john@intel.com>
	<1470654788-8717-2-git-send-email-maxin.john@intel.com>
	<CAJTo0LYCYsUFZ3_W-vRCh=TtmZe33zm-RFyukxbr84CQfi2+tQ@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] hdparm: update LICENSE info
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
X-List-Received-Date: Mon, 08 Aug 2016 13:03:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-08 at 12:23 +0100, Burton, Ross wrote:
> 
> On 8 August 2016 at 12:13, Maxin B. John <maxin.john@intel.com>
> wrote:
> > -LICENSE = "BSD"
> > +LICENSE = "BSD & GPLv2"
> >  LICENSE_wiper = "GPLv2"
> > 
> I sent a patch for this one last week but forgot to update the bug,
> sorry.
> 
> This isn't quite right as the hdparm utility itself is BSD licensed,
> so you also need LICENSE_${PN} = BSD.
> 
> That said Markus was saying last week that this behaviour isn't great
> (and neither was the original behaviour), so there may be more
> patches to improve how LICENSE works.

I opened a discussion on the architecture list:
http://lists.openembedded.org/pipermail/openembedded-architecture/2016-
August/000218.html

I'll hopefully have some patches after a satisfying solution is found.

Thanks,
  Markus

