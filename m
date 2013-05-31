Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBF66041D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 06:35:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 May 2013 23:35:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,777,1363158000"; d="scan'208";a="322320142"
Received: from unknown (HELO [10.255.13.98]) ([10.255.13.98])
	by orsmga001.jf.intel.com with ESMTP; 30 May 2013 23:35:35 -0700
Message-ID: <51A844B7.9020201@linux.intel.com>
Date: Fri, 31 May 2013 15:35:35 +0900
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
References: <1369946430-12959-1-git-send-email-eric@eukrea.com>
	<1369946430-12959-2-git-send-email-eric@eukrea.com>
In-Reply-To: <1369946430-12959-2-git-send-email-eric@eukrea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] gtk-icon-cache pixbufcache: add a clear dependency on gdk-pixbuf-native
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
X-List-Received-Date: Fri, 31 May 2013 06:35:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/31/2013 05:40 AM, Eric Bénard wrote:
> not really sure if the dependency is always inherited but at least
> there won't be bad surprise.
>
This seems to have caused a circular dependency, not sure the exact 
nature, please verify this.

There might have been a patch from someone else recently, so please 
check the latest master.

Thanks
    Sau!

> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>   meta/classes/gtk-icon-cache.bbclass | 2 +-
>   meta/classes/pixbufcache.bbclass    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
> index 789fa38..8ed7feb 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -1,6 +1,6 @@
>   FILES_${PN} += "${datadir}/icons/hicolor"
>
> -DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk-update-icon-cache-native"
> +DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk-update-icon-cache-native gdk-pixbuf-native"
>
>   gtk_icon_cache_postinst() {
>   if [ "x$D" != "x" ]; then
> diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
> index 274d67d..4ac17ee 100644
> --- a/meta/classes/pixbufcache.bbclass
> +++ b/meta/classes/pixbufcache.bbclass
> @@ -3,7 +3,7 @@
>   # packages.
>   #
>
> -DEPENDS += "qemu-native"
> +DEPENDS += "qemu-native gdk-pixbuf-native"
>   inherit qemu
>
>   PIXBUF_PACKAGES ??= "${PN}"
>

