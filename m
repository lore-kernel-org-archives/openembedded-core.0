Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RJn4e-0002az-DG for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 16:06:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9SE06pk020529
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 15:00:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20151-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 15:00:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9SDxuWH020513
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 14:59:57 +0100
Message-ID: <1319810395.3264.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 28 Oct 2011 14:59:55 +0100
In-Reply-To: <c69f8dfb51559661de1359f22a49f911c056d68e.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
	<c69f8dfb51559661de1359f22a49f911c056d68e.1319753141.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 04/18] libgcc: fix QA Packaging issues
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
X-List-Received-Date: Fri, 28 Oct 2011 14:06:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-28 at 00:06 +0200, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/gcc/libgcc_4.6.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
> index 6ba0339..401d9dc 100644
> --- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
> +++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
> @@ -6,6 +6,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
>  PACKAGES = "\
>    ${PN} \
>    ${PN}-dev \
> +  ${PN}-dbg \
>    "
>  
>  FILES_${PN} = "${base_libdir}/libgcc*.so.*"
> @@ -14,6 +15,7 @@ FILES_${PN}-dev = " \
>    ${libdir}/${TARGET_SYS}/${BINV}/crt* \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
> +FILES_${PN}-dbg = "${base_libdir}/.debug"

Isn't this second piece defined by default in bitbake.conf? I think we
can remove this second piece...

Cheers,

Richard



