Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROYSN-00007M-Tk
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 18:30:32 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Nov 2011 09:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,489,1315206000"; d="scan'208";a="35482350"
Received: from unknown (HELO [10.255.15.157]) ([10.255.15.157])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Nov 2011 09:24:13 -0800
Message-ID: <4EBC08BD.8010106@linux.intel.com>
Date: Thu, 10 Nov 2011 09:24:13 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320762144-9237-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1320762144-9237-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] libxml2: use Copyright in LIC_FILES_CHKSUM instead of COPYING
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Nov 2011 17:30:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2011 06:22 AM, Martin Jansa wrote:
> * COPYING is replaced by symlink to Copyright during do_configure
>    (see configure.in), then we end with link to nonexistent file
> * same issue as libxslt had http://patchwork.openembedded.org/patch/14195/
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-core/libxml/libxml2.inc      |    2 +-
>   meta/recipes-core/libxml/libxml2_2.7.8.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
> index 6f79333..68c088c 100644
> --- a/meta/recipes-core/libxml/libxml2.inc
> +++ b/meta/recipes-core/libxml/libxml2.inc
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://www.xmlsoft.org/"
>   BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
>   SECTION = "libs"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=bb90c48926316d9af6e2d70ca7013ade \
> +LIC_FILES_CHKSUM = "file://Copyright;md5=bb90c48926316d9af6e2d70ca7013ade \
>                       file://hash.c;beginline=6;endline=15;md5=ce702952bfddd7aee22639a2d6b54136 \
>                       file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
>                       file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
> diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
> index 71001a0..2fa246e 100644
> --- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
> @@ -1,6 +1,6 @@
>   require libxml2.inc
>
> -PR = "r3"
> +PR = "r4"
>
>   SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
>   SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"

Merged into OE-Core

Thanks
	Sau!


