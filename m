Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24Q9-00080j-3T
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:03:49 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Aug 2012 10:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="135069467"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 10:51:50 -0700
Message-ID: <502D3335.9080704@linux.intel.com>
Date: Thu, 16 Aug 2012 10:51:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344402403.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1344402403.git.jackie.huang@windriver.com>
Cc: Liezhi.Yang@windriver.com
Subject: Re: [PATCH 0/1] tcl: uncomment a line that causing TCL_SRC_DIR point to the workdir
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
X-List-Received-Date: Thu, 16 Aug 2012 18:03:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2012 10:11 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> The line 'sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh'
> is commented somehow in previous commit, so that TCL_SRC_DIR
> point to the tcl workdir which will cause package that use it
> fail to configure or compile when the tcl workdir is removed,
> so uncomment it back.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
> The following changes since commit 1e873271362b770381903098d46c4aec164d81de:
>
>    automake: Fix version reference in path substitutions (2012-08-07 23:35:54 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib jhuang0/expect_failed_0808
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/expect_failed_0808
>
> Jackie Huang (1):
>    tcl: uncomment a line that causing TCL_SRC_DIR point to the workdir.
>
>   meta/recipes-devtools/tcltk/tcl_8.5.11.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



