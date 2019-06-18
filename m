Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0786BCA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 19:23:50 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h6so32554745ioh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 12:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1qIbOfzgDIRfjDl90V7/YLXwDyYmEr5BfVl6WQVLpmc=;
	b=0PPCawiNUUw+tdPUUob/4l/I61fGjRSAmIiDP+OjG25OrRGNnTuNl57wax19uModZW
	3lbBMg/IO90tdxy130tD9RgxpyJXnuCiYIQaQoTD5Dp0TG4R1fODAOFtRx7LVgWvaIuL
	jber+U0rVx/de6YOLQ2jnQTyDUOc6pREOTjNYvm0KmEsJplk37qTijpIVrzhAv351q10
	LmMqqMiG0UbqYNw4CLPHByZzne1fqVzIkzw06Kprr1F4qqSv94mf1o8CxZ7qP+yjRTaL
	IOj9k9LkVSUZkSNOQhkEUo9UPrx7lKZHwfUQcx16DFdnMa0UGRSvPyYotbmGs9aOhJz8
	pO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1qIbOfzgDIRfjDl90V7/YLXwDyYmEr5BfVl6WQVLpmc=;
	b=s4/ILqGwRMKoZZf0IXE+/uxHRw9YvvUTPNggLocB8NWjW3RfPs40eYQz4cwP4OuDdh
	ZivwnLxGrtUDagtQ4GqwhPrmpisfHPz97fQ76lQQ+/fYhsKl3NRAqpirh02US93DD1KG
	EE110TTW9dAXzPd3vPjTVGqGsJpH761ubwm4lUpHw//ECPpfkEsw7MxIrJjSp5ULlSLn
	uwOTNvxuE5lUs8X2C5DM5XUMdKtFo0mIQIZGLFVdg9YMVpkhAlWyv+pIHcONAep0z2vA
	M4fqhv80+kEckar93p2pCw3yXu3BgsUa40Se/5Ttdcm3aCFc6tnsmoMiw08J839cUclR
	mYtQ==
X-Gm-Message-State: APjAAAUkUPj/uPQOtLUrZebXvSx5mzO2+/hFJM6VIyrEkvADtLo2f7Eu
	nKGJ7+RhipWVfVWf6x4KCwrJQmR2P1nBCG8+Xwaigw==
X-Google-Smtp-Source: APXvYqz1vm9Uf2kLbPKUtRRjFUeAVuldzBVzXe+YUnw1GFbC30IanFlEN4741y2shqyZOfmLrdmK5z/gZo5MWduN270=
X-Received: by 2002:a02:b798:: with SMTP id f24mr88251000jam.97.1560885832060; 
	Tue, 18 Jun 2019 12:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQdcXs=oCRTQ-jycu6WTVWxmQOUVMdnJ9ihFLCMGvCHiUw@mail.gmail.com>
	<20190618190928.14232-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190618190928.14232-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jun 2019 20:23:41 +0100
Message-ID: <CAJTo0LbrxK0uOU4ZmQOXoPXHYx-u3iY+gZaNc9uWPRH6bQU5vA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 18 Jun 2019 19:23:51 -0000
Content-Type: text/plain; charset="UTF-8"

No S-o-b in the patch, but more importantly no Upstream-Status.  Have
you reported this upstream?  Or compared what we're doing to what
other distros that package serf do?

Ross

On Tue, 18 Jun 2019 at 20:09, Martin Jansa <martin.jansa@gmail.com> wrote:
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

