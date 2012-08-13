Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T0ojo-0004Gk-0r
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 Aug 2012 09:06:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2012 23:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,758,1336374000"; d="scan'208";a="185551567"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 12 Aug 2012 23:54:58 -0700
Message-ID: <5028A4C1.9080602@linux.intel.com>
Date: Mon, 13 Aug 2012 09:54:57 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20120731185629.GA13766@windriver.com>
In-Reply-To: <20120731185629.GA13766@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
Subject: Re: [PATCH] socat: missing several dependencies
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
X-List-Received-Date: Mon, 13 Aug 2012 07:06:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2012 09:56 PM, Amy Fong wrote:
> socat: missing several dependencies
>
> socat depends on ncurses, readline, and tcp-wrappers
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>   socat_1.7.2.0.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.0.bb b/meta/recipes-connectivity/socat/socat_1.7.2.0.bb
> index 1273dcf..0faf016 100644
> --- a/meta/recipes-connectivity/socat/socat_1.7.2.0.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.7.2.0.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
>
>   SECTION = "console/network"
>
> -DEPENDS = "openssl"
> +DEPENDS = "openssl readline ncurses tcp-wrappers"
>
I have been thinking on this one and trying to understand why we should 
need to have readline and ncurses for socat, is there any configure 
flags to disable these instead of depending on them?

It also seems that tcp-wrappers' libwrap is also optional and can be 
disabled via the configure options.  I can see value of libwrap here, 
but we have not explicitly enabled it in the past, so my initial thought 
here is to disable it instead of adding the DEPENDS.

Sau!


>   LICENSE = "GPL-2.0+-with-OpenSSL-exception"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


