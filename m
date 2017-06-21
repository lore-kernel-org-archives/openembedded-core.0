Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 811AF77F79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 10:09:48 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id m62so30010297itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jG2WJHu9lzuUviYHppP964yd8ebwE4puApJOba/nZr4=;
	b=MVfXUaPyfHcNKgkVofuY/T4e+Vl11FbK3TD8W0OxJBVktbVRh646ecbD+kgI1B1Xc/
	JFYgUJMOqyeesO9tynSd/nwxb2FQ4fGPZqD+c5rjGlWIRZMHTHxcDXx5Q9O6tKa2M+NT
	/3k1K1qN0CE6ixp0cVqWO1soPMxGWCc1AV7Yj+tFJkQewKrvYBAAAHTKX5Lwia3H8jSa
	JaBONMRxqZTiksLjns9lKPp0uTURFrG52slDgf9Hs7S79qwjUypKRQP1MRn5NdMZ5ssX
	vXGXtAilKJKjozvVBkBkK0XjCpMLkLbx0lOsEADj9s4ZqMjemYaHG7FFSeWWlbYPMrAH
	VyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jG2WJHu9lzuUviYHppP964yd8ebwE4puApJOba/nZr4=;
	b=GlHeZ5Ngrtwq6UAWDPLXFGhnWWeEUH+78dHKbTJlpRHGht8KomDwGcjsIbWWdplGv4
	5ZVeeuP0JiWuwBCYqyVzC7SeL236Taj4ABdghLjgC/VVytXQV4nt+AfzZrhgMT9YWq7L
	9A0/kQjCWHUIFP7Pqqr7VfcV6ikyAWdd9g3Q0M15G2vHfQdE6xB6STVR1PVddBf/DJcL
	G9aklVfgVv0/ckMfwDycp7BYSp2y8HYcgFbZ+B32dwxYJ3h0cAzsQm7p+nKY0ZmJKk1t
	ohwynqjbeGQrusfpqLO1iVFtDmhVqT9+CKw5rPVjUvKF2mju2UQLw3ev8BlnrO7kfo6y
	5tnw==
X-Gm-Message-State: AKS2vOyWImYtN39SXPPlMLVVOnD2Vri0vaH6bBwDxVLguqwKnhqZ4iMF
	MxQR7Rp2P65Ix4rbMf5Xs34H5hA7bzHr7CM=
X-Received: by 10.36.167.65 with SMTP id s1mr7946746iti.98.1498039789363; Wed,
	21 Jun 2017 03:09:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.130 with HTTP; Wed, 21 Jun 2017 03:09:18 -0700 (PDT)
In-Reply-To: <1497944565-7498-4-git-send-email-tobiasha@axis.com>
References: <1497944565-7498-1-git-send-email-tobiasha@axis.com>
	<1497944565-7498-4-git-send-email-tobiasha@axis.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 21 Jun 2017 13:09:18 +0300
Message-ID: <CAHiDW_HETPL7K_UV6Vc-DqEepBAaxxMM2mVQLTmwfBA-dewdoA@mail.gmail.com>
To: Tobias Hagelborn <tobias.hagelborn@axis.com>
Cc: Tobias Hagelborn <tobiasha@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 4/4] devtool: deploy-target: Support stripped libs and execs
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
X-List-Received-Date: Wed, 21 Jun 2017 10:09:48 -0000
Content-Type: multipart/alternative; boundary="f403045fbfd8816f5805527591ed"

