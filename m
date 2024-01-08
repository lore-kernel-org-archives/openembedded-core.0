Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC98C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 12:13:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.5219.1704715976715575848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 04:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hla+6VeB;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3376d424a79so421938f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 04:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704715975; x=1705320775; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HMzCLJiXLVQF6iCXX5FQYKO9cw29FxM8uPUvsTtmUNY=;
        b=hla+6VeBUHT/2wurd/rEIkpI0jJ6eN4OlRGkNyZC5M1AqHb4I5CuvIO+uoF94K0p6L
         C50yJJvdjYIkxGyXiiaWhf3ZYk9HXe82tzo81cl2Vca1m1IpQDsL2mUHNEUiF0pdFDUK
         QxdSMDmTL5lUAGVHKoGHh1iBQ7a02at+IGnwxeL3jKrFQ82NZuVBHY4fZwNr9eFJ79dE
         62jDcm6WUl2rk0us9t5k5oTUUuIXrlBQYr2K5ZLs24pHOXGvst6zm0yIs8Jxngbt6e8N
         zY4aPnJlddJB+9U+KAADZ/kAMMaQZHAETz7hUBfLJLQ0OgcG5bgwdHG3Gd2hXBrYbeou
         6FRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704715975; x=1705320775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMzCLJiXLVQF6iCXX5FQYKO9cw29FxM8uPUvsTtmUNY=;
        b=jASmkfsNVgVS4zuqVQkXE8qFifOWCIhG01fSjvH+BbQNF431AK6bXBr6w1QPuQL/4d
         TckmHHME7o0xZp1Kec+iS3YvJkiSBMP0/txLeeA5rzKQl1PlIxiUJe6PbplJm++7qD77
         vnD3vFzDOE3l2YrUqG27MulEz1UsoLfgvel/tyhBhhlN/7w1aZfmJ105jjfkRj6uh7IV
         Zq17AGSWYPMc9e+LCVvJ8Ej5kndFYftkREqf/gw78NPLrF8XfjScr1027IvCjiQmAgFf
         5iB4VFpX2i15fhv8tLY7g7TyIAPfBrB3wEnwydzPU59yIcwkBMu52vHFeYhpW8/yETKi
         2cMQ==
X-Gm-Message-State: AOJu0YwB+w6D42mG2QNx+2CMucy23ZO0dibJD8i611zcgDU+OJMzX8ha
	3dJfXOqPh943nByKsq3FP9NRExBsl7NtH+u9ReA=
X-Google-Smtp-Source: AGHT+IFCE3Cn2usSHVTup+YGCmIEVnKosybFwS+Rm5p+jo8gFjGYwmYqyfhUk2FJdT3SKpW4cmwIKJRsPdDtYmSU4dU=
X-Received: by 2002:adf:f40d:0:b0:336:8b69:79ba with SMTP id
 g13-20020adff40d000000b003368b6979bamr1693740wro.10.1704715974742; Mon, 08
 Jan 2024 04:12:54 -0800 (PST)
MIME-Version: 1.0
References: <20231223142540.29847-1-alex.kiernan@gmail.com>
In-Reply-To: <20231223142540.29847-1-alex.kiernan@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Jan 2024 13:12:43 +0100
Message-ID: <CA+chaQcO-rUJ1GRqRe2PrjXiZ9-Ds8XBqQSz2vw-gakO-NU9TA@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH] sstate-cache-management: Rewrite in python
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001e18cd060e6e1e31"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 12:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193403

--0000000000001e18cd060e6e1e31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: I've compared
openembedded-core/scripts/sstate-cache-management.sh -d
--cache-dir=3Dsstate-cache
with
openembedded-core/scripts/sstate-cache-management.py -d
--cache-dir=3Dsstate-cache
on some older kirkstone and nanbield build dirs and the python version
removes _much_ more than the shell version did and it was indeed
significantly faster.

For kirkstone shell version removed from 145G to 125G and triggering python
version after that left only 19G.
For nanbield shell version removed from 88G to 77G and triggering python
version after that left only 11G.

I didn't check if all those sstate archives should have been removed or
whether the new python script is supposed to be compatible with older
releases, I just needed to free some disk space quickly before triggering
new build, so I gave it a try and found the huge difference interesting to
share.

Details from the 4 runs bellow:

kirkstone $ du -hs sstate-cache/;
openembedded-core/scripts/sstate-cache-management.sh -d
--cache-dir=3Dsstate-cache; du -hs sstate-cache/
145G    sstate-cache/
Figuring out the archs in the layers ...
Done
Figuring out the suffixes in the sstate cache dir ...
Done
The following suffixes have been found in the cache dir:
addto_recipe_sysroot bundle_initramfs clean cleansstate compile
compile_kernelmodules configure configure_manifest configure_security
create_v8_qemu_wrapper deploy deploy_source_date_epoch extra_symlinks fetch
flush_pseudodb gcc_stash_builddir generate_qt_config_file
generate_toolchain_file generate_webos_localization image image_debugfs_tar
image_ext4 image_tar image_wic install kernel_checkout kernel_configcheck
kernel_configme kernel_link_images kernel_metadata
kernel_version_sanity_check locate_enactjs_appinfo make_icudata mkimage
multilib_install package packagedata package_qa package_write_ipk patch
populate_lic populate_sysroot preconfigure prepare_recipe_sysroot recipe_qa
rootfs rootfs_wicenv shared_workdir sizecheck stash_locale strip
symlink_kernsrc transform_kernel unpack validate_branches warn_musl
write_config write_qemuboot_conf
Figuring out the archs in the sstate cache dir ...
Done
The following archs have been found in the cache dir:
allarch hammerhead_halium qemux86_64 tissot x86_64
...
14012 out of 67493 files will be removed!
...
14012 files have been removed!
125G    sstate-cache/
kirkstone $ du -hs sstate-cache/;
../scarthgap/openembedded-core/scripts/sstate-cache-management.py -d
--cache-dir=3Dsstate-cache; du -hs sstate-cache/
125G    sstate-cache/
39927 out of 55994 files will be removed!
Do you want to continue (y/n)?
y
19G     sstate-cache/

