Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UBPXj-0001LX-KA for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 13:58:33 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r21CnSGU013684; Fri, 1 Mar 2013 12:49:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F8iw13qAnEqb; Fri,  1 Mar 2013 12:49:28 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r21CnLOA013673
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Mar 2013 12:49:24 GMT
Message-ID: <1362141704.1055.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
Date: Fri, 01 Mar 2013 12:41:44 +0000
In-Reply-To: <1362140387-5761-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
References: <1362140387-5761-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] btrfs-tools: added PV to git package recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 12:58:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-03-01 at 14:19 +0200, Emilia Ciobanu wrote:
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
> ---
>  .../btrfs-tools/btrfs-tools_git.bb                 |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> index e963a74..df216b1 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> @@ -17,6 +17,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;p
>  
>  S = "${WORKDIR}/git"
>  
> +PV = "0.20-rc1+git${SRCPV}"
> +
>  PR = "r6"

Sadly this won't allow an upgrade path to 0.20 when its released.

We'd either need to use 0.20~rc1 or 0.19+0.20-rc1 as the string.

Cheers,

Richard



