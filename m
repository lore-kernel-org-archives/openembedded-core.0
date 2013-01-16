Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TvWHQ-0007fJ-7t
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:56:05 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Jan 2013 08:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,480,1355126400"; d="scan'208";a="272837056"
Received: from unknown (HELO [10.255.14.217]) ([10.255.14.217])
	by orsmga002.jf.intel.com with ESMTP; 16 Jan 2013 08:40:28 -0800
Message-ID: <1358354428.1665.54.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Chris Larson <clarson@kergoth.com>
Date: Wed, 16 Jan 2013 10:40:28 -0600
In-Reply-To: <CABcZAN=u7_BGuAQGhYF134PedRq0KkHrgBEtPoN1Tet_T-O6Lw@mail.gmail.com>
References: <20130116115800.A69171034D@opal> <20130116140919.GD3002@jama>
	<1358350681.1665.31.camel@empanada>
	<CABcZAN=u7_BGuAQGhYF134PedRq0KkHrgBEtPoN1Tet_T-O6Lw@mail.gmail.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: the oe-core layer <openembedded-core@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>, Patches
Subject: Re: [oe-commits] Tom Zanussi : lttng2-ust: rename to lttng-ust
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 16:56:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-01-16 at 08:46 -0700, Chris Larson wrote:
> 
> On Wed, Jan 16, 2013 at 8:38 AM, Tom Zanussi <tom.zanussi@intel.com>
> wrote:
>         > lttng-ust had PE="1", bump PE to fix upgrade path:
> 
> Technically, that isn't going to "fix" the upgrade path. lttng 1.x
> requires kernel patches and isn't compatible with lttng 2.x, as far as
> I'm aware. So any machine with lttng 1.x that upgrades to this
> wouldn't be a real 'upgrade', it would switch interfaces, and
> potentially break compatibility with the kernel running on that
> device. At mentor we have bsp layers for 1.x and for 2.x, and both
> work. I'm glad we aren't binary package feed based, or we'd be in
> serious trouble with this.
> 

This is for the userspace tracing part, lttng-ust, which AFAIK doesn't
require any kernel patches.

The other lttng 2.x recipes weren't changed, just moved, so that
shouldn't break anything.

The lttng 1.x recipes were removed, however, since they do require
extensive kernel patches, and at least the recent Yocto kernels didn't
have those applied, mainly IIRC because the transition of the lttng
project in the meantime to version 2.0 made that difficult.  But now
that 2.0 is available there doesn't seem to be a good reason to keep 1.x
around especially considering the work involved in patching the kernel
and the fact that the functionality is mostly replaced by 2.0.

Tom






