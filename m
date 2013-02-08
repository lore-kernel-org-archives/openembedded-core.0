Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U3rSD-0004Dp-IG
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 18:09:57 +0100
Received: by mail-ob0-f182.google.com with SMTP id va7so4049959obc.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 08:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=uV2YXbONUswR/WA3iWmfFEcaiqUIaYjP4SOlWDTipQ8=;
	b=KRjX4Tn98P65lO0kMs0R+Mk9le10EU1k+nwpTh9UWjaAX70J0MKJr3kMgrs7cFv+si
	97fJ8HKdoozN1mrVN3ARf+mVFylrNFzTIBuy+4/fUyH58gjEPmP04IOfNFDsZk1CrubG
	9yYrLsT+QsK5FVqYYfYEESquuJBRbKsmywR0AdPMulSBG0dJeIX0D+Tm0Q6oCF2nWO0p
	5SDx7FONTHwCGAIKndhEBOHcevukS70NgTCt+uUoSTbZmeI7zQNvEAoAzaUt08JOgzgo
	kyfPPe5S1WgShgu+hEVO/XSUQ5GCbtag+onM15UkOkGRCBYo0LvQI5HZqC1bPGoAFvHY
	2rLA==
MIME-Version: 1.0
X-Received: by 10.60.171.102 with SMTP id at6mr4828683oec.60.1360342423023;
	Fri, 08 Feb 2013 08:53:43 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Fri, 8 Feb 2013 08:53:42 -0800 (PST)
In-Reply-To: <1360336833-14523-1-git-send-email-ml@communistcode.co.uk>
References: <CAJTo0Lbf+qsJd2R_39bN2GDHZNbncKPZFa1VUQiHn7USVZy_iA@mail.gmail.com>
	<1360336833-14523-1-git-send-email-ml@communistcode.co.uk>
Date: Fri, 8 Feb 2013 14:53:42 -0200
X-Google-Sender-Auth: gd053FtqJ39Y-DhtxfZnEGO_Z5k
Message-ID: <CAP9ODKpGWXM88LEjw02XOO451buNdHwVEDKq999oKo5cuQWAzw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] packagegroup-core-boot: add VIRTUAL-RUNTIME_network_manager
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
X-List-Received-Date: Fri, 08 Feb 2013 17:09:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 8, 2013 at 1:20 PM,  <ml@communistcode.co.uk> wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> Now netbase has been split into netbase and init-ifupdown, the user should
> be able to make a choice on which network manager to install, and not be
> forced to install init-ifupdown alongside if they wish to use a vanilla copy
> of packagegroup-core-boot
>
> v2:
> - Update packagage-core-x11-sato to use the new variable

v2 comment ought to be done bellow --- line.

> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-boot.bb     | 3 ++-
>  meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index b9183a8..a714879 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -29,6 +29,7 @@ VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
>  VIRTUAL-RUNTIME_init_manager ?= "${DISTRO_FEATURES_INITMAN}"
>  VIRTUAL-RUNTIME_initscripts ?= "${@base_contains('DISTRO_FEATURES', 'sysvinit', 'initscripts', '',d)}"
>  VIRTUAL-RUNTIME_keymaps ?= "keymaps"
> +VIRTUAL-RUNTIME_network_manager ?= "init-ifupdown"
>
>  RDEPENDS_${PN} = "\
>      base-files \
> @@ -38,7 +39,7 @@ RDEPENDS_${PN} = "\
>      ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
>      modutils-initscripts \
>      netbase \
> -    init-ifupdown \
> +    ${VIRTUAL-RUNTIME_network_manager} \
>      ${VIRTUAL-RUNTIME_login_manager} \
>      ${VIRTUAL-RUNTIME_init_manager} \
>      ${VIRTUAL-RUNTIME_initscripts} \
> diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> index a4413be..7c000ab 100644
> --- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> +++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> @@ -26,6 +26,8 @@ RDEPENDS_${PN} = "\
>  NETWORK_MANAGER ?= "connman-gnome"
>  NETWORK_MANAGER_libc-uclibc = ""
>
> +VIRTUAL-RUNTIME_network_manager = "${NETWORK_MANAGER}"
> +
>  SUMMARY_${PN}-base = "Sato desktop - base packages"
>  RDEPENDS_${PN}-base = "\
>      matchbox-desktop \
> @@ -40,7 +42,6 @@ RDEPENDS_${PN}-base = "\
>      gtk-sato-engine \
>      shutdown-desktop \
>      libsdl \
> -    ${NETWORK_MANAGER} \
>      "
>
>  # pcmanfm doesn't work on mips
> --
> 1.8.1.2
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


