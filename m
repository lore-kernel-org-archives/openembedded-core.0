Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 10CC2780A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 20:39:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 24 May 2017 13:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,388,1491289200"; d="scan'208";a="91402589"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2017 13:39:17 -0700
Message-ID: <1495658864.26945.1.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 May 2017 15:47:44 -0500
In-Reply-To: <CAJTo0LaJrNTwML2jQbPR+p5y3EOnwm=D2nDiD5VcHtfer8m+gA@mail.gmail.com>
References: <20170503192603.41086-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170522164309.31121-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LaJrNTwML2jQbPR+p5y3EOnwm=D2nDiD5VcHtfer8m+gA@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] package_ipk: correct ipk descriptions
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
X-List-Received-Date: Wed, 24 May 2017 20:39:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-05-24 at 21:15 +0100, Burton, Ross wrote:
> 
> On 22 May 2017 at 17:43, <leonardo.sandoval.gonzalez@linux.intel.com>
> wrote:
>         Empty descriptions are set with a space following by a dot.
>         For the non-empty ones,
>         there is no need for formating the description with textwrap,
>         so remove the logic
>         for the latter.
>         
> 
> Looks like opkg doesn't behave like this as building lzop fails (which
> has lots of newlines embedded in the SUMMARY).

I will check that particular recipe and bb world just so see if some
other recipe is broken with this change, then provide a v3.

Leo
> 
> 
> Ross



