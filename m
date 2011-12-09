Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RYvOy-0002kP-Kl
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 09:01:52 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Fri, 9 Dec 2011 08:55:01 +0100
Date: Fri, 9 Dec 2011 08:55:05 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20111209075504.GA4082@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1323415475-21361-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1323415475-21361-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH] u-boot: renamed dir from uboot to the more appropriate u-boot
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
X-List-Received-Date: Fri, 09 Dec 2011 08:01:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Frans Meulenbroeks <fransmeulenbroeks@gmail.com> [111209 08:25]:

> recipe dirs normally have the name of the (main) package and the official name is u-boot

From this I guess that there aren't any other changes in the patch,
apart from the renames?

Next time, could you add '-M' to `git format-patch`, to make git detect
renames? That results in smaller and easier to review patches.

Cheers,
Anders

> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
>  .../u-boot/files/fix-arm920t-eabi.patch            |   22 +++++
>  ...Drop-config.h-include-in-tools-imximage.h.patch |   39 +++++++++
>  ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 ++++++++++++++++++++
>  ...Drop-config.h-include-in-tools-imximage.h.patch |   39 +++++++++
>  ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 ++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb  |   31 ++++++++
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb  |   29 +++++++
>  meta/recipes-bsp/u-boot/u-boot.inc                 |   50 ++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2011.03.bb          |   26 ++++++
>  meta/recipes-bsp/u-boot/u-boot_2011.06.bb          |   26 ++++++
>  .../recipes-bsp/uboot/files/fix-arm920t-eabi.patch |   22 -----
>  ...Drop-config.h-include-in-tools-imximage.h.patch |   39 ---------
>  ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 --------------------
>  ...Drop-config.h-include-in-tools-imximage.h.patch |   39 ---------
>  ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 --------------------
>  meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb   |   31 --------
>  meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb   |   29 -------
>  meta/recipes-bsp/uboot/u-boot.inc                  |   50 ------------
>  meta/recipes-bsp/uboot/u-boot_2011.03.bb           |   26 ------
>  meta/recipes-bsp/uboot/u-boot_2011.06.bb           |   26 ------
>  20 files changed, 426 insertions(+), 426 deletions(-)

-- 
Anders Darander
ChargeStorm AB / eStorm AB


