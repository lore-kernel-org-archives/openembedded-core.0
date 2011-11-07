Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNUNY-0006Hr-Hh
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 19:57:08 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Nov 2011 10:50:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,471,1315206000"; d="scan'208";a="71473762"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by azsmga001.ch.intel.com with ESMTP; 07 Nov 2011 10:50:53 -0800
Message-ID: <4EB8288D.3040304@linux.intel.com>
Date: Mon, 07 Nov 2011 10:50:53 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320236800-6978-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1320236800-6978-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] libcense.bbclass: fix OpenSSL mapping [BUGID# 1712]
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
X-List-Received-Date: Mon, 07 Nov 2011 18:57:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2011 05:26 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/classes/license.bbclass                       |    2 +-
>   .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 3f93bf5..baf35f0 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -44,7 +44,7 @@ SPDXLICENSEMAP[MPLv1.1] = "MPL-1"
>   SPDXLICENSEMAP[MIT-X] = "MIT"
>
>   #Openssl variations
> -SPDXLICENSEMAP[openssl] = "Openssl"
> +SPDXLICENSEMAP[openssl] = "OpenSSL"
>
>   #Other variations
>   SPDXLICENSEMAP[AFL2.1] = "AFL-2"
> diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
> index 5add70e..555bacf 100644
> --- a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
> @@ -1,6 +1,6 @@
>   require openssl.inc
>
> -PR = "r6"
> +PR = "r7"
>   SRC_URI += "file://debian/ca.patch \
>               file://debian/config-hurd.patch;apply=no \
>               file://debian/debian-targets.patch \

Merged into OE-Core with a tweak to the commit message formatting

Thanks
	Sau!


