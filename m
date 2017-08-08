Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A7D516010B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 10:54:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v78AscRi007690
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Aug 2017 03:54:38 -0700
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 8 Aug 2017 03:54:37 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1501506693-13285-1-git-send-email-zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <81ac9233-1a45-185d-1a83-a6be11db1f3c@windriver.com>
Date: Tue, 8 Aug 2017 18:53:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501506693-13285-1-git-send-email-zhe.he@windriver.com>
X-Originating-IP: [128.224.162.196]
Subject: Re: [PATCH] qemux86 qemux86-64: Enable pci
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
X-List-Received-Date: Tue, 08 Aug 2017 10:54:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping.

On 2017年07月31日 21:11, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> lspci and some other software require "pci" in MACHINE_FEATURES and PCI
> is valid in the qemux86* context.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/conf/machine/qemux86-64.conf | 2 +-
>  meta/conf/machine/qemux86.conf    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
> index 4f30033..9f78191 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -28,7 +28,7 @@ XSERVER = "xserver-xorg \
>             xserver-xorg-module-libint10 \
>             "
>  
> -MACHINE_FEATURES += "x86"
> +MACHINE_FEATURES += "x86 pci"
>  
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
>  
> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
> index e232947..d778fa7 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -27,7 +27,7 @@ XSERVER = "xserver-xorg \
>             xserver-xorg-module-libint10 \
>             "
>  
> -MACHINE_FEATURES += "x86"
> +MACHINE_FEATURES += "x86 pci"
>  
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
>  


