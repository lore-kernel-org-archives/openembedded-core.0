Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Snk3p-0006Rd-OO
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 07:29:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jul 2012 22:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="165302252"
Received: from unknown (HELO [10.255.13.33]) ([10.255.13.33])
	by azsmga001.ch.intel.com with ESMTP; 07 Jul 2012 22:18:24 -0700
Message-ID: <1341724701.6761.177.camel@trz-ThinkPad-T420>
From: Tom Zanussi <tom.zanussi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 08 Jul 2012 00:18:21 -0500
In-Reply-To: <cover.1341606068.git.tom.zanussi@intel.com>
References: <cover.1341606068.git.tom.zanussi@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] perf-scripting/perf-tui features, v2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Jul 2012 05:29:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-06 at 15:29 -0500, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
> 
> This patchset adds perf-scriping and perf-tui features as
> a per-arch thing rather than per-machine, as suggested by
> Richard Purdie.
> 
> I just started testing this, it works so far, but thought
> I'd put it out there now in case there were comments before
> putting too much effort into that, and possibly giving other
> people a chance to try it out.
> 

Looks fine after more build-testing: qemux86, qemux86-64, crownbay,
sugarbay, qemuarm and qemuppc both with and without perf-scripting and
perf-tui, and builds without perf as well all build fine here.

Tom

> The following changes since commit 5051e9837fa698e03d0a7a8a918ee7aa98409ce1:
>   Robert P. J. Day (1):
>         bitbake: usermanual: Fix missing markup
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-scripting-v2
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/perf-scripting-v2
> 
> Tom Zanussi (3):
>   perf: add perf.inc
>   perf: add arch-specific perf-scripting feature
>   perf: add arch-specific perf-tui feature
> 
>  meta/recipes-kernel/perf/perf.inc    |   30 ++++++++++++++++++++++++++++++
>  meta/recipes-kernel/perf/perf_3.4.bb |   18 +++++++++++++++---
>  2 files changed, 45 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-kernel/perf/perf.inc
> 




