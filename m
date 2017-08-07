Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3795F6010B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 17:10:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 10:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,339,1498546800"; d="scan'208";a="120930000"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2017 10:10:43 -0700
Message-ID: <1502126358.2330.5.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 07 Aug 2017 12:19:18 -0500
In-Reply-To: <CAJTo0LbdWuxLS=4VKHbUZ_rcTrBk0MpJB78i11HbCnBmScm6CA@mail.gmail.com>
References: <20170804185703.51157-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170804185703.51157-2-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LY5mBjm586rFqHBofcZE3eSzY=kAaxp2P=4PBA-2nYwiA@mail.gmail.com>
	<1502125572.2330.3.camel@linux.intel.com>
	<CAJTo0LbdWuxLS=4VKHbUZ_rcTrBk0MpJB78i11HbCnBmScm6CA@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sstatetests: limit the number of signature comparisons when differ
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
X-List-Received-Date: Mon, 07 Aug 2017 17:10:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-07 at 18:05 +0100, Burton, Ross wrote:
> On 7 August 2017 at 18:06, Leonardo Sandoval
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>         yes, but we this way, we are not listing those > 20 and I
>         believe this
>         is important. This fix just diffsigs the first 20, and the
>         rest are just
>         listed for convenience.
> 
> 
> Good point.  You could neatly print the filenames in one iteration,
> and then the first 20 diffs in another loop.

not super convinced but yes, that can be a another way to avoid the if
inside the for body. I will send a v2.

Leo
> 
> 
>         also, sets are not 'subscriptable' thus slicing is not
>         possible on sets.
> 
> 
> Which is why I called list() before slicing.
> 
> 
> Ross 



