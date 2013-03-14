Received: from mail-lb0-f174.google.com ([209.85.217.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <iwamatsu@nigauri.org>) id 1UFxTe-0008Ql-1I
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 03:01:06 +0100
Received: by mail-lb0-f174.google.com with SMTP id l12so1480490lbo.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 18:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:x-gm-message-state;
	bh=XPVlTaepubZsjGe9Otb1nM+C3q2IFdl2GS2VCSosvCg=;
	b=Xk/P3cLpoHuxZiPwQtEhFBOe3Nv1o4r1g0b6TMQkztkjTpEs/p52gqp1A5PtwCyTXJ
	0BAwX6YjjRB2dchKnMFpxijFFUddmDtDQo4CgUn6kizYBWwHAGpsijppVstvCreqdVvq
	gqzokRRFIr90DIsuDK92nYEWQYrAj5gQugtP9ruy+JQ6PMwzBSUwo255p0u5esQAn16d
	X7rTIXHcCu7WShpIIxwiLd+flocDyOSTgOaOI1Rxlu2vETo2tu6Prx8FKUh8WClbLXmU
	lldxmNhDsVFu8Kx0NOxuUCDD+cvW2tp5tz+0HP8SpsBIiEefklYV38WXsc2ogv2c+Qgj
	EnWw==
X-Received: by 10.152.104.80 with SMTP id gc16mr420206lab.49.1363225464332;
	Wed, 13 Mar 2013 18:44:24 -0700 (PDT)
MIME-Version: 1.0
Sender: iwamatsu@nigauri.org
Received: by 10.152.104.107 with HTTP; Wed, 13 Mar 2013 18:43:54 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16216497@IRSMSX102.ger.corp.intel.com>
References: <1363140541-13440-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
	<969F26A8BAB325438E7EB80D3C3134FB16216497@IRSMSX102.ger.corp.intel.com>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Date: Thu, 14 Mar 2013 10:43:54 +0900
X-Google-Sender-Auth: NZjqsBHGoDigoNWoTKshaWQaihI
Message-ID: <CABMQnVKVnoMH1B1Ri-Qmjec30BFX1TaosGq0b1Hc641m3490hA@mail.gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQnEBDoWavnkB5fjygqPGdKnby6Lw01EBcamminWtSp0JrQsmonSC7jjOEAn2UHPJjKikD3+
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: Update autotools.patch
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
X-List-Received-Date: Thu, 14 Mar 2013 02:01:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

When I build alsa-tools, I could not build this with following error:
----
checking for i586-oe-linux-pkg-config... no
checking for pkg-config...
/home/iwamatsu/yocto/alsa/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config
configure: WARNING: using cross tools not prefixed with host triplet
checking pkg-config is at least version 0.9.0... yes
checking for ENVY24CONTROL... no
configure: error: Package requirements (gtk+-2.0 alsa >= 0.9.0) were not met:

No package 'gtk+-2.0' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables ENVY24CONTROL_CFLAGS
and ENVY24CONTROL_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
make: *** [all] Error 1
----

The original patch is deleted from the list in the software depending on gtk.
However, envy24control etc. are dependent on gtk.
The patch which I created deletes these from a list.
I checked with openembedded-core (375ed2eaef10dd7d8f46badca6d779708724e5f6).

Does my environment have a problem?

Best regards,
  Nobuhiro

On Wed, Mar 13, 2013 at 8:02 PM, Iorga, Cristian
<cristian.iorga@intel.com> wrote:
> Hello Nobuhiro-san,
>
> Can you please explain your patch?
> As far as I know, the alsa-tools present as targets were all buildable.
> This was verified by me at last update.
>
> Regards,
> Cristian
>
> -----Original Message-----
> From: Nobuhiro Iwamatsu [mailto:iwamatsu@nigauri.org] On Behalf Of Nobuhiro Iwamatsu
> Sent: Wednesday, March 13, 2013 4:09 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Iorga, Cristian; Nobuhiro Iwamatsu
> Subject: [PATCH] alsa-tools: Update autotools.patch
>
> envy24control, rmedigicontrol and echomixer require gtk+-2.0.
> Remove envy24control rmedigicontrol and echomixer from list of tools.
>
> CC: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> ---
>  .../alsa/alsa-tools/autotools.patch                |    6 +++---
>  .../recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb |    2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
> index 294e970..08dd9de 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
> +++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
> @@ -26,9 +26,9 @@ diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
>  -        mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
>  -        us428control usx2yloader vxloader echomixer ld10k1 qlo10k1 \
>  -        hwmixvolume hdajackretask hda-verb
> -+SUBDIRS = ac3dec as10k1 envy24control \
> -+        mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
> -+        us428control usx2yloader vxloader echomixer \
> ++SUBDIRS = ac3dec as10k1 \
> ++        mixartloader pcxhrloader sb16_csp seq sscape_ctl \
> ++        us428control usx2yloader vxloader \
>  +        hwmixvolume hda-verb
>
>   all:
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
> index 0fe4bee..4b4f29b 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
> @@ -5,7 +5,7 @@ SECTION = "console/utils"
>  LICENSE = "GPLv2 & LGPLv2+"
>  DEPENDS = "alsa-lib ncurses"
>
> -PR = "r0"
> +PR = "r1"
>
>  LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                      file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Nobuhiro Iwamatsu


