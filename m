Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B76936ADA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 12:47:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jun 2013 05:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="336978848"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by orsmga001.jf.intel.com with ESMTP; 28 Jun 2013 05:47:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Jun 2013 13:47:58 +0100
Message-ID: <3815006.ZFkv3UK0PI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <20130628124534.GN3261@jama>
References: <1371254791-8168-1-git-send-email-net147@gmail.com>
	<9031819.zlCvcHI3ah@helios> <20130628124534.GN3261@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4e.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Fri, 28 Jun 2013 12:47:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 June 2013 14:45:34 Martin Jansa wrote:
> On Fri, Jun 28, 2013 at 01:40:26PM +0100, Paul Eggleton wrote:
> > FWIW, I see the same error without this patch if I build qt4-embedded
> > after building qt4-x11, so I don't know if this patch is really related to
> > the problem or not.
> 
> It was building fine in world builds until 1-2 weeks ago, but it's
> possible that I was just lucky to have it in right order.

I'm pretty sure it's a recent regression, I'd be surprised if we never built 
them in the current order before on our autobuilder.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

