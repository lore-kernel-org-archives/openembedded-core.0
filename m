Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TdWS1-0005X1-Tk
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 02:28:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Nov 2012 17:14:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,174,1355126400"; d="scan'208";a="225445709"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.47])
	by orsmga001.jf.intel.com with ESMTP; 27 Nov 2012 17:14:18 -0800
Message-ID: <50B56569.1020809@linux.intel.com>
Date: Tue, 27 Nov 2012 17:14:17 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1353910511-12931-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1353910511-12931-1-git-send-email-sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-meta-base: Make ximagesing optional on x11 DISTRO_FEATURE
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
X-List-Received-Date: Wed, 28 Nov 2012 01:28:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Ross,

This one should hit Danny next also if possible.

Thanks
	Sau!

On 11/25/2012 10:15 PM, Saul Wold wrote:
> If x11 is disabled from DISTRO_FEATURE we don't build the ximagesink
> package, but it still becomes a dependency in the final image which
> causes a failure
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   .../gstreamer/gst-meta-base_0.10.bb                |    3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> index 2fb39d5..0889437 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> @@ -16,7 +16,10 @@ PACKAGES = "\
>
>   ALLOW_EMPTY = "1"
>
> +X11_RDEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', 'gst-plugin-base-ximagesink', '', d)}"
> +
>   RDEPENDS_gst-meta-base = "\
> +    ${X11_RDEPENDS} \
>       gstreamer \
>       gst-plugins-base-playbin \
>       gst-plugins-base-decodebin \
>


