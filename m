Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2Tie-0008MS-HO
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:04:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Aug 2012 13:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="187901332"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2012 13:52:32 -0700
Message-ID: <502EAF10.2030207@linux.intel.com>
Date: Fri, 17 Aug 2012 13:52:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20120727150655.GA3419@windriver.com>
In-Reply-To: <20120727150655.GA3419@windriver.com>
Subject: Re: [PATCH] openssh: openssh's init fails to restart if sshd is not running
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
X-List-Received-Date: Fri, 17 Aug 2012 21:04:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2012 08:06 AM, Amy Fong wrote:
> openssh: openssh's init fails to restart if sshd is not running
>
> Because of "set -e", it's necessary to specify the -o (or --oknodo)
> so that start-stop-daemon returns an exit status of 0 if no actions
> are taken.
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>   init |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh-5.9p1/init b/meta/recipes-connectivity/openssh/openssh-5.9p1/init
> index 055dd22..6beec84 100644
> --- a/meta/recipes-connectivity/openssh/openssh-5.9p1/init
> +++ b/meta/recipes-connectivity/openssh/openssh-5.9p1/init
> @@ -76,7 +76,7 @@ case "$1" in
>     	check_keys
>   	check_config
>           echo -n "Restarting OpenBSD Secure Shell server: sshd"
> -	start-stop-daemon -K -x /usr/sbin/sshd
> +	start-stop-daemon -K --oknodo -x /usr/sbin/sshd
>   	check_for_no_start
>   	check_privsep_dir
>   	sleep 2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into OE-Core
>


