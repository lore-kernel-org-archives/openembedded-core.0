Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BB64A6B264
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 09:41:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2013 02:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,700,1367996400"; d="scan'208";a="348306970"
Received: from unknown (HELO helios.localnet) ([10.252.122.96])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2013 02:41:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Fri, 19 Jul 2013 10:41:20 +0100
Message-ID: <2871747.3HkfyQL6od@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CALmOhgkONNQgOjYsosWAk2avLr2nEukjRW=kFuAzLMyyvjEuGA@mail.gmail.com>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
	<51DAEEE9.6000203@windriver.com>
	<CALmOhgkONNQgOjYsosWAk2avLr2nEukjRW=kFuAzLMyyvjEuGA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3 v2] sanity.bbclass: Check for the known broken version of make
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
X-List-Received-Date: Fri, 19 Jul 2013 09:41:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 July 2013 16:14:55 Trevor Woerner wrote:
> On 8 July 2013 17:55, Mark Hatle <mark.hatle@windriver.com> wrote:
> > For anyone with an old or broken system, they will need to download (or
> > build) the buildtools..
> > install it and have it in their path prior to running oe-core.
> 
> Does a download location already exist with downloads available for
> people who receive this error when building? If so, could it be made
> part of the error message? Or maybe instead of asking people to use a
> working version of "make" the error message could instruct them to use
> one of these buildtools-tarball SDKs (and provide instructions for
> doing so)?

According to Beth, the current (nightly build) can be found here:

 http://autobuilder.yoctoproject.org/pub/nightly/CURRENT/buildtools/

Location for the upcoming 1.5 release when that is available:

 http://downloads.yoctoproject.org/releases/yocto/yocto-1.5/buildtools/

The tricky part is we don't have a solid location yet, only one being built 
from master. Perhaps we could link to an intermediary page with explanatory 
text that can link to the appropriate location.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