nanbield $ du -hs sstate-cache/;
openembedded-core/scripts/sstate-cache-management.sh -d
--cache-dir=3Dsstate-cache; du -hs sstate-cache/
88G     sstate-cache/
Figuring out the archs in the layers ...
Done
Figuring out the suffixes in the sstate cache dir ...
Done
The following suffixes have been found in the cache dir:
addto_recipe_sysroot bundle_initramfs clean cleansstate compile
compile_kernelmodules configure configure_manifest configure_security
create_v8_qemu_wrapper deploy deploy_source_date_epoch extra_symlinks fetch
flush_pseudodb gcc_stash_builddir generate_native_toolchain_file
generate_qt_config_file generate_toolchain_file generate_webos_localization
hack_recipe_sysroot image image_ext4 image_tar image_wic install
kernel_checkout kernel_configcheck kernel_configme kernel_link_images
kernel_metadata kernel_version_sanity_check locate_enactjs_appinfo
make_icudata mkimage multilib_install package package_qa package_write_ipk
packagedata patch populate_lic populate_sysroot preconfigure
prepare_recipe_sysroot recipe_qa rootfs rootfs_wicenv shared_workdir
sizecheck stash_locale strip symlink_kernsrc transform_kernel unpack
validate_branches warn_musl write_config write_qemuboot_conf
Figuring out the archs in the sstate cache dir ...
Done
The following archs have been found in the cache dir:
allarch qemux86_64 x86_64
...
14339 out of 73198 files will be removed!
...
14339 files have been removed!
77G     sstate-cache/
nanbield $ du -hs sstate-cache/;
../scarthgap/openembedded-core/scripts/sstate-cache-management.py -d
--cache-dir=3Dsstate-cache; du -hs sstate-cache/
77G     sstate-cache/
43490 out of 60639 files will be removed!
Do you want to continue (y/n)?
y
11G     sstate-cache/

On Sat, Dec 23, 2023 at 3:25=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:

