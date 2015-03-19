Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5F88B6AC33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 19:04:19 +0000 (UTC)
Received: by ykfc206 with SMTP id c206so31907660ykf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 12:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=7voShpJnoPB2hhO9SEx7f8Gt2Tgizo22jn73D2vv+M4=;
	b=H1fkzRgTxH6X6ONa5EIrNilgP5ed6lm7BPgdDkKifLexVpzaeoAYBe0ovIfgiHrJt9
	4mwzydsQXMD83PsRYZyu0hvFaZY+LkVcnQIg2Vs5cpssLbFBpgMhDNMkcgC7sH2BaEXi
	UzPzLWUYCBBURaD3sE9HrleULDy222R05W1/0C54eKC1inCrPL0OSEHKlSYJ9v4hXHRZ
	+pIJ/vDRw2KKj88b6rBCL3tBmfuZ0W6d7VhZUzCYJViH9/U7NQNV9wvgLzDgnCWjSvEe
	aORb4qMFTVlxpcynDJuOtwCchm750X/4XQF3gHrH1ZP2arpBLnLzRYCgNC8zWxy56DnG
	iWpw==
MIME-Version: 1.0
X-Received: by 10.236.190.5 with SMTP id d5mr77694108yhn.67.1426791860727;
	Thu, 19 Mar 2015 12:04:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Thu, 19 Mar 2015 12:04:20 -0700 (PDT)
In-Reply-To: <68b7c8a2b55dcd1ee14e22e61cb93bfea299116f.1426762068.git.anibal.limon@linux.intel.com>
References: <cover.1426762068.git.anibal.limon@linux.intel.com>
	<68b7c8a2b55dcd1ee14e22e61cb93bfea299116f.1426762068.git.anibal.limon@linux.intel.com>
Date: Thu, 19 Mar 2015 16:04:20 -0300
X-Google-Sender-Auth: _zVMwwp6XbUVikWepYagyBhhZVk
Message-ID: <CAP9ODKqW8cadpDE2FXLNVCh_sAXkAPttGcODR0m_Em4tRntUcA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 2/2] initscripts: Add changetodefaultvt for 1, 2, 3, 4 runlevels
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
X-List-Received-Date: Thu, 19 Mar 2015 19:04:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2015 at 7:52 AM, An=C3=ADbal Lim=C3=B3n
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
>  meta/recipes-core/initscripts/initscripts_1.0.bb               |  8 ++++=
++++
>  2 files changed, 18 insertions(+)
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

You didn't answer the question. How general use distros are handling
this? It seems hackish!

> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/reci=
pes-core/initscripts/initscripts_1.0.bb
> index dfb75b2..177ab90 100644
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
> @@ -100,6 +101,9 @@ do_install () {
>         install -m 0644    ${WORKDIR}/volatiles         ${D}${sysconfdir}=
/default/volatiles/00_core
>         install -m 0755    ${WORKDIR}/dmesg.sh          ${D}${sysconfdir}=
/init.d
>         install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfd=
ir}/
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false'=
, d)}; then
> +               install -m 0755    ${WORKDIR}/changetodefaultvt.sh      $=
{D}${sysconfdir}/init.d
> +       fi
>
>         if [ "${TARGET_ARCH}" =3D "arm" ]; then
>                 install -m 0755 ${WORKDIR}/alignment.sh ${D}${sysconfdir}=
/init.d
> @@ -112,6 +116,10 @@ do_install () {
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

