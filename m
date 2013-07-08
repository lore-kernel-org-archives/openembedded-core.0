Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C84BE6B0D8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 19:35:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2013 12:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1021,1363158000"; d="scan'208";a="342304719"
Received: from unknown (HELO [10.255.13.85]) ([10.255.13.85])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2013 12:35:43 -0700
Message-ID: <51DB148F.9020702@linux.intel.com>
Date: Mon, 08 Jul 2013 12:35:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: jackie.huang@windriver.com
References: <cover.1373267292.git.jackie.huang@windriver.com>
	<f3947aac42370ea5f114852fd677ff1689a9b7ca.1373267292.git.jackie.huang@windriver.com>
In-Reply-To: <f3947aac42370ea5f114852fd677ff1689a9b7ca.1373267292.git.jackie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] udev: add runtime dependency on blkid
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
X-List-Received-Date: Mon, 08 Jul 2013 19:35:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2013 12:10 AM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> udev requires blkid, but this wasn't explicit.  Note that the
> dependency is on util-linux specifically, the one from e2fsprogs
> won't work.
>
Doesn't udev use an internal builtin-blkid?  Or is the configure finding 
that we have util-linux and using it instead of the built-in?

If it's a configure test, then it might need to be a DEPENDS, not RDEPENDS.

Sau!


> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   meta/recipes-core/udev/udev_182.bb |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
> index d66292e..114a557 100644
> --- a/meta/recipes-core/udev/udev_182.bb
> +++ b/meta/recipes-core/udev/udev_182.bb
> @@ -5,5 +5,9 @@ PR = "r7"
>   # module-init-tools from kmod_git will provide libkmod runtime
>   DEPENDS += "module-init-tools"
>
> +# Needs blkid from this particular package. The one in e2fsprogs is
> +# old and incompatible.
> +RDEPENDS_${PN} += "util-linux-blkid"
> +
>   SRC_URI[md5sum] = "1b964456177fbf48023dfee7db3a708d"
>   SRC_URI[sha256sum] = "7857ed19fafd8f3ca8de410194e8c7336e9eb8a20626ea8a4ba6449b017faba4"
>

