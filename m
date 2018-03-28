Return-Path: <kamensky@cisco.com>
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id 679EA78278
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 17:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1243; q=dns/txt; s=iport;
	t=1522258631; x=1523468231;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=FAlfEuEmj8lImSZw6agsBwhptV5fDbbPSmCMTOV20Mk=;
	b=a7q0/M4+Bn+O8YBZN6SKmo3NTCcYpKRUvnpSf/GXGOjacuCn9WRfZl6G
	NMwsvTj9oysXdphNbGPEFMyIC0raVtLjow5Ydda+aguEJyooTWAo+kc+d
	aVQJVf3qO0La02Ic6lRovP3dDXdFX8Gg4zuiu0Bj3FzaORPkmTjztPoR5 E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0B5AgC+0bta/5pdJa1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNBYW8ojDqMI4FTIYEPkkqBegsYC4QVTAKEDSE1FwECAQE?=
	=?us-ascii?q?BAQEBAmsohSYBAQMBAQE2AhEBIgsFCwtGJwEvBhOFBggPqj8RgzyDbwGEVYI?=
	=?us-ascii?q?ph16CE4E6giI0gxEBBIctAoxQimMIhVGEfoVBikmIRUyGPwIECwITAYElHgI?=
	=?us-ascii?q?0gVJNIxU6gkMJkGQfMAGPbwEB?=
X-IronPort-AV: E=Sophos;i="5.48,372,1517875200"; d="scan'208";a="91089427"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2018 17:37:10 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id w2SHb90M025232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 28 Mar 2018 17:37:09 GMT
Date: Wed, 28 Mar 2018 10:37:09 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Ross Burton <ross.burton@intel.com>
In-Reply-To: <20180328162808.9990-1-ross.burton@intel.com>
Message-ID: <alpine.LRH.2.00.1803281032070.21653@sjc-ads-6991.cisco.com>
References: <20180328162808.9990-1-ross.burton@intel.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: actually use the aarch64 patch
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
X-List-Received-Date: Wed, 28 Mar 2018 17:37:09 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Wed, 28 Mar 2018, Ross Burton wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-devtools/qemu/qemu_2.11.1.bb | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> index 90eeee95c5f..f4b7d69fcad 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> @@ -21,6 +21,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
>            file://apic-fixup-fallthrough-to-PIC.patch \
>            file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
>            file://memfd.patch \
> +           file://0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch \
>            "
> UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"

Acked and tested with the latest tree and above patch
on machine where the issue is reproducable.

Thank you for taking care of this.

- Victor

> -- 
> 2.11.0
>
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

