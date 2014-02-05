Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 00C106E2D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 15:49:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Feb 2014 07:49:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,787,1384329600"; d="scan'208";a="476439376"
Received: from unknown (HELO [10.255.12.76]) ([10.255.12.76])
	by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2014 07:49:25 -0800
Message-ID: <52F25D84.6060501@linux.intel.com>
Date: Wed, 05 Feb 2014 07:49:24 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>, 
 openembedded-core@lists.openembedded.org
References: <1391598835-1631-1-git-send-email-lpapp@kde.org>
In-Reply-To: <1391598835-1631-1-git-send-email-lpapp@kde.org>
Subject: Re: [PATCH] meta/recipes-core/base-passwd/base-passwd/noshadow.patch: Split it into two parts
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
X-List-Received-Date: Wed, 05 Feb 2014 15:49:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2014 03:13 AM, Laszlo Papp wrote:
> The current change contains two different logics resulting that users like me
> may need to partially override the behavior of it. It would be easier for end
> users to keep one change while dropping the other if needed, like in our case.
>

I beleive that your first version of this was merged, is this different 
that the one you send on 1/30?

It seems that the line count in this patch is different than the first, 
please rebase against master and update this patch please.

Thanks

Sau!

> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>   meta/recipes-core/base-passwd/base-passwd/nobash.patch | 10 +---------
>   .../base-passwd/base-passwd/noshadow.patch             | 18 ++++++++++++++++++
>   meta/recipes-core/base-passwd/base-passwd_3.5.29.bb    |  1 +
>   3 files changed, 20 insertions(+), 9 deletions(-)
>   create mode 100644 meta/recipes-core/base-passwd/base-passwd/noshadow.patch
>
> diff --git a/meta/recipes-core/base-passwd/base-passwd/nobash.patch b/meta/recipes-core/base-passwd/base-passwd/nobash.patch
> index 6371576..eed87db 100644
> --- a/meta/recipes-core/base-passwd/base-passwd/nobash.patch
> +++ b/meta/recipes-core/base-passwd/base-passwd/nobash.patch
> @@ -1,14 +1,6 @@
>   use /bin/sh instead of /bin/bash, since the latter may not be included in
>   some images such as minimal
>
> -comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
> -
> -remove "*" for root since we don't have a /etc/shadow so far.
> -
> -by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
> -
> -Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
> -
>   Upstream-Status: Invalid [configuration]
>
>   Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> @@ -17,7 +9,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>   +++ base-passwd/passwd.master
>   @@ -1,4 +1,4 @@
>   -root:*:0:0:root:/root:/bin/bash
> -+root::0:0:root:/root:/bin/sh
> ++root:*:0:0:root:/root:/bin/sh
>    daemon:*:1:1:daemon:/usr/sbin:/bin/sh
>    bin:*:2:2:bin:/bin:/bin/sh
>    sys:*:3:3:sys:/dev:/bin/sh
> diff --git a/meta/recipes-core/base-passwd/base-passwd/noshadow.patch b/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
> new file mode 100644
> index 0000000..14e3959
> --- /dev/null
> +++ b/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
> @@ -0,0 +1,18 @@
> +comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
> +
> +remove "*" for root since we don't have a /etc/shadow so far.
> +
> +by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
> +
> +Upstream-Status: Invalid [configuration]
> +
> +Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> +
> +--- base-passwd/passwd.master~nobash
> ++++ base-passwd/passwd.master
> +@@ -1,4 +1,4 @@
> +-root:*:0:0:root:/root:/bin/sh
> ++root::0:0:root:/root:/bin/sh
> + daemon:*:1:1:daemon:/usr/sbin:/bin/sh
> + bin:*:2:2:bin:/bin:/bin/sh
> + sys:*:3:3:sys:/dev:/bin/sh
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> index 082037a..5b31fce 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> @@ -9,6 +9,7 @@ DEPENDS = "docbook-utils-native linuxdoc-tools-native"
>   SRC_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz \
>              file://add_shutdown.patch \
>              file://nobash.patch \
> +           file://noshadow.patch \
>              file://input.patch \
>              file://disable-docs.patch \
>             "
>

