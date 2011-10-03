Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RAoBW-000843-LD
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 21:28:18 +0200
Received: by gyg8 with SMTP id 8so3713709gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 12:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=aZAbUBUOO8u+Kv6MvgwzDhFE8Z/jB75F5ZvMEDhvpEI=;
	b=Spq1cYmIIFDGxHwf3rGfCwwElGGBuiEDsReUNxl3JldUMSzhekA6qvB67kg9bD24gL
	Uc4l0O+gk26bPXw5K0Bvm1D3h9wIJQCFuq2LSGIFBa8F2ykFDTxVNSVoeLi0vaa3zhA7
	d1ge3+FutBTZInR5ySRMu4/m7MaCWDYocgTNY=
Received: by 10.236.189.40 with SMTP id b28mr258118yhn.98.1317669764265;
	Mon, 03 Oct 2011 12:22:44 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id u13sm38875778anf.14.2011.10.03.12.22.42
	(version=SSLv3 cipher=OTHER); Mon, 03 Oct 2011 12:22:43 -0700 (PDT)
Message-ID: <4E8A0B81.1080507@gmail.com>
Date: Mon, 03 Oct 2011 12:22:41 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317322353-30258-1-git-send-email-msm@freescale.com>
In-Reply-To: <1317322353-30258-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH v2 10/16] Fix mdadm for powerpc64
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
X-List-Received-Date: Mon, 03 Oct 2011 19:28:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/2011 11:52 AM, Matthew McClintock wrote:
> This fixes build failures from build warnings on powerpc64
>
> Signed-off-by: Matthew McClintock<msm@freescale.com>
> ---
>   meta/recipes-extended/mdadm/mdadm_3.2.2.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
> index 5d29ae7..1c83f89 100644
> --- a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>                       file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
>                       file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2"
>
> @@ -16,6 +16,7 @@ SRC_URI[md5sum] = "12ee2fbf3beddb60601fb7a4c4905651"
>   SRC_URI[sha256sum] = "0d1a04e688b082bc88846e3f524abd50bc782b6ffc06123140f7d358c8f9b906"
>
>   CFLAGS += "-fno-strict-aliasing"
> +EXTRA_OEMAKE_append_powerpc64 = "CXFLAGS=-Wno-error=format"
>
>   inherit autotools
>

what kind of errors do you get ? and I wonder why they dont show up on 
x86_64. It may be something to fix in the madadm code.


