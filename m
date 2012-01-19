Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnyEk-00022e-Fi
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 21:05:30 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2012 11:57:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="98420777"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga001.jf.intel.com with ESMTP; 19 Jan 2012 11:57:49 -0800
Message-ID: <4F1875BD.5070600@linux.intel.com>
Date: Thu, 19 Jan 2012 11:57:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326841411-6369-1-git-send-email-andrea.adami@gmail.com>
	<1326924911-3127-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1326924911-3127-1-git-send-email-andrea.adami@gmail.com>
Subject: Re: [PATCH v2] xinput: add utility for configuring and testing XInput devices.
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
X-List-Received-Date: Thu, 19 Jan 2012 20:05:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2012 02:15 PM, Andrea Adami wrote:
> * from meta-openembedded with minor editings
> * (fields reordering like other recipes in xorg-app)
>
> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
> ---
>   meta/recipes-graphics/xorg-app/xinput_1.5.3.bb |   14 ++++++++++++++
>   1 files changed, 14 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
>
> diff --git a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
> new file mode 100644
> index 0000000..8f17e9a
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
> @@ -0,0 +1,14 @@
> +require xorg-app-common.inc
> +
> +SUMMARY = "Runtime configuration and test of XInput devices"
> +
> +DESCRIPTION = "Xinput is an utility for configuring and testing XInput devices"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"
> +
> +DEPENDS += " libxi"
> +
> +PR = "r7"
> +
> +SRC_URI[md5sum] = "1e2f0ad4f3fa833b65c568907f171d28"
> +SRC_URI[sha256sum] = "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd9fbb5ee2a75885c76"

V2 Merged into OE-Core

Thanks
	Sau!


