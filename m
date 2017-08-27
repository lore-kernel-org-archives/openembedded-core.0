Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 94B40780F9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 21:21:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7RLLqC3023873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 27 Aug 2017 22:21:54 +0100
Message-ID: <1503868912.32591.276.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Aug 2017 22:21:52 +0100
In-Reply-To: <20170827211005.18090-1-otavio@ossystems.com.br>
References: <20170827211005.18090-1-otavio@ossystems.com.br>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 27 Aug 2017 22:21:54 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Sun, 27 Aug 2017 21:21:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2017-08-27 at 18:10 -0300, Otavio Salvador wrote:
> There is no COMPATIBLE_HOST in the recipe neither it makes sense for
> this to be machine specific.
> 
> Possibly, initramfs-framework's based modules may be machine specific
> but if there is the case they can just RDEPENDS on
> initramfs-framework-base and provide the specific module as another
> recipe.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
> Changes in v2:
> - Add the new dependencies to the hash whitelist
> 
>  meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 8 +++

I think there may be something missing here as this looks like v1...

Cheers,

Richard


> -----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/initrdscripts/initramfs-
> framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-
> framework_1.0.bb
> index 9d69a696f1..94bf1756e3 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> @@ -3,12 +3,10 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de2
> 0420"
>  RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
>  
> -PR = "r2"
> +PR = "r3"
> +
> +inherit allarch
>  
> -# While the packages maybe an allarch due to it being a
> -# simple script, reality is that it is Host specific based
> -# on the COMPATIBLE_HOST below, which needs to take precedence
> -#inherit allarch
>  INHIBIT_DEFAULT_DEPS = "1"
>  
>  SRC_URI = "file://init \
> -- 
> 2.14.1
> 

