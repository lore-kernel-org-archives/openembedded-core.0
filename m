Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E94AE731C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 03:47:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBE3kbr5014114
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Dec 2016 19:46:37 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Dec 2016 19:46:36 -0800
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	<openembedded-core@lists.openembedded.org>
References: <1481715249-1985-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <563c4c2b-d506-eed9-6586-e5cbd566e7df@windriver.com>
Date: Wed, 14 Dec 2016 11:46:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1481715249-1985-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] libxkbcommon: 0.6.1 -> 0.7.0
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
X-List-Received-Date: Wed, 14 Dec 2016 03:47:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/14/2016 07:34 PM, Huang Qiyu wrote:
> 1)Upgrade libxkbcommon from 0.6.1 to 0.7.0.
> 2)License checksum changes are not related to license changes.

You need add what is changed, for example, year or space ?

// Robert

>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../xorg-lib/{libxkbcommon_0.6.1.bb => libxkbcommon_0.7.0.bb}       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.6.1.bb => libxkbcommon_0.7.0.bb} (74%)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.6.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.0.bb
> similarity index 74%
> rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.6.1.bb
> rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.0.bb
> index fc08109..a6836d8 100644
> --- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.6.1.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.0.bb
> @@ -2,15 +2,15 @@ SUMMARY = "Generic XKB keymap library"
>  DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
>  processes a reduced subset of keymaps as defined by the XKB specification."
>  HOMEPAGE = "http://www.xkbcommon.org"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=09457b156e3155972abebcaaaa0cb434"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e525ed9809e1f8a07cf4bce8b09e8b87"
>  LICENSE = "MIT & MIT-style"
>
>  DEPENDS = "util-macros flex-native bison-native"
>
>  SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
>
> -SRC_URI[md5sum] = "67a8f322b5fa32352272e811bb90dd73"
> -SRC_URI[sha256sum] = "5b0887b080b42169096a61106661f8d35bae783f8b6c58f97ebcd3af83ea8760"
> +SRC_URI[md5sum] = "61ba550fc529ea4d6f9faa2cad62c95f"
> +SRC_URI[sha256sum] = "09351592312d67b438655f54da5b67853026662c4a57e6be4d225f04a9989798"
>
>  UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
>
>

