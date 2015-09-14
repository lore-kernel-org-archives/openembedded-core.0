Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0000360053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 00:32:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8E0WKYm018420
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Sep 2015 17:32:20 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 13 Sep 2015 17:32:19 -0700
Message-ID: <55F61592.3070808@windriver.com>
Date: Mon, 14 Sep 2015 08:32:18 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1440576307-16564-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1440576307-16564-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] asciidoc: create recipe
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
X-List-Received-Date: Mon, 14 Sep 2015 00:32:21 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-Roy

On 2015年08月26日 16:05, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> To fix [YOCTO #3388], asciidoc is needed
>
> AsciiDoc is a text document format for writing short documents, articles,
> books and UNIX man pages.
>
> get recipe from openembedded, update the download url, remove the vim magic
> since it becomes useless, enable native, and upgrade to 8.6.9
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
>
> diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> new file mode 100644
> index 0000000..79747ae
> --- /dev/null
> +++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "AsciiDoc is a text document format for writing short documents, \
> +articles, books and UNIX man pages."
> +
> +HOMEPAGE = "http://www.methods.co.nz/asciidoc/"
> +LICENSE = "GPLv2"
> +
> +SRC_URI = " http://downloads.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
> +
> +inherit distutils-base autotools-brokensep
> +
> +export DESTDIR = "${D}"
> +
> +FILES_${PN} += "${sysconfdir}"
> +
> +RDEPENDS_${PN} += "python"
> +
> +SRC_URI[md5sum] = "c59018f105be8d022714b826b0be130a"
> +SRC_URI[sha256sum] = "78db9d0567c8ab6570a6eff7ffdf84eadd91f2dfc0a92a2d0105d323cab4e1f0"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
> +
> +BBCLASSEXTEND = "native"
>

-- 
Best Reagrds,
Roy | RongQing Li

