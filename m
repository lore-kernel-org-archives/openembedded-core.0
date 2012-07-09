Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHaY-0006Fz-RD
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:17:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2012 10:06:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190328167"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 10:06:24 -0700
Message-ID: <4FFB0F90.3050904@linux.intel.com>
Date: Mon, 09 Jul 2012 10:06:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341499703-6867-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1341499703-6867-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] classes/license: fix manifest to work with deb
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
X-List-Received-Date: Mon, 09 Jul 2012 17:17:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2012 07:48 AM, Paul Eggleton wrote:
> Prepend the license manifest creation call to ROOTFS_POSTPROCESS_COMMAND
> instead of appending to ROOTFS_POSTINSTALL_COMMAND. The latter is not
> implemented for the deb backend (and probably ought to just be removed
> completely), and by using _prepend we can still ensure it occurs before
> package info is removed (and before buildhistory in case it is needed
> there in future).
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/classes/license.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index e6096a6..4e25cf8 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -382,7 +382,7 @@ do_populate_lic[sstate-name] = "populate-lic"
>   do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
>   do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
>
> -ROOTFS_POSTINSTALL_COMMAND += "license_create_manifest; "
> +ROOTFS_POSTPROCESS_COMMAND_prepend = "license_create_manifest; "
>
>   python do_populate_lic_setscene () {
>   	sstate_setscene(d)
>

Merged into OE-Core

Thanks
	Sau!



