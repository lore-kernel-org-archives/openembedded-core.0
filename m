Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB146A5AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 16:09:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 13 Jun 2013 09:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,859,1363158000"; d="scan'208";a="349385550"
Received: from unknown (HELO [10.255.13.2]) ([10.255.13.2])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2013 09:09:36 -0700
Message-ID: <51B9EEA2.1080205@linux.intel.com>
Date: Thu, 13 Jun 2013 09:09:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1371029353-31833-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1371029353-31833-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: update install-quotaon-once.patch
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
X-List-Received-Date: Thu, 13 Jun 2013 16:09:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2013 02:29 AM, Ross Burton wrote:
> This patch has been merged upstream now, so refresh the patch with a backport
> (the patch was changed before being merged).
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../systemd/systemd/install-quotaon-once.patch     |   32 +++++++++++---------
>   1 file changed, 17 insertions(+), 15 deletions(-)
>
This seems to not being applied correctly

http://autobuilder.yoctoproject.org:8011/builders/nightly-qa-systemd/builds/47/steps/Building%20Images_1/logs/stdio


Sau!

> diff --git a/meta/recipes-core/systemd/systemd/install-quotaon-once.patch b/meta/recipes-core/systemd/systemd/install-quotaon-once.patch
> index 10280da..098a5f8 100644
> --- a/meta/recipes-core/systemd/systemd/install-quotaon-once.patch
> +++ b/meta/recipes-core/systemd/systemd/install-quotaon-once.patch
> @@ -1,7 +1,7 @@
> -Upstream-Status: Submitted (https://bugs.freedesktop.org/show_bug.cgi?id=65659)
> +Upstream-Status: Backport
>   Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> -From 44b7c4dc877984b5ea3f2c9fa09a93ee16dbe3b2 Mon Sep 17 00:00:00 2001
> +From 622004565eca385c685086cd478aa79afe73b785 Mon Sep 17 00:00:00 2001
>   From: Ross Burton <ross.burton@intel.com>
>   Date: Tue, 11 Jun 2013 17:16:37 +0100
>   Subject: [PATCH] build-sys: don't install quotaon.service twice
> @@ -9,24 +9,26 @@ Subject: [PATCH] build-sys: don't install quotaon.service twice
>   quotaon.service is already installed through dist_systemunit_DATA, so it doesn't
>   need to be added to nodist_systemunit_DATA.  Installing the same file twice
>   results in a race condition where the install process can fail.
> +
> +https://bugs.freedesktop.org/show_bug.cgi?id=65659
> +
> +[zj: actually remove quotaon.service from the other list.]
>   ---
> - Makefile.am |    3 ---
> - 1 file changed, 3 deletions(-)
> + Makefile.am |    1 -
> + 1 file changed, 1 deletion(-)
>
>   diff --git a/Makefile.am b/Makefile.am
> -index 28ae7ed..197119e 100644
> +index 28ae7ed..3219762 100644
>   --- a/Makefile.am
>   +++ b/Makefile.am
> -@@ -3229,9 +3229,6 @@ endif
> - EXTRA_DIST += \
> - 	units/systemd-quotacheck.service.in
> -
> --nodist_systemunit_DATA += \
> --	units/quotaon.service
> --
> - # ------------------------------------------------------------------------------
> - if ENABLE_RANDOMSEED
> - rootlibexec_PROGRAMS += \
> +@@ -389,7 +389,6 @@ dist_systemunit_DATA = \
> + 	units/sound.target \
> + 	units/bluetooth.target \
> + 	units/smartcard.target \
> +-	units/quotaon.service \
> + 	units/systemd-ask-password-wall.path \
> + 	units/systemd-ask-password-console.path \
> + 	units/systemd-udevd-control.socket \
>   --
>   1.7.10.4
>
>

