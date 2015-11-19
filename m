Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D514F60107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 10:31:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2015 02:31:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,317,1444719600"; d="scan'208";a="823928064"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 19 Nov 2015 02:31:30 -0800
Date: Thu, 19 Nov 2015 12:32:32 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20151119103231.GA31951@mbabyjoh-mobl.fi.intel.com>
References: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
	<564D55D4.1000808@windriver.com>
MIME-Version: 1.0
In-Reply-To: <564D55D4.1000808@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] iproute2: update to 4.3.0
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
X-List-Received-Date: Thu, 19 Nov 2015 10:31:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Nov 18, 2015 at 11:53:40PM -0500, Randy MacLeod wrote:
> On 2015-11-18 04:34 AM, Maxin B. John wrote:
> >4.1.1 -> 4.3.0
> >
> >Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >---
> >  .../iproute2/{iproute2_4.1.1.bb => iproute2_4.3.0.bb}                 | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-connectivity/iproute2/{iproute2_4.1.1.bb => iproute2_4.3.0.bb} (68%)
> >
> >diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb b/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
> >similarity index 68%
> >rename from meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb
> >rename to meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
> >index 10db0ba..0b3d896 100644
> >--- a/meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb
> >+++ b/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
> >@@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
> >             file://configure-cross.patch \
> >             file://0001-iproute2-de-bash-scripts.patch \
> >            "
> >-SRC_URI[md5sum] = "39290cb3a55d38dd8d10e19a3094109f"
> >-SRC_URI[sha256sum] = "73077a989efb934450bd655cbd9aaddaa747cb696c64d0c9a3323768a6a8e66f"
> >+SRC_URI[md5sum] = "1a2bbb80cfc7ab3f3e987e18b3207c2f"
> >+SRC_URI[sha256sum] = "f03b1188dd6c039512424de82ff7a8f3b446680bd4e908ff42a7b9b137422995"
> >
> >  # CFLAGS are computed in Makefile and reference CCOPTS
> >  #
> >
> 
> 
> There are other iproute utilities that are not yet packaged:
>    misc netem genl tipc
> and perhaps more from the make install rule:
>   for i in lib ip tc bridge misc netem genl tipc man; \
> Note that misc contains these executables:
> 
> misc/lnstat
> misc/ifstat
> misc/arpd
> misc/rtacct
> misc/nstat
> misc/ss
>

Good catch. Yes, we haven't packaged the above mentioned binaries, cbq 
and shared libraries (q_netem.so) here.

> Do we want individual iproute2-FOO packages or a catchall
> iproute2-extras ?
> I think additional packages for each of: misc netem genl tipc
> should be fine but I haven't played with these tools recently
> so input is welcome.

IMHO, we shouldn't add more complexity in recipe or new recipess for this. 
We should use the iproute2 recipe to install all these binaries.

> 
> These were not packaged in jethro AFAIK so we should pull the
> patch back once there is consensus.

Yes. These binaries were not packaged in jethro as well. I am not sure about the 
historical reason behind it. Since jethro can't accept "new binaries" at
this stage, I guess, we should update the iproute2 recipe present in the master branch.

> -- 
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada,
> K2K 2W5

Best Regards,
Maxin


