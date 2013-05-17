Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UdRS3-0004OO-7N
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 22:40:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2013 13:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,694,1363158000"; d="scan'208";a="243187801"
Received: from unknown (HELO [10.255.12.62]) ([10.255.12.62])
	by AZSMGA002.ch.intel.com with ESMTP; 17 May 2013 13:22:10 -0700
Message-ID: <51969171.3080501@linux.intel.com>
Date: Fri, 17 May 2013 23:22:09 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
References: <1368810732-29468-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1368810732-29468-1-git-send-email-schnitzeltony@googlemail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] glib-2.0: update to 2.36.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 20:40:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/17/2013 08:12 PM, Andreas Müller wrote:
> While updating the C++ bindings in meta-oe (glibmm/cairomm/pangomm) a
> dependency on glib 2.36.1 came up.
>
We have updated to 2.36.1 already, so this will need to be rebased if 
you want to update to 2.36.2.

Sau!

> This patch was build- (gcc 4.7.2/4.8.0) and run-tested with my standard
> xfce-/gnome2-images
>
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>   .../{glib-2.0_2.36.0.bb => glib-2.0_2.36.2.bb}     |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-core/glib-2.0/{glib-2.0_2.36.0.bb => glib-2.0_2.36.2.bb} (93%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
> similarity index 93%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
> index a042972..2e710c9 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
> @@ -18,8 +18,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>
>   SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
>
> -SRC_URI[md5sum] = "2047dff287473450593edecb18f79c17"
> -SRC_URI[sha256sum] = "455a8abe8692c5174bcc7ffa15b96a7521a2f2f9fb47594405927c35cb9bb227"
> +SRC_URI[md5sum] = "d791774ac49eaf8ba59792427bb74af7"
> +SRC_URI[sha256sum] = "5ea98451fb57d0ba523a1e836545f0a919b498863056fdd9da69d148c1347f80"
>
>   BBCLASSEXTEND = "native nativesdk"
>
>


