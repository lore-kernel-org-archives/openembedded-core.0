Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4B7D26BA7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 08:48:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2013 01:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,974,1367996400"; d="scan'208";a="369633820"
Received: from unknown (HELO helios.localnet) ([10.252.123.7])
	by orsmga001.jf.intel.com with ESMTP; 28 Aug 2013 01:48:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, Mihai Prica <mihai.prica@intel.com>
Date: Wed, 28 Aug 2013 09:48:34 +0100
Message-ID: <11388358.dTZLhufORm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130828081814.GE3544@jama>
References: <cover.1377613447.git.mihai.prica@intel.com>
	<20130828081814.GE3544@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Add midori and dependencies
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
X-List-Received-Date: Wed, 28 Aug 2013 08:48:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 August 2013 10:18:15 Martin Jansa wrote:
> On Tue, Aug 27, 2013 at 05:59:34PM +0300, Mihai Prica wrote:
> > The Midori web-browser can be used to more easily test the functionality
> > of webkit-gtk.
> > 
> > * The midori and libnotify recipes are from meta-gnome.
> > * The python-docutils and vala recipes are from meta-oe.
> > * The midori and python-docutils packages have been updated to the latest
> > upstream version.
> > 
> > Midori also depends on ca-certificates. A patch set was sent by
> > Christopher
> > Larson that adds the recipe in oe-core. This series depends on his
> > addition.
>
> Are you going to send patches to oe-devel to remove moved
> recipes/bbclasses ?

I'll take care of this along with ca-certificates.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

