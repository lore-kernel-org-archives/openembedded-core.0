Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id A4D2573287
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 08:02:02 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id w194so1765424vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 00:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=astibmtvdA1ZF+5nv53l1HbaTt7q0xlM54bEtJYjA+g=;
	b=pHgUN0uz9VEYIQnFsabLheOSKdkMC8ghfcq36NeHlvuO5gszRrBaKfL7qKB43YbVnD
	/a13ZlE95MxXbQ1Wo0YRa+kbrCaAkW9Tilv9zZLgu1sfGmMVaGiFq5HK3/h183ZDdRHM
	bC7+ZkF/watpmwUrwBzKTHnbi7eUf2iFUhvsMsouSkPza7KnWB4sYA8sM1tPiAjSM3It
	AY4SRtZEH9KwPuN/P8qUU+C0VA+9lT1zuhT8LNRfiJGfBORiUlcLsLjFbvxisNyUWTon
	du62eCPJ7Ak/RxHD95D91yIK0zILu0yOz52MnMWEW4hJFzj1NKmKvgvXEphcK62YzfdX
	aR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=astibmtvdA1ZF+5nv53l1HbaTt7q0xlM54bEtJYjA+g=;
	b=b0kLN+oSmvDSPFnANTzsMWYrcOxQlC3viStuZpECjry/4oAV1cLB3wF1nqyUG+ONbn
	+H4ZFBRlFNHjB8QT34rVlXeAEUqd9zUObetVZI/9rIVG3xHeSKaCHNAuoZ7AhA/QXT1I
	pNe3r1xuNeI1vM52lZdd4WBbIEgD5wxAXwg02x9Uicsmb7xKZP78WTlcrGc5EQDGhimf
	vA52l0FETZZWOe1DunDyQ+lnDdq+vupJoSfInMIes+gb909XKmn8q45LyKnu+ryvaAS6
	GoOND4IK1Web41qYlOBEGH5R9zbQHjLqV6l69Z6wwBVS5+kJoBtKkw5U4+zv8b2Wydf0
	sS7w==
X-Gm-Message-State: AKaTC00UQPX1EB+8g2G/J0cN9OyJ/TdJTqolTrZGq47F3SECBrjIyuypD8ZxO+TNJDdhfy8mU5FcAc7QOhbGRQ==
X-Received: by 10.31.48.85 with SMTP id w82mr34877170vkw.69.1481702523389;
	Wed, 14 Dec 2016 00:02:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.73.155 with HTTP; Wed, 14 Dec 2016 00:02:02 -0800 (PST)
In-Reply-To: <bc7d57b6fe00ec420d4fe2ebfd633da348bf2d00.1481700149.git.liezhi.yang@windriver.com>
References: <cover.1481700149.git.liezhi.yang@windriver.com>
	<bc7d57b6fe00ec420d4fe2ebfd633da348bf2d00.1481700149.git.liezhi.yang@windriver.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 14 Dec 2016 09:02:02 +0100
Message-ID: <CAFkk2KTb_5513EU1ntijyMdjtjENhAyN8b9MBd5hVp2D7ifavQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/8] populate_sdk_ext.bbclass: break the long lines
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
X-List-Received-Date: Wed, 14 Dec 2016 08:02:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm not a big fan of those run-on lines either, so thanks. Some
superficial comments:

