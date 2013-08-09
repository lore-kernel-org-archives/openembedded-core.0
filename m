Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 911A76AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 16:37:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Aug 2013 09:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,846,1367996400"; d="scan'208";a="378643112"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2013 09:37:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 09 Aug 2013 17:37:20 +0100
Message-ID: <1991130.heSQ5hX7rv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAJTo0LZML+XWhhpj4PS2nXt3XzgzLDpay4wBBM-vsavVmcHWgA@mail.gmail.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
	<dd5b55f4d3f2ef9218001d44fbb3d848dbc91c1a.1376038140.git.paul.eggleton@linux.intel.com>
	<CAJTo0LZML+XWhhpj4PS2nXt3XzgzLDpay4wBBM-vsavVmcHWgA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] yasm: add from meta-oe and tweak
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
X-List-Received-Date: Fri, 09 Aug 2013 16:37:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 09 August 2013 17:32:58 Burton, Ross wrote:
> On 9 August 2013 09:59, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> > +SUMMARY = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
> 
> Does this mean we can drop nasm to avoid having numerous assemblers in
> oe-core?  You can't feed them after midnight you know.

I don't know what the comparison between the two is, but I suspect they are 
not interchangeable.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

