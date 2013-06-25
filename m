Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D59C260780
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 10:41:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jun 2013 03:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,936,1363158000"; d="scan'208";a="335170507"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by orsmga001.jf.intel.com with ESMTP; 25 Jun 2013 03:41:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Kang Kai <Kai.Kang@windriver.com>
Date: Tue, 25 Jun 2013 11:41:36 +0100
Message-ID: <1810438.1YW5iENKFC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <51C963C0.5020009@windriver.com>
References: <51C963C0.5020009@windriver.com>
MIME-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Could qt4.8 build on mips 64 bits platform?
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
X-List-Received-Date: Tue, 25 Jun 2013 10:41:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 25 June 2013 17:32:48 Kang Kai wrote:
> Could qt4.8 build on mips 64 bits platform?
> 
> I searched qt-project.org and no such related information.
> And then grep the source codethat no such mips64 keyword in file
> qmake.conf under directory mkspecs. In contrast there are mips32 related
> flags in mkspecs/qws/linux-mips-g++/qmake.conf.
> 
> Does that mean we still can't build qt 4.8 on mips64?

I don't have any specific knowledge here; I'd suggest trying it. If additional 
patches are needed the best thing would be to try and get those merged 
upstream.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

