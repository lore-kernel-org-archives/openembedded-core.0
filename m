Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19BCCFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 13:31:16 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14609.1764423073430288487
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 05:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+6ARuwv;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-880570bdef8so29085216d6.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 05:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764423072; x=1765027872; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Awedhfa2wMlqjuq4Rf4vytMbn1PbsPbDISULJumy0PE=;
        b=D+6ARuwvzqEr8VUk2KS5iRHmbaEtJKQT/kQ6mjdfxfnDkCnA2vLVkse+cfQdEJvNo8
         5iLymgtI5EGeedH+siQ9wpSVMHREkEMns++brJvRIb0SN7mTwQkzorT9NKdNVM1qMmoG
         ggKynUukCfVSt0pXp3wW095mWU/pHQJP875WYN7cdpXMaC+5/t3A70IAllq8LdwYjZ/q
         YzXU4Blc+JmyAkF5xGNpi6JTUoFSvzH1tYkElgcn8rQ7vzvDBB84MSR3bEeg0ZZ4jE92
         BDne2vZnydgYshTrfCAHSUyrPMDVKKKENXQWjRaSXq296R8Kv3WPexitkM4lPbwzuRQv
         w+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764423072; x=1765027872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awedhfa2wMlqjuq4Rf4vytMbn1PbsPbDISULJumy0PE=;
        b=H3CflIoOl5i1uh76d3alg+2Gz8qlm57fJ5HWe9kJttW2yxC4CD6Y0CR8WvYtLnnDYv
         grcr9viH7k2+fp3Py6aS5dBsDIMwqfNXsFJTDrZfTyCOGfebLxax5ItXzh9N15E856Gr
         zzSVq4XxXZY0ho2f0xWxCCmyaJ1tlL/wGck3mBvSjWKi4RZ/LYnVhkC7LmOukQvoDERw
         +jePZKydpai9ho3bReaORXxbCGVmmX2RMrK57/sHOt0VfcxcD102S2soXdR+HEb25ckG
         HoKhVf+DDP2Q4fElvVTGFavifbegzWys7IzzDvwAWqxBsUBR9KsD8K1twdRNa9EtlRtF
         H4+A==
X-Gm-Message-State: AOJu0Yzf+cTXYGQanxP7QAtVYjbqqvVSdJfW0XB5nbNx0pbM0Cx7vF1x
	3+XfLyc/ki/D/ACMikq9Oyf/aVGX4P0T4nbWcCIr+RAnCg4mzQ9OfXP+xe3eLlcLEi595yCrFAc
	wubMPSiVI+e3YOwN4D5zoRukJ3XWREu+7pA==
X-Gm-Gg: ASbGnct9F1a3CR+CAett+0LDFQZcrst75hURuNU0VcNSkQ5wl1wyiHAw12AAhhkRCBq
	SFCKF7UFT9mF2CV8rzdddotGU0yuG+QzODTPzhr4ZJyEZ2YVCjFJ1PQPC+edEY2jpvUEWNt4lfx
	jCY1BKcQkt+Qu/uYNWnlm3VLjegj4OmwVsgvGFUCbFoGXNEHCYuEsjkqUKMfamaZ4kif8ZjXW/D
	TKr53M5XpqTspHLDwp/gGYF5LW0SFEQQxySkdHqwZEDWNxWu0MRKo1ZFC8/UcPF7dj21etgBLuI
	mrEBaG6oqQtQZO7ytsyuE9YOF6zRhKjSmUTs7qlD
X-Google-Smtp-Source: AGHT+IHupzgcg+uLznRIOds1RU8LVefb8yXPnM8EjxTxWrNkujToOvoemnV4Vglk9DeiC7WDq4lgHlI8mdFLEirXjnY=
X-Received: by 2002:a05:6214:29e8:b0:880:4d78:89ea with SMTP id
 6a1803df08f44-8863aff42d2mr306116736d6.60.1764423072233; Sat, 29 Nov 2025
 05:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20251128061521.3934350-1-Qi.Chen@windriver.com>
In-Reply-To: <20251128061521.3934350-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Nov 2025 14:31:01 +0100
X-Gm-Features: AWmQ_bkaO1jjJHniuGss054q4ebWc-Y9AdrADfjlcaP-jOEr74X6hNnCeoXQnO8
Message-ID: <CANNYZj_BtEWrFR+gg_eexOeG3hOfO0tStQhe18G_z_Bd3np2Vg@mail.gmail.com>
Subject: Re: [OE-core][RESEND][PATCH] package_manager/oe-pkgdata-util: fix
 complementary package installation
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 13:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226936

