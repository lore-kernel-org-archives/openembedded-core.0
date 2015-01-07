Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B68F372882
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 09:20:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 07 Jan 2015 01:17:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,713,1413270000"; d="scan'208";a="665685220"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2015 01:20:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Wed, 07 Jan 2015 09:20:25 +0000
Message-ID: <1458514.BbQ6jzxGvE@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <15bba8b20b0419737801a6c495d379afb8ed67b2.1420610929.git.Chong.Lu@windriver.com>
References: <cover.1420610929.git.Chong.Lu@windriver.com>
	<15bba8b20b0419737801a6c495d379afb8ed67b2.1420610929.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] layerindex.bbclass: Add ability to fetch layers from layer index
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
X-List-Received-Date: Wed, 07 Jan 2015 09:20:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chong,

On Wednesday 07 January 2015 14:35:42 Chong Lu wrote:
> It maybe depends on other layers when one layer is added to BBLAYERS. If
> define LAYERDEPENDS variable in this layer, we will get error from bitbake.
> But sometimes, we don't have defined. Add a mechanism to fetch layers from
> layer index and update bblayers.conf as appropriate. The layer index stores
> dependencies of all layers. Query dependency from layer index and fetch
> layer repo, then add this layer to BBLAYERS.

Hmm, this is certainly interesting but not quite what I had in mind - I was 
thinking rather that bitbake-layers would be extended and it would be an 
explicit operation to add a layer from the layer index + all of its 
dependencies. We can of course also have something semi-automatic like this 
class, but the manual tool ought to come first IMHO (which the class could then 
make use of).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

