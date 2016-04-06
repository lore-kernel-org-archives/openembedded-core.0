Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2F5731E3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 20:34:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Apr 2016 13:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,448,1455004800"; d="scan'208";a="926960135"
Received: from bitbang.jf.intel.com (HELO [10.7.199.152]) ([10.7.199.152])
	by orsmga001.jf.intel.com with ESMTP; 06 Apr 2016 13:34:52 -0700
To: Michael Wood <michael.g.wood@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1459962043-30259-1-git-send-email-michael.g.wood@intel.com>
	<1459962043-30259-2-git-send-email-michael.g.wood@intel.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <570572EC.2000008@linux.intel.com>
Date: Wed, 6 Apr 2016 13:34:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459962043-30259-2-git-send-email-michael.g.wood@intel.com>
Subject: Re: [PATCH] toaster: add DL_DIR and SSTATE_DIR to oe toasterconf
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
X-List-Received-Date: Wed, 06 Apr 2016 20:34:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2016 10:00 AM, Michael Wood wrote:
> From: Ed Bartosh <ed.bartosh@linux.intel.com>

Shouldn't the message from the cover letter actually be the commit message here, 
rather than an empty message?

>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> Signed-off-by: Michael Wood <michael.g.wood@intel.com>
> ---
>   meta/conf/toasterconf.json | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
> index 1987793..bbd40e9 100644
> --- a/meta/conf/toasterconf.json
> +++ b/meta/conf/toasterconf.json
> @@ -2,9 +2,11 @@
>       "config": {
>           "MACHINE"      : "qemux86",
>           "DISTRO"       : "poky",
> +        "DL_DIR"       : "${TOPDIR}/../downloads",
>           "IMAGE_FSTYPES": "ext3 jffs2 tar.bz2",
>           "IMAGE_INSTALL_append": "",
> -        "PACKAGE_CLASSES": "package_rpm"
> +        "PACKAGE_CLASSES": "package_rpm",
> +        "SSTATE_DIR"   : "${TOPDIR}/../sstate-cache"
>       },
>       "layersources": [
>           {
>


