Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qvd9O-0000Fc-I1
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 00:39:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2011 15:34:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40752719"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2011 15:34:36 -0700
Message-ID: <4E52D97C.8030000@linux.intel.com>
Date: Mon, 22 Aug 2011 15:34:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313423323-30335-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1313423323-30335-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] libxcb: enable native/nativesdk builds as was done previously in meta-oe
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
X-List-Received-Date: Mon, 22 Aug 2011 22:39:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/15/2011 08:48 AM, Dmitry Eremin-Solenikov wrote:
> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
> ---
>   meta/recipes-graphics/xcb/libxcb.inc |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-graphics/xcb/libxcb.inc b/meta/recipes-graphics/xcb/libxcb.inc
> index 5044917..015065e 100644
> --- a/meta/recipes-graphics/xcb/libxcb.inc
> +++ b/meta/recipes-graphics/xcb/libxcb.inc
> @@ -5,6 +5,8 @@ the protocol, improved threading support, and extensibility."
>   HOMEPAGE = "http://xcb.freedesktop.org"
>   BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
>
> +BBCLASSEXTEND = "native nativesdk"
> +
>   SECTION = "x11/libs"
>   LICENSE = "MIT-X"
>

Merged into OE-Core

Thanks
	Sau!


