Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 100E86AE86
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 17:17:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jul 2013 10:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1037,1363158000"; d="scan'208";a="363241634"
Received: from unknown (HELO [10.255.13.73]) ([10.255.13.73])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2013 10:18:10 -0700
Message-ID: <51DD9712.90006@linux.intel.com>
Date: Wed, 10 Jul 2013 10:17:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: jackie.huang@windriver.com
References: <1373450165-15022-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1373450165-15022-1-git-send-email-jackie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] matchbox-wm: correct the SRC_URI and add checksums
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
X-List-Received-Date: Wed, 10 Jul 2013 17:17:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2013 02:56 AM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   .../matchbox-wm/matchbox-wm_1.2.bb                 |    7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
> index 2628326..bc43167 100644
> --- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
> +++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
> @@ -2,13 +2,16 @@ SECTION = "x11/wm"
>   DESCRIPTION = "Matchbox window manager"
>   LICENSE = "GPLv2.0+"
>   DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes xdamage libxrender startup-notification expat"
> -PR = "r5"
> +PR = "r6"
>
No PR Bump needed


Sau!

> -SRC_URI = "http://matchbox-project.org/sources/matchbox-window-manager/1.2/matchbox-window-manager-${PV}.tar.bz2 \
> +SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/${PV}/matchbox-window-manager-${PV}.tar.bz2 \
>              file://configure_fix.patch \
>              file://kbdconfig \
>              file://gconf-2.m4"
>
> +SRC_URI[md5sum] = "3e158dcf57823b55c926d95b245500fb"
> +SRC_URI[sha256sum] = "81a23a4af797cf350759fd5ac738797015a66dd5dba2f3d9f3c6908506c1ceff"
> +
>   S = "${WORKDIR}/matchbox-window-manager-${PV}"
>
>   inherit autotools pkgconfig
>

