Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbEGX-0005vR-CA
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 18:39:13 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Nov 2012 09:25:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,293,1352102400"; d="scan'208";a="171073005"
Received: from unknown (HELO helios.localnet) ([10.252.122.187])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Nov 2012 09:25:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2012 17:25:05 +0000
Message-ID: <8516410.LZyfvPT3vv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <1353518473-27252-1-git-send-email-philip@balister.org>
References: <1353518473-27252-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
Subject: Re: [PATCH] insane.bbclass : Disable tests for unsafe references in binaries and scripts.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 17:39:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 November 2012 12:21:13 Philip Balister wrote:
> These test look for programs in / that depend on programs in /usr. After
> a brief discussion in #oe, we decided these tests should be disabled so
> we can focus on more serious QA issues.
> 
> If you are working on a system where / and /usr are on different partitions,
> you should turn these tests back on and resolving the QA warnings.
> 
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta/classes/insane.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 237ee82..c5c84b8 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -113,7 +113,7 @@ def package_qa_get_machine_dict():
> 
> 
>  # Currently not being used by default "desktop"
> -WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries
> unsafe-references-in-scripts staticdev libdir xorg-driver-abi textrel"
> +WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi
> textrel" ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2
> pkgconfig la perms dep-cmp"
> 
>  ALL_QA = "${WARN_QA} ${ERROR_QA}"

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre


