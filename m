Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id DF36771A84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 00:23:51 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id v84-v6so4218079lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=GPhAd1U3fFc/lKxF4A4HibNrLY1OfqClMS3haqwji8E=;
	b=G6MZEG5U4OfLGBQMtt+Pw1mQzmD2dUFROn6JSEKiADqyDr37IcM0TxnN7jMj3ytBK/
	F2dN+cm+8/0eti4NxWcAJ1OlOm4XB1eG9tWXfcrPGE/IwOj2kI06+V/qeqnc+gxFcTEl
	Ay2MmGJwUXNk89oH+/dhLuxAPt+q4e7VMrCVj1sJvJq/f66W+xyT7hl9/O5WlS29tOk3
	cEcdIiUMkBWk2wNGfYnHhVOaLW/3jzc+tKRPW/rBSyui72pux5yGc5/EjcbbuxrVqVuB
	NI3GM3Wh/nAHTbcVPExVm/dmgAMcMfp1ssAPzeCIgulIhzZmIyRBIk/VmCOrG4XaN0hL
	5WJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=GPhAd1U3fFc/lKxF4A4HibNrLY1OfqClMS3haqwji8E=;
	b=TJRPpd+cj8svGamiqJO6b/j/nf3bvun0bYMDtAr87ljUHcMVQaYCQGQir3mLtyIey7
	PnDcN29FlheH0P1hV6vUxJD1k0NCdw8pl1JKwqTGrq5E0H7I5uuHWsOSoBIZQXB0ENku
	K9Rl0T9bG0jajnT93INCXdQZ2bumTn7FGuMMMJAClgwJY35L9vaY961UnUOQrk5LxZRd
	O0wpd7Mjq1sTPZ3seXSxhFRJkZnBCICesuKiudgbpMF8ZyYj+0BBhk/LmKOEVlDoFpy4
	bfkC/dgeqyGz0KU+noS1Hj9XfZnCeDwJl5g7B/hThXXO4urTiN+rFt2CO25vNCIBDHHD
	KtYA==
X-Gm-Message-State: APt69E17FqV6v2Y8r916k99Mlig/bMa/SxagRg43qmuBb0tI52g41P8e
	YozmHo6imH0E+LJ7H00eIEU+DB0FqvHvZKj+Fo3i2A==
X-Google-Smtp-Source: ADUXVKKGczYB8hPto1TlXuOlP/8GgyD7G0b6oGKlqtxzG3eREBxhgQNe4xp2eyyKR0P2IralZsbFx5lG+jLYGalEGf8=
X-Received: by 2002:a2e:4811:: with SMTP id
	v17-v6mr9077884lja.39.1529367832192; 
	Mon, 18 Jun 2018 17:23:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb0f:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 17:23:51
	-0700 (PDT)
In-Reply-To: <20180606181135.18490-1-twoerner@gmail.com>
References: <20180606181135.18490-1-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 18 Jun 2018 20:23:51 -0400
Message-ID: <CAHUNapQdAXQ1nYe+7G9Bjn1Dx2=cZTSPMMgNJBzC_2YO54mPRA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Tue, 19 Jun 2018 00:23:52 -0000
Content-Type: multipart/alternative; boundary="0000000000005e6e05056ef3b2bc"

--0000000000005e6e05056ef3b2bc
Content-Type: text/plain; charset="UTF-8"

ping?

