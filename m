Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7F46B84D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 13:32:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Aug 2013 06:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,920,1367996400"; d="scan'208";a="365542211"
Received: from unknown (HELO helios.localnet) ([10.252.122.243])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2013 06:32:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Date: Tue, 20 Aug 2013 14:32:09 +0100
Message-ID: <11672169.pPNsTrMMam@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAF6bG8cHBD0+5JQfuXNNY0odSU3gs=_Son6zT4RXuH8eBfj=Xg@mail.gmail.com>
References: <CAF6bG8cHBD0+5JQfuXNNY0odSU3gs=_Son6zT4RXuH8eBfj=Xg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemu-native build regularly failing
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
X-List-Received-Date: Tue, 20 Aug 2013 13:32:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 20 August 2013 15:51:21 Marko Lindqvist wrote:
> Build of qemu-native regularly fails with:
> |   LINK  sh4-softmmu/qemu-system-sh4
> | 
> | /usr/lib/x86_64-linux-gnu/libXext.so.6: undefined reference to
> 
> `_XEatDataWords'
> 
> | collect2: error: ld returned 1 exit status
> 
> This might be some dependency missing, as building first some packets
> (+ more importantly their dependencies) that do not depend on qemu and
> only then qemu dependant image success.

Do you have something else causing libxext-native to be built by any chance?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

