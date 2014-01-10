Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 899C560B9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 23:16:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Jan 2014 15:16:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,640,1384329600"; d="scan'208";a="437148869"
Received: from unknown (HELO [10.255.12.53]) ([10.255.12.53])
	by orsmga001.jf.intel.com with ESMTP; 10 Jan 2014 15:16:12 -0800
Message-ID: <52D07F3C.40601@linux.intel.com>
Date: Fri, 10 Jan 2014 15:16:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1389373329-21241-1-git-send-email-ross.burton@intel.com>
	<1389373329-21241-2-git-send-email-ross.burton@intel.com>
In-Reply-To: <1389373329-21241-2-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH][V2 2/5] python-mako: add (from meta-oe)
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
X-List-Received-Date: Fri, 10 Jan 2014 23:16:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2014 09:02 AM, Ross Burton wrote:
> python-mako is needed for Piglit.  This recipe is taken directly from meta-oe.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-devtools/python/python-mako_0.7.2.bb |   22 +++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python-mako_0.7.2.bb
>
> diff --git a/meta/recipes-devtools/python/python-mako_0.7.2.bb b/meta/recipes-devtools/python/python-mako_0.7.2.bb
> new file mode 100644
> index 0000000..1d2bdd7
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-mako_0.7.2.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "Templating library for Python"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=da8dd26ed9751ee0cfdf9df1a16bbb54"
> +
> +PR = "r2"
> +
> +SRC_URI = "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"

Seems like they might have moved or lost these files since you tested, 
the upstream is at 0.9.1 and has moved these files to
https://pypi.python.org/packages/source/M/Mako/Mako-0.7.2.tar.gz

Sau!

> +SRC_URI[md5sum] = "e3c0a677aa4216da9e89ef8fa76cbafb"
> +SRC_URI[sha256sum] = "fe8698e845035586bd711a6748e4e40a208a58de276b9138026164700494b68f"
> +
> +S = "${WORKDIR}/Mako-${PV}"
> +
> +inherit setuptools
> +
> +RDEPENDS_${PN} = "python-threading \
> +                  python-netclient \
> +                  python-html \
> +"
> +RDEPENDS_${PN}_class-native = ""
> +
> +BBCLASSEXTEND = "native nativesdk"
>