On Wed, Jun 6, 2018 at 2:11 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> Instead of installing an entire recipe's build output (i.e. ${D}), allow
> the
> user to optionally specify the name of one package at a time from said
> recipe
> to be installed (i.e. ${PKGDEST}/<package>).
>
> NOTE: mixing "deploy-target" commands that have this new --package option
> and
> "deploy-target" commands without --package against the same recipe is not
> ideal.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> updates since v1:
>  - The behaviour of deploy-target is to start by trying to remove any
> previous
>    such deploy-targets with the same deploy-name which have already been
>    deployed on the target. That meant that, with v1, if someone tried to
>    deploy two packages from the same recipe, the second deployment would
>    undeploy the first deployment, then deploy the second. By incorporating
> the
>    package name into the on-target deploy-name, multiple such deployments
> can
>    exist at the same time from the same recipe.
> ---
>  scripts/lib/devtool/deploy.py | 42 ++++++++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
> index 52e261d560..0bd2a9f63b 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -169,11 +169,20 @@ def deploy(args, config, basepath, workspace):
>          except Exception as e:
>              raise DevtoolError('Exception parsing recipe %s: %s' %
>                              (args.recipename, e))
> -        recipe_outdir = rd.getVar('D')
> +        if args.package:
> +            recipe_outdir = os.path.join(rd.getVar('PKGDEST'),
> args.package)
> +        else:
> +            recipe_outdir = rd.getVar('D')
>          if not os.path.exists(recipe_outdir) or not
> os.listdir(recipe_outdir):
> -            raise DevtoolError('No files to deploy - have you built the
> %s '
> -                            'recipe? If so, the install step has not
> installed '
> -                            'any files.' % args.recipename)
> +            if args.package:
> +                raise DevtoolError('No files to deploy - have you built
> the %s '
> +                                'package of the %s recipe? If so, the
> install '
> +                                'step has not installed any files.'
> +                                % (args.package, args.recipename))
> +            else:
> +                raise DevtoolError('No files to deploy - have you built
> the %s '
> +                                'recipe? If so, the install step has not
> installed '
> +                                'any files.' % args.recipename)
>
>          if args.strip and not args.dry_run:
>              # Fakeroot copy to new destination
> @@ -246,7 +255,10 @@ def deploy(args, config, basepath, workspace):
>              shutil.rmtree(tmpdir)
>
>          # Now run the script
> -        ret = exec_fakeroot(rd, 'tar cf - . | ssh  %s %s %s \'sh %s %s %s
> %s\'' % (ssh_port, extraoptions, args.target, tmpscript, args.recipename,
> destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
> +        filename = args.recipename
> +        if args.package:
> +            filename = filename + '.' + args.package
> +        ret = exec_fakeroot(rd, 'tar cf - . | ssh  %s %s %s \'sh %s %s %s
> %s\'' % (ssh_port, extraoptions, args.target, tmpscript, filename, destdir,
> tmpfilelist), cwd=recipe_outdir, shell=True)
>          if ret != 0:
>              raise DevtoolError('Deploy failed - rerun with -s to get a
> complete '
>                              'error message')
> @@ -300,13 +312,19 @@ def undeploy(args, config, basepath, workspace):
>          shutil.rmtree(tmpdir)
>
>      # Now run the script
> -    ret = subprocess.call('ssh %s %s %s \'sh %s %s\'' % (ssh_port,
> extraoptions, args.target, tmpscript, args.recipename), shell=True)
> +    filename = args.recipename
> +    if args.package:
> +        filename = filename + '.' + args.package
> +    ret = subprocess.call('ssh %s %s %s \'sh %s %s\'' % (ssh_port,
> extraoptions, args.target, tmpscript, filename), shell=True)
>      if ret != 0:
>          raise DevtoolError('Undeploy failed - rerun with -s to get a
> complete '
>                             'error message')
>
>      if not args.all and not args.dry_run:
> -        logger.info('Successfully undeployed %s' % args.recipename)
> +        if args.package:
> +            logger.info('Successfully undeployed %s' % args.package)
> +        else:
> +            logger.info('Successfully undeployed %s' % args.recipename)
>      return 0
>
>
> @@ -314,8 +332,8 @@ def register_commands(subparsers, context):
>      """Register devtool subcommands from the deploy plugin"""
>
>      parser_deploy = subparsers.add_parser('deploy-target',
> -                                          help='Deploy recipe output
> files to live target machine',
> -                                          description='Deploys a
> recipe\'s build output (i.e. the output of the do_install task) to a live
> target machine over ssh. By default, any existing files will be preserved
> instead of being overwritten and will be restored if you run devtool
> undeploy-target. Note: this only deploys the recipe itself and not any
> runtime dependencies, so it is assumed that those have been installed on
> the target beforehand.',
> +                                          help='Deploy build output to a
> live target machine',
> +                                          description='Deploys either the
> full recipe\'s build output (i.e. the output of the do_install task) or a
> package of a recipe to a live target machine over ssh. By default, any
> existing files will be preserved instead of being overwritten and will be
> restored if you run devtool undeploy-target. Note: this only deploys the
> specified item itself and not any runtime dependencies, so it is assumed
> that those have been installed on the target beforehand.',
>                                            group='testbuild')
>      parser_deploy.add_argument('recipename', help='Recipe to deploy')
>      parser_deploy.add_argument('target', help='Live target machine
> running an ssh server: user@hostname[:destdir]')
> @@ -325,6 +343,7 @@ def register_commands(subparsers, context):
>      parser_deploy.add_argument('-p', '--no-preserve', help='Do not
> preserve existing files', action='store_true')
>      parser_deploy.add_argument('--no-check-space', help='Do not check
> for available space before deploying', action='store_true')
>      parser_deploy.add_argument('-P', '--port', help='Specify port to use
> for connection to the target')
> +    parser_deploy.add_argument('--package', help='Specify a recipe\'s
> package to deploy', dest='package')
>
>      strip_opts = parser_deploy.add_mutually_exclusive_group(required=
> False)
>      strip_opts.add_argument('-S', '--strip',
> @@ -337,8 +356,8 @@ def register_commands(subparsers, context):
>      parser_deploy.set_defaults(func=deploy)
>
>      parser_undeploy = subparsers.add_parser('undeploy-target',
> -                                            help='Undeploy recipe output
> files in live target machine',
> -                                            description='Un-deploys
> recipe output files previously deployed to a live target machine by devtool
> deploy-target.',
> +                                            help='Undeploy output files
> from a live target machine',
> +                                            description='Un-deploys
> output files previously deployed to a live target machine by devtool
> deploy-target.',
>                                              group='testbuild')
>      parser_undeploy.add_argument('recipename', help='Recipe to undeploy
> (if not using -a/--all)', nargs='?')
>      parser_undeploy.add_argument('target', help='Live target machine
> running an ssh server: user@hostname')
> @@ -347,4 +366,5 @@ def register_commands(subparsers, context):
>      parser_undeploy.add_argument('-a', '--all', help='Undeploy all
> recipes deployed on the target', action='store_true')
>      parser_undeploy.add_argument('-n', '--dry-run', help='List files to
> be undeployed only', action='store_true')
>      parser_undeploy.add_argument('-P', '--port', help='Specify port to
> use for connection to the target')
> +    parser_undeploy.add_argument('--package', help='Specify a recipe\'s
> package to undeploy', dest='package')
>      parser_undeploy.set_defaults(func=undeploy)
> --
> 2.17.0.582.gccdcbd54c
>
>

--0000000000005e6e05056ef3b2bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping?</div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Wed, Jun 6, 2018 at 2:11 PM, Trevor Woerner <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Instead of ins=
talling an entire recipe&#39;s build output (i.e. ${D}), allow the<br>
user to optionally specify the name of one package at a time from said reci=
pe<br>
to be installed (i.e. ${PKGDEST}/&lt;package&gt;).<br>
<br>
NOTE: mixing &quot;deploy-target&quot; commands that have this new --packag=
e option and<br>
&quot;deploy-target&quot; commands without --package against the same recip=
e is not<br>
ideal.<br>
<br>
Signed-off-by: Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.com">two=
erner@gmail.com</a>&gt;<br>
---<br>
updates since v1:<br>
=C2=A0- The behaviour of deploy-target is to start by trying to remove any =
previous<br>
=C2=A0 =C2=A0such deploy-targets with the same deploy-name which have alrea=
dy been<br>
=C2=A0 =C2=A0deployed on the target. That meant that, with v1, if someone t=
ried to<br>
=C2=A0 =C2=A0deploy two packages from the same recipe, the second deploymen=
t would<br>
=C2=A0 =C2=A0undeploy the first deployment, then deploy the second. By inco=
rporating the<br>
=C2=A0 =C2=A0package name into the on-target deploy-name, multiple such dep=
loyments can<br>
=C2=A0 =C2=A0exist at the same time from the same recipe.<br>
---<br>
=C2=A0scripts/lib/devtool/deploy.py | 42 ++++++++++++++++++++++++++----<wbr=
>-----<br>
=C2=A01 file changed, 31 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/scripts/lib/devtool/deploy.<wbr>py b/scripts/lib/devtool/deplo=
y.<wbr>py<br>
index 52e261d560..0bd2a9f63b 100644<br>
--- a/scripts/lib/devtool/deploy.<wbr>py<br>
+++ b/scripts/lib/devtool/deploy.<wbr>py<br>
@@ -169,11 +169,20 @@ def deploy(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DevtoolError(&#39;Exc=
eption parsing recipe %s: %s&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(args.recipename, e))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe_outdir =3D rd.getVar(&#39;D&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if args.package:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe_outdir =3D os.path.join(r=
d.getVar(&#39;<wbr>PKGDEST&#39;), args.package)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe_outdir =3D rd.getVar(&#39=
;D&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(recipe_outdir) or n=
ot os.listdir(recipe_outdir):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(&#39;No files=
 to deploy - have you built the %s &#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;recipe? If so, the install step has not insta=
lled &#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;any files.&#39; % args.recipename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if args.package:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError=
(&#39;No files to deploy - have you built the %s &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;package of the %s recipe? If so=
, the install &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;step has not installed any file=
s.&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % (args.package, args.recipename))<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError=
(&#39;No files to deploy - have you built the %s &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;recipe? If so, the install step=
 has not installed &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;any files.&#39; % args.recipena=
me)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if args.strip and not args.dry_run:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Fakeroot copy to new dest=
ination<br>
@@ -246,7 +255,10 @@ def deploy(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.rmtree(tmpdir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Now run the script<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D exec_fakeroot(rd, &#39;tar cf - . | ss=
h=C2=A0 %s %s %s \&#39;sh %s %s %s %s\&#39;&#39; % (ssh_port, extraoptions,=
 args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=3Dreci=
pe_outdir, shell=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D args.recipename<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if args.package:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D filename + &#39;.&#=
39; + args.package<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D exec_fakeroot(rd, &#39;tar cf - . | ss=
h=C2=A0 %s %s %s \&#39;sh %s %s %s %s\&#39;&#39; % (ssh_port, extraoptions,=
 args.target, tmpscript, filename, destdir, tmpfilelist), cwd=3Drecipe_outd=
ir, shell=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ret !=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DevtoolError(&#39;Dep=
loy failed - rerun with -s to get a complete &#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;error message&#39;)<br>
@@ -300,13 +312,19 @@ def undeploy(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.rmtree(tmpdir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Now run the script<br>
-=C2=A0 =C2=A0 ret =3D subprocess.call(&#39;ssh %s %s %s \&#39;sh %s %s\&#3=
9;&#39; % (ssh_port, extraoptions, args.target, tmpscript, args.recipename)=
, shell=3DTrue)<br>
+=C2=A0 =C2=A0 filename =3D args.recipename<br>
+=C2=A0 =C2=A0 if args.package:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D filename + &#39;.&#39; + args.pac=
kage<br>
+=C2=A0 =C2=A0 ret =3D subprocess.call(&#39;ssh %s %s %s \&#39;sh %s %s\&#3=
9;&#39; % (ssh_port, extraoptions, args.target, tmpscript, filename), shell=
=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0if ret !=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DevtoolError(&#39;Undeploy failed -=
 rerun with -s to get a complete &#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;error message&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if not args.all and not args.dry_run:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferr=
er" target=3D"_blank">logger.info</a>(&#39;Successfully undeployed %s&#39; =
% args.recipename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if args.package:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Successfully undep=
loyed %s&#39; % args.package)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Successfully undep=
loyed %s&#39; % args.recipename)<br>
=C2=A0 =C2=A0 =C2=A0return 0<br>
<br>
<br>
@@ -314,8 +332,8 @@ def register_commands(subparsers, context):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Register devtool subcommands from the=
 deploy plugin&quot;&quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0parser_deploy =3D subparsers.add_parser(&#39;deploy-<wb=
r>target&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
elp=3D&#39;Deploy recipe output files to live target machine&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d=
escription=3D&#39;Deploys a recipe\&#39;s build output (i.e. the output of =
the do_install task) to a live target machine over ssh. By default, any exi=
sting files will be preserved instead of being overwritten and will be rest=
ored if you run devtool undeploy-target. Note: this only deploys the recipe=
 itself and not any runtime dependencies, so it is assumed that those have =
been installed on the target beforehand.&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
elp=3D&#39;Deploy build output to a live target machine&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d=
escription=3D&#39;Deploys either the full recipe\&#39;s build output (i.e. =
the output of the do_install task) or a package of a recipe to a live targe=
t machine over ssh. By default, any existing files will be preserved instea=
d of being overwritten and will be restored if you run devtool undeploy-tar=
get. Note: this only deploys the specified item itself and not any runtime =
dependencies, so it is assumed that those have been installed on the target=
 beforehand.&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0group=3D&#39;testbuild&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_deploy.add_argument(&#39;<wbr>recipename&#39;, h=
elp=3D&#39;Recipe to deploy&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_deploy.add_argument(&#39;<wbr>target&#39;, help=
=3D&#39;Live target machine running an ssh server: user@hostname[:destdir]&=
#39;)<br>
@@ -325,6 +343,7 @@ def register_commands(subparsers, context):<br>
=C2=A0 =C2=A0 =C2=A0parser_deploy.add_argument(&#39;-<wbr>p&#39;, &#39;--no=
-preserve&#39;, help=3D&#39;Do not preserve existing files&#39;, action=3D&=
#39;store_true&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_deploy.add_argument(&#39;--<wbr>no-check-space&#=
39;, help=3D&#39;Do not check for available space before deploying&#39;, ac=
tion=3D&#39;store_true&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_deploy.add_argument(&#39;-<wbr>P&#39;, &#39;--po=
rt&#39;, help=3D&#39;Specify port to use for connection to the target&#39;)=
<br>
+=C2=A0 =C2=A0 parser_deploy.add_argument(&#39;--<wbr>package&#39;, help=3D=
&#39;Specify a recipe\&#39;s package to deploy&#39;, dest=3D&#39;package&#3=
9;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0strip_opts =3D parser_deploy.add_mutually_<wbr>exclusiv=
e_group(required=3D<wbr>False)<br>
=C2=A0 =C2=A0 =C2=A0strip_opts.add_argument(&#39;-S&#39;, &#39;--strip&#39;=
,<br>
@@ -337,8 +356,8 @@ def register_commands(subparsers, context):<br>
=C2=A0 =C2=A0 =C2=A0parser_deploy.set_defaults(<wbr>func=3Ddeploy)<br>
<br>
=C2=A0 =C2=A0 =C2=A0parser_undeploy =3D subparsers.add_parser(&#39;<wbr>und=
eploy-target&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 help=3D&#39;Undeploy recipe output files in live target machine&#39;=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 description=3D&#39;Un-deploys recipe output files previously deploye=
d to a live target machine by devtool deploy-target.&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 help=3D&#39;Undeploy output files from a live target machine&#39;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 description=3D&#39;Un-deploys output files previously deployed to a =
live target machine by devtool deploy-target.&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0group=3D&#39;testbuild&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_undeploy.add_argument(&#39;<wbr>recipename&#39;,=
 help=3D&#39;Recipe to undeploy (if not using -a/--all)&#39;, nargs=3D&#39;=
?&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_undeploy.add_argument(&#39;<wbr>target&#39;, hel=
p=3D&#39;Live target machine running an ssh server: user@hostname&#39;)<br>
@@ -347,4 +366,5 @@ def register_commands(subparsers, context):<br>
=C2=A0 =C2=A0 =C2=A0parser_undeploy.add_argument(&#39;<wbr>-a&#39;, &#39;--=
all&#39;, help=3D&#39;Undeploy all recipes deployed on the target&#39;, act=
ion=3D&#39;store_true&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_undeploy.add_argument(&#39;<wbr>-n&#39;, &#39;--=
dry-run&#39;, help=3D&#39;List files to be undeployed only&#39;, action=3D&=
#39;store_true&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_undeploy.add_argument(&#39;<wbr>-P&#39;, &#39;--=
port&#39;, help=3D&#39;Specify port to use for connection to the target&#39=
;)<br>
+=C2=A0 =C2=A0 parser_undeploy.add_argument(&#39;<wbr>--package&#39;, help=
=3D&#39;Specify a recipe\&#39;s package to undeploy&#39;, dest=3D&#39;packa=
ge&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_undeploy.set_defaults(<wbr>func=3Dundeploy)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.17.0.582.gccdcbd54c<br>
<br>
</font></span></blockquote></div><br></div>

--0000000000005e6e05056ef3b2bc--
