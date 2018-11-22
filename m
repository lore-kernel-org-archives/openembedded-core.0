Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 07F3E6C5ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 23:40:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAMNetGR002271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 22 Nov 2018 23:40:57 GMT
Message-ID: <ab3066d5b675930c69d2b8a276a6900265a62e81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 23:40:55 +0000
In-Reply-To: <20181122154136.121480-8-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<20181122154136.121480-8-alex.kanavin@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 08/16] btrfs-tools: update to 4.19
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
X-List-Received-Date: Thu, 22 Nov 2018 23:40:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-22 at 16:41 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../btrfs-tools/{btrfs-tools_4.17.1.bb => btrfs-tools_4.19.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.17.1.bb => btrfs-tools_4.19.bb} (96%)
> 
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb
> similarity index 96%
> rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
> rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb
> index 6b53fbcd7fe..9590a723d50 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb
> @@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
>  DEPENDS_append_class-target = " udev"
>  RDEPENDS_${PN} = "libgcc"
>  
> -SRCREV = "7faaca0d9f78f7162ae603231f693dd8e1af2a41"
> +SRCREV = "d72d913291683188ddf5d758db02f1bc3b05d2f7"
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
>             file://0001-Makefile-build-mktables-using-native-gcc.patch \
>             file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \

Sadly this upgrade is showing problems:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5/steps/7/logs/step6b
https://autobuilder.yoctoproject.org/typhoon/#/builders/70/builds/5/steps/7/logs/step1b
https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5/steps/7/logs/step1b
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5/steps/7/logs/step1b

possibly a problem on mips/ppc?

Cheers,

Richard



