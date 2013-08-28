Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 279276B8A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 12:31:47 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Aug 2013 05:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,975,1367996400"; d="scan'208";a="287828173"
Received: from unknown (HELO helios.localnet) ([10.252.123.7])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Aug 2013 05:31:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>,
	Christopher Larson <chris_larson@mentor.com>
Date: Wed, 28 Aug 2013 13:31:39 +0100
Message-ID: <1705534.gI98rekybp@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130828081908.GF3544@jama>
References: <cover.1377285913.git.chris_larson@mentor.com>
	<20130828081908.GF3544@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 0/2] Add ca-certificates recipe
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
X-List-Received-Date: Wed, 28 Aug 2013 12:31:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 August 2013 10:19:08 Martin Jansa wrote:
> On Fri, Aug 23, 2013 at 12:26:13PM -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> > 
> > This is based on the meta-oe recipe, with enhancements, and prepopulates
> > the certificates for the nativesdk version, for later use in the
> > buildtools-tarball.
> > 
> > The following changes since commit 
9b05c65450526522d7358d0c0901b594de546748:
> >   sstate: Fix the relative symlink replacement code (2013-08-23 16:59:04
> >   +0100)> 
> > are available in the git repository at:
> >   https://github.com/kergoth/oe-core.git ca-certificates
> > 
> > Christopher Larson (2):
> >   ca-certificates: add recipe (version 20130610)
> >   nativesdk-ca-certificates: prepopulate ca-certificates.crt
> 
> Are you going to send patches to oe-devel to remove moved
> recipes/bbclasses ?

Martin is now aware, but FYI I've sent a patch for this.

Cheers,
Paul


