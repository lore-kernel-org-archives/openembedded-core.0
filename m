Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QUpM2-0008Av-T5
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 02:13:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Jun 2011 17:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,344,1304319600"; d="scan'208";a="10399692"
Received: from unknown (HELO [10.255.12.249]) ([10.255.12.249])
	by azsmga001.ch.intel.com with ESMTP; 09 Jun 2011 17:10:16 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 09 Jun 2011 17:10:17 -0700
In-Reply-To: <06193403fa3f66c8ba416ace8fee6f10e05a4f13.1306931849.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<06193403fa3f66c8ba416ace8fee6f10e05a4f13.1306931849.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.0.2 (3.0.2-2.fc15) 
Message-ID: <1307664618.30948.3.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [RFC v1 PATCH 07/16] git: should depend on perl-native-runtime rather than perl-native
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
X-List-Received-Date: Fri, 10 Jun 2011 00:13:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 21:18 +0800, Dexuan Cui wrote:
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  meta/recipes-devtools/git/git.inc        |    4 ++--
>  meta/recipes-devtools/git/git_1.7.5.1.bb |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
> index c884f9c..3cdd1fa 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -1,14 +1,14 @@
>  DESCRIPTION = "The git revision control system used by the Linux kernel developers"
>  SECTION = "console/utils"
>  LICENSE = "GPLv2"
> -DEPENDS = "perl-native openssl curl zlib expat"
> +DEPENDS = "perl-native-runtime openssl curl zlib expat"

This change made git-native fail to build for me until I installed
perl-ExtUtils-MakeMaker on my Fedora 15 workstation.

If this is expected we need to be documenting this additional host
dependency.

Tracking bug: http://bugzilla.yoctoproject.org/show_bug.cgi?id=1155

Regards,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



