Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SpNZE-00037C-IX
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 19:52:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2012 10:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="165008239"
Received: from unknown (HELO helios.localnet) ([10.252.121.24])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2012 10:41:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 12 Jul 2012 18:41:28 +0100
Message-ID: <1719877.VOngMK1fKZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1342114502-31881-1-git-send-email-sgw@linux.intel.com>
References: <1342114502-31881-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Update proto -> protocol for recipes
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
X-List-Received-Date: Thu, 12 Jul 2012 17:52:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 12 July 2012 10:35:02 Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
>  meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
>  .../installer/adt-installer_1.0.bb                 |    2 +-
>  meta/recipes-devtools/opkg/opkg_svn.bb             |    2 +-
>  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
>  meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    2 +-
>  meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |    2 +-
>  .../matchbox-wm-2/matchbox-wm-2_git.bb             |    2 +-
>  meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    6 +++---
>  9 files changed, 11 insertions(+), 11 deletions(-)

I don't think we can do this for the svn recipes until the minimum
bitbake version has been bumped, since older bitbake versions won't
support the "protocol" parameter. For git, I'm not sure 'proto' has
ever been valid at least for fetch2.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


