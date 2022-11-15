Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D85C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 19:42:16 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.5414.1668541327421981133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 11:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vi5cbKSR;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id v27so23437558eda.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 11:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=whL5jdCGUdc9Fl2InFQTIfEdtWiQmfYUK9Hv8TvrpgI=;
        b=Vi5cbKSRur7luXH/9hSd2etsl10RlGd0Z75izvIYeUnV4XQb6NEttZ33ed8RbAkayb
         YRZzAKK0oCauF8zxw8eCYjtRRoqG3r+NOQwvB8WO7/gjV1rzSVx9jxfMv4AzY31e17Uc
         dTplrIjeewHOTHLh/zSGd0WW8SJ+gpLhsuq+aaA96oG0HOaqjxd9D6kR56Xd2PCT3ysU
         C7eGsHDzCOSDwnI+p4zWjhyXfZT9w+/CyErTN91Aua97juE+61Gd1rglWCW7gfK58akQ
         aYUimU2R2ywMdClYAzLRwy+dT10uL7jRS9yQDOL+ziEiG7B923nqZIIYuAWWXZ7Q0BLr
         RcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=whL5jdCGUdc9Fl2InFQTIfEdtWiQmfYUK9Hv8TvrpgI=;
        b=rduhE7gGuZ7G9hvZwKzOSjBf1YAW0lOmNsb6DZWxI7DcsCO5c1/sDJS6ha1iW1DOEK
         vhW+ZPfGuK7HV2zos5XE4+IiIpSoZnKd0EglA6VQnhJAD1pnIdC85ZjpjB7Z2ERIqUPt
         mJCPboVVPfUbHdXmz8v9CQBByA0fQwPOz5UawDRFdbx+LMJMXoCqAJI/SbhvIzQrB7/l
         6ql1zO1NCh36LjwRqHwitYcGdH/G4qYPqQgy+e/n0yU52Vk476TLw0TFgi+T+EGrIlWj
         YqRN/+L7mfeACWljlE4yUqy3+fCrOSHQ5sfmXALEP5whjr56tgYRCVZcKdDgyjlp1TT9
         AaZA==
X-Gm-Message-State: ANoB5pnY/89h3zdHdUoa7CIQSDiH3BM8gcmFQsX67GfzY28KVFe+dzVc
	MNP2GtVjX9yJaHDcbhLed2KJlMADhvqtlVostCOG+p+A
X-Google-Smtp-Source: AA0mqf4slu7zFYSK9fdSEsK8eXD0yuH6sMaZaNf0MEYgXLmjPXMhXTvPKeNJOXDT06psIN2Xn6Yo+X4duXQPxfCIH3s=
X-Received: by 2002:aa7:c0d6:0:b0:467:7519:6bff with SMTP id
 j22-20020aa7c0d6000000b0046775196bffmr14689863edp.301.1668541325460; Tue, 15
 Nov 2022 11:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20221111145551.1115391-1-JPEWhacker@gmail.com>
In-Reply-To: <20221111145551.1115391-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 15 Nov 2022 13:41:54 -0600
Message-ID: <CAJdd5GaYZNrHT8Ki3-M7yNuHcGbdz38O04aGJJspu=86PC2-Ag@mail.gmail.com>
Subject: Re: [OE-core][PATCH] scripts: convert-overrides: Allow command-line customizations
To: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 19:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173355

Steve,

Please backport this to kirkstone and langdale.

Thanks!

