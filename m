Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id C272C7F396
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 17:39:44 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id c21so26421270qtj.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 10:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DBj6GhyZWmnY9tRANkDvOYSn+sLCjDQ5yST9XVELPSA=;
	b=B2HK8SHOw1AZ+OikoZcAYPWt0dribIyeTxhjWvVyKKthvTW0KpyMzAfJA61lp6YM+A
	vCKsTcl+LHCJbs3kDPk7YR/GziT7p4Q6dbNN4LNZBC0WnKJxi1ieO73fGdVJ5KlJWeP3
	7gDKXnc/vzek/aBgGXX/xhhKkmynxKxhh3ekHiedZUmWwNAoYgf4qKG1tinyzwcZF9bk
	91ZmDlW2LOrQtIHHLRwvXvI4yEpZ0VDeu2WFSRTTyfPM73+8c+ZETcDxSAr0Yd+jnyn1
	yoZeAIZRPSbp+ZD5l4yVyURJpq2O9n0TxpKQZMO2Vu3LyBsZ2TK7LoFJOkTqeMjelCXr
	fuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DBj6GhyZWmnY9tRANkDvOYSn+sLCjDQ5yST9XVELPSA=;
	b=Pb3kC/dtLeg3f6g1Pu4wY+3MGqMkF39Y/FfkXJG4ZkrSOqTJGXsGc5xwkzukp1o+P2
	BalTrNTs+xoEJaD5rVABa5itU4pz8TVBPIS6bXVs7MMvXuviA9zr1/FiKLAiEHiA0SLX
	GAXosnAk3H1rV2R1T502Vrp91hPq9PfZYjaGUsDNXjnbc8us9xKD/6RntNJlh9AblW6f
	INbx2xiA+3SBkaaLgn7BKMF7KC7Za4MkrjlvypXrX0lGlngbdxBoLT6Hcv8OHAQ59CQm
	pqfbjRjtr6dUpGvikvPMuUxuff69H0lafVtKKcjft+8sd14CxqGPfVK+SqPNXK7i3wyP
	zLyw==
X-Gm-Message-State: APjAAAXNlw9Bewi/Qlk2nTccRXx+v3Fe5G4LGxy6MEhSN3/55ljKQYlt
	mYhXSjAej9wrE9Eo7IlIfwTgSVbItjl3UTx/CrM=
X-Google-Smtp-Source: APXvYqwsieu3hMMRRtpVmbIZ4MGmXgztftLZaWKVJsLhh+78QskB4Ll2FQE86YcjwNbbHtVHWYtig8SXrevJXK9V+sU=
X-Received: by 2002:ac8:4442:: with SMTP id m2mr35993922qtn.80.1570556385252; 
	Tue, 08 Oct 2019 10:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <1570473350-6427-1-git-send-email-chandana.kalluri@xilinx.com>
	<CAMKF1sr2yLJBiE6VdORpxJDg9fvYbNNXb2z7ZbMWcE8rKFkfUQ@mail.gmail.com>
	<MWHPR02MB2576CA239828D4BD746538FEB09A0@MWHPR02MB2576.namprd02.prod.outlook.com>
	<e18958c001784a0ca0d5c2ff73fa2e42@XBOX03.axis.com>
In-Reply-To: <e18958c001784a0ca0d5c2ff73fa2e42@XBOX03.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Oct 2019 10:39:34 -0700
Message-ID: <CAMKF1sp+NJk26a5Rzav3ZxCfGSsZt-6SuiBPt+VYjMymkJtdmg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] devtool: Add --remove-work option for devtool reset command
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
X-List-Received-Date: Tue, 08 Oct 2019 17:39:45 -0000
Content-Type: multipart/alternative; boundary="000000000000715a08059469a7a2"

--000000000000715a08059469a7a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2019 at 10:37 AM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Chandana Kalluri
> > Sent: den 8 oktober 2019 04:14
> > To: Paul Eggleton <paul.eggleton@linux.intel.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [OE-Core][master][PATCH] devtool: Add --remove-
> > work option for devtool reset command
> >
> > Hi Paul,
> >
> > Any thoughts on implementing this as a separate command  as suggested
> > by Khem?
>
> For what it's worth, I think the original suggested solution with a new
> option to the existing `devtool reset` and `devtool finish` commands is
> the better one.


