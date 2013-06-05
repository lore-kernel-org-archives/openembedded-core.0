Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D1ECE6065C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 16:57:33 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2013 09:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,808,1363158000"; d="scan'208";a="251074985"
Received: from unknown (HELO helios.localnet) ([10.252.121.228])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jun 2013 09:57:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 05 Jun 2013 17:57:32 +0100
Message-ID: <2054363.UxqkIOrzAJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-23-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <51AF6B79.3040506@linux.intel.com>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<20130605093056.GD30727@jama> <51AF6B79.3040506@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Wed, 05 Jun 2013 16:57:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 05 June 2013 09:46:49 Saul Wold wrote:
> On 06/05/2013 02:30 AM, Martin Jansa wrote:
> > On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
> >> qconfig.pri was not being loaded by qmake properly. This means Qt
> >> qmake projects are unable to query QT_ARCH, QT_VERSION and other
> >> variables defined in qconfig.pri.
> >> 
> >> Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig.pri
> >> so that it can be located by qmake.
> > 
> > There is such patch already:
> > http://lists.openembedded.org/pipermail/openembedded-core/2013-May/078314.
> > html
>
> Got lost in my queue, adding it for the next MUT.

FWIW I am still concerned by the assertion in the commit message about it 
causing undesirable behaviour. I'd want that checked out and the note removed 
before we look at merging this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

