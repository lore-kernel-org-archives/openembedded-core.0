Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id B8F2975852
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Sep 2015 11:59:34 +0000 (UTC)
Received: (qmail 23041 invoked by uid 1003); 20 Sep 2015 11:59:33 -0000
Received: from unknown (HELO ?192.168.11.114?)
	(philip@opensdr.com@108.44.118.254)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	20 Sep 2015 11:59:33 -0000
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
References: <1442702597-5619-1-git-send-email-marex@denx.de>
From: Philip Balister <philip@balister.org>
Message-ID: <55FE9FA4.4080204@balister.org>
Date: Sun, 20 Sep 2015 07:59:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1442702597-5619-1-git-send-email-marex@denx.de>
Cc: lftan@altera.com, waltergoossens@home.nl
Subject: Re: [PATCH 0/8] nios2 fixes
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
X-List-Received-Date: Sun, 20 Sep 2015 11:59:36 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 09/19/2015 06:43 PM, Marek Vasut wrote:
> This patchset fixes various minor issues found during the process
> of getting Yocto working with the Altera NIOS2 soft-processor.

You mean getting OpenEmbedded working, not Yocto :)

Philip

> 
> Marek Vasut (8):
>   insane: Add nios2 support
>   siteinfo: Add nios2-linux
>   kernel-arch: Add nios2 to valid archs
>   linux-yocto: depend on libgcc for nios2
>   openssl: Add nios2 configuration
>   libtool: Fix nios2 support
>   pixman: Fix missing FE_DIVBYZERO on nios2
>   libgpg-error: Add support for nios2
> 
>  meta/classes/insane.bbclass                        |   1 +
>  meta/classes/kernel-arch.bbclass                   |   3 +-
>  .../openssl/openssl/openssl_add_nios2.patch        |  33 ++
>  .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   1 +
>  meta/recipes-devtools/libtool/libtool-2.4.6.inc    |   1 +
>  ...1-libtool-Fix-support-for-NIOS2-processor.patch |  68 ++++
>  ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch |  65 ++++
>  meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb    |   1 +
>  meta/recipes-kernel/linux/linux-yocto.inc          |   4 +
>  .../0001-libgpg-error-Add-nios2-support.patch      |  46 +++
>  .../libgpg-error/libgpg-error_1.19.bb              |   4 +-
>  meta/site/nios2-linux                              | 395 +++++++++++++++++++++
>  12 files changed, 620 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl_add_nios2.patch
>  create mode 100644 meta/recipes-devtools/libtool/libtool/0001-libtool-Fix-support-for-NIOS2-processor.patch
>  create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
>  create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch
>  create mode 100644 meta/site/nios2-linux
> 

