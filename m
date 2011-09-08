Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Vfw-0001B5-Cs
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 05:53:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2011 20:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="46296278"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2011 20:48:12 -0700
Message-ID: <4E683AFC.4000608@linux.intel.com>
Date: Wed, 07 Sep 2011 20:48:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1315377343-5259-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1315377343-5259-1-git-send-email-eric@eukrea.com>
Subject: Re: resolvconf: switch to 1.59 as 1.58 was removed from debian ftp
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
X-List-Received-Date: Thu, 08 Sep 2011 03:53:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/06/2011 11:35 PM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
>   .../{resolvconf_1.58.bb =>  resolvconf_1.59.bb}     |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-connectivity/resolvconf/{resolvconf_1.58.bb =>  resolvconf_1.59.bb} (88%)
>
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.58.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb
> similarity index 88%
> rename from meta/recipes-connectivity/resolvconf/resolvconf_1.58.bb
> rename to meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb
> index 46040a0..94231e0 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.58.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb
> @@ -15,8 +15,8 @@ PR = "r0"
>
>   SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "6232b336e6bb05282791b5506bbbfa42"
> -SRC_URI[sha256sum] = "853016a2ef16a8fdd6d1e29ac94bc6391199033235aa8e3b373345979c617431"
> +SRC_URI[md5sum] = "59b20258bb8a3c25b8c4083fc0279547"
> +SRC_URI[sha256sum] = "37691677cea24da66d6664c98668b5f16667c0133f17feb166f246ee923ad756"
>
>   do_compile () {
>   	:

Merged into OE-Core

Thanks
	Sau!


