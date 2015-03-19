Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5F84A65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 18:44:43 +0000 (UTC)
Received: by ykfs63 with SMTP id s63so31842857ykf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=nRObxgDi9/hmAzVzbP/KJ79uXDTOVoWgALd4qar3AZM=;
	b=lv/uQJ7CwDCmoKBROgBwo6yOH1j41dJeyL+ulzUd8FTYdBT8IIvcx27aQ5bz047fJ8
	jqic+ozMFdcI++Hp75veUO5jXDxt6NHmk6ItxDIa/F400LF5DZTi9EQiRHtq/9m1wvP3
	45KxtiZGvG9Y/879qEauvWLwjQF/b81N2qPNe6SCKyUeWp5Yg7Wwx8rvDfV/N0Xvi+H8
	yZ9xWMpQ4I/hdWWwTupG5VQ9CpBFaj8pPoLi7k15wHZR96XFvOZS3tCsWdn39guPfXC0
	QPvH9iuVq2Ac5oeNs8scTtmORF2+K3dxY6r0h66Fnl0gMz1dMNoH08Tbm31DT0BiW/S9
	uiVw==
MIME-Version: 1.0
X-Received: by 10.170.59.78 with SMTP id b75mr22838539ykb.110.1426790684518;
	Thu, 19 Mar 2015 11:44:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Thu, 19 Mar 2015 11:44:44 -0700 (PDT)
In-Reply-To: <9edc589ecf1a1554efeb23e4e71306476f790723.1426758356.git.anibal.limon@linux.intel.com>
References: <cover.1426758356.git.anibal.limon@linux.intel.com>
	<9edc589ecf1a1554efeb23e4e71306476f790723.1426758356.git.anibal.limon@linux.intel.com>
Date: Thu, 19 Mar 2015 15:44:44 -0300
X-Google-Sender-Auth: 60AkXxe_761w-0d31VZ8YmwRZj4
Message-ID: <CAP9ODKpN91T-TuMWPoxqUPmkEyYiQ55pKL+DSX1mx2xAePeLoQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/2] initscripts: Add changetodefaultvt for 1, 2, 3, 4 runlevels
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
X-List-Received-Date: Thu, 19 Mar 2015 18:44:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2015 at 6:47 AM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> When change between runlevel 5 to another non-graphic runlevel
> the console stays in the tty where X was launched.
>
> This patchs add a default switch to tty1.
>
> [YOCTO #5336]
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  .../initscripts/initscripts-1.0/changetodefaultvt.sh           | 10 ++++=
++++++
>  meta/recipes-core/initscripts/initscripts_1.0.bb               |  6 ++++=
++
>  2 files changed, 16 insertions(+)
>  create mode 100755 meta/recipes-core/initscripts/initscripts-1.0/changet=
odefaultvt.sh
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/changetodefaul=
tvt.sh b/meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh
> new file mode 100755
> index 0000000..bbef7ed
> --- /dev/null
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:             changetodefaultvt
> +# Required-Start:
> +# Required-Stop:
> +# Default-Start:        1 2 3 4
> +# Default-Stop:
> +### END INIT INFO
> +
> +chvt 1

I tried to find this in Debian and failed. How normal distros are
handling this? After more thinking this seems to be something to be
handled in Xorg not init.

> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/reci=
pes-core/initscripts/initscripts_1.0.bb
> index dfb75b2..e0841cf 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -33,6 +33,7 @@ SRC_URI =3D "file://functions \
>             file://GPLv2.patch \
>             file://dmesg.sh \
>             file://logrotate-dmesg.conf \
> +           file://changetodefaultvt.sh \
>  "
>
>  S =3D "${WORKDIR}"
> @@ -100,6 +101,7 @@ do_install () {
>         install -m 0644    ${WORKDIR}/volatiles         ${D}${sysconfdir}=
/default/volatiles/00_core
>         install -m 0755    ${WORKDIR}/dmesg.sh          ${D}${sysconfdir}=
/init.d
>         install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfd=
ir}/
> +       install -m 0755    ${WORKDIR}/changetodefaultvt.sh      ${D}${sys=
confdir}/init.d

Conditional please

>         if [ "${TARGET_ARCH}" =3D "arm" ]; then
>                 install -m 0755 ${WORKDIR}/alignment.sh ${D}${sysconfdir}=
/init.d
> @@ -112,6 +114,10 @@ do_install () {
>  #
>  # Create runlevel links
>  #
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false'=
, d)}; then
> +               update-rc.d -r ${D} changetodefaultvt.sh start 99 1 2 3 4=
 .
> +       fi
> +
>         update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
>         update-rc.d -r ${D} sendsigs start 20 0 6 .
>         update-rc.d -r ${D} urandom start 30 S 0 6 .
> --
> 1.8.4.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

