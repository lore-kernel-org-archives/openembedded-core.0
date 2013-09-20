Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E31306C8BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 21:14:39 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Sep 2013 14:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,947,1371106800"; d="scan'208";a="363462709"
Received: from unknown (HELO [10.255.15.101]) ([10.255.15.101])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2013 14:14:41 -0700
Message-ID: <523CBAC0.1070306@linux.intel.com>
Date: Fri, 20 Sep 2013 14:14:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
References: <1379598325-23165-1-git-send-email-david.nystrom@enea.com>
In-Reply-To: <1379598325-23165-1-git-send-email-david.nystrom@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add makedevs to nativesdk, which can later allow creation of a small script which allows users of the toolchain tarball to create a custom rootfs from a package feed, using pseudo & makedevs.
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
X-List-Received-Date: Fri, 20 Sep 2013 21:14:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Please reformat the commit message to meet the guidelines

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

It should have a distinct summary: "makedevs: Add nativesdk" and then 
the "why" in the body of the commit message.

Thanks
	Sau!


On 09/19/2013 06:45 AM, David Nyström wrote:
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

