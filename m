Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFApU-0003Kj-Of
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 22:59:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2012 13:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125001172"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2012 13:50:38 -0700
Message-ID: <4F7B629D.3010906@linux.intel.com>
Date: Tue, 03 Apr 2012 13:50:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332328101-22779-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1332328101-22779-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH] speex: fix FILES variables
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
X-List-Received-Date: Tue, 03 Apr 2012 20:59:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/21/2012 04:08 AM, Eric Bénard wrote:
> actually FILES_${PN} and FILES_${PN}-dev match the same files.
> these files are supposed to go into ${PN} so remove the other entry.
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
>   meta/recipes-multimedia/speex/speex_1.2rc1.bb |    3 +--
>   1 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> index fe46a00..7370134 100644
> --- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> +++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
>                       file://include/speex/speex.h;beginline=1;endline=34;md5=a68129f78d7fe66e07163f73aba143b3"
>   DEPENDS = "libogg"
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.tar.gz"
>
> @@ -24,5 +24,4 @@ EXTRA_OECONF = " --enable-fixed-point --with-ogg-libraries=${STAGING_LIBDIR} \
>
>   PACKAGES += "${PN}-bin"
>   FILES_${PN} = "${libdir}/lib*.so.*"
> -FILES_${PN}-dev += "${libdir}/lib*.so.*"
>   FILES_${PN}-bin = "${bindir}"

Merged into OE-Core

Thanks
	Sau!


