Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBId1-0007q7-Pp
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 07:03:16 +0200
Received: by iebc11 with SMTP id c11so202614ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 21:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=12zMiVO3u0vfYVcuff2l1P+FkkXBV27DGqbqvIGr08E=;
	b=RK3sGHct2oEvE9kZjIvJhtUnJufZj3iXnCbvme+sree5y75MzIBSchesJ7JR16qGMR
	yL9g29Ov7mThmcLaa4Yl1KEyBxPDeQouGpqWrWqZ7Bs9RhUm5xF9G0RyjO+pWfDtIvmJ
	/OQ8kqwtsVuZk0JJFo99A9YoTG6FtjgmzBZedmiirk9kKtdPF4vcWVwmHRr/Tw/9dbBE
	6wl9YeBWzABTyB5RLI1oPS+bAnrpQLmIEIhw+/pDT4hzSPVa11YKeVpi6yb/gouDHrSK
	lMWn36DJ2ZBvyFgXOF37L2bQiI02ESjJqfCMR9vIRI5vR3llg0ny6ZP2bluIu9cn/991
	dhAA==
Received: by 10.50.207.35 with SMTP id lt3mr13622675igc.49.1347339044971;
	Mon, 10 Sep 2012 21:50:44 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id va9sm584349igb.17.2012.09.10.21.50.43
	(version=SSLv3 cipher=OTHER); Mon, 10 Sep 2012 21:50:44 -0700 (PDT)
Date: Mon, 10 Sep 2012 21:50:40 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20120911045038.GE2980@sakrah.homelinux.org>
Mail-Followup-To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
	<cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cc8bfedabfe61a0e06a8a8199f8c0fce4738260a.1347300360.git.bruce.ashfield@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 05:03:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/09/12 14:11), Bruce Ashfield wrote:
> Updating to 3.4.10 which has been soaking for a bit now, as well
> as picking up the following meta commits from Tom Z:

would it also need bumping linux-libc-headers too ?

> 
>   a82db2f meta: have systemtap use kprobes and uprobes feature
>   d5d5b80 meta: add kprobes support to ktypes/standard
>   b32d373 meta: add kprobes feature
>   d40ed99 meta: have uprobe feature use uprobe.cfg
>   a69d1db meta: add uprobe.cfg
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> index b2620ea..3b36378 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> @@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
>  KBRANCH = "standard/preempt-rt/base"
>  KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
>  
> -LINUX_VERSION ?= "3.4.9"
> +LINUX_VERSION ?= "3.4.10"
>  LINUX_KERNEL_TYPE = "preempt-rt"
>  
>  KMETA = "meta"
>  
> -SRCREV_machine ?= "9032b1e9daf5b4396f939981c3be95f67802d18c"
> -SRCREV_machine_qemuppc ?= "08ce190232f89303772b6591ca7daaf2820eb74e"
> -SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
> +SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
> +SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
> +SRCREV_meta ?= "d9d5fc63d8b38705036e946ea77d971d95de11ad"
>  
>  PR = "${INC_PR}.0"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 06bcb9a..7258cba 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
>  KBRANCH_DEFAULT = "standard/base"
>  KBRANCH = "${KBRANCH_DEFAULT}"
>  
> -SRCREV_machine_qemuarm ?= "84d8ee32265eea5d60f57a2f70bd3b9a0fb9213d"
> -SRCREV_machine_qemumips  ?= "ba0e336d4527080233c3c410989d4f351529ee4e"
> -SRCREV_machine_qemuppc ?= "e82b8a111430e3820b11f507863c4b8e8734ed8e"
> -SRCREV_machine_qemux86 ?= "0985844fa6235422c67ef269952fa4e765f252f9"
> -SRCREV_machine_qemux86-64 ?= "0985844fa6235422c67ef269952fa4e765f252f9"
> -SRCREV_machine ?= "0985844fa6235422c67ef269952fa4e765f252f9"
> -SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
> +SRCREV_machine_qemuarm ?= "b15e7b1e9b58b9863bd87778775f86cd8d8880ea"
> +SRCREV_machine_qemumips  ?= "8d5b98f263b5119af2dc30223f311be17173bab9"
> +SRCREV_machine_qemuppc ?= "b9a720ca38d298ed457f37d099c85771f9164b19"
> +SRCREV_machine_qemux86 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
> +SRCREV_machine_qemux86-64 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
> +SRCREV_machine ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
> +SRCREV_meta ?= "a82db2f0fc3ceebf3cb47e9dd05e4856ff9966ab"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>  
> -LINUX_VERSION ?= "3.4.9"
> +LINUX_VERSION ?= "3.4.10"
>  
>  PR = "${INC_PR}.1"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


