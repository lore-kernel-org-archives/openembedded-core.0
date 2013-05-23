Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B0CF06A44E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 15:51:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 May 2013 08:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,729,1363158000"; d="scan'208";a="318454494"
Received: from unknown (HELO [10.255.12.172]) ([10.255.12.172])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2013 08:51:31 -0700
Message-ID: <519E3B03.6080708@linux.intel.com>
Date: Thu, 23 May 2013 08:51:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
CC: openembedded-core@lists.openembedded.org
References: <1369319832-24797-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1369319832-24797-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] siteinfo: add existiance check for site config file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 May 2013 15:51:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Ignore this patch, I was quick on the draw and did not notice the 
listdir which means the file is there,

Sau!

On 05/23/2013 07:37 AM, Saul Wold wrote:
> There is a condition where ncurses adds a site config file to CONFIG_SITE list
> and then binutils configure tries to use the siteinfo list before ncurses has
> installed the file.  The existance test is there in the BBPATH search, but not
> in the SYSROOTCACHE check, so add it here.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/classes/siteinfo.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
> index 09f88c6..87a4225 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -139,7 +139,8 @@ def siteinfo_get_files(d, no_cache = False):
>       if os.path.isdir(path_siteconfig):
>           for i in os.listdir(path_siteconfig):
>               filename = os.path.join(path_siteconfig, i)
> -            sitefiles += filename + " "
> +            if os.path.exists(filename):
> +                sitefiles += filename + " "
>
>       return sitefiles
>
>

