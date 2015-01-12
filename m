Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 870EF7246D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 12:04:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 12 Jan 2015 03:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="510914177"
Received: from fcrouzet-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.81])
	by orsmga003.jf.intel.com with ESMTP; 12 Jan 2015 03:58:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 12 Jan 2015 12:04:18 +0000
Message-ID: <2333301.OCoA7eKtKt@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <20150108181342.GB28640@crash.betafive.co.uk>
References: <20150108181342.GB28640@crash.betafive.co.uk>
MIME-Version: 1.0
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [dylan] Backport request
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
X-List-Received-Date: Mon, 12 Jan 2015 12:04:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Paul,

On Thursday 08 January 2015 18:13:42 Paul Barker wrote:
> I know dylan is old but it's still the recommended branch for the TI MCSDK.
> We've ran into a problem automating deployment as symlinks aren't created
> for the modules archives when they are deployed. This was fixed by commit
> ef9fad8fff1c413bc0eab15625f051d4e2d0a201 in openembedded-core which looks
> pretty simple. I've tested this on the dylan branch in our builds and it
> works.
> 
> Could this be backported to the dylan branch please?

No problem, Richard has now applied this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

