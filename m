Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 70C0F6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 20:16:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2018 12:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,409,1511856000"; d="scan'208";a="22305513"
Received: from meazahar-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.66.253])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2018 12:16:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Date: Thu, 25 Jan 2018 09:16:14 +1300
Message-ID: <2339727.dy8ZIkzkI5@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <b1d6d959-203c-b5b8-8442-12cc1e670a35@xilinx.com>
References: <151648753376.31338.5162580593839986526@git.openembedded.org>
	<2335819.HfQnGk64D5@peggleto-mobl.ger.corp.intel.com>
	<b1d6d959-203c-b5b8-8442-12cc1e670a35@xilinx.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/06: python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Wed, 24 Jan 2018 20:16:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 23 January 2018 11:48:21 AM NZDT Alejandro Enedino Hernandez 
Samaniego wrote:
> On 01/22/2018 12:28 PM, Paul Eggleton wrote:
> > It seems to me we need to do one of two things:
> >
> > A) Add explicit RPROVIDES so that the core package provides these things
> > for compatibility with existing recipes
> >
> > or
> >
> > B) Add something to the migration guide to explain what users need to do
> > in order to fix their recipes after this change - the staging area for
> > these is on the wiki (doesn't have to be fully fleshed out, just the bare
> > details would be sufficient) 
> > https://wiki.yoctoproject.org/wiki/FutureMigrationGuide

> I'd rather go with B) if thats ok, since the actual dependencies are 
> being met and basically deleting the dependency for which its 
> complaining from RDEPENDS would fix things.

OK, sounds good to me.

> > Could you please take care of this?
>
> Sure, I can do this!

Thanks!

-Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

