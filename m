Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLBZ1-00053u-VJ for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 11:27:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1ALJgd027178
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 10:21:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26021-09 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2011 10:21:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1AL8l9027172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 10:21:10 GMT
Message-ID: <1320142868.13918.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 Nov 2011 10:21:08 +0000
In-Reply-To: <ac7b821f266e932e267a4d62af83586ba3261a98.1320134607.git.dexuan.cui@intel.com>
References: <cover.1320134607.git.dexuan.cui@intel.com>
	<ac7b821f266e932e267a4d62af83586ba3261a98.1320134607.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] bash: make job control really work
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
X-List-Received-Date: Tue, 01 Nov 2011 10:27:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-01 at 16:05 +0800, Dexuan Cui wrote:
> It turns out 9393ff833f44570fd5f500bc9de6c72db94b0296 didn't really fix
> the bug.
> 
> This patch is made and tested after I read the link below
> http://www.mail-archive.com/bug-bash@gnu.org/msg03107.html
> 
> [YOCTO #487]
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  meta/recipes-extended/bash/bash.inc    |    1 +
>  meta/recipes-extended/bash/bash_4.2.bb |    2 +-
>  2 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
> index d55e517..d495538 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -23,6 +23,7 @@ ALTERNATIVE_LINK = "${base_bindir}/sh"
>  ALTERNATIVE_PRIORITY = "100"
>  
>  do_configure () {
> +	export bash_cv_job_control_missing=present
>  	gnu-configize
>  	oe_runconf
>  }

This really should go into the common site files...

Cheers,

Richard




