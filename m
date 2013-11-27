Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EFFB56D586
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 20:26:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Nov 2013 12:22:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,784,1378882800"; d="scan'208";a="416153852"
Received: from unknown (HELO helios.localnet) ([10.252.122.36])
	by orsmga001.jf.intel.com with ESMTP; 27 Nov 2013 12:26:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>
Date: Wed, 27 Nov 2013 20:26:14 +0000
Message-ID: <5898776.30KuBfGzaR@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CABcZANkJoSBLjV6Td1eCZFJqOuYY_9+Nepti1zRsJey4q75HWg@mail.gmail.com>
References: <cover.1385467738.git.paul.eggleton@linux.intel.com>
	<CABcZANkJoSBLjV6Td1eCZFJqOuYY_9+Nepti1zRsJey4q75HWg@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Image manifest support
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
X-List-Received-Date: Wed, 27 Nov 2013 20:26:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chris,

On Wednesday 27 November 2013 12:02:41 Chris Larson wrote:
> Would you mind summarizing the differences between this and the already
> emitted image license manifest in deploy/license?

Actually I hadn't appreciated that there is a plain package list in that 
directory now in addition to the license manifest; however with this version:

1) It's right next to the image(s) instead of in another directory

2) The package version is in the same file next to the package name rather than 
in a separate file where fields are spread over multiple lines (which is harder 
to process)

3) It includes the package architecture

4) This isn't for licensing purposes, so it doesn't include any license 
information

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

