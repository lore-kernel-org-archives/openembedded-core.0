Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id B2F1C77A57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:08:04 +0000 (UTC)
Received: (qmail 27239 invoked by uid 1003); 28 Mar 2017 11:08:05 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.116.166)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	28 Mar 2017 11:08:04 -0000
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
References: <20170327143255.3423-1-marex@denx.de>
From: Philip Balister <philip@balister.org>
Message-ID: <a482e9ec-44e3-9e8c-ba43-a2c0806d2974@balister.org>
Date: Tue, 28 Mar 2017 07:07:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170327143255.3423-1-marex@denx.de>
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Mar 2017 11:08:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Some background is needed ....

Marex sent in the 2017.01 update after discussions in irc about timing
of u-boot releases and the YP release schedule. The 2017.03 release
would happen after oe-core passed the feature freeze. So, at the time
people felt the release should have 2017.01.

People consuming the u-boot recipe via a bbappends have been using
2017.01 for their bsp's. Changing at this time is potentially a pain
point, and has some technical risk on the release schedule.

On the other hand, people working to get their code upstream, might be
frustrated having to wait until fall to use a current u-boot release.

Should we go ahead and add the 2017.03 recipe and use DEFAULT_PREFERENCE
to turn it off?

Also, this would be a good time to determine who the maintainers of the
recipes are.

Philip


On 03/27/2017 10:32 AM, Marek Vasut wrote:
> Upgrade U-Boot to the latest version.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Denys Dmytriyenko <denis@denix.org>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Ross Burton <ross.burton@intel.com>
> ---
>  .../u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.03.inc}     | 2 +-
>  .../u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.03.bb}   | 0
>  .../u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.03.bb}     | 0
>  meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.03.bb}        | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.03.inc} (86%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.03.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.03.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.03.bb} (100%)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
> similarity index 86%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
> index df24c853dd..c115f36831 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
> @@ -7,7 +7,7 @@ PE = "1"
>  
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "a705ebc81b7f91bbd0ef7c634284208342901149"
> +SRCREV = "8537ddd769f460d7fb7a62a3dcc9669049702e51"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git"
>  
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.03.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.03.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.03.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.03.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot_2017.03.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2017.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2017.03.bb
> 

