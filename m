Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RJKRf-0008OJ-3e for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 09:32:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9R7QBMF028466
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 08:26:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28330-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 08:26:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9R7Q3Ep028459
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 08:26:04 +0100
Message-ID: <1319700362.15601.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 27 Oct 2011 08:26:02 +0100
In-Reply-To: <1319692454-20226-1-git-send-email-msm@freescale.com>
References: <1319692454-20226-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] Add new strace-graph package to avoid making perl a dependecy for all of strace
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
X-List-Received-Date: Thu, 27 Oct 2011 07:32:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-27 at 00:14 -0500, Matthew McClintock wrote:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-devtools/strace/strace_4.5.20.bb |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/strace/strace_4.5.20.bb b/meta/recipes-devtools/strace/strace_4.5.20.bb
> index b3d2aa5..0e22657 100644
> --- a/meta/recipes-devtools/strace/strace_4.5.20.bb
> +++ b/meta/recipes-devtools/strace/strace_4.5.20.bb
> @@ -3,9 +3,13 @@ HOMEPAGE = "http://strace.sourceforge.net"
>  SECTION = "console/utils"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4535377ede62550fdeaf39f595fd550a"
> -PR = "r2"
> +PR = "r3"
> +
> +PACKAGES = "${PN} ${PN}-graph"
> +FILES_${PN} = "${bindir}/strace"
> +FILES_${PN}-graph = "${bindir}/strace-graph"
> +RDEPENDS_${PN}-graph = "perl"
>  
This wipes out the ${PN}-dbg, ${PN}-dev and other packages. You need to
add ${PN}-graph to PACKAGES rather than overwriting it.

Cheers,

Richard



