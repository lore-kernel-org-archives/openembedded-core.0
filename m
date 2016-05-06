Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30084731A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 13:51:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u46DpZjO015737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 6 May 2016 06:51:35 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 6 May 2016 06:51:34 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <3e695d04-c762-c199-3f8f-142b74bf90e6@windriver.com>
Date: Fri, 6 May 2016 08:51:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Fri, 06 May 2016 13:51:37 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 5/6/16 6:26 AM, Ross Burton wrote:
> If debug filesystem generation is enabled but this isn't assigned then the
> generation code throws exceptions.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
Acked-by: Mark Hatle <mark.hatle@windriver.com>

(This is the patch that I thought had been sent before.. obviously didn't happen..)

Thanks!
--Mark

> ---
>  meta/conf/bitbake.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1c4175f..8e02e91 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -713,6 +713,7 @@ require conf/sanity.conf
>  DL_DIR ?= "${TOPDIR}/downloads"
>  SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
>  IMAGE_FSTYPES ?= "tar.gz"
> +IMAGE_FSTYPES_DEBUGFS ?= "${IMAGE_FSTYPES}"
>  
>  INITRAMFS_FSTYPES ?= "cpio.gz"
>  # The maximum size in Kbytes for the generated initramfs image size.
> 


