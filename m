Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 98AE8754BB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 16:49:15 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id d185-v6so8408807ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 09:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D7TQ7QQWSHaZXEo1xF8rfIhBmQC9ibaPbJCL29Mi0DA=;
	b=B3Qjj+KTevJTqy1M+/MAyTr3BqsKKpJdVTrjR98/LKyOnzKkM3dgzf05gfCfyhVfvc
	lUkF8NgtXMGTt6GvM0JFraFSBuCQqsCi2YwFAOoqaCCDN0JkV8DEijEmB3aZxQw8AW66
	XDZp7VWIQ1jU+oEPDcbLM/cJiKT1Ud3wXM5FuEaknUqengCGPYcv32wsTO/L0Pa3U50W
	ao5jlGVAUsbnTnj3fSzUcyvKouj5ZwV86qALoFfr8D/MDwcTk++nZA/a/FnwnsWjmt1u
	zcILkYKJm0ZlNtbdVlMUn1qjrFo/ftJW8iFEyIjonjcf7UjwhTAzYcJoFX/rowDA5ryJ
	lNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D7TQ7QQWSHaZXEo1xF8rfIhBmQC9ibaPbJCL29Mi0DA=;
	b=tXY8yc/IybkIx+sTjK275J+8QNx5CZexOL1iHZJG4TYGw9GJg7kf4mA03XrbLK1VPI
	mYqNuevxd9ZpC12gHeV9Gy+/5mdV0Vbh72uQ0qFPZVEO9NHnSKQVM42/2h6coUpZqKez
	Lx9nrbxTfZXrKvYgZh/8T8cDcFQz54tR4dqbTTCMA2nhHKea7swMrO7JFA1CvuR6gd2W
	Gu1P1iBT53sxNRVnw+gm6Vqaz/UMH2XzdprnQ5/6g8j5ZV5xcLbWgn4amZ0SjHw4U0a1
	iIoE2RlWqsGLQIUi9LF+YrqQnxrWQhmqLROGSO/iuNUA50QPM7+NzqWL3Z+wDcBp7Fku
	aybg==
X-Gm-Message-State: APt69E3aayxqMOX3qgnsvbRt0b9ByqKaELqPHJ+t3HCEaauHlzKp3kHQ
	ULO+1Ih7OekWSmygOJ2YvmdcimqHKCTm++T6wmFk2w==
X-Google-Smtp-Source: ADUXVKI1G10wWlI8ox7yDW1PVebItI/6257pbCI/zxAkle+WmFu7yIh9YlBFcvLh3EwnnPvEhE/Tq7E1LN0bAsdyXdQ=
X-Received: by 2002:a6b:2401:: with SMTP id
	k1-v6mr3459206iok.270.1528303756404; 
	Wed, 06 Jun 2018 09:49:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:f614:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 09:48:55 -0700 (PDT)
In-Reply-To: <31d93c4a23eec59b835a52dc7002814e1b9fbe22.1527214769.git.Qi.Chen@windriver.com>
References: <cover.1527214769.git.Qi.Chen@windriver.com>
	<31d93c4a23eec59b835a52dc7002814e1b9fbe22.1527214769.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Jun 2018 17:48:55 +0100
Message-ID: <CAJTo0LbuaPOcp0WbB0_T9O+kivU9Wye6Zzb6w8xD-kQXXOpJzg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libnss-nis
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
X-List-Received-Date: Wed, 06 Jun 2018 16:49:16 -0000
Content-Type: text/plain; charset="UTF-8"

Try building a musl buildtools and it breaks:

ERROR: Nothing RPROVIDES 'nativesdk-libnss-nis' (but
/home/ross/Yocto/poky/meta/recipes-core/meta/buildtools-tarball.bb
RDEPENDS on or otherwise requires it)
nativesdk-libnss-nis was skipped: incompatible with musl C library

Ross

On 25 May 2018 at 03:54, Chen Qi <Qi.Chen@windriver.com> wrote:
> Recent glibc change removed libnss-nis module from glibc and a new
> recipe libnss-nis.bb was added.
>
> After this change, we need to make sure nativesdk-libnss-nis is also
> included in buildtools-tarball, otherwise, we may encounter the following
> error when using 'tar' command from buildtools-tarball.
>
>   tar: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2: \
>        symbol _nsl_default_nss version GLIBC_PRIVATE not defined \
>        in file libnsl.so.1 with link time reference
>
> This error occured on my ubuntu16.04 host with 'nis' configured in
> /etc/nssswitch.conf.
>
> So add nativesdk-libnss-nis to buildtools-tarball to fix this problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index d98a9c9..377733f 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -21,6 +21,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>      nativesdk-wget \
>      nativesdk-ca-certificates \
>      nativesdk-texinfo \
> +    nativesdk-libnss-nis \
>      "
>
>  MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

