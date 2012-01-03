Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiBsB-0005bH-GC
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 22:26:19 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2012 13:18:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108401095"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2012 13:18:57 -0800
Message-ID: <4F0370C1.3030507@linux.intel.com>
Date: Tue, 03 Jan 2012 13:18:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <3443259C5BCC4C21B2D92CD4C4B9AC73@gmail.com>
In-Reply-To: <3443259C5BCC4C21B2D92CD4C4B9AC73@gmail.com>
Subject: Re: [PATCH] buildhistory: avoid quoting issues with the layer list for build-id
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
X-List-Received-Date: Tue, 03 Jan 2012 21:26:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/2011 08:23 AM, Christopher Larson wrote:
> The layer list is multiline, and includes quotes, so including it within
> quotes is problematic, particularly if the revision includes characters
> which
> are not valid outside of a quoted string in shell. To reproduce this
> failure:
> do a build with an scm layer not on a branch.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com
> <mailto:chris_larson@mentor.com>>
> ---
> meta/classes/buildhistory.bbclass | 5 ++++-
> 1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index 39f5ff6..6a08db4 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -325,7 +325,10 @@ buildhistory_get_imageinfo() {
> # Add some configuration information
> echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO}
> ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id
> - echo "${@buildhistory_get_layers(d)}" >>
> ${BUILDHISTORY_DIR_IMAGE}/build-id
> +
> + cat >> ${BUILDHISTORY_DIR_IMAGE}/build-id <<END
> +${@buildhistory_get_layers(d)}
> +END
> }
> # By prepending we get in before the removal of packaging files
> --
> 1.7.8
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Merged into OE-Core

Thanks
	Sau!


