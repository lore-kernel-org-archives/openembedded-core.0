Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 27D3960667
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 21:08:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Aug 2013 14:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,872,1367996400"; d="scan'208";a="362193978"
Received: from jfdmzpr06.jf.intel.com (HELO [10.7.201.52]) ([10.7.210.25])
	by orsmga001.jf.intel.com with ESMTP; 13 Aug 2013 14:08:51 -0700
Message-ID: <1376428128.12272.155.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 13 Aug 2013 14:08:48 -0700
In-Reply-To: <1376416910-21399-1-git-send-email-sgw@linux.intel.com>
References: <1376416910-21399-1-git-send-email-sgw@linux.intel.com>
Organization: Intel
X-Mailer: Evolution 3.8.4 (3.8.4-1.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2 v3] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 21:08:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-13 at 11:01 -0700, Saul Wold wrote:
> This shows an example of the config fragment support that
> both the linux-yocto and busybox recipes use. This example
> is specific to busybox.
> 
> By adding busybox CONFIG options into a .cfg file and then
> adding that .cfg file to SRC_URI the merge_config.sh script will
> correctly handle these CONFIG options during the do_configure task.
> The merge_config.sh script uses a last-in wins method.
> 
> For more details about this, see the Kernel Development Manual Section 2.2.3
> http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration
> 
> v2: fixed FILESEXTRAPATHS
> v3: Fixed kconfig line and added comments
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg   | 1 +
>  meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend | 12 +++++
>  2 files changed, 6 insertions(+)
>  create mode 100644 meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
>  create mode 100644 meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> 
> diff --git a/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
> new file mode 100644
> index 0000000..42c6730
> --- /dev/null
> +++ b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
> @@ -0,0 +1 @@
> +# CONFIG_RFKILL is not set
> diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> new file mode 100644
> index 0000000..641f04a4
> --- /dev/null
> +++ b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> @@ -0,0 +1,12 @@
> +# Example use of configuration fragments for busybox, which uses the same
> +# mechanism as the linux-yocto kernel recipe.
> +#
> +# The entries here will override any entries in the base busybox recipe
> +#
> +# More details can be found in the Kernel Dev Manual
> +# http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += " \
> +	    file://no_rfkill.cfg \
> +           "

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