On Fri, Nov 11, 2022 at 8:55 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Adds argument parsing to the conversion script so that the fields that
> the script uses to do conversions can be customized on the command line.
> The intention is to allows easier customization without having to fork
> the script, and allow automated checking on 3rd party layers via CI
> without false positives
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  scripts/contrib/convert-overrides.py | 103 +++++++++++++++------------
>  1 file changed, 57 insertions(+), 46 deletions(-)
>
> diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
> index 4d41a4c4759..1939757f1bc 100755
> --- a/scripts/contrib/convert-overrides.py
> +++ b/scripts/contrib/convert-overrides.py
> @@ -22,50 +22,62 @@ import sys
>  import tempfile
>  import shutil
>  import mimetypes
> +import argparse
>
> -if len(sys.argv) < 2:
> -    print("Please specify a directory to run the conversion script against.")
> -    sys.exit(1)
> +parser = argparse.ArgumentParser(description="Convert override syntax")
> +parser.add_argument("--override", "-o", action="append", default=[], help="Add additional strings to consider as an override (e.g. custom machines/distros")
> +parser.add_argument("--skip", "-s", action="append", default=[], help="Add additional string to skip and not consider an override")
> +parser.add_argument("--skip-ext", "-e", action="append", default=[], help="Additional file suffixes to skip when processing (e.g. '.foo')")
> +parser.add_argument("--package-vars", action="append", default=[], help="Additional variables to treat as package variables")
> +parser.add_argument("--image-vars", action="append", default=[], help="Additional variables to treat as image variables")
> +parser.add_argument("--short-override", action="append", default=[], help="Additional strings to treat as short overrides")
> +parser.add_argument("path", nargs="+", help="Paths to convert")
> +
> +args = parser.parse_args()
>
>  # List of strings to treat as overrides
> -vars = ["append", "prepend", "remove"]
> -vars = vars + ["qemuarm", "qemux86", "qemumips", "qemuppc", "qemuriscv", "qemuall"]
> -vars = vars + ["genericx86", "edgerouter", "beaglebone-yocto"]
> -vars = vars + ["armeb", "arm", "armv5", "armv6", "armv4", "powerpc64", "aarch64", "riscv32", "riscv64", "x86", "mips64", "powerpc"]
> -vars = vars + ["mipsarch", "x86-x32", "mips16e", "microblaze", "e5500-64b", "mipsisa32", "mipsisa64"]
> -vars = vars + ["class-native", "class-target", "class-cross-canadian", "class-cross", "class-devupstream"]
> -vars = vars + ["tune-",  "pn-", "forcevariable"]
> -vars = vars + ["libc-musl", "libc-glibc", "libc-newlib","libc-baremetal"]
> -vars = vars + ["task-configure", "task-compile", "task-install", "task-clean", "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
> -vars = vars + ["toolchain-clang", "mydistro", "nios2", "sdkmingw32", "overrideone", "overridetwo"]
> -vars = vars + ["linux-gnux32", "linux-muslx32", "linux-gnun32", "mingw32", "poky", "darwin", "linuxstdbase"]
> -vars = vars + ["linux-gnueabi", "eabi"]
> -vars = vars + ["virtclass-multilib", "virtclass-mcextend"]
> +vars = args.override
> +vars += ["append", "prepend", "remove"]
> +vars += ["qemuarm", "qemux86", "qemumips", "qemuppc", "qemuriscv", "qemuall"]
> +vars += ["genericx86", "edgerouter", "beaglebone-yocto"]
> +vars += ["armeb", "arm", "armv5", "armv6", "armv4", "powerpc64", "aarch64", "riscv32", "riscv64", "x86", "mips64", "powerpc"]
> +vars += ["mipsarch", "x86-x32", "mips16e", "microblaze", "e5500-64b", "mipsisa32", "mipsisa64"]
> +vars += ["class-native", "class-target", "class-cross-canadian", "class-cross", "class-devupstream"]
> +vars += ["tune-",  "pn-", "forcevariable"]
> +vars += ["libc-musl", "libc-glibc", "libc-newlib","libc-baremetal"]
> +vars += ["task-configure", "task-compile", "task-install", "task-clean", "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
> +vars += ["toolchain-clang", "mydistro", "nios2", "sdkmingw32", "overrideone", "overridetwo"]
> +vars += ["linux-gnux32", "linux-muslx32", "linux-gnun32", "mingw32", "poky", "darwin", "linuxstdbase"]
> +vars += ["linux-gnueabi", "eabi"]
> +vars += ["virtclass-multilib", "virtclass-mcextend"]
>
>  # List of strings to treat as overrides but only with whitespace following or another override (more restricted matching).
>  # Handles issues with arc matching arch.
> -shortvars = ["arc", "mips", "mipsel", "sh4"]
> +shortvars = ["arc", "mips", "mipsel", "sh4"] + args.short_override
>
>  # Variables which take packagenames as an override
>  packagevars = ["FILES", "RDEPENDS", "RRECOMMENDS", "SUMMARY", "DESCRIPTION", "RSUGGESTS", "RPROVIDES", "RCONFLICTS", "PKG", "ALLOW_EMPTY",
>                "pkg_postrm", "pkg_postinst_ontarget", "pkg_postinst", "INITSCRIPT_NAME", "INITSCRIPT_PARAMS", "DEBIAN_NOAUTONAME", "ALTERNATIVE",
>                "PKGE", "PKGV", "PKGR", "USERADD_PARAM", "GROUPADD_PARAM", "CONFFILES", "SYSTEMD_SERVICE", "LICENSE", "SECTION", "pkg_preinst",
>                "pkg_prerm", "RREPLACES", "GROUPMEMS_PARAM", "SYSTEMD_AUTO_ENABLE", "SKIP_FILEDEPS", "PRIVATE_LIBS", "PACKAGE_ADD_METADATA",
> -              "INSANE_SKIP", "DEBIANNAME", "SYSTEMD_SERVICE_ESCAPED"]
> +              "INSANE_SKIP", "DEBIANNAME", "SYSTEMD_SERVICE_ESCAPED"] + args.package_vars
>
>  # Expressions to skip if encountered, these are not overrides
> -skips = ["parser_append", "recipe_to_append", "extra_append", "to_remove", "show_appends", "applied_appends", "file_appends", "handle_remove"]
> -skips = skips + ["expanded_removes", "color_remove", "test_remove", "empty_remove", "toaster_prepend", "num_removed", "licfiles_append", "_write_append"]
> -skips = skips + ["no_report_remove", "test_prepend", "test_append", "multiple_append", "test_remove", "shallow_remove", "do_remove_layer", "first_append"]
> -skips = skips + ["parser_remove", "to_append", "no_remove", "bblayers_add_remove", "bblayers_remove", "apply_append", "is_x86", "base_dep_prepend"]
> -skips = skips + ["autotools_dep_prepend", "go_map_arm", "alt_remove_links", "systemd_append_file", "file_append", "process_file_darwin"]
> -skips = skips + ["run_loaddata_poky", "determine_if_poky_env", "do_populate_poky_src", "libc_cv_include_x86_isa_level", "test_rpm_remove", "do_install_armmultilib"]
> -skips = skips + ["get_appends_for_files", "test_doubleref_remove", "test_bitbakelayers_add_remove", "elf32_x86_64", "colour_remove", "revmap_remove"]
> -skips = skips + ["test_rpm_remove", "test_bitbakelayers_add_remove", "recipe_append_file", "log_data_removed", "recipe_append", "systemd_machine_unit_append"]
> -skips = skips + ["recipetool_append", "changetype_remove", "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends", "tgz_removed"]
> -
> -imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD", "IMAGE_TYPEDEP", "CONVERSION_CMD", "COMPRESS_CMD"]
> -packagevars = packagevars + imagevars
> +skips = args.skip
> +skips += ["parser_append", "recipe_to_append", "extra_append", "to_remove", "show_appends", "applied_appends", "file_appends", "handle_remove"]
> +skips += ["expanded_removes", "color_remove", "test_remove", "empty_remove", "toaster_prepend", "num_removed", "licfiles_append", "_write_append"]
> +skips += ["no_report_remove", "test_prepend", "test_append", "multiple_append", "test_remove", "shallow_remove", "do_remove_layer", "first_append"]
> +skips += ["parser_remove", "to_append", "no_remove", "bblayers_add_remove", "bblayers_remove", "apply_append", "is_x86", "base_dep_prepend"]
> +skips += ["autotools_dep_prepend", "go_map_arm", "alt_remove_links", "systemd_append_file", "file_append", "process_file_darwin"]
> +skips += ["run_loaddata_poky", "determine_if_poky_env", "do_populate_poky_src", "libc_cv_include_x86_isa_level", "test_rpm_remove", "do_install_armmultilib"]
> +skips += ["get_appends_for_files", "test_doubleref_remove", "test_bitbakelayers_add_remove", "elf32_x86_64", "colour_remove", "revmap_remove"]
> +skips += ["test_rpm_remove", "test_bitbakelayers_add_remove", "recipe_append_file", "log_data_removed", "recipe_append", "systemd_machine_unit_append"]
> +skips += ["recipetool_append", "changetype_remove", "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends", "tgz_removed"]
> +
> +imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD", "IMAGE_TYPEDEP", "CONVERSION_CMD", "COMPRESS_CMD"] + args.image_vars
> +packagevars += imagevars
> +
> +skip_ext = [".html", ".patch", ".m4", ".diff"] + args.skip_ext
>
>  vars_re = {}
>  for exp in vars:
> @@ -124,21 +136,20 @@ def processfile(fn):
>  ourname = os.path.basename(sys.argv[0])
>  ourversion = "0.9.3"
>
> -if os.path.isfile(sys.argv[1]):
> -    processfile(sys.argv[1])
> -    sys.exit(0)
> -
> -for targetdir in sys.argv[1:]:
> -    print("processing directory '%s'" % targetdir)
> -    for root, dirs, files in os.walk(targetdir):
> -        for name in files:
> -            if name == ourname:
> -                continue
> -            fn = os.path.join(root, name)
> -            if os.path.islink(fn):
> -                continue
> -            if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff"):
> -                continue
> -            processfile(fn)
> +for p in args.path:
> +    if os.path.isfile(p):
> +        processfile(p)
> +    else:
> +        print("processing directory '%s'" % p)
> +        for root, dirs, files in os.walk(p):
> +            for name in files:
> +                if name == ourname:
> +                    continue
> +                fn = os.path.join(root, name)
> +                if os.path.islink(fn):
> +                    continue
> +                if "/.git/" in fn or any(fn.endswith(ext) for ext in skip_ext):
> +                    continue
> +                processfile(fn)
>
>  print("All files processed with version %s" % ourversion)
> --
> 2.33.0
>

