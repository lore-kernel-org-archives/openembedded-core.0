Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EF6E6731F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 21:49:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2016 13:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,437,1449561600"; d="scan'208";a="914128040"
Received: from dmcerlea-mobl1.ger.corp.intel.com (HELO
	jlock-mobl1.gar.corp.intel.com) ([10.252.13.227])
	by fmsmga002.fm.intel.com with ESMTP; 12 Feb 2016 13:49:05 -0800
Message-ID: <1455313743.3546.23.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 21:49:03 +0000
In-Reply-To: <548649854.435770.1455297246525.JavaMail.open-xchange@ox1.netart.com.pl>
References: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
	<548649854.435770.1455297246525.JavaMail.open-xchange@ox1.netart.com.pl>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH] os-release: remove double-quotes around VERSION_ID value
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
X-List-Received-Date: Fri, 12 Feb 2016 21:49:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-02-12 at 18:14 +0100, Maciej Borzecki wrote:
> > Dnia 12 luty 2016 o 13:15 Dmitry Rozhkov <dmitry.rozhkov@intel.com>
> > napisał(a):
> > 
> > This becomes crucial when ClearLinux's software
> > update mechanism is integrated into builds, because
> > its client side ignores VERSION_ID's value if it
> > doesn't conform the definition.
> 
> Is this integration work already published somewhere? I'm interested
> in trying out swupdate with Yocto, but the lack of publicly available
> repo is kind of holding this back (yes, I'm ware of SRPMs).

I'm working on integrating swupd into OE-Core, it's a work in progress
and so far nothing has been published (the work is not yet in a
functional state).

The recipes we are currently using for swupd-server and swupd-client
use the src.rpm's from clearlinux.org

> Do you mind sharing the some details if there is a larger plan for
> getting Clear closer to Yocto/OE?

We have a couple of tickets in the Yocto Project bugzilla[1][2] which
give an overview of the approach I'm taking for this initial
implementation.

The approach is fairly conservative in an attempt to get something
usable integrated that lets us work with the swupd developers to iron
out issues with utilising swupd from within OE.

Regards,

Joshua

1. https://bugzilla.yoctoproject.org/show_bug.cgi?id=9039
2. https://bugzilla.yoctoproject.org/show_bug.cgi?id=9040



