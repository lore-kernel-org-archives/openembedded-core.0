Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SzTF3-0008PH-Qm
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Aug 2012 15:57:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Aug 2012 06:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,739,1336374000"; d="scan'208";a="177988520"
Received: from unknown (HELO helios.localnet) ([10.252.121.69])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2012 06:44:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.linuxtogo.org
Date: Thu, 09 Aug 2012 14:44:41 +0100
Message-ID: <5445965.Z9E9QDAQJ1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-27-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <ab9afe9c0eab7dc2d9832cd2afabe1eededc7cae.1344480978.git.wenzong.fan@windriver.com>
References: <cover.1344480978.git.wenzong.fan@windriver.com>
	<ab9afe9c0eab7dc2d9832cd2afabe1eededc7cae.1344480978.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] at 3.1.13: get 'at' depends on 'flex-native' explicitly
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
X-List-Received-Date: Thu, 09 Aug 2012 13:57:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 09 August 2012 10:59:15 wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> 'at' needs flex to generate source file lex.yy.c, but it doesn't
> depend on flex-native directly; This maybe cause a do_compile
> failure if flex-native is not built or included in project.
> 
> Error message is:
>     error: lex.yy.c: No such file or directory
> 
> Get 'at' depends on flex-native to fix this potential issue.
> 
> [YOCTO #2919]
> 
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta/recipes-extended/at/at_3.1.13.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/at/at_3.1.13.bb
> b/meta/recipes-extended/at/at_3.1.13.bb index ce9396a..a391d6e 100644
> --- a/meta/recipes-extended/at/at_3.1.13.bb
> +++ b/meta/recipes-extended/at/at_3.1.13.bb
> @@ -4,14 +4,14 @@ the system load levels drop to a particular level."
>  SECTION = "base"
>  LICENSE="GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
> -DEPENDS = "flex initscripts \
> +DEPENDS = "flex flex-native initscripts \

Does it need flex for the target as well, or was it a case of "flex" being added 
instead of "flex-native" by mistake?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


