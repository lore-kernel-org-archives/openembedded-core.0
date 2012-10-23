Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TQjfe-0005ZO-Is
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 20:57:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Oct 2012 11:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,637,1344236400"; d="scan'208";a="208095785"
Received: from unknown (HELO [10.255.14.141]) ([10.255.14.141])
	by azsmga001.ch.intel.com with ESMTP; 23 Oct 2012 11:44:18 -0700
Message-ID: <5086E582.4050607@linux.intel.com>
Date: Tue, 23 Oct 2012 11:44:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1350903186-20334-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1350903186-20334-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] gmae: remove Evolution Data Server
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
X-List-Received-Date: Tue, 23 Oct 2012 18:57:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/2012 03:53 AM, Ross Burton wrote:
> Evolution Data Server is now maintained in meta-oe/meta-gnome and GMAE is dead,
> so continue pruning the sdk-gmae package group until we can remove it entirely.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc |    3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> index a6403fc..58bc05b 100644
> --- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> +++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> @@ -7,9 +7,6 @@ SDK-GMAE = " \
>       gconf-dev \
>       avahi-dev \
>       telepathy-glib-dev \
> -    evolution-data-server-dev \
> -    libecal-dev \
> -    libebook-dev \
>       libxi-dev \
>       libsqlite3-dev \
>       gnome-desktop \
>

Merged this patch set into OE-Core

Thanks
	Sau!


