Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T1apX-0006sW-Vy for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 12:28:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FAG73x032457
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 11:16:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28290-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 11:16:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FAFqmS032443
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 11:15:58 +0100
Message-ID: <1344970890.25109.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <5623cc2a909aa332092db9ca0c79ef36c2987554.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
	<5623cc2a909aa332092db9ca0c79ef36c2987554.1344946189.git.sgw@linux.intel.com>
Date: Tue, 14 Aug 2012 20:01:30 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.2.3-0ubuntu6 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED REQUEST 05/64] console-tools: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Wed, 15 Aug 2012 10:28:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-14 at 15:12 +0300, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../console-tools/console-tools_0.3.2.bb           |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
> index 6027d4a..1446368 100644
> --- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
> +++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
> @@ -3,7 +3,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
>  SUMMARY = "Allows you to set-up and manipulate the Linux console."
>  DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
> -PR = "r5"
> +PR = "r6"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
>             file://codepage.patch \
> @@ -35,6 +35,10 @@ inherit autotools gettext update-alternatives
>  ALTERNATIVE_PRIORITY = "100"
>  
>  bindir_progs = "chvt deallocvt fgconsole openvt"
> -ALTERNATIVE_LINKS = "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
> +ALTERNATIVE_${PN} = "${bindir_progs}"
> +#python __anonymous() {
> +#	for prog in d.getVar('bindir_progs', True).split():
> +#		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir', True), prog))
> +#}

Any particular reason we're adding in this anonymous python function
which is commented out?

Cheers,

Richard




