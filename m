Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2B53C70A30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 10:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BAXMjf032103; Mon, 11 Aug 2014 11:33:22 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Q0fQ_h_ci0oE; Mon, 11 Aug 2014 11:33:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BAXJBu032100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 11 Aug 2014 11:33:20 +0100
Message-ID: <1407753199.22187.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 11 Aug 2014 11:33:19 +0100
In-Reply-To: <1407751920-9684-1-git-send-email-mike.looijmans@topic.nl>
References: <1407751920-9684-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] squashfs-tools: Enable LZO support
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
X-List-Received-Date: Mon, 11 Aug 2014 10:33:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-08-11 at 12:11 +0200, Mike Looijmans wrote:
> For systems looking for speed rather than size (e.g. booting from serial NOR
> flash) LZO is usually a good tradeoff, and usually boots faster than gzip
> or even an uncompressed filesystem.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  .../squashfs-tools/squashfs-tools_4.2.bb           |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
> index 57400cd..1ded2c9 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPL-2 & PD"
>  LIC_FILES_CHKSUM = "file://../COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>                      file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
>                     "
> -DEPENDS = "attr zlib xz"
> +DEPENDS = "attr zlib xz lzo"
>  PR = "r2"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
> @@ -27,7 +27,7 @@ S = "${WORKDIR}/squashfs${PV}/squashfs-tools"
>  # EXTRA_OEMAKE is typically: -e MAKEFLAGS=
>  # the -e causes problems as CFLAGS is modified in the Makefile, so
>  # we redefine EXTRA_OEMAKE here
> -EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1"
> +EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. LZO_SUPPORT=1 XZ_SUPPORT=1"
>  
>  do_compile() {
>          oe_runmake mksquashfs

The patch is good but its against 4.2, 4.3 is now in master. Could you
resend against master please?

Also, could you resend 2/2 without the whitespace changes (put them in a
separate patch).

Cheers,

Richard


