Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R0TJs-0005md-CB
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 09:10:12 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Mon, 5 Sep 2011
	09:05:11 +0200
Date: Mon, 5 Sep 2011 09:05:22 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110905070522.GA8690@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1314970267-20365-2-git-send-email-denis@eukrea.com>
	<1314979795-13537-1-git-send-email-denis@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1314979795-13537-1-git-send-email-denis@eukrea.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [RESEND] bitbake.conf: fix ubi images creation
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
X-List-Received-Date: Mon, 05 Sep 2011 07:10:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Denis Carikli <denis@eukrea.com> [110902 18:19]:
> Without that commit ubinize.cfg lack a volume name value,
>   and the related ubinize.cfg line looks like that:
>     vol_name=
>   which result in a broken ubi image,which after beeing flashed produce
>   the following error:
>     UBI error: vtbl_check: volume table check failed: record 0, error 11
>   wich result in a kernel panic because the rootfs can't be mounted.

I've recently spent some time debugging this very same issue, when
converting an on-going project from oe-dev to oe-core.

> Signed-off-by: Denis Carikli <denis@eukrea.com>

Acked-by: Anders Darander <anders@chargestorm.se>

> ---
>  meta/conf/bitbake.conf |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a68be07..14ee90c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -382,6 +382,8 @@ IMAGE_BASENAME = "${PN}"
>  IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
>  IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
>  
> +UBI_VOLNAME ?= "${MACHINE}-rootfs"
> +
>  # This option allows for a percentage overage of the actual image size rather than a
>  # fixed extra space, this is space needed for initial startup and basic operations.
>  IMAGE_OVERHEAD_FACTOR ?= 1.3
-- 
Anders Darander
ChargeStorm AB


