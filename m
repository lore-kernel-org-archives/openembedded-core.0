Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A8D577846A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 08:59:10 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 01:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,387,1498546800"; d="scan'208";a="138624755"
Received: from qnguye5-mobl1.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.135.6])
	by orsmga005.jf.intel.com with ESMTP; 17 Aug 2017 01:59:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	juan.m.cruz.alcaraz@linux.intel.com
Date: Thu, 17 Aug 2017 20:59:04 +1200
Message-ID: <1812364.na1VDiqueP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1502955374.13978.182.camel@linuxfoundation.org>
References: <20170817013615.5900-1-juan.m.cruz.alcaraz@linux.intel.com>
	<1502955374.13978.182.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation.
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
X-List-Received-Date: Thu, 17 Aug 2017 08:59:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 17 August 2017 7:36:14 PM NZST Richard Purdie wrote:
> On Wed, 2017-08-16 at 18:36 -0700, juan.m.cruz.alcaraz@linux.intel.com
> wrote:
> > From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
> > 
> > The eSDK installation requires the meta-skeleton layer.
> > The build system might use the meta-skeleton recipes as layout
> > to create custom recipes. An example is the recipetool script
> > that uses the meta-skeleton kernel recipe when creating a custom
> > kernel recipe.
> > 
> > [YOCTO #11102]
> > 
> > Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.c
> > om>
> > ---
> >  meta/lib/oe/copy_buildsystem.py | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> 
> Failed to build on the autobuilder I'm afraid:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/1216/
steps/BuildImages_2/logs/stdio

Right, the assumption that the first part will be "poky/" is probably the 
issue here. I suspect you will have to step through the list and remove 
anything that ends with '/meta-skeleton'.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

