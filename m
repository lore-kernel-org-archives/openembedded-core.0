Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Suk9k-0005PS-H9 for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 15:00:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RCn4vA006129;
	Fri, 27 Jul 2012 13:49:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05276-07; Fri, 27 Jul 2012 13:49:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RCmt0Z006123
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Jul 2012 13:48:56 +0100
Message-ID: <1343393335.9574.134.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 13:48:55 +0100
In-Reply-To: <1343389641-15641-1-git-send-email-fahad.usman@gmail.com>
References: <1343389641-15641-1-git-send-email-fahad.usman@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Fahad Usman <fahad_usman@mentor.com>
Subject: Re: [PATCH] qemu: cflags concatination issue
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
X-List-Received-Date: Fri, 27 Jul 2012 13:00:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 16:47 +0500, Fahad Usman wrote:
> From: Fahad Usman <fahad_usman@mentor.com>
> 
> add patch to fix cflags concatination issue
> 
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>  .../qemu/qemu-0.15.1/cflags-separator.patch        |   15 +++++++++++++++
>  meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 ++-
>  2 files changed, 17 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/cflags-separator.patch
> 
> diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/cflags-separator.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/cflags-separator.patch
> new file mode 100644
> index 0000000..9eb9c70
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu-0.15.1/cflags-separator.patch
> @@ -0,0 +1,15 @@
> +---
> + configure |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- qemu-0.15.1.orig/configure
> ++++ qemu-0.15.1/configure
> +@@ -2550,7 +2550,7 @@ int main(int argc, char **argv)
> + }
> + EOF
> +   if ! compile_prog "" "" ; then
> +-    CFLAGS+="-march=i486"
> ++    CFLAGS+=" -march=i486"
> +   fi
> + fi
> + 


The patch is missing the Upstream-Status, author and description
information in the header.

Cheers,

Richard

> diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> index 2cc59f6..6a4a1ec 100644
> --- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> @@ -3,7 +3,7 @@ require qemu.inc
>  LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>                      file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>  
> -PR = "r9"
> +PR = "r10"
>  
>  FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
>  FILESDIR = "${WORKDIR}"
> @@ -21,6 +21,7 @@ SRC_URI = "\
>      file://a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch \
>      file://dummy-gl-config.patch \
>      file://0001-ppc64-Fix-linker-script.patch \
> +    file://cflags-separator.patch \
>      "
>  
>  # Only use the GL passthrough patches for native/nativesdk versions




