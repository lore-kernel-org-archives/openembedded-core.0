Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qbig5-0005wW-MB
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 02:30:49 +0200
Received: by pvf24 with SMTP id 24so483315pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 17:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Llc2Z8FE1qp+J7v5WdGSVdSPtYhlIZpr6J6YCyn30Vs=;
	b=Qw3dcmzXdU0t9hPUhJhf3svLvTJrIf+28jdsKwTZrjnb0danNk6enCTj4tNxD3kQdt
	nw+abUeMOdPxiE+lbCfwlcU5K/yVx+Juoyr1NHta6ycgjTVZB6SnMv+Vfzu+AWVNCRFb
	mrSsdWv/IZrKB4r6z6GpDgKhqwGFrJom0OmwI=
Received: by 10.142.234.3 with SMTP id g3mr83207wfh.423.1309307227266;
	Tue, 28 Jun 2011 17:27:07 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z20sm436899wff.19.2011.06.28.17.27.06
	(version=SSLv3 cipher=OTHER); Tue, 28 Jun 2011 17:27:06 -0700 (PDT)
Message-ID: <4E0A7159.4020003@gmail.com>
Date: Tue, 28 Jun 2011 17:27:05 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1309188248.21613.325.camel@phil-desktop>
In-Reply-To: <1309188248.21613.325.camel@phil-desktop>
Subject: Re: [PATCH] fontconfig: specify font directory in EXTRA_OECONF
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
X-List-Received-Date: Wed, 29 Jun 2011 00:30:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/27/2011 08:24 AM, Phil Blundell wrote:
> since, otherwise, fontconfig's builtin default may not match ${datadir}.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   .../fontconfig/fontconfig_2.8.0.bb                 |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
> index ae0fef5..5381065 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
> @@ -20,7 +20,7 @@ SECTION = "libs"
>
>   DEPENDS = "expat freetype zlib"
>
> -PR = "r1"
> +PR = "r3"

a nitpick though not wrong but should be r2

>
>   SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
>              file://fix-pkgconfig.patch \
> @@ -45,7 +45,7 @@ inherit autotools pkgconfig
>
>   export HASDOCBOOK="no"
>
> -EXTRA_OECONF = " --disable-docs --with-arch=${HOST_ARCH}"
> +EXTRA_OECONF = " --disable-docs --with-arch=${HOST_ARCH} --with-default-fonts=${datadir}/fonts"
>   EXTRA_OEMAKE = "FC_LANG=fc-lang FC_GLYPHNAME=fc-glyphname"
>
>   # The tarball has some of the patched files as read only, which



