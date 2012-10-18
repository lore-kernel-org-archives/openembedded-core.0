Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwa6-0005e7-Bf
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:20:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Oct 2012 13:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,608,1344236400"; d="scan'208";a="206225420"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by azsmga001.ch.intel.com with ESMTP; 18 Oct 2012 13:07:16 -0700
Message-ID: <50806174.2080204@linux.intel.com>
Date: Thu, 18 Oct 2012 13:07:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1349107384.32611.62.camel@phil-desktop>
In-Reply-To: <1349107384.32611.62.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] recipe_sanity: Don't bother checking LICENSE
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
X-List-Received-Date: Thu, 18 Oct 2012 20:20:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2012 09:03 AM, Phil Blundell wrote:
> Since e3d7890cace71b0a57d2530bf615a58dcb46d96f or so, base.bbclass has
> considered invalid LICENSE settings to be a fatal error.  This means we
> will never see them so there is no point checking for that.
>
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>   meta/classes/recipe_sanity.bbclass |    9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
> index c3bd0d2..bf378ea 100644
> --- a/meta/classes/recipe_sanity.bbclass
> +++ b/meta/classes/recipe_sanity.bbclass
> @@ -13,7 +13,7 @@ def bad_runtime_vars(cfgdata, d):
>               __note("%s should be %s_${PN}" % (var, var), d)
>
>   __recipe_sanity_reqvars = "DESCRIPTION"
> -__recipe_sanity_reqdiffvars = "LICENSE"
> +__recipe_sanity_reqdiffvars = ""
>   def req_vars(cfgdata, d):
>       for var in d.getVar("__recipe_sanity_reqvars", True).split():
>           if not d.getVar(var, 0):
> @@ -23,11 +23,6 @@ def req_vars(cfgdata, d):
>           val = d.getVar(var, 0)
>           cfgval = cfgdata.get(var)
>
> -        # Hardcoding is bad, but I'm lazy.  We don't care about license being
> -        # unset if the recipe has no sources!
> -        if var == "LICENSE" and d.getVar("SRC_URI", True) == cfgdata.get("SRC_URI"):
> -            continue
> -
>           if not val:
>               __note("%s should be set" % var, d)
>           elif val == cfgval:
> @@ -93,7 +88,7 @@ def can_remove_FILESDIR(cfgdata, d):
>               expanded == d.expand(expected))
>
>   def can_remove_others(p, cfgdata, d):
> -    for k in ["S", "PV", "PN", "DESCRIPTION", "LICENSE", "DEPENDS",
> +    for k in ["S", "PV", "PN", "DESCRIPTION", "DEPENDS",
>                 "SECTION", "PACKAGES", "EXTRA_OECONF", "EXTRA_OEMAKE"]:
>       #for k in cfgdata:
>           unexpanded = d.getVar(k, 0)
>

Merged into OE-Core

Thanks
	Sau!



