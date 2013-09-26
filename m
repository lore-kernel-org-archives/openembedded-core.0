Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 336836110B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 13:48:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2013 06:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,985,1371106800"; d="scan'208";a="401386041"
Received: from unknown (HELO [10.255.15.105]) ([10.255.15.105])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2013 06:48:26 -0700
Message-ID: <52443B2A.4040806@linux.intel.com>
Date: Thu, 26 Sep 2013 06:48:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
References: <1380192442-12205-1-git-send-email-david.nystrom@enea.com>
In-Reply-To: <1380192442-12205-1-git-send-email-david.nystrom@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] makedevs: Add device_table-minimal.txt to the nativesdk sysroot
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
X-List-Received-Date: Thu, 26 Sep 2013 13:48:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/26/2013 03:47 AM, David Nyström wrote:
> Add an example device_table in the SDK under /usr/share/
>
> Signed-off-by: David Nyström <david.nystrom@enea.com>
> ---
>   meta/recipes-devtools/makedevs/makedevs_1.0.0.bb | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
> index e6860f0..4c7a5ae 100644
> --- a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
> +++ b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
> @@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>   SECTION = "base"
>   SRC_URI = "file://makedevs.c \
>              file://COPYING.patch"
> -PR = "r7"
> +PR = "r8"
> +
No PR bump needed any more.

Thanks
	Sau!

> +FILES_${PN}_append_class-nativesdk = " ${datadir}"
>
>   do_configure() {
>   	install -m 0644 ${WORKDIR}/makedevs.c ${S}/
> @@ -19,4 +21,9 @@ do_install() {
>   	install -m 0755 ${S}/makedevs ${D}${base_sbindir}/makedevs
>   }
>
> +do_install_append_class-nativesdk() {
> +        install -d ${D}${datadir}
> +        install -m 644 ${COREBASE}/meta/files/device_table-minimal.txt ${D}${datadir}/
> +}
> +
>   BBCLASSEXTEND = "native nativesdk"
>

