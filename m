Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBZgE-0002I0-Jt
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 00:11:10 +0200
Received: by gyg8 with SMTP id 8so2083189gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 15:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=tQ9i0bUjGDbsrHS6Eu+uLpMHvOIIbCPL8brCS0xepb8=;
	b=FlHmwddkZHRMnU6d8T3WD6vE02mN/bEuTrBC8Wlk5zpneqtXqyoVW327bXA/IN/zBK
	zJ/M6G0voVwJWNSZjgzJpN3sDuSBwaYNf5z7YE9FVMjlEA1IqFaVauIs8lirMH7QlE2R
	+SQu5TJgIHmQ7SgBJS9LyVl8x6prOemDr74Z0=
Received: by 10.68.60.166 with SMTP id i6mr355365pbr.48.1317852334323;
	Wed, 05 Oct 2011 15:05:34 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net.
	[99.57.141.118])
	by mx.google.com with ESMTPS id ml4sm11804632pbc.0.2011.10.05.15.05.33
	(version=SSLv3 cipher=OTHER); Wed, 05 Oct 2011 15:05:33 -0700 (PDT)
Message-ID: <4E8CD4A9.5020802@gmail.com>
Date: Wed, 05 Oct 2011 15:05:29 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1317850009-7714-1-git-send-email-msm@freescale.com>
In-Reply-To: <1317850009-7714-1-git-send-email-msm@freescale.com>
Subject: Re: [PATCH v2 1/6] Fix mdadm for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 22:11:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/2011 2:26 PM, Matthew McClintock wrote:
> This takes an upstream fix for compiling on powerpc64

where is the patch ? Did you forget git add
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   meta/recipes-extended/mdadm/mdadm_3.2.2.bb |    6 ++++--
>   1 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
> index 5d29ae7..492cc8e 100644
> --- a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
> @@ -8,9 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>                       file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
>                       file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
>
> -PR = "r0"
> +PR = "r1"
>
> -SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2"
> +SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
> +	    file://0001-mdadm-fix-build-failures-ppc64.patch \
> +	  "
>
>   SRC_URI[md5sum] = "12ee2fbf3beddb60601fb7a4c4905651"
>   SRC_URI[sha256sum] = "0d1a04e688b082bc88846e3f524abd50bc782b6ffc06123140f7d358c8f9b906"



