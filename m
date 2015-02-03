Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF1B60024
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 10:43:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Feb 2015 02:39:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,512,1418112000"; d="scan'208";a="680145072"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.17.39])
	by orsmga002.jf.intel.com with ESMTP; 03 Feb 2015 02:43:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
Date: Tue, 03 Feb 2015 10:43:06 +0000
Message-ID: <3305403.PEBTYygoE5@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1422873041-19803-1-git-send-email-florian.boor@kernelconcepts.de>
References: <1422873041-19803-1-git-send-email-florian.boor@kernelconcepts.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: Use bb.warn instead of bb.error for deprecation notification.
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
X-List-Received-Date: Tue, 03 Feb 2015 10:43:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Florian,

On Monday 02 February 2015 11:30:41 Florian Boor wrote:
> An error in bitbake/OE context is something fatal and interrupts the build.
> A deprecation warning is exactly what we have bb.warn for.

Out of interest, which layer are you including that needs fixing? Can we poke 
the layer maintainer to remove all references to PRINC?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

