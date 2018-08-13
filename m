Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id A1A9B78EAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 18:29:22 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id w26-v6so18480705qto.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 11:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KZuCGPWR3Q78AszjJAtXLv3WIgkLda/Df7IoIbLuarw=;
	b=MP3XN9+wg4eZradPeXeWuOJpYq6P5wYfk4REuvNFBfIdX+SUV5Q83ZH8JwahDuNrbL
	F5JqchKIFi5onGw87RJPLMMR/t3+PQO2el5JP+0VbWdvO2NfYtpVv0UBAj2/1/PCCntD
	wvFDuHyzvoHeIDb0diSTU8DDN2Lh/mDU30QJUZNXP9dIkllBBU3rOxFk5BXeon3C6j4a
	6VRHvh3nwlc+anDQvsPweCXWdBU4d0QiMHlW1PCtOy8K2L806aQ8ousdf1AYmR4RC+Xp
	6i+QlCY0mVvB2VuAaQI0HwXSXNfMLPg96Ee4EMhGLIYsducF3vXAfEiwqoO5oTw/wq80
	zvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KZuCGPWR3Q78AszjJAtXLv3WIgkLda/Df7IoIbLuarw=;
	b=tfoEdk6CM/bWErLVk/16D+EZk38YF5OQAIYITBzm1yjAxok4ptCLR0L3XgCzwCJQmw
	Xs3fNM1H9/jIbnK8Op6eOaGraVfXP4fpadMOFbBt86CrPpXtR7ysNtnAnQfsWMheGfwr
	2NP12zMbynwzaocv5dj0fn39dltKLg+9QXqmVioE1Jq7muodsiENEkUPgc2w2DibP/iC
	hH4BCUgZS2TXx+ocW0+ZVB6/XFVKHfrFfY32WIgm2XhZpA/bQCpwzWETfu7Usf95bE8U
	TnsVfV5kidhl18/iRCw85vzHzcHrosKKZV1mtNDpRp/5RH8eK0RZ0yzZTl723Dnh5GQ1
	UrMA==
X-Gm-Message-State: AOUpUlGefLWNt7+lTVmFXE/AlmSRT9CdFplnW8w3oDprRSjOv6CVZvA1
	Zo4N/Zeu9eRmDQHx0zjK6P9+Ano2Ho5YB0z25AQ=
X-Google-Smtp-Source: AA+uWPxKUREobpRqUNYgMcOOEi9yAvf8yTGZsvFajCEk5KQ46joRlqon3D3HmzD/mtnW34Ri70XlGK16n93FhdYpN3I=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr18113041qta.117.1534184963339; 
	Mon, 13 Aug 2018 11:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
	<20180813142835.5309-6-richard.purdie@linuxfoundation.org>
