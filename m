Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7394A6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 12:10:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2016 05:10:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,574,1459839600"; d="scan'208";a="1010619188"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.30.71])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2016 05:10:35 -0700
Message-ID: <1467634234.2767.3.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	openembedded-core@lists.openembedded.org, peter.seebach@windriver.com
Date: Mon, 04 Jul 2016 13:10:34 +0100
In-Reply-To: <d1e04a54-0d95-3add-7f29-5bacff43451f@linux.intel.com>
References: <1467401433-2237-1-git-send-email-joshua.g.lock@intel.com>
	<1467401433-2237-2-git-send-email-joshua.g.lock@intel.com>
	<d1e04a54-0d95-3add-7f29-5bacff43451f@linux.intel.com>
X-Mailer: Evolution 3.20.3 (3.20.3-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] pseudo: upgrade to 1.8.0
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
X-List-Received-Date: Mon, 04 Jul 2016 12:10:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-07-04 at 14:36 +0300, Alexander Kanavin wrote:
> On 07/01/2016 10:30 PM, Joshua Lock wrote:
> > * drop patches where the changes exist upstream
> > * fetch from git as no tarball is available for 1.8.0
> 
> > diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.0.bb
> > b/meta/recipes-devtools/pseudo/pseudo_1.8.0.bb
> > new file mode 100644
> > index 0000000..08477ff
> > --- /dev/null
> > +++ b/meta/recipes-devtools/pseudo/pseudo_1.8.0.bb
> > @@ -0,0 +1,14 @@
> > +require pseudo.inc
> > +
> > +SRCREV = "786c6d3813622d18e12d36c4aa722af6a417c8fa"
> > +PV = "1.8.0+git${SRCPV}"
> > +
> > +SRC_URI = "git://git.yoctoproject.org/pseudo \
> 
> This commit id refers to version 1.7.5, and version 1.8.0 is not
> tagged 
> at all in the git repository. Can you fix that please?

Thanks for catching this, I failed badly at merging some local changes.

I will send a v2 with the correct SRCREV. I'll also see whether I can
convince someone to tag the repo.

Regards,

Joshua

