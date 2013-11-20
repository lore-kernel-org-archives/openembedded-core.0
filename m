Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE8E16D3B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 05:56:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAK5uiHS008932
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 21:56:44 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 19 Nov 2013 21:56:44 -0800
Message-ID: <528C4F2E.6000708@windriver.com>
Date: Wed, 20 Nov 2013 13:57:02 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-2-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1384696338-5390-2-git-send-email-Martin.Jansa@gmail.com>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH 2/7] packagegroup-core-boot: Drop build-time dependency on virtual/kernel
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
X-List-Received-Date: Wed, 20 Nov 2013 05:56:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2013 09:52 PM, Martin Jansa wrote:
> * because kernel isn't needed to build packagegroup and building
>    it doesn't influence if it's included in image or not.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index 486385a..5455899 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -5,7 +5,6 @@
>   SUMMARY = "Minimal boot requirements"
>   DESCRIPTION = "The minimal set of packages required to boot the system"
>   LICENSE = "MIT"
> -DEPENDS = "virtual/kernel"
>   PR = "r11"
>   
>   inherit packagegroup

What about adding this dependency in image.bbclass? Otherwise, the 
kernel will not get built if it's not pulled in by other packages like 
v86d. For example, if we build core-image-minimal for qemumips, the 
kernel is not built by default and we have to `bitbake linux-yocto' 
before we can use `runqemu' to start target.

Best Regards,
Chen Qi

