Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B0A0D65C89
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 02:44:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t622iQi2013042
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jul 2015 19:44:26 -0700 (PDT)
Received: from [128.224.162.138] (128.224.162.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 1 Jul 2015 19:44:25 -0700
Message-ID: <5594A588.1040901@windriver.com>
Date: Thu, 2 Jul 2015 10:44:24 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1435804469-14774-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1435804469-14774-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] image_types_uboot: remove the middle file
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
X-List-Received-Date: Thu, 02 Jul 2015 02:44:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

drop it, I will rework the commit header

-R

On 2015年07月02日 10:34, rongqing.li@windriver.com wrote:
> From: Yue Tao <Yue.Tao@windriver.com>
>
> The .gz, .bz2 or .lzma are middle files for making gz.u-boot,
> bz2.u-boot, or lzma.u-boot. It should be removed once the final
> image is generated. Otherwise, even you --enable-rm-oldimgs=yes,
> it can't be removed, moreover more and more middle files are
> genrated via 'make fs
>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>   meta/classes/image_types_uboot.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
> index 07837b5..dba9293 100644
> --- a/meta/classes/image_types_uboot.bbclass
> +++ b/meta/classes/image_types_uboot.bbclass
> @@ -3,6 +3,7 @@ inherit image_types kernel-arch
>   oe_mkimage () {
>       mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
>           -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
> +    rm $1
>   }
>
>   COMPRESSIONTYPES += "gz.u-boot bz2.u-boot lzma.u-boot u-boot"
>

-- 
Best Reagrds,
Roy | RongQing Li

