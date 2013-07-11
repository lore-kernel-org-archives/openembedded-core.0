Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 056C2601DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 09:23:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2013 02:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1042,1363158000"; d="scan'208";a="343849905"
Received: from unknown (HELO helios.localnet) ([10.252.122.35])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2013 02:23:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Thu, 11 Jul 2013 10:23:16 +0100
Message-ID: <2090020.yKL4kvvByo@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <51DE73A7.1070400@windriver.com>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
	<CALmOhgnqd_AEmtzgJ_4gCAJXiXYW=tHryRJVGwN-rUw5TXR5MQ@mail.gmail.com>
	<51DE73A7.1070400@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] nss: fix incorrect shebang line of perl script
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
X-List-Received-Date: Thu, 11 Jul 2013 09:23:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 11 July 2013 16:58:15 Hongxu Jia wrote:
> On 07/11/2013 04:39 PM, Trevor Woerner wrote:
> > On 10 July 2013 09:03, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> >> Replace incorrect shebang line with `#!/usr/bin/perl'.
> > 
> > I thought using 'env' was the preferred method?
> 
> If use 'env', should we add 'coreutils' on nss's DEPENDS?
> The coreutils provides env.

Our busybox configuration enables its version of env as well. I think it's 
pretty safe to assume this is available without the need for additional 
dependencies.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

