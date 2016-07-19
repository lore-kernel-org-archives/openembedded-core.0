Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8F270100
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 00:45:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 18 Jul 2016 17:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,386,1464678000"; d="scan'208";a="997889650"
Received: from scvick-mobl.amr.corp.intel.com ([10.254.24.153])
	by orsmga001.jf.intel.com with ESMTP; 18 Jul 2016 17:45:52 -0700
Date: Mon, 18 Jul 2016 17:45:52 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160719004552.GA25758@scvick-mobl.amr.corp.intel.com>
References: <20160711175529.2650-1-stephano.cetola@linux.intel.com>
	<20160711175529.2650-2-stephano.cetola@linux.intel.com>
	<CAJTo0LZfTnmKoMCwjZhU9-ooBZm4F1vsy=vC4sh9p0HQF6mVKQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZfTnmKoMCwjZhU9-ooBZm4F1vsy=vC4sh9p0HQF6mVKQ@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-07-01)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] rootfs.py: allow removal of support packages
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
X-List-Received-Date: Tue, 19 Jul 2016 00:45:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/18, Burton, Ross wrote:
> On 11 July 2016 at 18:55, Stephano Cetola <stephano.cetola@linux.intel.com>
> wrote:
> 
> > +            unneeded_pkgs.extend(self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL",
> > +                True).split(","))
> >
> 
> Sorry for not getting around to reviewing this...
> 
> That variable is whitespace separated, not comma.
> 
> Ross

There should be a V4 out there already that splits off space. Not sure what I
was thinking here, but I realized pretty quickly my mistake :)

https://patchwork.openembedded.org/patch/126893/

Cheers,
Stephano


