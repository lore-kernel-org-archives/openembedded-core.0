Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A80F86FFCC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 19:31:55 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP; 05 Dec 2016 11:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,749,1477983600"; d="scan'208";a="39156823"
Received: from achong2-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.156.113])
	by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2016 11:31:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 06 Dec 2016 08:31:52 +1300
Message-ID: <1956643.Hk647jXyjn@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.10-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1480687192-4813-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1480687192-4813-1-git-send-email-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Add RPROVIDES bootloader
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
X-List-Received-Date: Mon, 05 Dec 2016 19:31:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Fabio,

On Fri, 02 Dec 2016 11:59:52 Fabio Berton wrote:
> This change allow to install u-boot in /boot partition using
> MACHINE_ESSENTIAL_EXTRA_RDEPENDS variable e.g.:
> 
> MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "bootloader"
> 
> This is usefull when system has only one partition and u-boot,
> kernel and device tree need to be installed in /boot.

If the intention is that other packages also have "bootloader" in RPROVIDES, I 
thought that these kinds of "virtual provides" weren't supported well by all 
of the package managers. (We might get away with it here since they probably 
will all be in their own separate machine-specific feeds, though).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

