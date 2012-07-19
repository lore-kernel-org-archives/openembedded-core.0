Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrlXK-0006Lm-Q6
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 09:52:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2012 00:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168352020"
Received: from unknown (HELO [10.255.12.217]) ([10.255.12.217])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2012 00:41:15 -0700
Message-ID: <5007BA1B.9080806@linux.intel.com>
Date: Thu, 19 Jul 2012 00:41:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342618950-1081-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1342618950-1081-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] sanity: display the parsed PATH when complaining about CWD elements
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
X-List-Received-Date: Thu, 19 Jul 2012 07:52:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2012 06:42 AM, Ross Burton wrote:
> Many people don't understand the nuances of PATH, so help them by clarifying
> the warning and displaying the parsed PATH element-by-element.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/sanity.bbclass |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 765958e..5c69d54 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -390,7 +390,8 @@ def check_sanity(sanity_data):
>
>       paths = sanity_data.getVar('PATH', True).split(":")
>       if "." in paths or "" in paths:
> -        messages = messages + "PATH contains '.' or '', which will break the build, please remove this."
> +        messages = messages + "PATH contains '.' or '' (empty element), which will break the build, please remove this.\n"
> +        messages = messages + "Parsed PATH is " + str(paths) + "\n"
>
>       bbpaths = sanity_data.getVar('BBPATH', True).split(":")
>       if "." in bbpaths or "" in bbpaths:
>

Looks like this version was merged into OE-Core, please rebase your 
updated change and re-sbumit.

Thanks
	Sau!


