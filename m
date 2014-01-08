Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 44F5E6D255
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 17:31:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jan 2014 09:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,625,1384329600"; d="scan'208";a="463627346"
Received: from unknown (HELO [10.255.12.53]) ([10.255.12.53])
	by orsmga002.jf.intel.com with ESMTP; 08 Jan 2014 09:31:35 -0800
Message-ID: <52CD8B77.4020805@linux.intel.com>
Date: Wed, 08 Jan 2014 09:31:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Corneliu Stoicescu <corneliux.stoicescu@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1389028342-23264-1-git-send-email-corneliux.stoicescu@intel.com>
In-Reply-To: <1389028342-23264-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: Re: [PATCH V2] Modify buildstats to be merged inside buildhistory
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
X-List-Received-Date: Wed, 08 Jan 2014 17:31:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2014 09:12 AM, Corneliu Stoicescu wrote:
> - added buildstats inheritance inside buildhistory
> - when buildhisory is used, buildstats will be moved inside the buildhistory directory

This does not seem to have a Signed-off-by:

Please submit a v2 for review.

Thanks
	Sau!

> ---
>   meta/classes/buildhistory.bbclass |    3 +++
>   meta/classes/buildstats.bbclass   |    2 +-
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index e9a9c3b..54efecfe 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -16,9 +16,12 @@ BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
>   BUILDHISTORY_COMMIT ?= "0"
>   BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
>   BUILDHISTORY_PUSH_REPO ?= ""
> +BUILDSTATS_BASE = "${BUILDHISTORY_DIR}/buildstats"
>
>   SSTATEPOSTINSTFUNCS += "buildhistory_emit_pkghistory"
>
> +inherit buildstats
> +
>   #
>   # Write out metadata about this package for comparision when writing future packages
>   #
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
> index 72fff11..c8769ae 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -1,4 +1,4 @@
> -BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
> +BUILDSTATS_BASE ??= "${TMPDIR}/buildstats/"
>   BNFILE = "${BUILDSTATS_BASE}/.buildname"
>   DEVFILE = "${BUILDSTATS_BASE}/.device"
>
>

