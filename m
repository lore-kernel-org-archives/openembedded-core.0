Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC1C6010E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 15:37:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2013 08:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,916,1371106800"; d="scan'208";a="404082184"
Received: from unknown (HELO helios.localnet) ([10.252.123.198])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2013 08:37:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Randy MacLeod <randy.macleod@windriver.com>, JC <jc@vtkloud.com>
Date: Mon, 16 Sep 2013 16:37:50 +0100
Message-ID: <3047549.YMT2qeacCQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52371CDF.4020607@windriver.com>
References: <52339BE5.8000804@vtkloud.com> <52371CDF.4020607@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: lib ao ?
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
X-List-Received-Date: Mon, 16 Sep 2013 15:37:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 16 September 2013 10:59:43 Randy MacLeod wrote:
> On 13-09-13 07:12 PM, JC wrote:
> > Hi,
> > 
> > I cannot find a trace of libao. Is this present somewhere in some
> 
> It is:
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/libao/libao_
> 0.8.8.bb
> > openembedded-* repo I would have missed ? I could not find it in
> > layers.openembedded.org

There isn't currently a libao recipe in common OE-Core based layers indexed by 
the layer index. FYI though there is a recipe in the unofficial (and apparently 
unmaintained) meta-jlime layer here:

https://github.com/tworaz/oe-tworaz/tree/master/meta-jlime

It would be great to have this added to meta-multimedia - please test it and 
if it works for you please feel free to send a patch adding it to meta-
multimedia.
 
> The UI for that site has changed, you have to set:
> Branch: OE-Classic
> to search meta-openembedded.
> 
> Painful, I know, but I assume there was confusion about what's in
> oe-core and what's in OE-Classic.

This is *not* correct. OE-Classic as shown in the layer index is OE-Classic, 
the old monolithic OpenEmbedded; it is not the same thing as meta-oe or any of 
the layers in the meta-openembedded repository.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

