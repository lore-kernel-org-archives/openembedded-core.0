Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 678706B876
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 15:24:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Sep 2014 08:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,572,1406617200"; d="scan'208";a="606616050"
Received: from mpsamara-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.108])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2014 08:24:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, bruce.ashfield@windriver.com
Date: Mon, 22 Sep 2014 16:24:47 +0100
Message-ID: <2251278.GaOGmN6XgQ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.16.2-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
References: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] kernel: Enable externalsrc on kernels which instantiate kernel.bbclass
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
X-List-Received-Date: Mon, 22 Sep 2014 15:25:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 06 February 2014 02:05:05 Khem Raj wrote:
> This also make a change where for kernel
> S != B, this is done because when S = B
> and we use O= option or set KBUILD_OUTPUT
> to point to objectdir, kernel build system
> ends up denoting itself dirty and asking for
> running mrproper during later build steps
> after do_configure but works perfectly
> for when S != B
> 
> Additional fixes make sure that we do not
> assume directory paths when accessing files
> 
> Move exporting KBUILD_OUTPUT from kernel-yocto
> into kernel class
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

So discussion on this patch seems to have stalled - did you guys make any 
progress offline?

Looking over the patch I'd guess we'd want to try to avoid cd'ing and instead 
be explicit about the path where needed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

