Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id C3F8E60D41
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 03:25:49 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id j17so803150edp.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 19:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=w5uKF95HzCgz3f0DrTC2Em73dV5WGsrtR3Y+Lwkr978=;
	b=EcrE10Ye9MSNq0QHRnLvGfFK7B5+jszMAba5taaoljRKcI/sjA2uokRx88mC11Ajvt
	6NGrPnw+lqr83BYrW3PzAg8rqyAQ5FQI/V3OLMs9QqSo63PN7Uv/4g/6bWZrlAw32zfz
	boD8SAF41TgvIKbh5bZiqqpCmpNGJs0waZUYmhi6AWLI9tDiiZqKxIRLYlbPLzmvKDv3
	KJvvJCS/t0wcf30GRxXdxMF21xCCe6AcGEkexUU/+uIIlfigrrIYrsDorp/oer81GFEj
	a6Pucoqs3Tjs23+bHlBNATVPYaJwDSVeQPtrCrjMzQp4DFQXsWTg6KN0RoK1ArXdEwTb
	29tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=w5uKF95HzCgz3f0DrTC2Em73dV5WGsrtR3Y+Lwkr978=;
	b=N8fAK7ZpKt8SqcKLmo7XFuzTGZgUwy/qKdbIMi+T1Uh+fu9IYeoX+4nImf2xkopIgM
	u6nLT6fnzQZQzppDZdYMRAGHmc5FvayUmPNsNKrFoJngho1N8dbaxy+9DKCdqgjcIBSC
	oub2BB/Eu7mBPRlgfQ4pPNeUHgrpqK03sQyEDbe2yHzpzaiOanDgswbobSNi09ppC90Y
	3kDJSJ2smEMcDY92aEPcusQ2wtzI2Tb1Ol7AaDuB3fQKMLW7lOBvg+bHJl6MJxaiyqOF
	i/ZbLyQ6VikEyeFJElOUpsJifhjcpJ7luCVpmNEGD/i6k2bLbMLzZLkmGKL6fbvTrqUB
	PHBw==
X-Gm-Message-State: APjAAAWD72mJtVYHSottRvEusyBdyHWPQrgnZqn29kVE4lNNFoS0m2yx
	y+lWNiQcO4TwZe7Jhq52LdMPaYhw+/ksCohDtF0=
X-Google-Smtp-Source: APXvYqy3Lhgpn9LylOsmolxljNXKg/0YoOYAyJr9fJEMVuWLvIXespV5OYKiQV65FywEY40M/kG0uCBdh+AM5IsI8Jc=
X-Received: by 2002:a50:ee8d:: with SMTP id f13mr2936569edr.347.1580873150335; 
	Tue, 04 Feb 2020 19:25:50 -0800 (PST)
MIME-Version: 1.0
References: <20200205024241.27828-1-Martin.Jansa@gmail.com>
	<20200205024241.27828-2-Martin.Jansa@gmail.com>
In-Reply-To: <20200205024241.27828-2-Martin.Jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Feb 2020 22:25:39 -0500
Message-ID: <CADkTA4M1WZpVWTBssJmR9ymK0ojVtWejtxa3Kbn-cNzeUkR58Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] kernel-yocto.bbclass: do_kernel_configme: don't use +errexit, merge_config_build.log and fail when /.config wasn't created
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
X-List-Received-Date: Wed, 05 Feb 2020 03:25:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard,

I've grabbed all 4 patches in this series and am running some
additional tests, and will do a quick AB run to see if they interact
with any of the other layers, etc. I'll send a consolidated pull
request on Wednesday.

Cheers,

Bruce

On Tue, Feb 4, 2020 at 9:42 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * for whatever reason, instead of silently continuing to build default ke=
rnel config
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yoct=
o.bbclass
> index d2796b01bf..8e642cd999 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -318,8 +318,6 @@ do_kernel_configme[depends] +=3D "virtual/${TARGET_PR=
EFIX}gcc:do_populate_sysroot"
>  do_kernel_configme[depends] +=3D "bc-native:do_populate_sysroot bison-na=
tive:do_populate_sysroot"
>  do_kernel_configme[dirs] +=3D "${S} ${B}"
>  do_kernel_configme() {
> -       set +e
> -
>         # translate the kconfig_mode into something that merge_config.sh
>         # understands
>         case ${KCONFIG_MODE} in
> @@ -345,8 +343,9 @@ do_kernel_configme() {
>                 bbfatal_log "Could not find configuration queue (${meta_d=
ir}/config.queue)"
>         fi
>
> -       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC} $=
{BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL_CC=
}" LD=3D"${KERNEL_LD}" ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flag=
s} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
> -       if [ $? -ne 0 ]; then
> +       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC} $=
{BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL_CC=
}" LD=3D"${KERNEL_LD}" ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flag=
s} ${configs}
> +
> +       if [ $? -ne 0 -o ! -f ${B}/.config ]; then
>                 bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERN=
EL_TYPE}"
>         fi
>
> --
> 2.20.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

