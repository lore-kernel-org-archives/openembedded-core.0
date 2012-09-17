Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TDePy-0005Bq-Dw
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 18:43:30 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 16EECF81235; Mon, 17 Sep 2012 10:30:53 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id D76BAF8121C;
	Mon, 17 Sep 2012 10:30:51 -0600 (MDT)
Message-ID: <50575042.3090405@mlbassoc.com>
Date: Mon, 17 Sep 2012 10:30:58 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1347898621-24929-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1347898621-24929-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] xserver-xorg: Modify RREPLACES for RCONFLICTS
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
X-List-Received-Date: Mon, 17 Sep 2012 16:43:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-09-17 10:17, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
>   .../xorg-xserver/xserver-xorg-common.inc           |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index b4a348c..c71896a 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -8,4 +8,4 @@ SRC_URI += "file://crosscompile.patch \
>   SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
>   SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
>
> -PR = "r6"
> +PR = "r7"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> index 6133344..98fe534 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> @@ -66,7 +66,7 @@ PACKAGES =+ "${PN}-security-policy \
>
>   RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
>   RDEPENDS_${PN}-xvfb += "xkeyboard-config"
> -RREPLACES_${PN}-module-exa = "${PN}"
> +RCONFLICTS_${PN}-module-exa = "${PN} (<${PV})"

Can you please explain what this means (the syntax is unknown to me)?

>
>   FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
>   FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


