Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sfb63-0000wx-QH
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 20:18:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Jun 2012 11:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="158159680"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2012 11:07:29 -0700
Message-ID: <4FDB79E1.7020903@linux.intel.com>
Date: Fri, 15 Jun 2012 11:07:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1339427112-6567-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1339427112-6567-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH] coreutils: Fix a typo in v6.9 (bracket not braket)
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
X-List-Received-Date: Fri, 15 Jun 2012 18:18:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2012 08:05 AM, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   meta/recipes-core/coreutils/coreutils_6.9.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
> index 6789b8c..5bfab16 100644
> --- a/meta/recipes-core/coreutils/coreutils_6.9.bb
> +++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
> @@ -65,7 +65,7 @@ inherit update-alternatives
>
>   ALTERNATIVE_PRIORITY = "100"
>
> -ALTERNATIVE_${PN} = "lbraket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs}"
> +ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs}"
>
>   ALTERNATIVE_PRIORITY[uptime] = "10"
>   ALTERNATIVE_PRIORITY[hostname] = "10"

Merged into OE-Core

Thanks
	Sau!


