Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C59C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 14:24:31 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.55043.1699280665785292517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 06:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NvG5+u4l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5094cb3a036so5505182e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 06:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699280664; x=1699885464; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gPSqcL60hr+Q+NVvEVemdhjqxt9nL/QOUP0g6EUrV14=;
        b=NvG5+u4lXmqdMjUso3H5mN5x+o8kRnyxKCIBSEs315rDn8iQWWmLln0apWpjAAHFxK
         u9ar9hkuCR35P4PITrq7F1fFIqlB86B5jKL3VYUa2vOXSPeXfWM2jT/Lb+tkNHHSCk9k
         +Mx7h46ZPdjrvApCay3HdwoXQRTQZeb5ipMz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699280664; x=1699885464;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPSqcL60hr+Q+NVvEVemdhjqxt9nL/QOUP0g6EUrV14=;
        b=qek4pfsjcO74wWHmtJVf/jVDbd62/eDd3tIfhWCpNLW2l+Jaii/3tnVzbrYrKU46Lx
         UyU90A1kHPcFdUGAe2m7WIpc+YG7Iwa0KhLCFuBH5q96EvXL0cCA0j/G+QwPpSVLM7oa
         OI5plbTBEKh8dyePwhEn98cpCYrrv+9fdsAN3LIa2CyKrwV+QuYabZFqxXlkt2qEGqMK
         tNlYqVdLqEvUCgsMSee0fsB3Gox3Lb3zZdSN7Qp7yxdcu4hak7OjZBDAujqbqww3f+Pi
         QU3RmXjY6z/Tgf9JWi/bwxnBWPR49vtSytGxmJt8yYaXq6fznRj+KBtxRB2nL6otgoEu
         27fg==
X-Gm-Message-State: AOJu0Yz2vIeD0XAHFPlj8pz+DDLW3NCuiXyDopTg99pSWMRlygVTDv3j
	zXK2Uuteb1ZTDNLUHdNkm9Xm2A==
X-Google-Smtp-Source: AGHT+IHLamJnqZyp9MEyujMoTqoenil5qhIhx2FbcTISQhTN3QWC7GlZf/xhwgnNNVQqFCsWFYCyQw==
X-Received: by 2002:a19:f80b:0:b0:509:44b4:f4d9 with SMTP id a11-20020a19f80b000000b0050944b4f4d9mr9870544lff.19.1699280663701;
        Mon, 06 Nov 2023 06:24:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id o29-20020a05600c511d00b004083996dad8sm12449876wms.18.2023.11.06.06.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 06:24:23 -0800 (PST)
Message-ID: <0d980031e13375a78227a7143a1b2c32f14a5d18.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 6/8] devtool: new ide plugin
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Mon, 06 Nov 2023 14:24:22 +0000
In-Reply-To: <20231101110129.647878-7-adrian.freihofer@siemens.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-7-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 14:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190220

On Wed, 2023-11-01 at 12:01 +0100, Adrian Freihofer wrote:
> The new devtool ide plugin configures an IDE to work with the eSDK.
>=20
> With this initial implementation VSCode is the default IDE.
> The plugin works for recipes inheriting the cmake or the meson bbclass.
> Support for more programming languages and build tools may be added in
> the future.
>=20
> Using the plugin in recipe modes:
> $ devtool modify a-recipe
> $ devtool ide a-recipe a-image
> $ code "$BUILDDIR/workspace/sources/a-recipe"
> Work in VSCode, after installing the proposed plugins
>=20
> Using the plugin without a recipe
> $ devtool ide none a-image
> vscode where/the/sources/are
> Use the cross tool-chain which is provided as a cmake-kit.

Firstly, we should think carefully about the namespace. "ide" is in
this patch and I've heard talk about "esdk" elsewhere.

The plugin makes some assumptions since it is effectively behaving more
like an SDK than a full build environment. I did wonder if "ide-sdk"
might be the most appropriate?

Somehow we need to ensure users to be aware this uses a single shared
sysroot which is quite different to a specific single recipe
environment.