> This (should be) a drop in replacement for sstate-cache-management.sh.
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> This is hopefully an option compatible drop in for the existing shell
> sstate-cache-management script. It's orders of magnitude faster, for
> example removing duplicates, with a warmed cache across a more or less
> vanilla poky build:
>
> shell: 24.55s
> python: 0.63s
>
> Running on an NFS mount with 1000s of objects the improvement is even
> more marked.
>
> There are differences in the lists of things which are removed, but all
> examples I've found are things where the shell failed to remove things
> it could.
>
> There's an additional option to remove orphan siginfo files, which I
> found quite a lot of during testing.
>
> The --extra-archs and --extra-layer options are unimplemented since, as
> far as I could work out, they were really implementation artefacts of
> the existing script - there's a couple of functions I implemented which
> generate this data, but I really couldn't see anywhere I actually needed
> it; these want deleting if this goes beyond RFC.
>
> Similary the --follow-symlink option is unimplemented as that appears to
> an sstate-cache implementation detail which is no longer used.
>
> The couple of TODOs left are all about more parallelisation, I expect
> neither of them is as big a win as parallelising the stat()ing of all
> the paths was (especially when running over NFS).
>
>  scripts/sstate-cache-management.py | 329 +++++++++++++++++++++++++++++
>  1 file changed, 329 insertions(+)
>  create mode 100755 scripts/sstate-cache-management.py
>
> diff --git a/scripts/sstate-cache-management.py
> b/scripts/sstate-cache-management.py
> new file mode 100755
> index 000000000000..3ae3a7fa0515
> --- /dev/null
> +++ b/scripts/sstate-cache-management.py
> @@ -0,0 +1,329 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import argparse
> +import os
> +import re
> +import sys
> +
> +from collections import defaultdict
> +from concurrent.futures import ThreadPoolExecutor
> +from dataclasses import dataclass
> +from pathlib import Path
> +
> +if sys.version_info < (3, 8, 0):
> +    raise RuntimeError("Sorry, python 3.8.0 or later is required for thi=
s
> script.")
> +
> +SSTATE_PREFIX =3D "sstate:"
> +SSTATE_EXTENSION =3D ".tar.zst"
> +# SSTATE_EXTENSION =3D ".tgz"
> +# .siginfo.done files are mentioned in the original script?
> +SSTATE_SUFFIXES =3D (
> +    SSTATE_EXTENSION,
> +    f"{SSTATE_EXTENSION}.siginfo",
> +    f"{SSTATE_EXTENSION}.done",
> +)
> +
> +RE_SSTATE_PKGSPEC =3D re.compile(
> +    rf"""sstate:(?P<pn>[^:]*):
> +         (?P<package_target>[^:]*):
> +         (?P<pv>[^:]*):
> +         (?P<pr>[^:]*):
> +         (?P<sstate_pkgarch>[^:]*):
> +         (?P<sstate_version>[^_]*):
> +         (?P<bb_unihash>[^_]*)_
> +         (?P<bb_task>[^:]*)
> +         (?P<ext>({"|".join([re.escape(s) for s in
> SSTATE_SUFFIXES])}))$""",
> +    re.X,
> +)
> +
> +
> +# Really we'd like something like a Path subclass which implements a sta=
t
> +# cache here, unfortunately there's no good way to do that transparently
> +# (yet); see:
> +#
> +# https://github.com/python/cpython/issues/70219
> +# https://discuss.python.org/t/make-pathlib-extensible/3428/77
> +@dataclass
> +class SstateEntry:
> +    """Class for keeping track of an entry in sstate-cache."""
> +
> +    path: Path
> +    match: re.Match
> +    stat_result: os.stat_result =3D None
> +
> +    def __hash__(self):
> +        return self.path.__hash__()
> +
> +    def __getattr__(self, name):
> +        return self.match.group(name)
> +
> +
> +# this is what's in the original script; as far as I can tell, it's an
> +# implementation artefact which we don't need?
> +def find_archs():
> +    # all_archs
> +    builder_arch =3D os.uname().machine
> +
> +    # FIXME
> +    layer_paths =3D [Path("../..")]
> +
> +    tune_archs =3D set()
> +    re_tune =3D re.compile(r'AVAILTUNES .*=3D.*"(.*)"')
> +    for path in layer_paths:
> +        for tunefile in [
> +            p for p in path.glob("meta*/conf/machine/include/**/*") if
> p.is_file()
> +        ]:
> +            with open(tunefile) as f:
> +                for line in f:
> +                    m =3D re_tune.match(line)
> +                    if m:
> +                        tune_archs.update(m.group(1).split())
> +
> +    # all_machines
> +    machine_archs =3D set()
> +    for path in layer_paths:
> +        for machine_file in path.glob("meta*/conf/machine/*.conf"):
> +            machine_archs.add(machine_file.parts[-1][:-5])
> +
> +    extra_archs =3D set()
> +    all_archs =3D (
> +        set(
> +            arch.replace("-", "_")
> +            for arch in machine_archs | tune_archs | set(["allarch",
> builder_arch])
> +        )
> +        | extra_archs
> +    )
> +
> +    print(all_archs)
> +
> +
> +# again, not needed?
> +def find_tasks():
> +    print(set([p.bb_task for p in paths]))
> +
> +
> +def collect_sstate_paths(args):
> +    def scandir(path, paths):
> +        # Assume everything is a directory; by not checking we avoid
> needing an
> +        # additional stat which is potentially a synchronous roundtrip
> over NFS
> +        try:
> +            for p in path.iterdir():
> +                filename =3D p.parts[-1]
> +                if filename.startswith(SSTATE_PREFIX):
> +                    if filename.endswith(SSTATE_SUFFIXES):
> +                        m =3D RE_SSTATE_PKGSPEC.match(p.parts[-1])
> +                        assert m
> +                        paths.add(SstateEntry(p, m))
> +                    # ignore other things (includes things like lockfile=
s)
> +                else:
> +                    scandir(p, paths)
> +
> +        except NotADirectoryError:
> +            pass
> +
> +    paths =3D set()
> +    # TODO: parellise scandir
> +    scandir(Path(args.cache_dir), paths)
> +
> +    def path_stat(p):
> +        p.stat_result =3D p.path.lstat()
> +
> +    if args.remove_duplicated:
> +        # This is probably slightly performance negative on a local
> filesystem
> +        # when we interact with the GIL; over NFS it's a massive win.
> +        with ThreadPoolExecutor(max_workers=3Dargs.jobs) as executor:
> +            executor.map(path_stat, paths)
> +
> +    return paths
> +
> +
> +def remove_by_stamps(args, paths):
> +    all_sums =3D set()
> +    for stamps_dir in args.stamps_dir:
> +        stamps_path =3D Path(stamps_dir)
> +        assert stamps_path.is_dir()
> +        re_sigdata =3D re.compile(r"do_.*.sigdata\.([^.]*)")
> +        all_sums |=3D set(
> +            [
> +                re_sigdata.search(x.parts[-1]).group(1)
> +                for x in stamps_path.glob("*/*/*.do_*.sigdata.*")
> +            ]
> +        )
> +        re_setscene =3D re.compile(r"do_.*_setscene\.([^.]*)")
> +        all_sums |=3D set(
> +            [
> +                re_setscene.search(x.parts[-1]).group(1)
> +                for x in stamps_path.glob("*/*/*.do_*_setscene.*")
> +            ]
> +        )
> +    return [p for p in paths if p.bb_unihash not in all_sums]
> +
> +
> +def remove_duplicated(args, paths):
> +    # Skip populate_lic as it produces duplicates in a normal build
> +    #
> +    # 9ae16469e707 sstate-cache-management: skip populate_lic archives
> when removing duplicates
> +    valid_paths =3D [p for p in paths if p.bb_task !=3D "populate_lic"]
> +
> +    keep =3D dict()
> +    remove =3D list()
> +    for p in valid_paths:
> +        sstate_sig =3D ":".join([p.pn, p.sstate_pkgarch, p.bb_task, p.ex=
t])
> +        if sstate_sig not in keep:
> +            keep[sstate_sig] =3D p
> +        elif p.stat_result.st_mtime >
> keep[sstate_sig].stat_result.st_mtime:
> +            remove.append(keep[sstate_sig])
> +            keep[sstate_sig] =3D p
> +        else:
> +            remove.append(p)
> +
> +    return remove
> +
> +
> +def remove_orphans(args, paths):
> +    remove =3D list()
> +    pathsigs =3D defaultdict(list)
> +    for p in paths:
> +        sstate_sig =3D ":".join([p.pn, p.sstate_pkgarch, p.bb_task])
> +        pathsigs[sstate_sig].append(p)
> +    for k, v in pathsigs.items():
> +        if len([p for p in v if p.ext =3D=3D SSTATE_EXTENSION]) =3D=3D 0=
:
> +            remove.extend(v)
> +    return remove
> +
> +
> +def parse_arguments():
> +    parser =3D argparse.ArgumentParser(description=3D"sstate cache manag=
ement
> utility.")
> +
> +    parser.add_argument(
> +        "--cache-dir",
> +        default=3Dos.environ.get("SSTATE_CACHE_DIR"),
> +        help=3D"""Specify sstate cache directory, will use the environme=
nt
> +            variable SSTATE_CACHE_DIR if it is not specified.""",
> +    )
> +
> +    # parser.add_argument(
> +    #     "--extra-archs",
> +    #     help=3D"""Specify list of architectures which should be tested=
,
> this list
> +    #         will be extended with native arch, allarch and empty arch.
> The
> +    #         script won't be trying to generate list of available archs
> from
> +    #         AVAILTUNES in tune files.""",
> +    # )
> +
> +    # parser.add_argument(
> +    #     "--extra-layer",
> +    #     help=3D"""Specify the layer which will be used for searching t=
he
> archs,
> +    #         it will search the meta and meta-* layers in the top dir b=
y
> +    #         default, and will search meta, meta-*, <layer1>, <layer2>,
> +    #         ...<layern> when specified. Use "," as the separator.
> +    #
> +    #         This is useless for --stamps-dir or when --extra-archs is
> used.""",
> +    # )
> +
> +    parser.add_argument(
> +        "-d",
> +        "--remove-duplicated",
> +        action=3D"store_true",
> +        help=3D"""Remove the duplicated sstate cache files of one packag=
e,
> only
> +            the newest one will be kept. The duplicated sstate cache fil=
es
> +            of one package must have the same arch, which means sstate
> cache
> +            files with multiple archs are not considered duplicate.
> +
> +            Conflicts with --stamps-dir.""",
> +    )
> +
> +    parser.add_argument(
> +        "--remove-orphans",
> +        action=3D"store_true",
> +        help=3Df"""Remove orphan siginfo files from the sstate cache, i.=
e.
> those
> +            where this is no {SSTATE_EXTENSION} file but there are
> associated
> +            tracking files.""",
> +    )
> +
> +    parser.add_argument(
> +        "--stamps-dir",
> +        action=3D"append",
> +        help=3D"""Specify the build directory's stamps directories, the
> sstate
> +            cache file which IS USED by these build diretories will be
> KEPT,
> +            other sstate cache files in cache-dir will be removed. Can b=
e
> +            specified multiple times for several directories.
> +
> +            Conflicts with --remove-duplicated.""",
> +    )
> +
> +    parser.add_argument(
> +        "-j", "--jobs", default=3D8, type=3Dint, help=3D"Run JOBS jobs i=
n
> parallel."
> +    )
> +
> +    # parser.add_argument(
> +    #     "-L",
> +    #     "--follow-symlink",
> +    #     action=3D"store_true",
> +    #     help=3D"Remove both the symbol link and the destination file,
> default: no.",
> +    # )
> +
> +    parser.add_argument(
> +        "-y",
> +        "--yes",
> +        action=3D"store_true",
> +        help=3D"""Automatic yes to prompts; assume "yes" as answer to al=
l
> prompts
> +            and run non-interactively.""",
> +    )
> +
> +    parser.add_argument(
> +        "-v", "--verbose", action=3D"store_true", help=3D"Explain what i=
s
> being done."
> +    )
> +
> +    parser.add_argument(
> +        "-D",
> +        "--debug",
> +        action=3D"count",
> +        default=3D0,
> +        help=3D"Show debug info, repeat for more debug info.",
> +    )
> +
> +    args =3D parser.parse_args()
> +    if args.cache_dir is None or (
> +        not args.remove_duplicated and not args.stamps_dir and not
> args.remove_orphans
> +    ):
> +        parser.print_usage()
> +        sys.exit(1)
> +
> +    return args
> +
> +
> +def main():
> +    args =3D parse_arguments()
> +
> +    paths =3D collect_sstate_paths(args)
> +    if args.remove_duplicated:
> +        remove =3D remove_duplicated(args, paths)
> +    elif args.stamps_dir:
> +        remove =3D remove_by_stamps(args, paths)
> +    else:
> +        remove =3D list()
> +
> +    if args.remove_orphans:
> +        remove =3D set(remove) | set(remove_orphans(args, paths))
> +
> +    if args.debug >=3D 1:
> +        print("\n".join([str(p.path) for p in remove]))
> +    print(f"{len(remove)} out of {len(paths)} files will be removed!")
> +    if not args.yes:
> +        print("Do you want to continue (y/n)?")
> +        confirm =3D input() in ("y", "Y")
> +    else:
> +        confirm =3D True
> +    if confirm:
> +        # TODO: parallelise remove
> +        for path in remove:
> +            remove.unlink()
> +
> +
> +if __name__ =3D=3D "__main__":
> +    main()
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192883):
> https://lists.openembedded.org/g/openembedded-core/message/192883
> Mute This Topic: https://lists.openembedded.org/mt/103334660/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001e18cd060e6e1e31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I&#39;ve compared<div>openembedded-core/scripts/ssta=
te-cache-management.sh -d --cache-dir=3Dsstate-cache</div><div>with<br><div=
>openembedded-core/scripts/sstate-cache-management.py -d --cache-dir=3Dssta=
te-cache<br></div><div>on some older kirkstone and nanbield build dirs and =
the python version removes _much_ more than the shell version did and it wa=
s indeed significantly faster.</div></div><div><br></div><div>For kirkstone=
 shell version removed from 145G to 125G and triggering python version afte=
r that left only 19G.</div><div>For nanbield shell version removed from 88G=
 to 77G and triggering python version after that left only 11G.</div><div><=
br></div><div>I didn&#39;t check if all those sstate archives should have b=
een removed or whether the new python script is supposed to be compatible w=
ith older releases, I just needed to free some disk space quickly before tr=
iggering new build, so I gave it a try and found the huge difference intere=
sting to share.</div><div><br></div><div>Details from the 4 runs bellow:</d=
iv><div><br></div><div>kirkstone $ du -hs sstate-cache/; openembedded-core/=
scripts/sstate-cache-management.sh -d --cache-dir=3Dsstate-cache; du -hs ss=
tate-cache/<br>145G =C2=A0 =C2=A0sstate-cache/<br>Figuring out the archs in=
 the layers ...<br>Done<br>Figuring out the suffixes in the sstate cache di=
r ...<br>Done<br>The following suffixes have been found in the cache dir:<b=
r>addto_recipe_sysroot bundle_initramfs clean cleansstate compile compile_k=
ernelmodules configure configure_manifest configure_security create_v8_qemu=
_wrapper deploy deploy_source_date_epoch extra_symlinks fetch flush_pseudod=
b gcc_stash_builddir generate_qt_config_file generate_toolchain_file genera=
te_webos_localization image image_debugfs_tar image_ext4 image_tar image_wi=
c install kernel_checkout kernel_configcheck kernel_configme kernel_link_im=
ages kernel_metadata kernel_version_sanity_check locate_enactjs_appinfo mak=
e_icudata mkimage multilib_install package packagedata package_qa package_w=
rite_ipk patch populate_lic populate_sysroot preconfigure prepare_recipe_sy=
sroot recipe_qa rootfs rootfs_wicenv shared_workdir sizecheck stash_locale =
strip symlink_kernsrc transform_kernel unpack validate_branches warn_musl w=
rite_config write_qemuboot_conf<br>Figuring out the archs in the sstate cac=
he dir ...<br>Done<br>The following archs have been found in the cache dir:=
<br>allarch hammerhead_halium qemux86_64 tissot x86_64<br></div><div>...</d=
iv><div>14012 out of 67493 files will be removed!<br></div><div>...</div><d=
iv>14012 files have been removed!<br>125G =C2=A0 =C2=A0sstate-cache/<br></d=
iv><div>kirkstone $ du -hs sstate-cache/; ../scarthgap/openembedded-core/sc=
ripts/sstate-cache-management.py -d --cache-dir=3Dsstate-cache; du -hs ssta=
te-cache/<br>125G =C2=A0 =C2=A0sstate-cache/<br>39927 out of 55994 files wi=
ll be removed!<br>Do you want to continue (y/n)?<br>y<br>19G =C2=A0 =C2=A0 =
sstate-cache/<br></div><div><br></div><div>nanbield $ du -hs sstate-cache/;=
 openembedded-core/scripts/sstate-cache-management.sh -d --cache-dir=3Dssta=
te-cache; du -hs sstate-cache/<br></div><div>88G =C2=A0 =C2=A0 sstate-cache=
/<br>Figuring out the archs in the layers ...<br>Done<br>Figuring out the s=
uffixes in the sstate cache dir ...<br>Done<br>The following suffixes have =
been found in the cache dir:<br>addto_recipe_sysroot bundle_initramfs clean=
 cleansstate compile compile_kernelmodules configure configure_manifest con=
figure_security create_v8_qemu_wrapper deploy deploy_source_date_epoch extr=
a_symlinks fetch flush_pseudodb gcc_stash_builddir generate_native_toolchai=
n_file generate_qt_config_file generate_toolchain_file generate_webos_local=
ization hack_recipe_sysroot image image_ext4 image_tar image_wic install ke=
rnel_checkout kernel_configcheck kernel_configme kernel_link_images kernel_=
metadata kernel_version_sanity_check locate_enactjs_appinfo make_icudata mk=
image multilib_install package package_qa package_write_ipk packagedata pat=
ch populate_lic populate_sysroot preconfigure prepare_recipe_sysroot recipe=
_qa rootfs rootfs_wicenv shared_workdir sizecheck stash_locale strip symlin=
k_kernsrc transform_kernel unpack validate_branches warn_musl write_config =
write_qemuboot_conf<br>Figuring out the archs in the sstate cache dir ...<b=
r>Done<br>The following archs have been found in the cache dir:<br>allarch =
qemux86_64 x86_64<br></div><div>...</div><div>14339 out of 73198 files will=
 be removed!<br></div><div>...</div><div>14339 files have been removed!<br>=
77G =C2=A0 =C2=A0 sstate-cache/<br>nanbield $ du -hs sstate-cache/; ../scar=
thgap/openembedded-core/scripts/sstate-cache-management.py -d --cache-dir=
=3Dsstate-cache; du -hs sstate-cache/<br>77G =C2=A0 =C2=A0 sstate-cache/<br=
>43490 out of 60639 files will be removed!<br>Do you want to continue (y/n)=
?<br>y<br>11G =C2=A0 =C2=A0 sstate-cache/<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 23, 2023 at =
3:25=E2=80=AFPM Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">=
alex.kiernan@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">This (should be) a drop in replacement for sstate-cac=
he-management.sh.<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
This is hopefully an option compatible drop in for the existing shell<br>
sstate-cache-management script. It&#39;s orders of magnitude faster, for<br=
>
example removing duplicates, with a warmed cache across a more or less<br>
vanilla poky build:<br>
<br>
shell: 24.55s<br>
python: 0.63s<br>
<br>
Running on an NFS mount with 1000s of objects the improvement is even<br>
more marked.<br>
<br>
There are differences in the lists of things which are removed, but all<br>
examples I&#39;ve found are things where the shell failed to remove things<=
br>
it could.<br>
<br>
There&#39;s an additional option to remove orphan siginfo files, which I<br=
>
found quite a lot of during testing.<br>
<br>
The --extra-archs and --extra-layer options are unimplemented since, as<br>
far as I could work out, they were really implementation artefacts of<br>
the existing script - there&#39;s a couple of functions I implemented which=
<br>
generate this data, but I really couldn&#39;t see anywhere I actually neede=
d<br>
it; these want deleting if this goes beyond RFC.<br>
<br>
Similary the --follow-symlink option is unimplemented as that appears to<br=
>
an sstate-cache implementation detail which is no longer used.<br>
<br>
The couple of TODOs left are all about more parallelisation, I expect<br>
neither of them is as big a win as parallelising the stat()ing of all<br>
the paths was (especially when running over NFS).<br>
<br>
=C2=A0scripts/sstate-cache-management.py | 329 ++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 329 insertions(+)<br>
=C2=A0create mode 100755 scripts/sstate-cache-management.py<br>
<br>
diff --git a/scripts/sstate-cache-management.py b/scripts/sstate-cache-mana=
gement.py<br>
new file mode 100755<br>
index 000000000000..3ae3a7fa0515<br>
--- /dev/null<br>
+++ b/scripts/sstate-cache-management.py<br>
@@ -0,0 +1,329 @@<br>
+#!/usr/bin/env python3<br>
+#<br>
+# Copyright OpenEmbedded Contributors<br>
+#<br>
+# SPDX-License-Identifier: MIT<br>
+#<br>
+<br>
+import argparse<br>
+import os<br>
+import re<br>
+import sys<br>
+<br>
+from collections import defaultdict<br>
+from concurrent.futures import ThreadPoolExecutor<br>
+from dataclasses import dataclass<br>
+from pathlib import Path<br>
+<br>
+if sys.version_info &lt; (3, 8, 0):<br>
+=C2=A0 =C2=A0 raise RuntimeError(&quot;Sorry, python 3.8.0 or later is req=
uired for this script.&quot;)<br>
+<br>
+SSTATE_PREFIX =3D &quot;sstate:&quot;<br>
+SSTATE_EXTENSION =3D &quot;.tar.zst&quot;<br>
+# SSTATE_EXTENSION =3D &quot;.tgz&quot;<br>
+# .siginfo.done files are mentioned in the original script?<br>
+SSTATE_SUFFIXES =3D (<br>
+=C2=A0 =C2=A0 SSTATE_EXTENSION,<br>
+=C2=A0 =C2=A0 f&quot;{SSTATE_EXTENSION}.siginfo&quot;,<br>
+=C2=A0 =C2=A0 f&quot;{SSTATE_EXTENSION}.done&quot;,<br>
+)<br>
+<br>
+RE_SSTATE_PKGSPEC =3D re.compile(<br>
+=C2=A0 =C2=A0 rf&quot;&quot;&quot;sstate:(?P&lt;pn&gt;[^:]*):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(?P&lt;package_target&gt;[^:]*):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(?P&lt;pv&gt;[^:]*):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(?P&lt;pr&gt;[^:]*):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(?P&lt;sstate_pkgarch&gt;[^:]*):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(?P&lt;sstate_version&gt;[^_]*):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(?P&lt;bb_unihash&gt;[^_]*)_<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(?P&lt;bb_task&gt;[^:]*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(?P&lt;ext&gt;({&quot;|&quot;.join([re.e=
scape(s) for s in SSTATE_SUFFIXES])}))$&quot;&quot;&quot;,<br>
+=C2=A0 =C2=A0 re.X,<br>
+)<br>
+<br>
+<br>
+# Really we&#39;d like something like a Path subclass which implements a s=
tat<br>
+# cache here, unfortunately there&#39;s no good way to do that transparent=
ly<br>
+# (yet); see:<br>
+#<br>
+# <a href=3D"https://github.com/python/cpython/issues/70219" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/python/cpython/issues/70219</a><=
br>
+# <a href=3D"https://discuss.python.org/t/make-pathlib-extensible/3428/77"=
 rel=3D"noreferrer" target=3D"_blank">https://discuss.python.org/t/make-pat=
hlib-extensible/3428/77</a><br>
+@dataclass<br>
+class SstateEntry:<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Class for keeping track of an entry in sst=
ate-cache.&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 path: Path<br>
+=C2=A0 =C2=A0 match: re.Match<br>
+=C2=A0 =C2=A0 stat_result: os.stat_result =3D None<br>
+<br>
+=C2=A0 =C2=A0 def __hash__(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.path.__hash__()<br>
+<br>
+=C2=A0 =C2=A0 def __getattr__(self, name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.match.group(name)<br>
+<br>
+<br>
+# this is what&#39;s in the original script; as far as I can tell, it&#39;=
s an<br>
+# implementation artefact which we don&#39;t need?<br>
+def find_archs():<br>
+=C2=A0 =C2=A0 # all_archs<br>
+=C2=A0 =C2=A0 builder_arch =3D os.uname().machine<br>
+<br>
+=C2=A0 =C2=A0 # FIXME<br>
+=C2=A0 =C2=A0 layer_paths =3D [Path(&quot;../..&quot;)]<br>
+<br>
+=C2=A0 =C2=A0 tune_archs =3D set()<br>
+=C2=A0 =C2=A0 re_tune =3D re.compile(r&#39;AVAILTUNES .*=3D.*&quot;(.*)&qu=
ot;&#39;)<br>
+=C2=A0 =C2=A0 for path in layer_paths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for tunefile in [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p for p in path.glob(&quot;meta*=
/conf/machine/include/**/*&quot;) if p.is_file()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(tunefile) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =
=3D re_tune.match(line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tune_archs.update(m.group(1).split())<br>
+<br>
+=C2=A0 =C2=A0 # all_machines<br>
+=C2=A0 =C2=A0 machine_archs =3D set()<br>
+=C2=A0 =C2=A0 for path in layer_paths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for machine_file in path.glob(&quot;meta*/conf=
/machine/*.conf&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 machine_archs.add(machine_file.p=
arts[-1][:-5])<br>
+<br>
+=C2=A0 =C2=A0 extra_archs =3D set()<br>
+=C2=A0 =C2=A0 all_archs =3D (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch.replace(&quot;-&quot;, &quo=
t;_&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for arch in machine_archs | tune=
_archs | set([&quot;allarch&quot;, builder_arch])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 | extra_archs<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 print(all_archs)<br>
+<br>
+<br>
+# again, not needed?<br>
+def find_tasks():<br>
+=C2=A0 =C2=A0 print(set([p.bb_task for p in paths]))<br>
+<br>
+<br>
+def collect_sstate_paths(args):<br>
+=C2=A0 =C2=A0 def scandir(path, paths):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Assume everything is a directory; by not che=
cking we avoid needing an<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # additional stat which is potentially a synch=
ronous roundtrip over NFS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for p in path.iterdir():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D p.par=
ts[-1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if filename.starts=
with(SSTATE_PREFIX):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if f=
ilename.endswith(SSTATE_SUFFIXES):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 m =3D RE_SSTATE_PKGSPEC.match(p.parts[-1])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 assert m<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 paths.add(SstateEntry(p, m))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # ig=
nore other things (includes things like lockfiles)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scan=
dir(p, paths)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except NotADirectoryError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
+=C2=A0 =C2=A0 paths =3D set()<br>
+=C2=A0 =C2=A0 # TODO: parellise scandir<br>
+=C2=A0 =C2=A0 scandir(Path(args.cache_dir), paths)<br>
+<br>
+=C2=A0 =C2=A0 def path_stat(p):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p.stat_result =3D p.path.lstat()<br>
+<br>
+=C2=A0 =C2=A0 if args.remove_duplicated:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This is probably slightly performance negati=
ve on a local filesystem<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # when we interact with the GIL; over NFS it&#=
39;s a massive win.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with ThreadPoolExecutor(max_workers=3D<a href=
=3D"http://args.jobs" rel=3D"noreferrer" target=3D"_blank">args.jobs</a>) a=
s executor:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 executor.map(path_stat, paths)<b=
r>
+<br>
+=C2=A0 =C2=A0 return paths<br>
+<br>
+<br>
+def remove_by_stamps(args, paths):<br>
+=C2=A0 =C2=A0 all_sums =3D set()<br>
+=C2=A0 =C2=A0 for stamps_dir in args.stamps_dir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stamps_path =3D Path(stamps_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert stamps_path.is_dir()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 re_sigdata =3D re.compile(r&quot;do_.*.sigdata=
\.([^.]*)&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 all_sums |=3D set(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re_sigdata.search(=
x.parts[-1]).group(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for x in stamps_pa=
th.glob(&quot;*/*/*.do_*.sigdata.*&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 re_setscene =3D re.compile(r&quot;do_.*_setsce=
ne\.([^.]*)&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 all_sums |=3D set(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re_setscene.search=
(x.parts[-1]).group(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for x in stamps_pa=
th.glob(&quot;*/*/*.do_*_setscene.*&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 return [p for p in paths if p.bb_unihash not in all_sums]<br=
>
+<br>
+<br>
+def remove_duplicated(args, paths):<br>
+=C2=A0 =C2=A0 # Skip populate_lic as it produces duplicates in a normal bu=
ild<br>
+=C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 # 9ae16469e707 sstate-cache-management: skip populate_lic ar=
chives when removing duplicates<br>
+=C2=A0 =C2=A0 valid_paths =3D [p for p in paths if p.bb_task !=3D &quot;po=
pulate_lic&quot;]<br>
+<br>
+=C2=A0 =C2=A0 keep =3D dict()<br>
+=C2=A0 =C2=A0 remove =3D list()<br>
+=C2=A0 =C2=A0 for p in valid_paths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sstate_sig =3D &quot;:&quot;.join([<a href=3D"=
http://p.pn" rel=3D"noreferrer" target=3D"_blank">p.pn</a>, p.sstate_pkgarc=
h, p.bb_task, p.ext])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if sstate_sig not in keep:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 keep[sstate_sig] =3D p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif p.stat_result.st_mtime &gt; keep[sstate_s=
ig].stat_result.st_mtime:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remove.append(keep[sstate_sig])<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 keep[sstate_sig] =3D p<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remove.append(p)<br>
+<br>
+=C2=A0 =C2=A0 return remove<br>
+<br>
+<br>
+def remove_orphans(args, paths):<br>
+=C2=A0 =C2=A0 remove =3D list()<br>
+=C2=A0 =C2=A0 pathsigs =3D defaultdict(list)<br>
+=C2=A0 =C2=A0 for p in paths:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sstate_sig =3D &quot;:&quot;.join([<a href=3D"=
http://p.pn" rel=3D"noreferrer" target=3D"_blank">p.pn</a>, p.sstate_pkgarc=
h, p.bb_task])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pathsigs[sstate_sig].append(p)<br>
+=C2=A0 =C2=A0 for k, v in pathsigs.items():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len([p for p in v if p.ext =3D=3D SSTATE_EX=
TENSION]) =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remove.extend(v)<br>
+=C2=A0 =C2=A0 return remove<br>
+<br>
+<br>
+def parse_arguments():<br>
+=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(description=3D&quot;sstat=
e cache management utility.&quot;)<br>
+<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--cache-dir&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default=3Dos.environ.get(&quot;SSTATE_CACHE_DI=
R&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;&quot;&quot;Specify sstate cache =
directory, will use the environment<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variable SSTATE_CACHE_DIR if it =
is not specified.&quot;&quot;&quot;,<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 # parser.add_argument(<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;--extra-archs&quot;,<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0help=3D&quot;&quot;&quot;Specify list o=
f architectures which should be tested, this list<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be extended with nat=
ive arch, allarch and empty arch. The<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0script won&#39;t be tryin=
g to generate list of available archs from<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AVAILTUNES in tune files.=
&quot;&quot;&quot;,<br>
+=C2=A0 =C2=A0 # )<br>
+<br>
+=C2=A0 =C2=A0 # parser.add_argument(<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;--extra-layer&quot;,<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0help=3D&quot;&quot;&quot;Specify the la=
yer which will be used for searching the archs,<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0it will search the meta a=
nd meta-* layers in the top dir by<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default, and will search =
meta, meta-*, &lt;layer1&gt;, &lt;layer2&gt;,<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...&lt;layern&gt; when sp=
ecified. Use &quot;,&quot; as the separator.<br>
+=C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is useless for --sta=
mps-dir or when --extra-archs is used.&quot;&quot;&quot;,<br>
+=C2=A0 =C2=A0 # )<br>
+<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--remove-duplicated&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&quot;store_true&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;&quot;&quot;Remove the duplicated=
 sstate cache files of one package, only<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the newest one will be kept. The=
 duplicated sstate cache files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of one package must have the sam=
e arch, which means sstate cache<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files with multiple archs are no=
t considered duplicate.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Conflicts with --stamps-dir.&quo=
t;&quot;&quot;,<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--remove-orphans&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&quot;store_true&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3Df&quot;&quot;&quot;Remove orphan siginf=
o files from the sstate cache, i.e. those<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 where this is no {SSTATE_EXTENSI=
ON} file but there are associated<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tracking files.&quot;&quot;&quot=
;,<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--stamps-dir&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&quot;append&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;&quot;&quot;Specify the build dir=
ectory&#39;s stamps directories, the sstate<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache file which IS USED by thes=
e build diretories will be KEPT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 other sstate cache files in cach=
e-dir will be removed. Can be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 specified multiple times for sev=
eral directories.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Conflicts with --remove-duplicat=
ed.&quot;&quot;&quot;,<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-j&quot;, &quot;--jobs&quot;, default=3D=
8, type=3Dint, help=3D&quot;Run JOBS jobs in parallel.&quot;<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 # parser.add_argument(<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;-L&quot;,<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0&quot;--follow-symlink&quot;,<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0action=3D&quot;store_true&quot;,<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0help=3D&quot;Remove both the symbol lin=
k and the destination file, default: no.&quot;,<br>
+=C2=A0 =C2=A0 # )<br>
+<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-y&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--yes&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&quot;store_true&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;&quot;&quot;Automatic yes to prom=
pts; assume &quot;yes&quot; as answer to all prompts<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and run non-interactively.&quot;=
&quot;&quot;,<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-v&quot;, &quot;--verbose&quot;, action=
=3D&quot;store_true&quot;, help=3D&quot;Explain what is being done.&quot;<b=
r>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 parser.add_argument(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-D&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--debug&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&quot;count&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default=3D0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;Show debug info, repeat for more =
debug info.&quot;,<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
+=C2=A0 =C2=A0 if args.cache_dir is None or (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 not args.remove_duplicated and not args.stamps=
_dir and not args.remove_orphans<br>
+=C2=A0 =C2=A0 ):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parser.print_usage()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(1)<br>
+<br>
+=C2=A0 =C2=A0 return args<br>
+<br>
+<br>
+def main():<br>
+=C2=A0 =C2=A0 args =3D parse_arguments()<br>
+<br>
+=C2=A0 =C2=A0 paths =3D collect_sstate_paths(args)<br>
+=C2=A0 =C2=A0 if args.remove_duplicated:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remove =3D remove_duplicated(args, paths)<br>
+=C2=A0 =C2=A0 elif args.stamps_dir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remove =3D remove_by_stamps(args, paths)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remove =3D list()<br>
+<br>
+=C2=A0 =C2=A0 if args.remove_orphans:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remove =3D set(remove) | set(remove_orphans(ar=
gs, paths))<br>
+<br>
+=C2=A0 =C2=A0 if args.debug &gt;=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;\n&quot;.join([str(p.path) for p i=
n remove]))<br>
+=C2=A0 =C2=A0 print(f&quot;{len(remove)} out of {len(paths)} files will be=
 removed!&quot;)<br>
+=C2=A0 =C2=A0 if not args.yes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Do you want to continue (y/n)?&quo=
t;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 confirm =3D input() in (&quot;y&quot;, &quot;Y=
&quot;)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 confirm =3D True<br>
+=C2=A0 =C2=A0 if confirm:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: parallelise remove<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for path in remove:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remove.unlink()<br>
+<br>
+<br>
+if __name__ =3D=3D &quot;__main__&quot;:<br>
+=C2=A0 =C2=A0 main()<br>
-- <br>
2.39.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192883): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192883" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192883</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103334660/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103334660/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001e18cd060e6e1e31--