On Wed, Dec 14, 2016 at 8:24 AM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
> Make it easier to read and maintain.
>
> [YOCTO #10647]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populat=
e_sdk_ext.bbclass
> index 3c3a73c..adef96d 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -567,7 +567,13 @@ sdk_ext_postinst() {
>         printf "\nExtracting buildtools...\n"
>         cd $target_sdk_dir
>         env_setup_script=3D"$target_sdk_dir/environment-setup-${REAL_MULT=
IMACH_TARGET_SYS}"
> -       printf "buildtools\ny" | ./${SDK_BUILDTOOLS_INSTALLER} > buildtoo=
ls.log || { printf 'ERROR: buildtools installation failed:\n' ; cat buildto=
ols.log ; echo "printf 'ERROR: this SDK was not fully installed and needs r=
einstalling\n'" >> $env_setup_script ; exit 1 ; }
> +       ./${SDK_BUILDTOOLS_INSTALLER} -d buildtools -y > buildtools.log
> +       if [ $? -ne 0 ]; then
> +               printf 'ERROR: buildtools installation failed:\n'
> +               cat buildtools.log
> +               echo "printf 'ERROR: this SDK was not fully installed and=
 needs reinstalling\n'" >> $env_setup_script
> +               exit 1
> +       fi

Maybe it's a deliberate style choice, but just in case you're not
aware of it, the following two snippets work the same:

./${SDK_BUILDTOOLS_INSTALLER} -d buildtools -y > buildtools.log
if [ $? -ne 0 ]; then
    ...

if ! ./${SDK_BUILDTOOLS_INSTALLER} -d buildtools -y > buildtools.log; then
    ...

>
>         # Delete the buildtools tar file since it won't be used again
>         rm -f ./${SDK_BUILDTOOLS_INSTALLER}
> @@ -588,7 +594,9 @@ sdk_ext_postinst() {
>         echo "printf 'SDK environment now set up; additionally you may no=
w run devtool to perform development tasks.\nRun devtool --help for further=
 details.\n'" >> $env_setup_script
>
>         # Warn if trying to use external bitbake and the ext SDK together
> -       echo "(which bitbake > /dev/null 2>&1 && echo 'WARNING: attemptin=
g to use the extensible SDK in an environment set up to run bitbake - this =
may lead to unexpected results. Please source this script in a new shell se=
ssion instead.') || true" >> $env_setup_script
> +       echo "(which bitbake > /dev/null 2>&1 && \
> +               echo 'WARNING: attempting to use the extensible SDK in an=
 environment set up to run bitbake - this may lead to unexpected results. P=
lease source this script in a new shell session instead.') || \
> +               true" >> $env_setup_script
>
>         if [ "$prepare_buildsystem" !=3D "no" ]; then
>                 printf "Preparing build system...\n"
> @@ -596,8 +604,16 @@ sdk_ext_postinst() {
>                 # current working directory when first ran, nor will it s=
et $1 when
>                 # sourcing a script. That is why this has to look so ugly=
.
>                 LOGFILE=3D"$target_sdk_dir/preparing_build_system.log"
> -               sh -c ". buildtools/environment-setup* > $LOGFILE && cd $=
target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir &=
& . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE &=
& python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS=
}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs re=
installing\n'" >> $env_setup_script ; exit 1 ; }
> -               rm $target_sdk_dir/ext-sdk-prepare.py
> +               sh -c ". buildtools/environment-setup* > $LOGFILE && \
> +                       cd $target_sdk_dir/`dirname ${oe_init_build_env_p=
ath}` && \
> +                       set $target_sdk_dir && \

I know it was there before, but I wonder what the point of the 'set'
is here. It sets $1 to $target_sdk_dir, but $target_sdk_dir is already
passed explicitly to $target_sdk_dir/${oe_init_build_env_path} below.

> +                       . $target_sdk_dir/${oe_init_build_env_path} $targ=
et_sdk_dir >> $LOGFILE && \
> +                       python $target_sdk_dir/ext-sdk-prepare.py $LOGFIL=
E '${SDK_INSTALL_TARGETS}'"
> +               if [ $? -ne ]; then
> +                       echo "printf 'ERROR: this SDK was not fully insta=
lled and needs reinstalling\n'" >> $env_setup_script
> +                       exit 1
> +                       rm $target_sdk_dir/ext-sdk-prepare.py

Unreachable code.

> +               fi
>         fi
>         echo done
>  }
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Cheers,
Ulf