> The goal of this implementation is to create a configuration for VSCode
> (or other IDEs) that allows to work on the code of a recipe completely
> independent from bitbake. bitbake is only called if the configuration or
> the whole SDK has to be regenerated. But bitbake should not need to be
> called while working in the IDE. This has two major advantages over
> calling devtool build from the IDE:
> - The IDE provides plugins for integration with cmake, for example.
>   These features are usable, which would not be the case if bitbake or
>   devtool are called from within the IDE.
> - It is much faster.
>=20
> Many thanks to Enguerrand de Ribaucourt for testing and bug fixing.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

The main thing worrying me about this plugin/code is the code
effectively copying and emulating bitbake:


> +    def gen_fakeroot_install_script(self):
> +        """Generate a helper script to execute make install with pseudo
> +
> +        For the deployment to the target device the do_install task must=
 be
> +        executed out of the IDE as well. This function generates a scrip=
t which
> +        runs the run.do_install script from bitbake under pseudo so that=
 it picks
> +        up the appropriate file permissions. If the intent is to keep fo=
rking off bits of code which are too slow. Generating a self-contained scri=
pt
> +        is much quicker than calling bitbake or devtool build from an ID=
E.
> +        """
> +        cmd_lines =3D ['#!/bin/sh']
> +        # Ensure the do compile step gets always executed without pseuso=
 before do install
