Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 24F026ABF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:29:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2013 15:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,962,1363158000"; d="scan'208";a="361350952"
Received: from unknown (HELO helios.localnet) ([10.252.122.99])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2013 15:29:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 28 Jun 2013 23:29:54 +0100
Message-ID: <2032984.e8lyiF9NsH@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CAP9ODKqJuwRmyah=LU5zcTccQWZkdfFJvBbQ81VZpooCMbpHbA@mail.gmail.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
	<CAP9ODKqJuwRmyah=LU5zcTccQWZkdfFJvBbQ81VZpooCMbpHbA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/8] Proposed implementation of a new runtime tests framework
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
X-List-Received-Date: Fri, 28 Jun 2013 22:29:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 June 2013 19:06:04 Otavio Salvador wrote:
> Did you think about adding something like an overidable set of hooks
> which starts, setup image and shutdown the machine? This would allow
> same framework to be used for real hardware test.

Yes, we did think about this; the way this would be done would be to simply 
swap out the QemuRunner instance at runtime with some other class that has the 
same interface which would provision a real machine. However there is no 
established framework for doing the latter, and at the moment we just want to 
concentrate on getting runtime tests working. As long as the tests themselves 
know as little as possible about the machine they are running in then 
switching over to real hardware is pretty straightforward, and we've tried to 
design things in that manner.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

