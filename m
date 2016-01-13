Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4800360017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 12:55:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jan 2016 04:55:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,289,1449561600"; d="scan'208";a="880484806"
Received: from jlock-mobl.gar.corp.intel.com (HELO
	jlock-mobl1.gar.corp.intel.com) ([10.252.9.77])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2016 04:55:26 -0800
To: Bob Ham <bob.ham@collabora.com>, openembedded-core@lists.openembedded.org
References: <1452684873-15629-1-git-send-email-bob.ham@collabora.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
Message-ID: <5696493C.8070700@linux.intel.com>
Date: Wed, 13 Jan 2016 12:55:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1452684873-15629-1-git-send-email-bob.ham@collabora.com>
Subject: Re: [PATCH] xserver-xorg: ensure xkbcomp is present for xwayland-only installs
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
X-List-Received-Date: Wed, 13 Jan 2016 12:55:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bob,

On 13/01/16 11:34, Bob Ham wrote:
> Add appropriate RRECOMMENDS for Xwayland runtime dependencies.

A change was merged to master some time back for this[1], is this patch 
intended for the jethro branch?

If so the usual convention is to backport, or request a cherry-pick, of 
the changes from the master branch.
Furthermore submissions to a stable branch should include the name of 
the stable branch in the subject.

Policies for stable branches are similar to those for the Yocto 
Project[2], though we should probably create a similar page on the OE 
wiki documenting the desired process for this project.

Regards,

Joshua

1. 
http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc?id=682fb02f585c830e3f28a858b97276adf71693d2
2. https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

> Co-Authored-By: Joshua Lock <joshua.lock@collabora.co.uk>
> Signed-off-by: Bob Ham <bob.ham@collabora.com>
> ---
>   meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 9881c94..8707e34 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -73,6 +73,7 @@ SUMMARY_xf86-video-modesetting = "X.Org X server -- modesetting display driver"
>   INSANE_SKIP_xf86-video-modesetting = "xorg-driver-abi"
>
>   RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config xkbcomp"
> +RRECOMMENDS_${PN}-xwayland += "xkeyboard-config rgb xserver-xf86-config xkbcomp"
>   RDEPENDS_${PN}-xvfb += "xkeyboard-config"
>   RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
>
>

