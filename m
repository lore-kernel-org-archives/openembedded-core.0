Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D8C7A794AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:32:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N7WYTr010056
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:32:35 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 23 Aug 2018 00:32:34 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1534487230-438571-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B7E6292.10602@windriver.com>
Date: Thu, 23 Aug 2018 15:30:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1534487230-438571-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.162.173]
Subject: Re: [PATCH 1/2] mdadm: fix usrmerge install path
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
X-List-Received-Date: Thu, 23 Aug 2018 07:32:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ping.

Thanks,

On 2018年08月17日 14:27, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Update /lib to $nonarch_base_libdir to fix
> the below error when usrmerge enabled in
> DISTRO_FEATURES.
>
> ERROR: mdadm-4.0-r0 do_package_qa: QA Issue: mdadm package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>   meta/recipes-extended/mdadm/mdadm_4.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
> index 226b974..2c4d88a 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
> @@ -42,7 +42,7 @@ CFLAGS_append_mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
>
>   do_compile() {
>   	# Point to right sbindir
> -	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" ${S}/Makefile
> +	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" -e "s;UDEVDIR = /lib;UDEVDIR = $nonarch_base_libdir;" ${S}/Makefile
>   	oe_runmake SYSROOT="${STAGING_DIR_TARGET}"
>   }
>
>

