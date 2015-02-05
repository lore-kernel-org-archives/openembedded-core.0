Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 53D9872DE1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 22:02:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 05 Feb 2015 13:55:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,526,1418112000"; d="scan'208";a="681607172"
Received: from msdesadl-mobl.amr.corp.intel.com (HELO [10.252.141.171])
	([10.252.141.171])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2015 14:01:59 -0800
Message-ID: <1423173718.21935.1.camel@picadillo>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 05 Feb 2015 16:01:58 -0600
In-Reply-To: <1423090155-14149-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1423090155-14149-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: bootimg-partition: Stop removing whole workdir
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
X-List-Received-Date: Thu, 05 Feb 2015 22:02:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-04 at 23:49 +0100, Alexandre Belloni wrote:
> Stop removing the whole working directory as this is also removing
> eventual previously created partition images, leading to image creation
> failures.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Acked-by: Tom Zanussi >tom.zanussi@linux.intel.com>

> ---
>  scripts/lib/wic/plugins/source/bootimg-partition.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
> index 6ba39a01f700..c5eb7b8b801b 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-partition.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
> @@ -66,7 +66,7 @@ class BootimgPartitionPlugin(SourcePlugin):
>          - copies all files listed in IMAGE_BOOT_FILES variable
>          """
>          hdddir = "%s/boot" % cr_workdir
> -        rm_cmd = "rm -rf %s" % cr_workdir
> +        rm_cmd = "rm -rf %s/boot" % cr_workdir
>          exec_cmd(rm_cmd)
>  
>          install_cmd = "install -d %s" % hdddir
> -- 
> 2.1.0
> 



