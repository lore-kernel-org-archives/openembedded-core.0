Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F33A3610FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 15:16:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Sep 2013 08:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,963,1371106800"; d="scan'208";a="405883380"
Received: from unknown (HELO [10.255.15.44]) ([10.255.15.44])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2013 08:16:13 -0700
Message-ID: <52405B3D.2060205@linux.intel.com>
Date: Mon, 23 Sep 2013 08:16:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
References: <1379923288-1061-1-git-send-email-david.nystrom@enea.com>
In-Reply-To: <1379923288-1061-1-git-send-email-david.nystrom@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] Add makedevs to nativesdk
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
X-List-Received-Date: Mon, 23 Sep 2013 15:16:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


You subject line in this patch and the libprelude patch still do not 
follow the guidelines, I pointed this out in the last review.

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

It should be in the form of makedevs: add nativesdk to BBCLASSEXTEND

The patch itself is good, just the commit message needs to be formatted 
correctly.

Thanks
	Sau!


On 09/23/2013 01:01 AM, David Nyström wrote:
> This is a first in a series of patches to add items
> to the nativesdk toolchain tarball.
> Many of which are Yocto specific and needed to create a
> rootfs with pre and post install hooks successfully run,
> using only the toolchain tarball.
>
> End goal is to create a sandbox where _users_ of a Yocto
> based distribution can customize a rootfs from a package feed
> with their package manager of choice.
>
> Signed-off-by: David Nyström <david.nystrom@enea.com>
> ---
>   meta/recipes-devtools/makedevs/makedevs_1.0.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
> index 2b9fd37..e6860f0 100644
> --- a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
> +++ b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
> @@ -19,4 +19,4 @@ do_install() {
>   	install -m 0755 ${S}/makedevs ${D}${base_sbindir}/makedevs
>   }
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
>