--f403045fbfd8816f5805527591ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 20 June 2017 at 10:42, Tobias Hagelborn <tobias.hagelborn@axis.com>
wrote:
>
> New devtool deploy-target option --strip which enables deploying
> stripped binaries, saving some space on target.
>
> * Copies the files of ${D} into a new directory and strips them in place
> * Used oe.package.strip_execs for stripping directory
> * Added devtool.conf option "strip" for changing default behavior
>
> Config example:
> [Deploy]
> strip =3D true
>
> [YOCTO #11227]
>
> Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
> ---
>  scripts/lib/devtool/deploy.py | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.p=
y
> index 04c34cb..96b877e 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -16,12 +16,16 @@
>  # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>  """Devtool plugin containing the deploy subcommands"""
>
> +import logging
>  import os
> +import shutil
>  import subprocess
> -import logging
>  import tempfile
> -import shutil
> +
> +import bb.utils
>  import argparse_oe
> +import oe
> +
>  from devtool import exec_fakeroot, setup_tinfoil,
check_workspace_recipe, DevtoolError
>
>  logger =3D logging.getLogger('devtool')
> @@ -140,9 +144,9 @@ def _prepare_remote_script(deploy, verbose=3DFalse,
dryrun=3DFalse, undeployall=3DFals
>      return '\n'.join(lines)
>
>
> +
>  def deploy(args, config, basepath, workspace):
>      """Entry point for the devtool 'deploy' subcommand"""
> -    import re
>      import math
>      import oe.recipeutils
>
> @@ -170,6 +174,17 @@ def deploy(args, config, basepath, workspace):
>                              'recipe? If so, the install step has not
installed '
>                              'any files.' % args.recipename)
>
> +        if args.strip and not args.dry_run:
> +            # Fakeroot copy to new destination
> +            srcdir =3D recipe_outdir
> +            recipe_outdir =3D os.path.join(rd.getVar('WORKDIR', True),
'deploy-target-stripped')
> +            if os.path.isdir(recipe_outdir):
> +                bb.utils.remove(recipe_outdir, True)
> +            exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir,
'.'), recipe_outdir), shell=3DTrue)
> +            os.environ['PATH'] =3D ':'.join([os.environ['PATH'],
rd.getVar('PATH', True) or ''])
> +            oe.package.strip_execs(args.recipename, recipe_outdir,
rd.getVar('STRIP', True), rd.getVar('libdir', True),
> +                        rd.getVar('base_libdir', True))
> +
>          filelist =3D []
>          ftotalsize =3D 0
>          for root, _, files in os.walk(recipe_outdir):
> @@ -189,7 +204,6 @@ def deploy(args, config, basepath, workspace):
>                  print('  %s' % item)
>              return 0
>
> -
>          extraoptions =3D ''
>          if args.no_host_check:
>              extraoptions +=3D '-o UserKnownHostsFile=3D/dev/null -o
StrictHostKeyChecking=3Dno'
> @@ -301,6 +315,7 @@ def undeploy(args, config, basepath, workspace):
>
>  def register_commands(subparsers, context):
>      """Register devtool subcommands from the deploy plugin"""
> +
>      parser_deploy =3D subparsers.add_parser('deploy-target',
>                                            help=3D'Deploy recipe output
files to live target machine',
>                                            description=3D'Deploys a
recipe\'s build output (i.e. the output of the do_install task) to a live
target machine over ssh. By default, any existing files will be preserved
instead of being overwritten and will be restored if you run devtool
undeploy-target. Note: this only deploys the recipe itself and not any
runtime dependencies, so it is assumed that those have been installed on
the target beforehand.',
> @@ -313,6 +328,15 @@ def register_commands(subparsers, context):
>      parser_deploy.add_argument('-p', '--no-preserve', help=3D'Do not
preserve existing files', action=3D'store_true')
>      parser_deploy.add_argument('--no-check-space', help=3D'Do not check
for available space before deploying', action=3D'store_true')
>      parser_deploy.add_argument('-P', '--port', default=3D'22', help=3D'P=
ort
to use for connection to the target')
> +
> +    strip_opts =3D
parser_deploy.add_mutually_exclusive_group(required=3DFalse)
> +    strip_opts.add_argument('-S', '--strip',
> +                               help=3D'Strip executables prior to
deploying (default: %(default)s). '
> +                                    'The default value of this option
can be controlled by setting the strip option in the [Deploy] section to
True or False.',
> +
default=3Doe.types.boolean(context.config.get('Deploy', 'strip',
default=3D'0')),
> +                               action=3D'store_true')

Autobuilder is complaining about this:

Exception: bb.process.ExecutionError: Execution of 'devtool --bbpath
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta-po=
ky:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/buil=
d:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta:=
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta-yo=
cto-bsp
--basepath
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/t=
mp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image//opt/=
poky/2.3
create-workspace --create-only
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/t=
mp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image//opt/=
poky/2.3/workspace'
failed with exit code 1:
Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/script=
s/devtool",
line 351, in <module>
    ret =3D main()
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/script=
s/devtool",
line 329, in main
    plugin.register_commands(subparsers, context)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/script=
s/lib/devtool/deploy.py",
line 336, in register_commands
    default=3Doe.types.boolean(context.config.get('Deploy', 'strip',
default=3D'0')),
AttributeError: module 'oe' has no attribute 'types'

See
https://autobuilder.yocto.io/builders/nightly-x86-64/builds/333/steps/Build=
Images_2/logs/stdio
for context.


> +    strip_opts.add_argument('--no-strip', help=3D'Do not strip executabl=
es
prior to deploy', dest=3D'strip', action=3D'store_false')
> +
>      parser_deploy.set_defaults(func=3Ddeploy)
>
>      parser_undeploy =3D subparsers.add_parser('undeploy-target',
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--f403045fbfd8816f5805527591ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On 20 June 2017 at 10:42, Tobias Hagelborn &lt;<a =
href=3D"mailto:tobias.hagelborn@axis.com">tobias.hagelborn@axis.com</a>&gt;=
 wrote:<br>&gt;<br>&gt; New devtool deploy-target option --strip which enab=
les deploying<br>&gt; stripped binaries, saving some space on target.<br>&g=
t;<br>&gt; * Copies the files of ${D} into a new directory and strips them =
in place<br>&gt; * Used oe.package.strip_execs for stripping directory<br>&=
gt; * Added devtool.conf option &quot;strip&quot; for changing default beha=
vior<br>&gt;<br>&gt; Config example:<br>&gt; [Deploy]<br>&gt; strip =3D tru=
e<br>&gt;<br>&gt; [YOCTO #11227]<br>&gt;<br>&gt; Signed-off-by: Tobias Hage=
lborn &lt;<a href=3D"mailto:tobiasha@axis.com">tobiasha@axis.com</a>&gt;<br=
>&gt; ---<br>&gt; =C2=A0scripts/lib/devtool/deploy.py | 32 ++++++++++++++++=
++++++++++++----<br>&gt; =C2=A01 file changed, 28 insertions(+), 4 deletion=
s(-)<br>&gt;<br>&gt; diff --git a/scripts/lib/devtool/deploy.py b/scripts/l=
ib/devtool/deploy.py<br>&gt; index 04c34cb..96b877e 100644<br>&gt; --- a/sc=
ripts/lib/devtool/deploy.py<br>&gt; +++ b/scripts/lib/devtool/deploy.py<br>=
&gt; @@ -16,12 +16,16 @@<br>&gt; =C2=A0# 51 Franklin Street, Fifth Floor, B=
oston, MA 02110-1301 USA.<br>&gt; =C2=A0&quot;&quot;&quot;Devtool plugin co=
ntaining the deploy subcommands&quot;&quot;&quot;<br>&gt;<br>&gt; +import l=
ogging<br>&gt; =C2=A0import os<br>&gt; +import shutil<br>&gt; =C2=A0import =
subprocess<br>&gt; -import logging<br>&gt; =C2=A0import tempfile<br>&gt; -i=
mport shutil<br>&gt; +<br>&gt; +import bb.utils<br>&gt; =C2=A0import argpar=
se_oe<br>&gt; +import oe<br>&gt; +<br>&gt; =C2=A0from devtool import exec_f=
akeroot, setup_tinfoil, check_workspace_recipe, DevtoolError<br>&gt;<br>&gt=
; =C2=A0logger =3D logging.getLogger(&#39;devtool&#39;)<br>&gt; @@ -140,9 +=
144,9 @@ def _prepare_remote_script(deploy, verbose=3DFalse, dryrun=3DFalse=
, undeployall=3DFals<br>&gt; =C2=A0 =C2=A0 =C2=A0return &#39;\n&#39;.join(l=
ines)<br>&gt;<br>&gt;<br>&gt; +<br>&gt; =C2=A0def deploy(args, config, base=
path, workspace):<br>&gt; =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Entry point=
 for the devtool &#39;deploy&#39; subcommand&quot;&quot;&quot;<br>&gt; - =
=C2=A0 =C2=A0import re<br>&gt; =C2=A0 =C2=A0 =C2=A0import math<br>&gt; =C2=
=A0 =C2=A0 =C2=A0import oe.recipeutils<br>&gt;<br>&gt; @@ -170,6 +174,17 @@=
 def deploy(args, config, basepath, workspace):<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;recipe? If so, the install step has not installed &#39;<b=
r>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;any files.&#39; % args.recipenam=
e)<br>&gt;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if args.strip and not args.=
dry_run:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Fakeroot copy=
 to new destination<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcd=
ir =3D recipe_outdir<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rec=
ipe_outdir =3D os.path.join(rd.getVar(&#39;WORKDIR&#39;, True), &#39;deploy=
-target-stripped&#39;)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f os.path.isdir(recipe_outdir):<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(recipe_outdir, True)<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_fakeroot(rd, &quot;cp -af %s %s&=
quot; % (os.path.join(srcdir, &#39;.&#39;), recipe_outdir), shell=3DTrue)<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.environ[&#39;PATH&#39;=
] =3D &#39;:&#39;.join([os.environ[&#39;PATH&#39;], rd.getVar(&#39;PATH&#39=
;, True) or &#39;&#39;])<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar(&#39;ST=
RIP&#39;, True), rd.getVar(&#39;libdir&#39;, True),<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rd.ge=
tVar(&#39;base_libdir&#39;, True))<br>&gt; +<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0filelist =3D []<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ftot=
alsize =3D 0<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for root, _, files i=
n os.walk(recipe_outdir):<br>&gt; @@ -189,7 +204,6 @@ def deploy(args, conf=
ig, basepath, workspace):<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0print(&#39; =C2=A0%s&#39; % item)<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>&gt;<br>&gt; -<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extraoptions =3D &#39;&#39;<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if args.no_host_check:<br>&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extraoptions +=3D &#39;-o UserKnownHosts=
File=3D/dev/null -o StrictHostKeyChecking=3Dno&#39;<br>&gt; @@ -301,6 +315,=
7 @@ def undeploy(args, config, basepath, workspace):<br>&gt;<br>&gt; =C2=
=A0def register_commands(subparsers, context):<br>&gt; =C2=A0 =C2=A0 =C2=A0=
&quot;&quot;&quot;Register devtool subcommands from the deploy plugin&quot;=
&quot;&quot;<br>&gt; +<br>&gt; =C2=A0 =C2=A0 =C2=A0parser_deploy =3D subpar=
sers.add_parser(&#39;deploy-target&#39;,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help=3D&#39;Deploy r=
ecipe output files to live target machine&#39;,<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description=
=3D&#39;Deploys a recipe\&#39;s build output (i.e. the output of the do_ins=
tall task) to a live target machine over ssh. By default, any existing file=
s will be preserved instead of being overwritten and will be restored if yo=
u run devtool undeploy-target. Note: this only deploys the recipe itself an=
d not any runtime dependencies, so it is assumed that those have been insta=
lled on the target beforehand.&#39;,<br>&gt; @@ -313,6 +328,15 @@ def regis=
ter_commands(subparsers, context):<br>&gt; =C2=A0 =C2=A0 =C2=A0parser_deplo=
y.add_argument(&#39;-p&#39;, &#39;--no-preserve&#39;, help=3D&#39;Do not pr=
eserve existing files&#39;, action=3D&#39;store_true&#39;)<br>&gt; =C2=A0 =
=C2=A0 =C2=A0parser_deploy.add_argument(&#39;--no-check-space&#39;, help=3D=
&#39;Do not check for available space before deploying&#39;, action=3D&#39;=
store_true&#39;)<br>&gt; =C2=A0 =C2=A0 =C2=A0parser_deploy.add_argument(&#3=
9;-P&#39;, &#39;--port&#39;, default=3D&#39;22&#39;, help=3D&#39;Port to us=
e for connection to the target&#39;)<br>&gt; +<br>&gt; + =C2=A0 =C2=A0strip=
_opts =3D parser_deploy.add_mutually_exclusive_group(required=3DFalse)<br>&=
gt; + =C2=A0 =C2=A0strip_opts.add_argument(&#39;-S&#39;, &#39;--strip&#39;,=
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;Strip executables pri=
or to deploying (default: %(default)s). &#39;<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;The default value of this option can=
 be controlled by setting the strip option in the [Deploy] section to True =
or False.&#39;,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default=3Doe.types.=
boolean(context.config.get(&#39;Deploy&#39;, &#39;strip&#39;, default=3D&#3=
9;0&#39;)),<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&#39;store_tr=
ue&#39;)<br><br>Autobuilder is complaining about this:<br><br>Exception: bb=
.process.ExecutionError: Execution of &#39;devtool --bbpath /home/pokybuild=
/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta-poky:/home/pokybu=
ild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build:/home/pokybui=
ld/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta:/home/pokybuild=
/yocto-autobuilder/yocto-worker/nightly-x86-64/build/meta-yocto-bsp --basep=
ath /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/bui=
ld/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image//=
opt/poky/2.3 create-workspace --create-only /home/pokybuild/yocto-autobuild=
er/yocto-worker/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/c=
ore-image-minimal/1.0-r0/sdk-ext/image//opt/poky/2.3/workspace&#39; failed =
with exit code 1:<br>Traceback (most recent call last):<br>=C2=A0 File &quo=
t;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/scrip=
ts/devtool&quot;, line 351, in &lt;module&gt;<br>=C2=A0 =C2=A0 ret =3D main=
()<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nigh=
tly-x86-64/build/scripts/devtool&quot;, line 329, in main<br>=C2=A0 =C2=A0 =
plugin.register_commands(subparsers, context)<br>=C2=A0 File &quot;/home/po=
kybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/scripts/lib/dev=
tool/deploy.py&quot;, line 336, in register_commands<br>=C2=A0 =C2=A0 defau=
lt=3Doe.types.boolean(context.config.get(&#39;Deploy&#39;, &#39;strip&#39;,=
 default=3D&#39;0&#39;)),<br>AttributeError: module &#39;oe&#39; has no att=
ribute &#39;types&#39;<br><br>See=C2=A0<a href=3D"https://autobuilder.yocto=
.io/builders/nightly-x86-64/builds/333/steps/BuildImages_2/logs/stdio">http=
s://autobuilder.yocto.io/builders/nightly-x86-64/builds/333/steps/BuildImag=
es_2/logs/stdio</a> for context.<br><br><br>&gt; + =C2=A0 =C2=A0strip_opts.=
add_argument(&#39;--no-strip&#39;, help=3D&#39;Do not strip executables pri=
or to deploy&#39;, dest=3D&#39;strip&#39;, action=3D&#39;store_false&#39;)<=
br>&gt; +<br>&gt; =C2=A0 =C2=A0 =C2=A0parser_deploy.set_defaults(func=3Ddep=
loy)<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0parser_undeploy =3D subparsers.add=
_parser(&#39;undeploy-target&#39;,<br>&gt; --<br>&gt; 2.1.4<br>&gt;<br>&gt;=
 --<br>&gt; _______________________________________________<br>&gt; Openemb=
edded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.o=
penembedded.org">Openembedded-core@lists.openembedded.org</a><br>&gt; <a hr=
ef=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core">htt=
p://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br></div>

--f403045fbfd8816f5805527591ed--
