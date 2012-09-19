Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEOXY-0003Rx-Bj
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:58:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Sep 2012 10:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,450,1344236400"; d="scan'208";a="224065576"
Received: from unknown (HELO [10.255.13.229]) ([10.255.13.229])
	by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2012 10:45:39 -0700
Message-ID: <505A04C3.8010804@linux.intel.com>
Date: Wed, 19 Sep 2012 10:45:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1347879240-17214-1-git-send-email-Martin.Jansa@gmail.com>
	<1347902221-5221-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1347902221-5221-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtelepathy: PR bump to rebuild after libffi5 -> libffi6
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
X-List-Received-Date: Wed, 19 Sep 2012 17:58:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2012 10:17 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
> index a7c6667..ee131ee 100644
> --- a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
> +++ b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
> @@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 dbus dbus-glib telepathy-glib"
>   LICENSE = "LGPLv2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>                       file://src/tp-conn.c;beginline=1;endline=19;md5=4c58069f77d601cc59200bce5396c7cb"
> -PR = "r4"
> +PR = "r5"
>
>   SRC_URI = "http://telepathy.freedesktop.org/releases/libtelepathy/libtelepathy-${PV}.tar.gz \
>              file://prefer_python_2.5.patch \
>

Merged the 3 of these PR Bumps into OE-Core

Thanks
	Sau!