I've been dreading having to meaningfully review this because it
requires figuring out the substantial changes in code behavior that
are obscured by all the indentation changes. And I suspect, I'm not
the only one.

So this needs to be split up, such that the part that takes away a
huge chunk, and then re-adds it with a different indentation and
behavior changes is eliminated altogether or kept to an absolute
minimum. The way to do this is to place the code in a function (or
better, several short, simple functions) first, with no functional
changes, and only then start modifying it, such that the modifications
are visible in a diff directly. It's a good refactor anyway: such
long, deeply nested blocks are a maintenance problem in the first
place.

Alex

On Fri, 28 Nov 2025 at 07:16, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> We currently have a problem regarding complementary package installation,
> that is, if 'oe-pkgdata-util glob' maps out packages that are not in
> the oe-rootfs-repo, we will get error like below:
>
>   No match for argument: lib32-glibc-locale-en-gb
>   Error: Unable to find a match: lib32-glibc-locale-en-gb
>
> Here are the steps to reproduce the issue:
> 1. Add the following lines to local.conf:
>    require conf/multilib.conf
>    MULTILIBS ?= "multilib:lib32"
>    DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"
>    IMAGE_INSTALL:append = " lib32-sysstat"
> 2. bitbake lib32-glibc-locale && bitbake core-image-full-cmdline
>
> This problem appears because:
> 1) At do_rootfs time, we first contruct a repo with a filtering
>    mechanism to ensure we don't pull in unneeded packages.[1]
> 2) oe-pkgdata-util uses the pkgdata without filtering.
>
> In order to avoid any hardcoding that might grow in the future[2], we need
> to give 'oe-pkgdata-util glob' some filtering ability.
>
> So this patch does the following things:
> 1) Add a new option, '-a/--allpkgs', to 'oe-pkgdata-util glob'.
>    This gives it a filtering mechanism. As it's an option, people who use
>    'oe-pkgdata-util glob' command could use it as before.
> 2) Add to package_manager 'list_all' function implementations which
>    list all available functions in our filtered repo.
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=85e72e129362db896b0d368077033e4a2e373cf9
> [2] https://lists.openembedded.org/g/openembedded-core/message/221449
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oe/package_manager/__init__.py     | 78 ++++++++++++---------
>  meta/lib/oe/package_manager/deb/__init__.py | 26 +++++++
>  meta/lib/oe/package_manager/ipk/__init__.py | 20 ++++++
>  meta/lib/oe/package_manager/rpm/__init__.py |  8 +++
>  scripts/oe-pkgdata-util                     | 14 ++++
>  5 files changed, 111 insertions(+), 35 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
> index 88bc5ab195..b9a4218939 100644
> --- a/meta/lib/oe/package_manager/__init__.py
> +++ b/meta/lib/oe/package_manager/__init__.py
> @@ -32,7 +32,7 @@ def create_index(arg):
>
>  def opkg_query(cmd_output):
>      """
> -    This method parse the output from the package managerand return
> +    This method parse the output from the package manager and return
>      a dictionary with the information of the packages. This is used
>      when the packages are in deb or ipk format.
>      """
> @@ -369,40 +369,48 @@ class PackageManager(object, metaclass=ABCMeta):
>          if globs:
>              # we need to write the list of installed packages to a file because the
>              # oe-pkgdata-util reads it from a file
> -            with tempfile.NamedTemporaryFile(mode="w+", prefix="installed-pkgs") as installed_pkgs:
> -                pkgs = self.list_installed()
> -
> -                provided_pkgs = set()
> -                for pkg in pkgs.values():
> -                    provided_pkgs |= set(pkg.get('provs', []))
> -
> -                output = oe.utils.format_pkg_list(pkgs, "arch")
> -                installed_pkgs.write(output)
> -                installed_pkgs.flush()
> -
> -                cmd = ["oe-pkgdata-util",
> -                    "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs.name,
> -                    globs]
> -                exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
> -                if exclude:
> -                    cmd.extend(['--exclude=' + '|'.join(exclude.split())])
> -                try:
> -                    bb.note('Running %s' % cmd)
> -                    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> -                    stdout, stderr = proc.communicate()
> -                    if stderr: bb.note(stderr.decode("utf-8"))
> -                    complementary_pkgs = stdout.decode("utf-8")
> -                    complementary_pkgs = set(complementary_pkgs.split())
> -                    skip_pkgs = sorted(complementary_pkgs & provided_pkgs)
> -                    install_pkgs = sorted(complementary_pkgs - provided_pkgs)
> -                    bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
> -                        ' '.join(install_pkgs),
> -                        ' '.join(skip_pkgs)))
> -                    self.install(install_pkgs, hard_depends_only=True)
> -                except subprocess.CalledProcessError as e:
> -                    bb.fatal("Could not compute complementary packages list. Command "
> -                            "'%s' returned %d:\n%s" %
> -                            (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
> +            with tempfile.NamedTemporaryFile(mode="w+", prefix="all-pkgs") as all_pkgs:
> +                with tempfile.NamedTemporaryFile(mode="w+", prefix="installed-pkgs") as installed_pkgs:
> +                    pkgs = self.list_installed()
> +
> +                    provided_pkgs = set()
> +                    for pkg in pkgs.values():
> +                        provided_pkgs |= set(pkg.get('provs', []))
> +
> +                    output = oe.utils.format_pkg_list(pkgs, "arch")
> +                    installed_pkgs.write(output)
> +                    installed_pkgs.flush()
> +
> +                    cmd = ["oe-pkgdata-util",
> +                           "-p", self.d.getVar('PKGDATA_DIR'), "glob",
> +                           installed_pkgs.name, globs]
> +
> +                    if hasattr(self, "list_all"):
> +                        output_allpkg = self.list_all()
> +                        all_pkgs.write(output_allpkg)
> +                        all_pkgs.flush()
> +                        cmd.extend(["--allpkgs=%s" % all_pkgs.name])
> +
> +                    exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
> +                    if exclude:
> +                        cmd.extend(['--exclude=' + '|'.join(exclude.split())])
> +                    try:
> +                        bb.note('Running %s' % cmd)
> +                        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +                        stdout, stderr = proc.communicate()
> +                        if stderr: bb.note(stderr.decode("utf-8"))
> +                        complementary_pkgs = stdout.decode("utf-8")
> +                        complementary_pkgs = set(complementary_pkgs.split())
> +                        skip_pkgs = sorted(complementary_pkgs & provided_pkgs)
> +                        install_pkgs = sorted(complementary_pkgs - provided_pkgs)
> +                        bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
> +                            ' '.join(install_pkgs),
> +                            ' '.join(skip_pkgs)))
> +                        self.install(install_pkgs, hard_depends_only=True)
> +                    except subprocess.CalledProcessError as e:
> +                        bb.fatal("Could not compute complementary packages list. Command "
> +                                "'%s' returned %d:\n%s" %
> +                                (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
>
>          if self.d.getVar('IMAGE_LOCALES_ARCHIVE') == '1':
>              target_arch = self.d.getVar('TARGET_ARCH')
> diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
> index eb48f3f982..0f74e1322f 100644
> --- a/meta/lib/oe/package_manager/deb/__init__.py
> +++ b/meta/lib/oe/package_manager/deb/__init__.py
> @@ -112,6 +112,29 @@ class PMPkgsList(PkgsList):
>
>          return opkg_query(cmd_output)
>
> +    def list_all_pkgs(self, apt_conf_file=None):
> +        if not apt_conf_file:
> +            apt_conf_file = self.d.expand("${APTCONF_TARGET}/apt/apt.conf")
> +        os.environ['APT_CONFIG'] = apt_conf_file
> +
> +        cmd = [bb.utils.which(os.getenv('PATH'), "apt"), "list"]
> +
> +        try:
> +            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
> +        except subprocess.CalledProcessError as e:
> +            bb.fatal("Cannot get the all packages list. Command '%s' "
> +                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
> +
> +        all_pkgs_lines = []
> +        for line in cmd_output.splitlines():
> +            line_parts = line.split()
> +            # the valid lines takes the format of something like "findutils-locale-ga/unknown 4.10.0-r0 amd64"
> +            if len(line_parts) != 3:
> +                continue
> +            line_parts[0] = line_parts[0].split('/')[0]
> +            new_line = ' '.join(line_parts)
> +            all_pkgs_lines.append(new_line)
> +        return "\n".join(all_pkgs_lines)
>
>  class DpkgPM(OpkgDpkgPM):
>      def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None, deb_repo_workdir="oe-rootfs-repo", filterbydependencies=True):
> @@ -436,6 +459,9 @@ class DpkgPM(OpkgDpkgPM):
>      def list_installed(self):
>          return PMPkgsList(self.d, self.target_rootfs).list_pkgs()
>
> +    def list_all(self):
> +        return PMPkgsList(self.d, self.target_rootfs).list_all_pkgs(apt_conf_file=self.apt_conf_file)
> +
>      def package_info(self, pkg):
>          """
>          Returns a dictionary with the package info.
> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> index 4794f31f88..2f330ec4f0 100644
> --- a/meta/lib/oe/package_manager/ipk/__init__.py
> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> @@ -90,6 +90,23 @@ class PMPkgsList(PkgsList):
>
>          return opkg_query(cmd_output)
>
> +    def list_all_pkgs(self, format=None):
> +        cmd = "%s %s list" % (self.opkg_cmd, self.opkg_args)
> +
> +        # opkg returns success even when it printed some
> +        # "Collected errors:" report to stderr. Mixing stderr into
> +        # stdout then leads to random failures later on when
> +        # parsing the output. To avoid this we need to collect both
> +        # output streams separately and check for empty stderr.
> +        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
> +        cmd_output, cmd_stderr = p.communicate()
> +        cmd_output = cmd_output.decode("utf-8")
> +        cmd_stderr = cmd_stderr.decode("utf-8")
> +        if p.returncode or cmd_stderr:
> +            bb.fatal("Cannot get all packages list. Command '%s' "
> +                     "returned %d and stderr:\n%s" % (cmd, p.returncode, cmd_stderr))
> +
> +        return cmd_output
>
>  class OpkgPM(OpkgDpkgPM):
>      def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True, prepare_index=True):
> @@ -364,6 +381,9 @@ class OpkgPM(OpkgDpkgPM):
>      def list_installed(self):
>          return PMPkgsList(self.d, self.target_rootfs).list_pkgs()
>
> +    def list_all(self):
> +        return PMPkgsList(self.d, self.target_rootfs).list_all_pkgs()
> +
>      def dummy_install(self, pkgs):
>          """
>          The following function dummy installs pkgs and returns the log of output.
> diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
> index 20e6cb8744..a51057650a 100644
> --- a/meta/lib/oe/package_manager/rpm/__init__.py
> +++ b/meta/lib/oe/package_manager/rpm/__init__.py
> @@ -275,6 +275,14 @@ class RpmPM(PackageManager):
>                  elif os.path.isfile(source_dir):
>                      shutil.copy2(source_dir, target_dir)
>
> +    def list_all(self):
> +        output = self._invoke_dnf(["repoquery", "--all", "--queryformat", "Packages: %{name} %{arch} %{version}"], print_output = False)
> +        all_pkgs_lines = []
> +        for line in output.splitlines():
> +            if line.startswith("Packages: "):
> +                all_pkgs_lines.append(line.replace("Packages: ", ""))
> +        return "\n".join(all_pkgs_lines)
> +
>      def list_installed(self):
>          output = self._invoke_dnf(["repoquery", "--installed", "--queryformat", "Package: %{name} %{arch} %{version} %{name}-%{version}-%{release}.%{arch}.rpm\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nDependenciesEndHere:\n"],
>                                    print_output = False)
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 44ae40549a..5b7cd768a4 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -51,6 +51,15 @@ def glob(args):
>
>      skippedpkgs = set()
>      mappedpkgs = set()
> +    allpkgs = set()
> +    if args.allpkgs:
> +        with open(args.allpkgs, 'r') as f:
> +            for line in f:
> +                fields = line.rstrip().split()
> +                if not fields:
> +                    continue
> +                else:
> +                    allpkgs.add(fields[0])
>      with open(args.pkglistfile, 'r') as f:
>          for line in f:
>              fields = line.rstrip().split()
> @@ -136,6 +145,10 @@ def glob(args):
>                          logger.debug("%s is not a valid package!" % (pkg))
>                          break
>
> +                if args.allpkgs:
> +                    if mappedpkg not in allpkgs:
> +                        continue
> +
>                  if mappedpkg:
>                      logger.debug("%s (%s) -> %s" % (pkg, g, mappedpkg))
>                      mappedpkgs.add(mappedpkg)
> @@ -592,6 +605,7 @@ def main():
>      parser_glob.add_argument('pkglistfile', help='File listing packages (one package name per line)')
>      parser_glob.add_argument('glob', nargs="+", help='Glob expression for package names, e.g. *-dev')
>      parser_glob.add_argument('-x', '--exclude', help='Exclude packages matching specified regex from the glob operation')
> +    parser_glob.add_argument('-a', '--allpkgs', help='File listing all available packages (one package name per line)')
>      parser_glob.set_defaults(func=glob)
>
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226883): https://lists.openembedded.org/g/openembedded-core/message/226883
> Mute This Topic: https://lists.openembedded.org/mt/116510338/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

