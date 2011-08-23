Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qvsj1-0000El-Oa
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 17:17:12 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2011 08:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,270,1312182000"; d="scan'208";a="10190557"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2011 08:12:25 -0700
Message-ID: <4E53C358.9010002@linux.intel.com>
Date: Tue, 23 Aug 2011 08:12:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1314094152.git.paul.eggleton@linux.intel.com>
	<3b2374ace44a610af75052498766f9840fb3d615.1314094152.git.paul.eggleton@linux.intel.com>
In-Reply-To: <3b2374ace44a610af75052498766f9840fb3d615.1314094152.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] image.bbclass: remove non-standard -n option from cp command
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
X-List-Received-Date: Tue, 23 Aug 2011 15:17:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2011 03:11 AM, Paul Eggleton wrote:
> -n is not a POSIX option and does not work on some systems (e.g. Debian
> Lenny); in any case it is not strictly necessary here, so remove it.
>
> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
> ---
>   meta/classes/image.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 286ae01..bf8b73a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -138,7 +138,7 @@ fakeroot do_rootfs () {
>   	mkdir -p ${IMAGE_ROOTFS}
>   	mkdir -p ${DEPLOY_DIR_IMAGE}
>
> -	cp -n ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> +	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>
>   	if [ "${USE_DEVFS}" != "1" ]; then
>   		for devtable in ${@get_devtable_list(d)}; do
Paul,

Is this in addition to the previous image.bbclass patch you provided? 
If so, there are 2 usages of -n in original patch that is merged.

Sau!


