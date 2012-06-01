Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SaMCa-0001Ha-0i
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 09:23:16 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Jun 2012 00:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106612567"
Received: from unknown (HELO [10.239.11.116]) ([10.239.11.116])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jun 2012 00:12:34 -0700
Message-ID: <4FC86B60.6040907@linux.intel.com>
Date: Fri, 01 Jun 2012 00:12:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1338420972.git.elizabeth.flanagan@intel.com>
	<6dcb3827885e1e0812656d44028df568903fb400.1338420972.git.elizabeth.flanagan@intel.com>
In-Reply-To: <6dcb3827885e1e0812656d44028df568903fb400.1338420972.git.elizabeth.flanagan@intel.com>
Subject: Re: [PATCH 1/1] license.bbclass: Adding PV to package.manifest
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
X-List-Received-Date: Fri, 01 Jun 2012 07:23:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/30/2012 04:39 PM, Elizabeth Flanagan wrote:
> Per request, adding the package version to the package manifest
> file.
>
> Signed-off-by: Elizabeth Flanagan<elizabeth.flanagan@intel.com>
> ---
>   meta/classes/license.bbclass |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 6c4a673..a537496 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -90,11 +90,13 @@ license_create_manifest() {
>   		for filename in $files; do
>   			pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
>   			pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
> +			pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
>   			# check to see if the package name exists in the manifest. if so, bail.
>   			if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
>   				# exclude local recipes
>   				if [ ! "${pkged_pn}" = "*locale*" ]; then
>   					echo "PACKAGE NAME:" ${pkg}>>  ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
> +					echo "PACKAGE VERSION:" ${pkged_pv}>>  ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
>   					echo "RECIPE NAME:" ${pkged_pn}>>  ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
>   					echo "LICENSE: ">>  ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
>   					for lic in ${pkged_lic}; do
Beth,

Your patches don't seem to apply together, if I apply one the other 
fails or the reverse.

Can you rebase appropriately

Sau!


