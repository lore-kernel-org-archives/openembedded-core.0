Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D12B777D94
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 10:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491559620; x=1523095620;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=3B1FVjI8DhmoEUSxJU6k3+Oj/TSShNBhJ2KQHQ3/ie8=;
	b=RliAkVeTYHil5QrDme3jv/2i1YNEyQ9vrnQhltbkP2tt7aho4XdBdWer
	Yo5aeLvGcuWvDBXCpJXezXTETzVn1w==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Apr 2017 03:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,164,1488873600"; d="scan'208";a="1132509389"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.6.1])
	by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2017 03:06:56 -0700
Message-ID: <1491559615.3478.1.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 07 Apr 2017 11:06:55 +0100
In-Reply-To: <CAMKF1sq7VfdNAJG60Ls6aoQOW2YvHztNqk_z8JwVWO=m1LpkKQ@mail.gmail.com>
References: <cover.1491484515.git.joshua.g.lock@intel.com>
	<CAMKF1sq7VfdNAJG60Ls6aoQOW2YvHztNqk_z8JwVWO=m1LpkKQ@mail.gmail.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Fixes for building on Fedora 26 (Alpha)
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
X-List-Received-Date: Fri, 07 Apr 2017 10:06:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-04-06 at 06:50 -0700, Khem Raj wrote:
> On Thu, Apr 6, 2017 at 6:23 AM, Joshua Lock <joshua.g.lock@intel.com>
> wrote:
> > As Fedora 26 has a new gcc [1] and a new system pkg-config
> > implementation [2] I
> > wanted to do some testing on that host OS so that we might be able
> > to get some
> > fixes in before Pyro/2.3 is released.
> > 
> > The following series were the only changes required to start
> > building (I have
> > tested core-image-minimal, core-image-base and core-image-sato) on
> > Fedora 26.
> 
> gcc patch looks fine to me.

Thanks for the review.

> > 
> > 1. https://fedoraproject.org/wiki/Changes/GCC7
> > 2. https://fedoraproject.org/wiki/Changes/pkgconf_as_system_pkg-con
> > fig_implementation
> 
> I think we should think about making pkgconf as default too for OE in
> next release cycle.

I've filed that as a 2.4 enhancement bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11308

Joshua

