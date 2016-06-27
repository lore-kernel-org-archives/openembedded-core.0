Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 296536E660
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 07:44:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Jun 2016 00:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,536,1459839600"; d="scan'208";a="983894949"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.16.145])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2016 00:43:33 -0700
Message-ID: <1467013411.2892.2.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2016 08:43:31 +0100
In-Reply-To: <1466590945-10412-1-git-send-email-joshua.g.lock@intel.com>
References: <1466590945-10412-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: Evolution 3.20.3 (3.20.3-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] rootfs-postcommands: don't hard-code .rootfs in manifest filename
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
X-List-Received-Date: Mon, 27 Jun 2016 07:44:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-06-22 at 11:22 +0100, Joshua Lock wrote:
> The .rootfs suffix of a generated image can be overridden by setting
> IMAGE_NAME_SUFFIX, to ensure manifest filenames match the associated
> image make use of this variable in the manifest filename.

This change will break a few external layers so probably isn't worth it
for a minor cosmetic change?

Regards,

Joshua

> 
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> index db8b551..c413389 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -15,7 +15,7 @@ ROOTFS_POSTPROCESS_COMMAND +=
> "rootfs_update_timestamp ; "
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES"
> , "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
>  
>  # Write manifest
> -IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
> +IMAGE_MANIFEST =
> "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
>  ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
>  # Set default postinst log file
>  POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
> -- 
> 2.7.4
> 

