Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 516E9796BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 09:37:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8R9bS7i010315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 02:37:28 -0700 (PDT)
Received: from [128.224.162.216] (128.224.162.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 27 Sep 2018 02:37:27 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1538037507-104826-1-git-send-email-zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <67c7f295-f8c9-e71e-bf73-1b31f7c88335@windriver.com>
Date: Thu, 27 Sep 2018 17:37:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1538037507-104826-1-git-send-email-zhe.he@windriver.com>
X-Originating-IP: [128.224.162.216]
Subject: Re: [PATCH] nativesdk-bison: Add to nativesdk-packagegroup-sdk-host and set BISON_PKGDATADIR
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
X-List-Received-Date: Thu, 27 Sep 2018 09:37:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please ignore. Something wrong with it.

Zhe

On 2018年09月27日 16:38, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> bison is needed when building kernel. Add it to nativesdk-packagegroup-sdk-host
> and set BISON_PKGDATADIR for bison to use its components.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
>  meta/recipes-devtools/bison/bison_3.0.4.bb                         | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index e2f6169..448c2f6 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -25,6 +25,7 @@ RDEPENDS_${PN} = "\
>      nativesdk-cmake \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
>      nativesdk-sdk-provides-dummy \
> +    nativesdk-bison \
>      "
>  
>  RDEPENDS_${PN}_darwin = "\
> diff --git a/meta/recipes-devtools/bison/bison_3.0.4.bb b/meta/recipes-devtools/bison/bison_3.0.4.bb
> index cc155f0..07677a7 100644
> --- a/meta/recipes-devtools/bison/bison_3.0.4.bb
> +++ b/meta/recipes-devtools/bison/bison_3.0.4.bb
> @@ -36,4 +36,8 @@ do_install_append_class-native() {
>  	create_wrapper ${D}/${bindir}/bison \
>  		BISON_PKGDATADIR=${STAGING_DATADIR_NATIVE}/bison
>  }
> +do_install_append_class-nativesdk() {
> +	create_wrapper ${D}/${bindir}/bison \
> +		BISON_PKGDATADIR=${OECORE_NATIVE_SYSROOT}${prefix_nativesdk}/share/bison
> +}
>  BBCLASSEXTEND = "native nativesdk"


