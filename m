Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0160761DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 23:28:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2013 16:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,880,1367996400"; d="scan'208";a="387282834"
Received: from unknown (HELO [10.255.14.106]) ([10.255.14.106])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2013 16:28:01 -0700
Message-ID: <520C1280.7030205@linux.intel.com>
Date: Wed, 14 Aug 2013 16:28:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>
References: <1376521430-15244-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1376521430-15244-1-git-send-email-jslater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] coreutils: add PACKAGECONFIG info for act support
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
X-List-Received-Date: Wed, 14 Aug 2013 23:28:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2013 04:03 PM, Joe Slater wrote:
> CQID: 430353
>
act support or acl support :-)

> Add configuration data to enable acl support if
> it is a distro feature.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   meta/recipes-core/coreutils/coreutils_6.9.bb |   13 ++++++++++++-
>   1 files changed, 12 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
> index c0778ba..2bdd297 100644
> --- a/meta/recipes-core/coreutils/coreutils_6.9.bb
> +++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
> @@ -8,7 +8,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>                       file://src/ls.c;beginline=4;endline=16;md5=15ed60f67b1db5fedd5dbc37cf8a9543"
> -PR = "r5"
> +PR = "r6"

No PR Bumps
>   DEPENDS_class-native = "gettext-native"
>
>   inherit autotools gettext
> @@ -32,6 +32,17 @@ SRC_URI_class-native = "${SRC_URI_BASE}"
>   SRC_URI[md5sum] = "c9607d8495f16e98906e7ed2d9751a06"
>   SRC_URI[sha256sum] = "89c2895ad157de50e53298b22d91db116ee4e1dd3fdf4019260254e2e31497b0"
>
> +
> +# acl is not a default feature
> +#
> +PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
> +PACKAGECONFIG_class-native ??= ""
> +
> +# with, without, depends, rdepends
> +#
> +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
> +
> +
>   # [ gets a special treatment and is not included in this
>   bindir_progs = "base64 basename cksum comm csplit cut dir dircolors dirname du \
>                   env expand expr factor fmt fold groups head hostid id install \
>

