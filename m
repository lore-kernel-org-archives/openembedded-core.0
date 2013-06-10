Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6578E61AC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 23:06:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jun 2013 16:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,841,1363158000"; d="scan'208";a="327329119"
Received: from unknown (HELO helios.localnet) ([10.252.122.19])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2013 16:06:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steve Sakoman <sakoman@gmail.com>
Date: Tue, 11 Jun 2013 00:06:38 +0100
Message-ID: <2342205.5KE7L6LC2a@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CAGDS+nkQ1u=bzhgDGJjMw+U99eazLb_Na51qmVSa2AGUrZM_QQ@mail.gmail.com>
References: <CAGDS+nkQ1u=bzhgDGJjMw+U99eazLb_Na51qmVSa2AGUrZM_QQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Sample recipe for qt4e app?
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
X-List-Received-Date: Mon, 10 Jun 2013 23:06:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Steve,

On Monday 10 June 2013 15:45:42 Steve Sakoman wrote:
> The qt-apps folder in oe-core only seems to have recipes for qt4-x11-free
> apps.
> 
> Does anyone have a recipe for a simple qt4e app that they would be
> willing to share?
> 
> I'm looking to get an idea of just how small a qt4e image can be
> without climbing the learning curve of writing a qt app and recipe :-)

It's not really much different; you should only need to inherit qt4e instead of
qt4x11. As for an example, you could look at the qconnman-e recipe in meta-oe:

http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-qt/qconnman

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

