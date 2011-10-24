Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RIKSF-0007Ij-Cn for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 15:20:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9ODEdUg028563
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:14:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28282-01 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:14:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9ODETMn028553
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:14:30 +0100
Message-ID: <1319462069.25011.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 24 Oct 2011 14:14:29 +0100
In-Reply-To: <dfc5efb4c54797a39c2471dfba7b7cbf14fb6476.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<dfc5efb4c54797a39c2471dfba7b7cbf14fb6476.1319394187.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 26/27] abiword: convert to svn
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
X-List-Received-Date: Mon, 24 Oct 2011 13:20:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-10-23 at 11:27 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta-demoapps/recipes-gnome/abiword/abiword.inc    |    4 ++--
>  meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb |   10 ----------
>  meta-demoapps/recipes-gnome/abiword/abiword_svn.bb |   10 ++++++++++
>  3 files changed, 12 insertions(+), 12 deletions(-)
>  delete mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb
>  create mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_svn.bb
> 
> diff --git a/meta-demoapps/recipes-gnome/abiword/abiword.inc b/meta-demoapps/recipes-gnome/abiword/abiword.inc
> index b1b0f67..2b34a7a 100644
> --- a/meta-demoapps/recipes-gnome/abiword/abiword.inc
> +++ b/meta-demoapps/recipes-gnome/abiword/abiword.inc
> @@ -13,8 +13,8 @@ RRECOMMENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
>  RELURI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz"
>  RELSRC = "${WORKDIR}/abiword-${PV}/abi"
>  
> -CVSURI = "cvs://anoncvs:anoncvs@anoncvs.abisource.com/cvsroot;module=abi"
> -CVSSRC = "${WORKDIR}/abi"
> +SVNURI = "cvs://svn.abisource.com/abiword/trunk;module=abiword;proto=http"
> +SVNSRC = "${WORKDIR}/abi"
>  
Er, its still using cvs:// ?!

Cheers,

Richard



