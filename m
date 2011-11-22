Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RStAt-0005iH-B9
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 17:26:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Nov 2011 08:19:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="78832500"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by orsmga001.jf.intel.com with ESMTP; 22 Nov 2011 08:19:51 -0800
Message-ID: <4ECBCBA7.8080208@linux.intel.com>
Date: Tue, 22 Nov 2011 08:19:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC][PATCH 1/2] libjson: add 0.9
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
X-List-Received-Date: Tue, 22 Nov 2011 16:26:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2011 10:12 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-devtools/libjson/libjson_0.9.bb |   13 +++++++++++++
>   1 files changed, 13 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
>
> diff --git a/meta/recipes-devtools/libjson/libjson_0.9.bb b/meta/recipes-devtools/libjson/libjson_0.9.bb
> new file mode 100644
> index 0000000..4d609a6
> --- /dev/null
> +++ b/meta/recipes-devtools/libjson/libjson_0.9.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "JSON-C - A JSON implementation in C"
> +
> +LICENSE = "MIT/X11"

I believe that LICENSE = "MIT" (or MIT-X) as the standard entry.
Maybe Beth can give the correct version here.

Thanks
	Sau!

> +LIC_FILES_CHKSUM = "file://COPYING;md5=30a276a476b02c2dcd0849bde417fb17"
> +
> +SRC_URI = "http://oss.metaparadigm.com/json-c/json-c-${PV}.tar.gz"
> +SRC_URI[md5sum] = "3a13d264528dcbaf3931b0cede24abae"
> +SRC_URI[sha256sum] = "702a486c9bf8e19137d484ab5c49b4ad314eb5e1fe37062a72c0a0fa39439475"
> +
> +S = "${WORKDIR}/json-c-${PV}"
> +
> +
> +inherit autotools


