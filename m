Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SkaLF-0004gx-1P for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 14:30:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TCJXkQ001993
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 13:19:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00996-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 13:19:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TCJQOb001987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 13:19:27 +0100
Message-ID: <1340972370.23146.150.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 13:19:30 +0100
In-Reply-To: <1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
References: <1340396533-5386-1-git-send-email-ray.danks@se-eng.com>
	<1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] mkelfimage: Add stable git build (initial recipe)
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
X-List-Received-Date: Fri, 29 Jun 2012 12:30:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-22 at 14:22 -0600, Raymond Danks wrote:
> Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
> ---
> This was originally submitted to the openembedded project:
> http://patches.openembedded.org/patch/7687/
> 
> Resubmitting to oe-core for review prior to commit in openembedded-core.
> 
>  meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> 
> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> new file mode 100644
> index 0000000..b341213
> --- /dev/null
> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "A utility to create ELF boot images from Linux kernel images"
> +HOMEPAGE = "http://www.coreboot.org/Mkelfimage"
> +SECTION = "devel"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
> +
> +SRCREV = "e13632a939e7dde8d7d44fc73e73a41dae8060c3"
> +PV = "1.0.0+gitr${SRCPV}"
> +PR = "r1"
> +
> +SRC_URI = "git://review.coreboot.org/p/coreboot;protocol=http;branch=master"
> +
> +S = "${WORKDIR}/git/util/mkelfImage"
> +
> +inherit autotools
> +
> +NATIVE_INSTALL_WORKS = "1"

The above line is no longer needed, does nothing and should be removed.


> +BBCLASSEXTEND = "native"

Cheers,

Richard



