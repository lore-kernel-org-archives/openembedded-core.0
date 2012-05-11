Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStxM-0003VG-9l
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:48:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 May 2012 10:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="142863005"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by orsmga002.jf.intel.com with ESMTP; 11 May 2012 10:38:47 -0700
Message-ID: <4FAD4EA7.2090902@linux.intel.com>
Date: Fri, 11 May 2012 10:38:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336680237-31671-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1336680237-31671-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] e2fsprogs: fix packaging error for libext2fs
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
X-List-Received-Date: Fri, 11 May 2012 17:48:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2012 01:03 PM, Andreas Oberritter wrote:
> * libext2fs is located in base_libdir, not libdir
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
> index 6df7cea..8d4443b 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
> @@ -1,6 +1,6 @@
>   require e2fsprogs.inc
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI += "file://fallocate.patch \
>               file://acinclude.m4 \
> @@ -58,7 +58,7 @@ FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
>   FILES_libcomerr = "${base_libdir}/libcom_err.so.*"
>   FILES_libss = "${base_libdir}/libss.so.*"
>   FILES_libe2p = "${base_libdir}/libe2p.so.*"
> -FILES_libext2fs = "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
> +FILES_libext2fs = "${libdir}/e2initrd_helper ${base_libdir}/libext2fs.so.*"
>   FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so"
>
>   BBCLASSEXTEND = "native"

Merged into OE-Core

Thanks
	Sau!


