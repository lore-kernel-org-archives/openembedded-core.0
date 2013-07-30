Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 609EC6B3F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 10:59:39 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Jul 2013 03:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,777,1367996400"; d="scan'208";a="275240255"
Received: from unknown (HELO helios.localnet) ([10.252.122.217])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 03:59:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 30 Jul 2013 11:59:32 +0100
Message-ID: <14478313.i1FmA8Di2T@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 30 Jul 2013 10:59:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 29 July 2013 19:26:27 Otavio Salvador wrote:
> This allow the addition and removal of distro features easily. To add
> a feature, use:
> 
>  EXTRA_DISTRO_FEATURES += "wayland"
> 
> and to remove, use '~' prefix, as:
> 
>  EXTRA_DISTRO_FEATURES += "~x11"
> 
> This code has been mostly copied from Mentor Graphics public layer but
> changed the variable name for a more descriptive name. 

1) Isn't this just adding list subtraction via the back door, which Richard 
has already argued against (mostly because the interaction between it and 
_append/_prepend will be hard to predict)?

2) Why not just set DISTRO_FEATURES to contain just the items you want in your 
distro configuration instead of trying to add and subtract from some previous 
value? What if the previous value changes in a way that no longer fits your 
desired configuration? Surely it is better to just be explicit.

3) Even if we were to add this here wouldn't users expect this to work in all 
such variables and not just DISTRO_FEATURES?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