In-Reply-To: <20180813142835.5309-6-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Aug 2018 11:28:57 -0700
Message-ID: <CAMKF1sqHoFmmW3-c1nPMcf04TCRT6EjUAtkQ=kksEy8aY=sMwQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] image: Add locale archive optimisation
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
X-List-Received-Date: Mon, 13 Aug 2018 18:29:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 13, 2018 at 7:29 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Refactor the locale archive function from the SDK to also make it work during
> general image creation. This reduces the size of the locales from 900MB to 220MB
> in core-image-lsb-sdk.
>
> The exception handling around subprocess was dropped as the standard subprocess
> exception printing is better handled than the catchall exception.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/image.bbclass     |  2 +-
>  meta/lib/oe/package_manager.py | 49 ++++++++++++++++++++++++++++++++++
>  meta/lib/oe/sdk.py             | 45 ++-----------------------------
>  3 files changed, 52 insertions(+), 44 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index c3e73676dca..c0a2714288d 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -22,7 +22,7 @@ POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks; "
>
>  LICENSE ?= "MIT"
>  PACKAGES = ""
> -DEPENDS += "${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross depmodwrapper-cross"
> +DEPENDS += "${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross depmodwrapper-cross cross-localedef-native"
>  RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
>  RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
>  PATH_prepend = "${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 64c8a912160..6011e873503 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -12,6 +12,7 @@ import oe.path
>  import string
>  from oe.gpg_sign import get_signer
>  import hashlib
> +import fnmatch
>
>  # this can be used by all PM backends to create the index files in parallel
>  def create_index(arg):
> @@ -89,6 +90,47 @@ def failed_postinsts_warn(pkgs, log_path):
>  If deferring to first boot wasn't the intent, then scriptlet failure may mean an issue in the recipe, or a regression elsewhere.
>  Details of the failure are in %s.""" %(pkgs, log_path))
>
> +def generate_locale_archive(d, rootfs, target_arch, localedir):
> +    # Pretty sure we don't need this for locale archive generation but
> +    # keeping it to be safe...
> +    locale_arch_options = { \
> +        "arm": ["--uint32-align=4", "--little-endian"],
> +        "armeb": ["--uint32-align=4", "--big-endian"],
> +        "aarch64": ["--uint32-align=4", "--little-endian"],
> +        "aarch64_be": ["--uint32-align=4", "--big-endian"],
> +        "sh4": ["--uint32-align=4", "--big-endian"],
> +        "powerpc": ["--uint32-align=4", "--big-endian"],
> +        "powerpc64": ["--uint32-align=4", "--big-endian"],
> +        "mips": ["--uint32-align=4", "--big-endian"],
> +        "mipsisa32r6": ["--uint32-align=4", "--big-endian"],
> +        "mips64": ["--uint32-align=4", "--big-endian"],
> +        "mipsisa64r6": ["--uint32-align=4", "--big-endian"],
> +        "mipsel": ["--uint32-align=4", "--little-endian"],
> +        "mipsisa32r6el": ["--uint32-align=4", "--little-endian"],
> +        "mips64el": ["--uint32-align=4", "--little-endian"],
> +        "mipsisa64r6el": ["--uint32-align=4", "--little-endian"],
> +        "i586": ["--uint32-align=4", "--little-endian"],
> +        "i686": ["--uint32-align=4", "--little-endian"],
> +        "x86_64": ["--uint32-align=4", "--little-endian"]
> +    }

perhaps now we should also add risc-v here since its not limited to SDK alone

"riscv64": ["--uint32-align=4", "--little-endian"]
"riscv32": ["--uint32-align=4", "--little-endian"]

> +    if target_arch in locale_arch_options:
> +        arch_options = locale_arch_options[target_arch]
> +    else:
> +        bb.error("locale_arch_options not found for target_arch=" + target_arch)
> +        bb.fatal("unknown arch:" + target_arch + " for locale_arch_options")
> +
> +    # Need to set this so cross-localedef knows where the archive is
> +    env = dict(os.environ)
> +    env["LOCALEARCHIVE"] = oe.path.join(localedir, "locale-archive")
> +
> +    for name in os.listdir(localedir):
> +        path = os.path.join(localedir, name)
> +        if os.path.isdir(path):
> +            cmd = ["cross-localedef", "--verbose"]
> +            cmd += arch_options
> +            cmd += ["--add-to-archive", path]
> +            subprocess.check_output(cmd, env=env, stderr=subprocess.STDOUT)
> +
>  class Indexer(object, metaclass=ABCMeta):
>      def __init__(self, d, deploy_dir):
>          self.d = d
> @@ -536,6 +578,13 @@ class PackageManager(object, metaclass=ABCMeta):
>                           "'%s' returned %d:\n%s" %
>                           (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
>
> +        target_arch = self.d.getVar('TARGET_ARCH')
> +        localedir = oe.path.join(self.target_rootfs, self.d.getVar("libdir"), "locale")
> +        if os.path.exists(localedir) and os.listdir(localedir):
> +            generate_locale_archive(self.d, self.target_rootfs, target_arch, localedir)
> +            # And now delete the binary locales
> +            self.remove(fnmatch.filter(self.list_installed(), "glibc-binary-localedata-*"), False)
> +
>      def deploy_dir_lock(self):
>          if self.deploy_dir is None:
>              raise RuntimeError("deploy_dir is not set!")
> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
> index 0d39ea8a91e..a579d9ae77f 100644
> --- a/meta/lib/oe/sdk.py
> +++ b/meta/lib/oe/sdk.py
> @@ -7,51 +7,10 @@ import shutil
>  import glob
>  import traceback
>
> -def generate_locale_archive(d, rootfs):
> -    # Pretty sure we don't need this for SDK archive generation but
> -    # keeping it to be safe...
> +def generate_locale_archive_sdk(d, rootfs):
>      target_arch = d.getVar('SDK_ARCH')
> -    locale_arch_options = { \
> -        "arm": ["--uint32-align=4", "--little-endian"],
> -        "armeb": ["--uint32-align=4", "--big-endian"],
> -        "aarch64": ["--uint32-align=4", "--little-endian"],
> -        "aarch64_be": ["--uint32-align=4", "--big-endian"],
> -        "sh4": ["--uint32-align=4", "--big-endian"],
> -        "powerpc": ["--uint32-align=4", "--big-endian"],
> -        "powerpc64": ["--uint32-align=4", "--big-endian"],
> -        "mips": ["--uint32-align=4", "--big-endian"],
> -        "mipsisa32r6": ["--uint32-align=4", "--big-endian"],
> -        "mips64": ["--uint32-align=4", "--big-endian"],
> -        "mipsisa64r6": ["--uint32-align=4", "--big-endian"],
> -        "mipsel": ["--uint32-align=4", "--little-endian"],
> -        "mipsisa32r6el": ["--uint32-align=4", "--little-endian"],
> -        "mips64el": ["--uint32-align=4", "--little-endian"],
> -        "mipsisa64r6el": ["--uint32-align=4", "--little-endian"],
> -        "i586": ["--uint32-align=4", "--little-endian"],
> -        "i686": ["--uint32-align=4", "--little-endian"],
> -        "x86_64": ["--uint32-align=4", "--little-endian"]
> -    }
> -    if target_arch in locale_arch_options:
> -        arch_options = locale_arch_options[target_arch]
> -    else:
> -        bb.error("locale_arch_options not found for target_arch=" + target_arch)
> -        bb.fatal("unknown arch:" + target_arch + " for locale_arch_options")
> -
>      localedir = oe.path.join(rootfs, d.getVar("libdir_nativesdk"), "locale")
> -    # Need to set this so cross-localedef knows where the archive is
> -    env = dict(os.environ)
> -    env["LOCALEARCHIVE"] = oe.path.join(localedir, "locale-archive")
> -
> -    for name in os.listdir(localedir):
> -        path = os.path.join(localedir, name)
> -        if os.path.isdir(path):
> -            try:
> -                cmd = ["cross-localedef", "--verbose"]
> -                cmd += arch_options
> -                cmd += ["--add-to-archive", path]
> -                subprocess.check_output(cmd, env=env, stderr=subprocess.STDOUT)
> -            except Exception as e:
> -                bb.fatal("Cannot create locale archive: %s" % e.output)
> +    generate_locale_archive(d, rootfs, target_arch, localedir)
>
>  class Sdk(object, metaclass=ABCMeta):
>      def __init__(self, d, manifest_dir):
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

