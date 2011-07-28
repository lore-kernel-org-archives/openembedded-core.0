Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QmEA4-0005bL-8c
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 02:09:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2011 17:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="32873073"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2011 17:04:56 -0700
Message-ID: <4E30A7A8.8000007@linux.intel.com>
Date: Wed, 27 Jul 2011 17:04:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311604485-14447-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1311604485-14447-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] module-init-tools: do not build static utilities for -cross
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
X-List-Received-Date: Thu, 28 Jul 2011 00:09:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2011 07:34 AM, Enrico Scholz wrote:
> There is no need to have static module-init-tools for the cross
> tools.  Building such binaries requires a static libc which is not
> required by the rest of OE and which is deprecated and not installed
> by distributions like Fedora.
>
>
> Signed-off-by: Enrico Scholz<enrico.scholz@sigma-chemnitz.de>
> ---
>   .../module-init-tools-cross_3.16.bb                |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
> index a59f96a..38f0476 100644
> --- a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
> +++ b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
> @@ -8,4 +8,4 @@ SRC_URI += "file://no-static-binaries.patch"
>   SRC_URI[md5sum] = "bc44832c6e41707b8447e2847d2019f5"
>   SRC_URI[sha256sum] = "e1f2cdcae64a8effc25e545a5e0bdaf312f816ebbcd0916e4e87450755fab64b"
>
> -EXTRA_OECONF_append = " --program-prefix=${TARGET_PREFIX}"
> +EXTRA_OECONF_append = " --program-prefix=${TARGET_PREFIX} --disable-static-utils"

Merged into OE-Core

Thanks
	Sau!


