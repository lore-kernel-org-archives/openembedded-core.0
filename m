Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 72DFA60746
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 17:53:47 +0000 (UTC)
Received: (qmail 30582 invoked by uid 1003); 3 Nov 2016 17:53:49 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.116.4)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	3 Nov 2016 17:53:48 -0000
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org
References: <cover.1478179369.git.bruce.ashfield@windriver.com>
	<85d6608fcafacaac093ccffc70b6315ef810fd0d.1478179369.git.bruce.ashfield@windriver.com>
From: Philip Balister <philip@balister.org>
Message-ID: <1f3a4a9d-ff3a-a90b-6627-cecdcc51b398@balister.org>
Date: Thu, 3 Nov 2016 13:53:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <85d6608fcafacaac093ccffc70b6315ef810fd0d.1478179369.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] linux-yocto/4.8: update to 4.8.6
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
X-List-Received-Date: Thu, 03 Nov 2016 17:53:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I'd go bug Bruce directly, but I think the answer is of general interest.

How do I review the actual changes the version update makes?

At the moment, I'd like to look at the commits added to the kernel to
see if they are related to an issue I am having. I'm also wondering what
other stuff might change.

Philip

On 11/03/2016 09:25 AM, Bruce Ashfield wrote:
> Integrating the korg -stable release.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
>  3 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> index e51c9cdcca0e..26b309d8b8f4 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>  
> -SRCREV_machine ?= "4057556c041f6aac0d29aa3425587d414c9a0090"
> -SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
> +SRCREV_machine ?= "b99b6fac437104e206d30540a5cb12103049af1e"
> +SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
>  
> -LINUX_VERSION ?= "4.8.3"
> +LINUX_VERSION ?= "4.8.6"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>  
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> index c8ddbd93dc7f..63dd11baa19e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> @@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
>  
>  require recipes-kernel/linux/linux-yocto.inc
>  
> -LINUX_VERSION ?= "4.8.3"
> +LINUX_VERSION ?= "4.8.6"
>  
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>  
> -SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
> +SRCREV_machine ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>  
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> index 13778b9c4db6..03691982b1f0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>  
> -SRCREV_machine_qemuarm ?= "4cc544ad09ad704322cb66fe4ba197a6a05dc71f"
> -SRCREV_machine_qemuarm64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_machine_qemumips ?= "c285969d4f9376a671167ecf397578c8ad3e6a75"
> -SRCREV_machine_qemuppc ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_machine_qemux86 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_machine_qemux86-64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_machine_qemumips64 ?= "64f96ba530e58456070f26b0f3fcce3f64988b72"
> -SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> -SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
> +SRCREV_machine_qemuarm ?= "94d3e8675e2fcb09f29814a33ccf79df06149104"
> +SRCREV_machine_qemuarm64 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_machine_qemumips ?= "046ff6344eee25dcc0eea1214e0ad8771ddfabfb"
> +SRCREV_machine_qemuppc ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_machine_qemux86 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_machine_qemux86-64 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_machine_qemumips64 ?= "edcb167f91abc071cc98cbd762418ff7ab9d839b"
> +SRCREV_machine ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
> +SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
>  
> -LINUX_VERSION ?= "4.8.3"
> +LINUX_VERSION ?= "4.8.6"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>  
> 

