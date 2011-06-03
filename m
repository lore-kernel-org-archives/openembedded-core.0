Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QSIg8-0008TR-C4
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 02:56:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2011 17:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,312,1304319600"; 
   d="scan'208";a="8707607"
Received: from swold-mobl.jf.intel.com (HELO [10.24.4.14]) ([10.24.4.14])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2011 17:52:23 -0700
Message-ID: <4DE83048.1030100@linux.intel.com>
Date: Thu, 02 Jun 2011 17:52:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307042670.git.otavio@ossystems.com.br>
	<21881aba9031cefb72fcc33cca9d146169f344e9.1307042670.git.otavio@ossystems.com.br>
In-Reply-To: <21881aba9031cefb72fcc33cca9d146169f344e9.1307042670.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 1/4] xf86-driver-common.inc: remove .la files to	avoid unpackaged warning
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
X-List-Received-Date: Fri, 03 Jun 2011 00:56:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2011 12:25 PM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   .../xorg-driver/xf86-driver-common.inc             |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc b/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc
> index 550423b..6ff1391 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc
> +++ b/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc
> @@ -5,7 +5,7 @@ SECTION = "x11/drivers"
>   LICENSE = "MIT-X"
>
>   PE = "1"
> -PR = "r0"
> +PR = "r1"
>
>   DEPENDS = "virtual/xserver-xf86 xproto randrproto util-macros"
>
> @@ -27,3 +27,7 @@ do_configure_prepend () {
>       mv configure.ac.new configure.ac
>   }
>
> +do_install_append () {
> +    # driver's la files are not packaged
> +    rm -f ${D}${libdir}/xorg/modules/drivers/*.la
> +}
Would it not be better to package them in the -dev package instead of 
throwing them away?

Sau!


