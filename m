Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 773056B40D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 17:18:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Aug 2013 10:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,871,1367996400"; d="scan'208";a="386483321"
Received: from jfdmzpr06.jf.intel.com (HELO [10.7.201.52]) ([10.7.210.25])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2013 10:18:56 -0700
Message-ID: <1376414333.12272.104.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 13 Aug 2013 10:18:53 -0700
In-Reply-To: <1376412296-7521-2-git-send-email-sgw@linux.intel.com>
References: <1376412296-7521-1-git-send-email-sgw@linux.intel.com>
	<1376412296-7521-2-git-send-email-sgw@linux.intel.com>
Organization: Intel
X-Mailer: Evolution 3.8.4 (3.8.4-1.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 17:19:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-13 at 09:44 -0700, Saul Wold wrote:
> This shows an example of the config fragment support that
> both the linux-yocto and busybox recipes use. This example
> is specific to busybox.
> 
> By adding busybox CONFIG options into a .cfg file and then
> adding that .cfg file to SRC_URI the merge_config.sh script will
> correctly handle these CONFIG options during the do_configure task.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg   | 1 +
>  meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend | 5 +++++
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
> +CONFIG_RFKILL=n

I would have thought "# CONFIG_RFKILL is not set" would have been the
correct string here.

Otherwise, thanks for doing this, this is a great use of meta-skeleton.

> diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> new file mode 100644
> index 0000000..641f04a4
> --- /dev/null
> +++ b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS := "${THISDIR}/${PN}"
> +
> +SRC_URI += " \
> +	    file://no_rfkill.cfg \
> +           "

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



