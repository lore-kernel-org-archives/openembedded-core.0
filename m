Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THHZz-0004gU-C6
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 19:08:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Sep 2012 09:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="149916004"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Sep 2012 09:55:56 -0700
Message-ID: <5064851C.2020105@linux.intel.com>
Date: Thu, 27 Sep 2012 09:55:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
References: <cover.1348695851.git.elizabeth.flanagan@intel.com>
	<c2df57712e4e2ce9e87121b063835f51e5a76d7c.1348695851.git.elizabeth.flanagan@intel.com>
In-Reply-To: <c2df57712e4e2ce9e87121b063835f51e5a76d7c.1348695851.git.elizabeth.flanagan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] license.bbclass: Variable standardization
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
X-List-Received-Date: Thu, 27 Sep 2012 17:08:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2012 02:50 PM, Elizabeth Flanagan wrote:
> The variable mentioned in license.conf is LICENSE_PATH. The variable
> used in license.bbclass is LICENSE_DIR. Conforming to what is in
> license.conf
>
> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
> ---
>   meta/classes/license.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index ffcaf93..ad543f6 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -186,7 +186,7 @@ python do_populate_lic() {
>       license_source_dirs = []
>       license_source_dirs.append(generic_directory)
>       try:
> -        additional_lic_dirs = d.getVar('LICENSE_DIR', True).split()
> +        additional_lic_dirs = d.getVar('LICENSE_PATH', True).split()

Beth, I found that we also have LICENSE_DIRECTORY, so the intent here is 
to be a multiple directory (such as a search PATH) for licenses?

There is also some documentation that needs to be changed, should not 
prevent this patch from being pulled.



Sau!

>           for lic_dir in additional_lic_dirs:
>               license_source_dirs.append(lic_dir)
>       except:
>


