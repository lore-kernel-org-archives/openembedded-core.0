Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1E98E6AF6D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 11:14:31 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2013 04:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1027,1363158000"; d="scan'208";a="265836154"
Received: from unknown (HELO helios.localnet) ([10.252.121.245])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2013 04:14:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Liu Ting-B28495 <B28495@freescale.com>,
	Guo Chunrong-B40290 <B40290@freescale.com>
Date: Tue, 09 Jul 2013 12:14:28 +0100
Message-ID: <1899518.lrLlCUV9nm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <AF604684617F454390621992F367F1690BA97FAF@039-SN2MPN1-011.039d.mgd.msft.net>
References: <1373356003-20356-1-git-send-email-B40290@freescale.com>
	<AF604684617F454390621992F367F1690BA97FAF@039-SN2MPN1-011.039d.mgd.msft.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] common-licenses: Adding netperf
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
X-List-Received-Date: Tue, 09 Jul 2013 11:14:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 July 2013 08:01:58 Liu Ting-B28495 wrote:
> Netperf is restricted license. I don't think oe-core will accept it.
> 
> We add below line in fsl-setup-poky:
> echo "# whiteliste restricted license" >> conf/local.conf
> echo "LICENSE_FLAGS_WHITELIST = \"non-commercial_netperf\"" >>
> conf/local.conf
> 
> -Ting
> 
> > -----Original Message-----
> > From: Guo Chunrong-B40290
> > Sent: Tuesday, July 09, 2013 3:47 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo
> > Chunrong-B40290
> > Subject: [OE-core][PATCH] common-licenses: Adding netperf
> > 
> >        *netperf requires it's own specific license when
> >        add meta-openembedded layer
> > 
> > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > ---
> > 
> >  meta/files/common-licenses/netperf |   43
> > 
> > ++++++++++++++++++++++++++++++++++++
> > 
> >  1 files changed, 43 insertions(+), 0 deletions(-)  create mode 100644
> > 
> > meta/files/common-licenses/netperf
> > 
> > diff --git a/meta/files/common-licenses/netperf b/meta/files/common-
> > licenses/netperf
> > new file mode 100644
> > index 0000000..3f3ceb2
> > --- /dev/null
> > +++ b/meta/files/common-licenses/netperf
> > @@ -0,0 +1,43 @@
> > +
> > +
> > +              Copyright (C) 1993 Hewlett-Packard Company
> > +                         ALL RIGHTS RESERVED.
> > +
> > +  The enclosed software and documentation includes copyrighted works
> > + of Hewlett-Packard Co. For as long as you comply with the following
> > + limitations, you are hereby authorized to (i) use, reproduce, and
> > + modify the software and documentation, and to (ii) distribute the
> > + software and documentation, including modifications, for
> > + non-commercial purposes only.
> > +
> > +  1.  The enclosed software and documentation is made available at no
> > +      charge in order to advance the general development of
> > +      high-performance networking products.
> > +
> > +  2.  You may not delete any copyright notices contained in the
> > +      software or documentation. All hard copies, and copies in
> > +      source code or object code form, of the software or
> > +      documentation (including modifications) must contain at least
> > +      one of the copyright notices.
> > +
> > +  3.  The enclosed software and documentation has not been subjected
> > +      to testing and quality control and is not a Hewlett-Packard Co.
> > +      product. At a future time, Hewlett-Packard Co. may or may not
> > +      offer a version of the software and documentation as a product.
> > +
> > +  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
> > +      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
> > +      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
> > +      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
> > +      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
> > +      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
> > +      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
> > +      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
> > +      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> > +
> > +  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
> > +      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
> > +      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
> > +      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.
> > +
> > +
> > --

The answer here may be that the layer that adds the recipe (meta-networking in 
this case) should add the license rather than it being added to OE-Core. To do 
this, add the following to the layer's conf/layer.conf:

LICENSE_PATH += "${LAYERDIR}/licenses"

Then put the netperf file in a "licenses" subdirectory within the layer.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

