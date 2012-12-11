Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TiV6q-0003aH-MP
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 20:03:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2012 10:48:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,260,1355126400"; d="scan'208";a="255931335"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.105])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2012 10:48:42 -0800
Message-ID: <50C7800A.1010502@linux.intel.com>
Date: Tue, 11 Dec 2012 10:48:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
References: <1355220496-8878-1-git-send-email-muhammad_shakeel@mentor.com>
In-Reply-To: <1355220496-8878-1-git-send-email-muhammad_shakeel@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wireless-tools: Remove QA warning: No GNU_HASH in the elf binary
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
X-List-Received-Date: Tue, 11 Dec 2012 19:03:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2012 02:08 AM, Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> Handle LDFLAGS properly in the Makefile to remove warning:
> QA Issue: No GNU_HASH in the elf binary
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>   .../wireless-tools/wireless-tools/ldflags.patch    |   15 +++++++++++++++
>   .../wireless-tools/wireless-tools_29.bb            |    3 ++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch
> new file mode 100644
> index 0000000..84144ac
> --- /dev/null
> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch
> @@ -0,0 +1,15 @@

No patch header

Please add a Signed-off-by: and Upstream-Status: tags

Thanks
	Sau!

> +---
> + Makefile |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- wireless_tools.29.orig/Makefile
> ++++ wireless_tools.29/Makefile
> +@@ -144,7 +144,7 @@ wireless.h:
> +
> + # Compilation of the dynamic library
> + $(DYNAMIC): $(OBJS:.o=.so)
> +-	$(CC) -shared -o $@ -Wl,-soname,$@ $(STRIPFLAGS) $(LIBS) -lc $^
> ++	$(CC) -shared -o $@ -Wl,-soname,$@ $(LDFLAGS) $(STRIPFLAGS) $(LIBS) -lc $^
> +
> + # Compilation of the static library
> + $(STATIC): $(OBJS:.o=.so)
> diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> index 209f29a..b4d34bb 100644
> --- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> @@ -14,7 +14,8 @@ SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.2
>   	   file://man.patch \
>   	   file://wireless-tools.if-pre-up \
>   	   file://zzz-wireless.if-pre-up \
> -	   file://avoid_strip.patch"
> +	   file://avoid_strip.patch \
> +	   file://ldflags.patch"
>
>   SRC_URI[md5sum] = "e06c222e186f7cc013fd272d023710cb"
>   SRC_URI[sha256sum] = "6fb80935fe208538131ce2c4178221bab1078a1656306bce8909c19887e2e5a1"
>