> +        # Running do_compile always without pseudo is probably better th=
an trying to have
> +        # all the paths referred by compiling added to PSEUDO_IGNORE_PAT=
HS.
> +        if self.cmd_compile:
> +            cmd_compile =3D "( cd %s && %s)" % (
> +                self.real_srctree, self.cmd_compile)
> +            cmd_lines.append(cmd_compile)
> +        if not os.access(self.fakerootcmd, os.X_OK):
> +            raise DevtoolError(
> +                "pseudo executable %s could not be found" % self.fakeroo=
tcmd)
> +        run_do_install =3D os.path.join(self.workdir, 'temp', 'run.do_in=
stall')
> +
> +        if not os.access(run_do_install, os.X_OK):
> +            raise DevtoolError(
> +                "run script does not exists: %s" % run_do_install)
> +
> +        # Set up the appropriate environment
> +        newenv =3D dict(os.environ)
> +        for varvalue in self.fakerootenv.split():
> +            if '=3D' in varvalue:
> +                splitval =3D varvalue.split('=3D', 1)
> +                newenv[splitval[0]] =3D splitval[1]
> +
> +        # Replicate the environment variables from bitbake
> +        for var, val in newenv.items():
> +            cmd_lines.append('export %s=3D"%s"' % (var, val))
> +
> +        # Setup the task environment as bitbake would do it based on the=
 varFlags
> +        for d in self.f_do_install_cleandirs:
> +            cmd_lines.append('%s rm -rf %s' % (self.fakerootcmd, d))
> +        for d in self.f_do_install_dirs:
> +            cmd_lines.append('%s mkdir -p %s' % (self.fakerootcmd, d))
> +        if len(self.f_do_install_dirs) > 0:
> +            cmd =3D "cd %s" % self.f_do_install_dirs[-1]
> +            cmd_lines.append('%s || { "%s failed"; exit 1; }' % (cmd, cm=
d))
> +
> +        # Remove the package* folders from TMPDIR. These folders might c=
ontain the sources for the -src packages.
> +        # This likely breaks pseudo like:
> +        # path mismatch [3 links]: ino 79147802 db
> +        # .../build/tmp/.../cmake-example/1.0/package/usr/src/debug/cmak=
e-example/1.0-r0/oe-local-files/cpp-example-lib.cpp
> +        # .../build/workspace/sources/cmake-example/oe-local-files/cpp-e=
xample-lib.cpp
> +        # Since the files are anyway outdated lets deleted them (also fr=
om pseudo's db) to workaround this issue.
> +        pkg_dirs =3D ' '.join([os.path.join(self.workdir, d) for d in [
> +            "package", "packages-split", "pkgdata", "sstate-install-pack=
age", "debugsources.list", "*.spec"]])
> +        cmd =3D "%s rm -rf %s" % (self.fakerootcmd, pkg_dirs)
> +        cmd_lines.append('%s || { "%s failed"; exit 1; }' % (cmd, cmd))
> +
> +        # Finally call run.do_install on pseudo
> +        cmd =3D "%s %s" % (self.fakerootcmd, run_do_install)
> +        cmd_lines.append('%s || { "%s failed"; exit 1; }' % (cmd, cmd))
> +
> +        return self.write_script(cmd_lines, 'bb_run_do_install')
> +
> +    def gen_deploy_target_script(self, args):
> +        """Generate a script which does what devtool deploy-target does
> +
> +        This script is much quicker than devtool target-deploy. Because =
it
> +        does not need to start a bitbake server. All information from ti=
nfoil
> +        is hard-coded in the generated script.
> +        """
> +        cmd_lines =3D ['#!/usr/bin/env python3']
> +        cmd_lines.append('import sys')
> +        cmd_lines.append('devtool_sys_path =3D %s' % str(sys.path))
> +        cmd_lines.append('devtool_sys_path.reverse()')
> +        cmd_lines.append('for p in devtool_sys_path:')
> +        cmd_lines.append('    if p not in sys.path:')
> +        cmd_lines.append('        sys.path.insert(0, p)')
> +        cmd_lines.append('from devtool.deploy import deploy_cached')
> +        args_filter =3D ['debug', 'dry_run', 'key', 'no_check_space', 'n=
o_host_check',
> +                       'no_preserve', 'port', 'show_status', 'ssh_exec',=
 'strip', 'target']
> +        filtered_args_dict =3D {key: value for key, value in vars(
> +            args).items() if key in args_filter}
> +        cmd_lines.append('filtered_args_dict =3D %s' % str(filtered_args=
_dict))
> +        cmd_lines.append('class Dict2Class(object):')
> +        cmd_lines.append('    def __init__(self, my_dict):')
> +        cmd_lines.append('        for key in my_dict:')
> +        cmd_lines.append('            setattr(self, key, my_dict[key])')
> +        cmd_lines.append('filtered_args =3D Dict2Class(filtered_args_dic=
t)')
> +        cmd_lines.append(
> +            'setattr(filtered_args, "recipename", "%s")' % self.bpn)
> +        cmd_lines.append('deploy_cached("%s", "%s", "%s", "%s", "%s", "%=
s", %d, "%s", "%s", filtered_args)' %
> +                         (self.d, self.work If the intent is to keep for=
king off bits of code which are too slow.dir, self.path, self.strip_cmd,
> +                          self.libdir, self.base_libdir, self.max_proces=
s,
> +                          self.fakerootcmd, self.fakerootenv))
> +        return self.write_script(cmd_lines, 'deploy_target')
> +
> +    def gen_install_deploy_script(self, args):
> +        """Generate a script which does install and deploy"""
> +        cmd_lines =3D ['#!/bin/sh -e']
> +        cmd_lines.append(self.gen_fakeroot_install_script())
> +        cmd_lines.append(self.gen_deploy_target_script(args))
> +        return self.write_script(cmd_lines, 'install_and_deploy')
> +
> +    def write_script(self, cmd_lines, script_name):
> +        bb.utils.mkdirhier(self.temp_dir)
> +        script_name_arch =3D script_name + '_' + self.recipe_id
> +        script_file =3D os.path.join(self.temp_dir, script_name_arch)
> +        with open(script_file, 'w') as script_f:
> +            script_f.write(os.linesep.join(cmd_lines))
> +        st =3D os.stat(script_file)
> +        os.chmod(script_file, st.st_mode | stat.S_IEXEC)
> +        return script_file

You say devtool is too slow as it has to start a bitbake server. Are
there ways we could get bitbake to behave in a fast enough way to make
this work well enough for the IDE so we don't have to duplicate this?

There are a few things which can be done:

a) memory resident bitbake means the start/stop of the server is no
longer needed

b) bitbake -b specifying a specific recipe is extremely fast as it
bypasses any need to parse multiple recipes

c) could a tinfoil client/daemon persist as a helper for the plugin in
the background to avoid having to fork these bits of code?


I suspect a lot comes down to intent with this code. If the intent is
that this is "done" and once merged, will stay like this or even
duplicate more bits as needed in future, I don't think I'm prepared to
take it. If we document clearly that this approach is a WIP and
ultimately we want to use something directly with bitbake, there are
probably paths to merging it.

I do want to have a clear understanding on what the ultimate goal and
code would look like.

Cheers,

Richard


