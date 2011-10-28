Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RJiLl-0008PC-6f for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 11:03:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9S8veKO014743
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 09:57:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14353-02-3 for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 09:57:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9S8tTCd013811
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 09:55:30 +0100
Message-ID: <1319792127.22423.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 28 Oct 2011 09:55:27 +0100
In-Reply-To: <1319743874-9891-1-git-send-email-msm@freescale.com>
References: <1319700362.15601.2.camel@ted>
	<1319743874-9891-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2 1/2] Add new strace-graph package to avoid making perl a dependecy for all of strace
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
X-List-Received-Date: Fri, 28 Oct 2011 09:03:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-27 at 14:31 -0500, Matthew McClintock wrote:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> v2: Change to use PACKAGES_prepend instead of explictly listing all packages
> and also fixing the fact we missed the -dev and -dbg packages before
> 
>  meta/recipes-devtools/strace/strace_4.5.20.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/strace/strace_4.5.20.bb b/meta/recipes-devtools/strace/strace_4.5.20.bb
> index b3d2aa5..450abea 100644
> --- a/meta/recipes-devtools/strace/strace_4.5.20.bb
> +++ b/meta/recipes-devtools/strace/strace_4.5.20.bb
> @@ -5,7 +5,9 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4535377ede62550fdeaf39f595fd550a"
>  PR = "r2"
>  
> -RDEPENDS = "perl"
> +PACKAGES_prepend = "${PN}-graph "
> +FILES_${PN}-graph = "${bindir}/strace-graph"
> +RDEPENDS_${PN}-graph = "perl"

I should have been clearer in my original email, pretty much every other
recipe uses += or =+ in this context. Whilst the _prepend override is
probably ok, its probably a bit heavy in this case and the standard
operator should work just fine.

Cheers,

Richard