Yeah thinking about it again we already have two commands which would need
same functionality it=E2=80=99s not good to introduce a third one although =
I think
the usability of current solution will be a bit nicer if it was independent
option

>
>
> > > -----Original Message-----
> > > From: Khem Raj <raj.khem@gmail.com>
> > > Sent: Monday, October 7, 2019 11:40 AM
> > > To: Chandana Kalluri <ckalluri@xilinx.com>
> > > Cc: Patches and discussions about the oe-core layer <openembedded-
> > > core@lists.openembedded.org>
> > > Subject: Re: [OE-core] [OE-Core][master][PATCH] devtool: Add --
> > remove-work
> > > option for devtool reset command
> > >
> > > On Mon, Oct 7, 2019 at 11:36 AM Sai Hari Chandana Kalluri
> > > <chandana.kalluri@xilinx.com> wrote:
> > > >
> > > > Enable --remove-work option for devtool reset command that allows
> > user
> > > > to clean up source directory within workspace.
> > > >
> > > > Currently devtool reset command only removes recipes and user is
> > > > forced to manually remove the sources directory within the
> > workspace
> > > > before running devtool modify again.
> > > >
> > > > Using devtool reset -r or devtool reset --remove-work option, user
> > can
> > > > cleanup the sources directory along with the recipe instead of
> > > > manually cleaning it.
> > >
> > > perhaps we can have another cmd like "reset-all" like cleanall ?
> > > which would remove everything that devtool did external to bblayers
> > for that
> > > recipe.
> > >
> > > >
> > > > syntax: devtool reset -r <recipename>
> > > >     Ex: devtool reset -r zip
> > > >
> > > >         devtool finish -r <recipename> <layer-name>
> > > >     Ex: devtool finish -r zip meta-yocto-bsp
> > > >
> > > > Signed-off-by: Sai Hari Chandana Kalluri
> > <chandana.kalluri@xilinx.com>
> > > > ---
> > > >  scripts/lib/devtool/standard.py | 26 +++++++++++++++++++-------
> > > >  1 file changed, 19 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/scripts/lib/devtool/standard.py
> > > > b/scripts/lib/devtool/standard.py index 60c9a04..1c0cd8a 100644
> > > > --- a/scripts/lib/devtool/standard.py
> > > > +++ b/scripts/lib/devtool/standard.py
> > > > @@ -1852,7 +1852,7 @@ def status(args, config, basepath,
> > workspace):
> > > >      return 0
> > > >
> > > >
> > > > -def _reset(recipes, no_clean, config, basepath, workspace):
> > > > +def _reset(recipes, no_clean, remove_work, config, basepath,
> > workspace):
> > > >      """Reset one or more recipes"""
> > > >      import oe.path
> > > >
> > > > @@ -1930,10 +1930,15 @@ def _reset(recipes, no_clean, config,
> > basepath,
> > > workspace):
> > > >          srctreebase =3D workspace[pn]['srctreebase']
> > > >          if os.path.isdir(srctreebase):
> > > >              if os.listdir(srctreebase):
> > > > -                # We don't want to risk wiping out any work in
> > progress
> > > > -                logger.info('Leaving source tree %s as-is; if you
> > no '
> > > > -                            'longer need it then please delete it
> > manually'
> > > > -                            % srctreebase)
> > > > +                    if remove_work:
> > > > +                        logger.info('-r argument used on %s,
> > removing source tree.'
> > > > +                                    ' You will lose any unsaved
> > work' %pn)
> > > > +                        shutil.rmtree(srctreebase)
> > > > +                    else:
> > > > +                        # We don't want to risk wiping out any
> > work in progress
> > > > +                        logger.info('Leaving source tree %s as-is;
> > if you no '
> > > > +                                    'longer need it then please
> > delete it manually'
> > > > +                                    % srctreebase)
> > > >              else:
> > > >                  # This is unlikely, but if it's empty we can just
> > remove it
> > > >                  os.rmdir(srctreebase) @@ -1943,6 +1948,10 @@ def
> > > > _reset(recipes, no_clean, config, basepath, workspace):
> > > >  def reset(args, config, basepath, workspace):
> > > >      """Entry point for the devtool 'reset' subcommand"""
> > > >      import bb
> > > > +    import shutil
> > > > +
> > > > +    recipes =3D ""
> > > > +
> > > >      if args.recipename:
> > > >          if args.all:
> > > >              raise DevtoolError("Recipe cannot be specified if
> > > > -a/--all is used") @@ -1957,7 +1966,7 @@ def reset(args, config,
> > basepath,
> > > workspace):
> > > >      else:
> > > >          recipes =3D args.recipename
> > > >
> > > > -    _reset(recipes, args.no_clean, config, basepath, workspace)
> > > > +    _reset(recipes, args.no_clean, args.remove_work, config,
> > > > + basepath, workspace)
> > > >
> > > >      return 0
> > > >
> > > > @@ -2009,6 +2018,7 @@ def finish(args, config, basepath,
> > workspace):
> > > >              raise DevtoolError('Source tree is not
> > > > clean:\n\n%s\nEnsure you have committed your changes or use -f/--
> > force
> > > > if you are sure there\'s nothing that needs to be committed' %
> > dirty)
> > > >
> > > >      no_clean =3D args.no_clean
> > > > +    remove_work=3Dargs.remove_work
> > > >      tinfoil =3D setup_tinfoil(basepath=3Dbasepath, tracking=3DTrue=
)
> > > >      try:
> > > >          rd =3D parse_recipe(config, tinfoil, args.recipename, True=
)
> > @@
> > > > -2160,7 +2170,7 @@ def finish(args, config, basepath, workspace):
> > > >      if args.dry_run:
> > > >          logger.info('Resetting recipe (dry-run)')
> > > >      else:
> > > > -        _reset([args.recipename], no_clean=3Dno_clean,
> > config=3Dconfig,
> > > basepath=3Dbasepath, workspace=3Dworkspace)
> > > > +        _reset([args.recipename], no_clean=3Dno_clean,
> > > > + remove_work=3Dremove_work, config=3Dconfig, basepath=3Dbasepath,
> > > > + workspace=3Dworkspace)
> > > >
> > > >      return 0
> > > >
> > > > @@ -2272,6 +2282,7 @@ def register_commands(subparsers, context):
> > > >      parser_reset.add_argument('recipename', nargs=3D'*',
> > help=3D'Recipe to
> > > reset')
> > > >      parser_reset.add_argument('--all', '-a', action=3D"store_true"=
,
> > help=3D'Reset all
> > > recipes (clear workspace)')
> > > >      parser_reset.add_argument('--no-clean', '-n',
> > > > action=3D"store_true", help=3D'Don\'t clean the sysroot to remove
> > recipe
> > > > output')
> > > > +    parser_reset.add_argument('--remove-work', '-r',
> > > > + action=3D"store_true", help=3D'Clean the sources directory along =
with
> > > > + append')
> > > >      parser_reset.set_defaults(func=3Dreset)
> > > >
> > > >      parser_finish =3D subparsers.add_parser('finish', help=3D'Fini=
sh
> > > > working on a recipe in your workspace', @@ -2282,6 +2293,7 @@ def
> > > register_commands(subparsers, context):
> > > >      parser_finish.add_argument('--mode', '-m', choices=3D['patch',
> > 'srcrev',
> > > 'auto'], default=3D'auto', help=3D'Update mode (where %(metavar)s is
> > %(choices)s;
> > > default is %(default)s)', metavar=3D'MODE')
> > > >      parser_finish.add_argument('--initial-rev', help=3D'Override
> > starting revision
> > > for patches')
> > > >      parser_finish.add_argument('--force', '-f',
> > action=3D"store_true",
> > > > help=3D'Force continuing even if there are uncommitted changes in t=
he
> > > > source tree repository')
> > > > +    parser_finish.add_argument('--remove-work', '-r',
> > > > + action=3D"store_true", help=3D'Clean the sources directory under
> > > > + workspace')
> > > >      parser_finish.add_argument('--no-clean', '-n',
> > action=3D"store_true",
> > > help=3D'Don\'t clean the sysroot to remove recipe output')
> > > >      parser_finish.add_argument('--no-overrides', '-O',
> > action=3D"store_true",
> > > help=3D'Do not handle other override branches (if they exist)')
> > > >      parser_finish.add_argument('--dry-run', '-N',
> > > > action=3D"store_true", help=3D'Dry-run (just report changes instead=
 of
> > > > writing them)')
> > > > --
> > > > 2.7.4
> > > >
> >
> > Thanks,
> > Chandana
>
> //Peter
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000715a08059469a7a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 8, 2019 at 10:37 AM Peter Kjellerstedt &lt;<a h=
ref=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; -----Original Messa=
ge-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a> =
&lt;openembedded-<br>
&gt; <a href=3D"mailto:core-bounces@lists.openembedded.org" target=3D"_blan=
k">core-bounces@lists.openembedded.org</a>&gt; On Behalf Of Chandana Kallur=
i<br>
&gt; Sent: den 8 oktober 2019 04:14<br>
&gt; To: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com"=
 target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;<br>
&gt; Cc: Patches and discussions about the oe-core layer &lt;openembedded-<=
br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt;<br>
&gt; Subject: Re: [OE-core] [OE-Core][master][PATCH] devtool: Add --remove-=
<br>
&gt; work option for devtool reset command<br>
&gt; <br>
&gt; Hi Paul,<br>
&gt; <br>
&gt; Any thoughts on implementing this as a separate command=C2=A0 as sugge=
sted<br>
&gt; by Khem?<br>
<br>
For what it&#39;s worth, I think the original suggested solution with a new=
 <br>
option to the existing `devtool reset` and `devtool finish` commands is <br=
>
the better one.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Y=
eah thinking about it again we already have two commands which would need s=
ame functionality it=E2=80=99s not good to introduce a third one although I=
 think the usability of current solution will be a bit nicer if it was inde=
pendent option=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; Sent: Monday, October 7, 2019 11:40 AM<br>
&gt; &gt; To: Chandana Kalluri &lt;<a href=3D"mailto:ckalluri@xilinx.com" t=
arget=3D"_blank">ckalluri@xilinx.com</a>&gt;<br>
&gt; &gt; Cc: Patches and discussions about the oe-core layer &lt;openembed=
ded-<br>
&gt; &gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">=
core@lists.openembedded.org</a>&gt;<br>
&gt; &gt; Subject: Re: [OE-core] [OE-Core][master][PATCH] devtool: Add --<b=
r>
&gt; remove-work<br>
&gt; &gt; option for devtool reset command<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Oct 7, 2019 at 11:36 AM Sai Hari Chandana Kalluri<br>
&gt; &gt; &lt;<a href=3D"mailto:chandana.kalluri@xilinx.com" target=3D"_bla=
nk">chandana.kalluri@xilinx.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Enable --remove-work option for devtool reset command that a=
llows<br>
&gt; user<br>
&gt; &gt; &gt; to clean up source directory within workspace.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Currently devtool reset command only removes recipes and use=
r is<br>
&gt; &gt; &gt; forced to manually remove the sources directory within the<b=
r>
&gt; workspace<br>
&gt; &gt; &gt; before running devtool modify again.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Using devtool reset -r or devtool reset --remove-work option=
, user<br>
&gt; can<br>
&gt; &gt; &gt; cleanup the sources directory along with the recipe instead =
of<br>
&gt; &gt; &gt; manually cleaning it.<br>
&gt; &gt;<br>
&gt; &gt; perhaps we can have another cmd like &quot;reset-all&quot; like c=
leanall ?<br>
&gt; &gt; which would remove everything that devtool did external to bblaye=
rs<br>
&gt; for that<br>
&gt; &gt; recipe.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; syntax: devtool reset -r &lt;recipename&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Ex: devtool reset -r zip<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devtool finish -r &lt;recip=
ename&gt; &lt;layer-name&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Ex: devtool finish -r zip meta-yocto-bsp<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Sai Hari Chandana Kalluri<br>
&gt; &lt;<a href=3D"mailto:chandana.kalluri@xilinx.com" target=3D"_blank">c=
handana.kalluri@xilinx.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 scripts/lib/devtool/standard.py | 26 +++++++++++++++++=
++-------<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 19 insertions(+), 7 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/scripts/lib/devtool/standard.py<br>
&gt; &gt; &gt; b/scripts/lib/devtool/standard.py index 60c9a04..1c0cd8a 100=
644<br>
&gt; &gt; &gt; --- a/scripts/lib/devtool/standard.py<br>
&gt; &gt; &gt; +++ b/scripts/lib/devtool/standard.py<br>
&gt; &gt; &gt; @@ -1852,7 +1852,7 @@ def status(args, config, basepath,<br>
&gt; workspace):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -def _reset(recipes, no_clean, config, basepath, workspace):=
<br>
&gt; &gt; &gt; +def _reset(recipes, no_clean, remove_work, config, basepath=
,<br>
&gt; workspace):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Reset one or more reci=
pes&quot;&quot;&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 import oe.path<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -1930,10 +1930,15 @@ def _reset(recipes, no_clean, config=
,<br>
&gt; basepath,<br>
&gt; &gt; workspace):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srctreebase =3D workspace[=
pn][&#39;srctreebase&#39;]<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isdir(srctreeba=
se):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.listdi=
r(srctreebase):<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # W=
e don&#39;t want to risk wiping out any work in<br>
&gt; progress<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a =
href=3D"http://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.inf=
o</a>(&#39;Leaving source tree %s as-is; if you<br>
&gt; no &#39;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;longer need it then please dele=
te it<br>
&gt; manually&#39;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % srctreebase)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if remove_work:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" =
target=3D"_blank">logger.info</a>(&#39;-r argument used on %s,<br>
&gt; removing source tree.&#39;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; Yo=
u will lose any unsaved<br>
&gt; work&#39; %pn)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(srctreebase)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # We don&#39;t want to risk wiping out any<br>
&gt; work in progress<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" =
target=3D"_blank">logger.info</a>(&#39;Leaving source tree %s as-is;<br>
&gt; if you no &#39;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;lon=
ger need it then please<br>
&gt; delete it manually&#39;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % srctre=
ebase)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 # This is unlikely, but if it&#39;s empty we can just<br>
&gt; remove it<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.rmdir(srctreebase) @@ -1943,6 +1948,10 @@ def<br>
&gt; &gt; &gt; _reset(recipes, no_clean, config, basepath, workspace):<br>
&gt; &gt; &gt;=C2=A0 def reset(args, config, basepath, workspace):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Entry point for the de=
vtool &#39;reset&#39; subcommand&quot;&quot;&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 import bb<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 import shutil<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 recipes =3D &quot;&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if args.recipename:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if args.all:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Devtoo=
lError(&quot;Recipe cannot be specified if<br>
&gt; &gt; &gt; -a/--all is used&quot;) @@ -1957,7 +1966,7 @@ def reset(args=
, config,<br>
&gt; basepath,<br>
&gt; &gt; workspace):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 recipes =3D args.recipenam=
e<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 _reset(recipes, args.no_clean, config, basepa=
th, workspace)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 _reset(recipes, args.no_clean, args.remove_wo=
rk, config,<br>
&gt; &gt; &gt; + basepath, workspace)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -2009,6 +2018,7 @@ def finish(args, config, basepath,<br>
&gt; workspace):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Devtoo=
lError(&#39;Source tree is not<br>
&gt; &gt; &gt; clean:\n\n%s\nEnsure you have committed your changes or use =
-f/--<br>
&gt; force<br>
&gt; &gt; &gt; if you are sure there\&#39;s nothing that needs to be commit=
ted&#39; %<br>
&gt; dirty)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 no_clean =3D args.no_clean<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 remove_work=3Dargs.remove_work<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 tinfoil =3D setup_tinfoil(basepath=3Dbas=
epath, tracking=3DTrue)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rd =3D parse_recipe(config=
, tinfoil, args.recipename, True)<br>
&gt; @@<br>
&gt; &gt; &gt; -2160,7 +2170,7 @@ def finish(args, config, basepath, worksp=
ace):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if args.dry_run:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.i=
nfo" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Resetting re=
cipe (dry-run)&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 _reset([args.recipename], no_cl=
ean=3Dno_clean,<br>
&gt; config=3Dconfig,<br>
&gt; &gt; basepath=3Dbasepath, workspace=3Dworkspace)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _reset([args.recipename], no_cl=
ean=3Dno_clean,<br>
&gt; &gt; &gt; + remove_work=3Dremove_work, config=3Dconfig, basepath=3Dbas=
epath,<br>
&gt; &gt; &gt; + workspace=3Dworkspace)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -2272,6 +2282,7 @@ def register_commands(subparsers, cont=
ext):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_reset.add_argument(&#39;recipenam=
e&#39;, nargs=3D&#39;*&#39;,<br>
&gt; help=3D&#39;Recipe to<br>
&gt; &gt; reset&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_reset.add_argument(&#39;--all&#39=
;, &#39;-a&#39;, action=3D&quot;store_true&quot;,<br>
&gt; help=3D&#39;Reset all<br>
&gt; &gt; recipes (clear workspace)&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_reset.add_argument(&#39;--no-clea=
n&#39;, &#39;-n&#39;,<br>
&gt; &gt; &gt; action=3D&quot;store_true&quot;, help=3D&#39;Don\&#39;t clea=
n the sysroot to remove<br>
&gt; recipe<br>
&gt; &gt; &gt; output&#39;)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 parser_reset.add_argument(&#39;--remove-work&=
#39;, &#39;-r&#39;,<br>
&gt; &gt; &gt; + action=3D&quot;store_true&quot;, help=3D&#39;Clean the sou=
rces directory along with<br>
&gt; &gt; &gt; + append&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_reset.set_defaults(func=3Dreset)<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_finish =3D subparsers.add_parser(=
&#39;finish&#39;, help=3D&#39;Finish<br>
&gt; &gt; &gt; working on a recipe in your workspace&#39;, @@ -2282,6 +2293=
,7 @@ def<br>
&gt; &gt; register_commands(subparsers, context):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_finish.add_argument(&#39;--mode&#=
39;, &#39;-m&#39;, choices=3D[&#39;patch&#39;,<br>
&gt; &#39;srcrev&#39;,<br>
&gt; &gt; &#39;auto&#39;], default=3D&#39;auto&#39;, help=3D&#39;Update mod=
e (where %(metavar)s is<br>
&gt; %(choices)s;<br>
&gt; &gt; default is %(default)s)&#39;, metavar=3D&#39;MODE&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_finish.add_argument(&#39;--initia=
l-rev&#39;, help=3D&#39;Override<br>
&gt; starting revision<br>
&gt; &gt; for patches&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_finish.add_argument(&#39;--force&=
#39;, &#39;-f&#39;,<br>
&gt; action=3D&quot;store_true&quot;,<br>
&gt; &gt; &gt; help=3D&#39;Force continuing even if there are uncommitted c=
hanges in the<br>
&gt; &gt; &gt; source tree repository&#39;)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 parser_finish.add_argument(&#39;--remove-work=
&#39;, &#39;-r&#39;,<br>
&gt; &gt; &gt; + action=3D&quot;store_true&quot;, help=3D&#39;Clean the sou=
rces directory under<br>
&gt; &gt; &gt; + workspace&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_finish.add_argument(&#39;--no-cle=
an&#39;, &#39;-n&#39;,<br>
&gt; action=3D&quot;store_true&quot;,<br>
&gt; &gt; help=3D&#39;Don\&#39;t clean the sysroot to remove recipe output&=
#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_finish.add_argument(&#39;--no-ove=
rrides&#39;, &#39;-O&#39;,<br>
&gt; action=3D&quot;store_true&quot;,<br>
&gt; &gt; help=3D&#39;Do not handle other override branches (if they exist)=
&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_finish.add_argument(&#39;--dry-ru=
n&#39;, &#39;-N&#39;,<br>
&gt; &gt; &gt; action=3D&quot;store_true&quot;, help=3D&#39;Dry-run (just r=
eport changes instead of<br>
&gt; &gt; &gt; writing them)&#39;)<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.7.4<br>
&gt; &gt; &gt;<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Chandana<br>
<br>
//Peter<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000715a08059469a7a2--
