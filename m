Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id E620A7CF98
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 19:14:19 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id a27so9313200qkk.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 12:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G4EjSxEj3gnkTWSBeuLQ47awsIgXcPRrYoj/B7xy5OQ=;
	b=ff8S2GS7RH02e4NI6n+47kSOS4L1NqrHlTXBXU5r+Yocf9s2RKkEbAxzDzyzo9cACV
	xH9W3d98qLcGw5VL+a9IoH95AA6w9uT2fJxFfa216Ekmc3y/8Dv5HmUOKwOBZoWeO/FI
	DDBeIyNz8HXlhb8c4aZcJPGQ8n2jbIA8u6OKm6fpQ/JMZJUWDTjMH2zUxfUaQ3rOlHMM
	ytVq7EbwhuBNjnokeddvbcFuuSe9RqqGF/AetuKGKwCn6c9y7+yQgBVj+90eZEYGrGWr
	zP7FZEdGDlxWpjliUsLeFfRD1DqGyjxw847PnYYAfM3I3InXLz6I/eK/iRqCcqcNsYjF
	kLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G4EjSxEj3gnkTWSBeuLQ47awsIgXcPRrYoj/B7xy5OQ=;
	b=Gmxwx5Ickwwmo+vn4uH/JQEbzDWfNEPh6bHis0dn0xPSAyevSTzYP1zjFIO84HLFGJ
	uUUS6NEyK+fHD6bd5MKdk9DlRcmWV8B3iCnw7QWd7ZhoZxht/HKl4SSOQXGYPcXQnCmZ
	GfcfHAvRqtag1tZ4r0BpHj2mtn4HjyYMdg4libj/3ihN+0JI3GfPb+skr/HbqRGjgoF3
	3rHldwW1xgIRwCRp6+Pu+Eikv8oK+XyIGJ4B9yd0KU4dPYHUl/ryhJQ4Q/+omG6pPX1g
	FfyKUksw9Lz1phOBRmUF32DxGSLSpMVTMbAQdY927DeRWPEQcBbEentIt/voKB8Xufyl
	Agmg==
X-Gm-Message-State: APjAAAXQ+Hxa41LAYPSApHnpzOjZ3oRACQtkPoWud99AuXPPIFnwN2Q9
	HmGmXeWb8LssOEQPA1jBr2/rAKIox0F2LvM8VNY=
X-Google-Smtp-Source: APXvYqxcipKEP8AfN0ObPTlAa7DSjiKKEH3F9Vbp9vJFjQpgY56OQUy0dL3Nv/KUfMmN7u/Zbv2ATWRR4h52lFqt+pM=
X-Received: by 2002:a37:b0c6:: with SMTP id
	z189mr47153540qke.208.1560885260395; 
	Tue, 18 Jun 2019 12:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQdcXs=oCRTQ-jycu6WTVWxmQOUVMdnJ9ihFLCMGvCHiUw@mail.gmail.com>
	<20190618190928.14232-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190618190928.14232-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jun 2019 12:13:54 -0700
Message-ID: <CAMKF1sp8ihQ+=9a24TvcHgh395QoBpdL5Q2PG8-LzKkf9MK3sw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] serf: stop scons trying to create directories in hosts rootfs
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
X-List-Received-Date: Tue, 18 Jun 2019 19:14:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 18, 2019 at 12:09 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * since 1522f09a4d serf: cleanup recipe
>   serf.do_install fails in builds with multilib enabled (with
>   libdir=/usr/lib64 on host where /usr/lib64 doesn't exist)
>
> DEBUG: Executing shell function do_install
> scons: Reading SConscript files ...
> PermissionError: [Errno 13] Permission denied: '/usr/lib64':
>   File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct", line 158:
>     ENV = os.environ,
>   File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Environment.py", line 965:
>     variables.Update(self)
>   File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/__init__.py", line 227:
>     option.validator(option.key, env.subst('${%s}'%option.key), env)
>   File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct", line 60:
>     return PathVariable.PathIsDirCreate(key, val, env)
>   File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/PathVariable.py", line 101:
>     os.makedirs(val)
>   File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/lib/python3.7/os.py", line 221:
>     mkdir(name, mode)
> ERROR: scons install execution failed.
>
> * I don't know how exactly --install-sandbox is supposed to work but
>   in this case it's trying to mkdir /usr/lib64 on the host rootfs
>   which is clearly wrong and if I set LIBDIR together with
>   --install-sandbox then the install paths are prefixed with $D twice
>   in some cases (not for includedir and empty libdir at the end).
>   So in the end I think it was an issue caused by the custom path
>   validator in serf's SConstruct, removing that stops touching host
>   and the installed paths (including the paths inside libserf*.pc)
>   look correct
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...ories.without.sandbox-install.prefix.patch | 34 +++++++++++++++++++
>  meta/recipes-support/serf/serf_1.3.9.bb       |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
>
> diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> new file mode 100644
> index 0000000000..bfb2f5a2aa
> --- /dev/null
> +++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> @@ -0,0 +1,34 @@
> +--- ../1.3.9-r0-bad-double/serf-1.3.9/SConstruct       2019-06-18 15:49:19.968961108 +0000
> ++++ serf-1.3.9/SConstruct      2019-06-18 18:53:21.412337151 +0000
> +@@ -51,17 +51,6 @@
> +     """
> +     return (key, '%s' % (help), default, None, lambda val: _converter(val))
> +
> +-# Custom path validator, creates directory when a specified option is set.
> +-# To be used to ensure a PREFIX directory is only created when installing.
> +-def createPathIsDirCreateWithTarget(target):
> +-  def my_validator(key, val, env):
> +-    build_targets = (map(str, BUILD_TARGETS))
> +-    if target in build_targets:
> +-      return PathVariable.PathIsDirCreate(key, val, env)
> +-    else:
> +-      return PathVariable.PathAccept(key, val, env)
> +-  return my_validator
> +-
> + # default directories
> + if sys.platform == 'win32':
> +   default_incdir='..'
> +@@ -77,11 +66,11 @@
> +   PathVariable('PREFIX',
> +                'Directory to install under',
> +                default_prefix,
> +-               createPathIsDirCreateWithTarget('install')),
> ++               PathVariable.PathAccept),
> +   PathVariable('LIBDIR',
> +                'Directory to install architecture dependent libraries under',
> +                default_libdir,
> +-               createPathIsDirCreateWithTarget('install')),
> ++               PathVariable.PathAccept),
> +   PathVariable('APR',
> +                "Path to apr-1-config, or to APR's install area",
> +                default_incdir,
> diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
> index 92cd5ca061..25ccd79e00 100644
> --- a/meta/recipes-support/serf/serf_1.3.9.bb
> +++ b/meta/recipes-support/serf/serf_1.3.9.bb
> @@ -6,6 +6,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patch \
>             file://0003-gen_def.patch \
>             file://0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch \
> +    file://SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch \

tabs or spaces mismatch I guess ?

>             "
>
>  SRC_URI[md5sum] = "370a6340ff20366ab088012cd13f2b57"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

