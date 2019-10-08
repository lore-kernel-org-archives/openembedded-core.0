Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A7E2578F72
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 17:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CD7B0183E6;
	Tue,  8 Oct 2019 19:37:04 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id lUFsm4s2JApk; Tue,  8 Oct 2019 19:37:03 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2492D18324;
	Tue,  8 Oct 2019 19:37:03 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F010B1A062;
	Tue,  8 Oct 2019 19:37:02 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E26EA1A061;
	Tue,  8 Oct 2019 19:37:02 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue,  8 Oct 2019 19:37:02 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id D552AF5;
	Tue,  8 Oct 2019 19:37:02 +0200 (CEST)
Received: from XBOX03.axis.com (10.0.5.17) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Tue, 8 Oct 2019 19:37:02 +0200
Received: from XBOX03.axis.com ([fe80::e49e:4060:87cc:61a]) by XBOX03.axis.com
	([fe80::e49e:4060:87cc:61a%22]) with mapi id 15.00.1365.000;
	Tue, 8 Oct 2019 19:37:02 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Chandana Kalluri <ckalluri@xilinx.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [OE-Core][master][PATCH] devtool: Add --remove-work
	option for devtool reset command
Thread-Index: AQHVfT60AF59rfuGaECadqNYtKYGsqdP4CyAgAEhpCA=
Date: Tue, 8 Oct 2019 17:37:02 +0000
Message-ID: <e18958c001784a0ca0d5c2ff73fa2e42@XBOX03.axis.com>
References: <1570473350-6427-1-git-send-email-chandana.kalluri@xilinx.com>
	<CAMKF1sr2yLJBiE6VdORpxJDg9fvYbNNXb2z7ZbMWcE8rKFkfUQ@mail.gmail.com>
	<MWHPR02MB2576CA239828D4BD746538FEB09A0@MWHPR02MB2576.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR02MB2576CA239828D4BD746538FEB09A0@MWHPR02MB2576.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 08 Oct 2019 17:37:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Chandana Kalluri
> Sent: den 8 oktober 2019 04:14
> To: Paul Eggleton <paul.eggleton@linux.intel.com>
> Cc: Patches and discussions about the oe-core layer <openembedded-
> core@lists.openembedded.org>
> Subject: Re: [OE-core] [OE-Core][master][PATCH] devtool: Add --remove-
> work option for devtool reset command
>=20
> Hi Paul,
>=20
> Any thoughts on implementing this as a separate command  as suggested
> by Khem?

For what it's worth, I think the original suggested solution with a new=20
option to the existing `devtool reset` and `devtool finish` commands is=20
the better one.

> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Monday, October 7, 2019 11:40 AM
> > To: Chandana Kalluri <ckalluri@xilinx.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [OE-Core][master][PATCH] devtool: Add --
> remove-work
> > option for devtool reset command
> >
> > On Mon, Oct 7, 2019 at 11:36 AM Sai Hari Chandana Kalluri
> > <chandana.kalluri@xilinx.com> wrote:
> > >
> > > Enable --remove-work option for devtool reset command that allows
> user
> > > to clean up source directory within workspace.
> > >
> > > Currently devtool reset command only removes recipes and user is
> > > forced to manually remove the sources directory within the
> workspace
> > > before running devtool modify again.
> > >
> > > Using devtool reset -r or devtool reset --remove-work option, user
> can
> > > cleanup the sources directory along with the recipe instead of
> > > manually cleaning it.
> >
> > perhaps we can have another cmd like "reset-all" like cleanall ?
> > which would remove everything that devtool did external to bblayers
> for that
> > recipe.
> >
> > >
> > > syntax: devtool reset -r <recipename>
> > >     Ex: devtool reset -r zip
> > >
> > >         devtool finish -r <recipename> <layer-name>
> > >     Ex: devtool finish -r zip meta-yocto-bsp
> > >
> > > Signed-off-by: Sai Hari Chandana Kalluri
> <chandana.kalluri@xilinx.com>
> > > ---
> > >  scripts/lib/devtool/standard.py | 26 +++++++++++++++++++-------
> > >  1 file changed, 19 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/scripts/lib/devtool/standard.py
> > > b/scripts/lib/devtool/standard.py index 60c9a04..1c0cd8a 100644
> > > --- a/scripts/lib/devtool/standard.py
> > > +++ b/scripts/lib/devtool/standard.py
> > > @@ -1852,7 +1852,7 @@ def status(args, config, basepath,
> workspace):
> > >      return 0
> > >
> > >
> > > -def _reset(recipes, no_clean, config, basepath, workspace):
> > > +def _reset(recipes, no_clean, remove_work, config, basepath,
> workspace):
> > >      """Reset one or more recipes"""
> > >      import oe.path
> > >
> > > @@ -1930,10 +1930,15 @@ def _reset(recipes, no_clean, config,
> basepath,
> > workspace):
> > >          srctreebase =3D workspace[pn]['srctreebase']
> > >          if os.path.isdir(srctreebase):
> > >              if os.listdir(srctreebase):
> > > -                # We don't want to risk wiping out any work in
> progress
> > > -                logger.info('Leaving source tree %s as-is; if you
> no '
> > > -                            'longer need it then please delete it
> manually'
> > > -                            % srctreebase)
> > > +                    if remove_work:
> > > +                        logger.info('-r argument used on %s,
> removing source tree.'
> > > +                                    ' You will lose any unsaved
> work' %pn)
> > > +                        shutil.rmtree(srctreebase)
> > > +                    else:
> > > +                        # We don't want to risk wiping out any
> work in progress
> > > +                        logger.info('Leaving source tree %s as-is;
> if you no '
> > > +                                    'longer need it then please
> delete it manually'
> > > +                                    % srctreebase)
> > >              else:
> > >                  # This is unlikely, but if it's empty we can just
> remove it
> > >                  os.rmdir(srctreebase) @@ -1943,6 +1948,10 @@ def
> > > _reset(recipes, no_clean, config, basepath, workspace):
> > >  def reset(args, config, basepath, workspace):
> > >      """Entry point for the devtool 'reset' subcommand"""
> > >      import bb
> > > +    import shutil
> > > +
> > > +    recipes =3D ""
> > > +
> > >      if args.recipename:
> > >          if args.all:
> > >              raise DevtoolError("Recipe cannot be specified if
> > > -a/--all is used") @@ -1957,7 +1966,7 @@ def reset(args, config,
> basepath,
> > workspace):
> > >      else:
> > >          recipes =3D args.recipename
> > >
> > > -    _reset(recipes, args.no_clean, config, basepath, workspace)
> > > +    _reset(recipes, args.no_clean, args.remove_work, config,
> > > + basepath, workspace)
> > >
> > >      return 0
> > >
> > > @@ -2009,6 +2018,7 @@ def finish(args, config, basepath,
> workspace):
> > >              raise DevtoolError('Source tree is not
> > > clean:\n\n%s\nEnsure you have committed your changes or use -f/--
> force
> > > if you are sure there\'s nothing that needs to be committed' %
> dirty)
> > >
> > >      no_clean =3D args.no_clean
> > > +    remove_work=3Dargs.remove_work
> > >      tinfoil =3D setup_tinfoil(basepath=3Dbasepath, tracking=3DTrue)
> > >      try:
> > >          rd =3D parse_recipe(config, tinfoil, args.recipename, True)
> @@
> > > -2160,7 +2170,7 @@ def finish(args, config, basepath, workspace):
> > >      if args.dry_run:
> > >          logger.info('Resetting recipe (dry-run)')
> > >      else:
> > > -        _reset([args.recipename], no_clean=3Dno_clean,
> config=3Dconfig,
> > basepath=3Dbasepath, workspace=3Dworkspace)
> > > +        _reset([args.recipename], no_clean=3Dno_clean,
> > > + remove_work=3Dremove_work, config=3Dconfig, basepath=3Dbasepath,
> > > + workspace=3Dworkspace)
> > >
> > >      return 0
> > >
> > > @@ -2272,6 +2282,7 @@ def register_commands(subparsers, context):
> > >      parser_reset.add_argument('recipename', nargs=3D'*',
> help=3D'Recipe to
> > reset')
> > >      parser_reset.add_argument('--all', '-a', action=3D"store_true",
> help=3D'Reset all
> > recipes (clear workspace)')
> > >      parser_reset.add_argument('--no-clean', '-n',
> > > action=3D"store_true", help=3D'Don\'t clean the sysroot to remove
> recipe
> > > output')
> > > +    parser_reset.add_argument('--remove-work', '-r',
> > > + action=3D"store_true", help=3D'Clean the sources directory along wi=
th
> > > + append')
> > >      parser_reset.set_defaults(func=3Dreset)
> > >
> > >      parser_finish =3D subparsers.add_parser('finish', help=3D'Finish
> > > working on a recipe in your workspace', @@ -2282,6 +2293,7 @@ def
> > register_commands(subparsers, context):
> > >      parser_finish.add_argument('--mode', '-m', choices=3D['patch',
> 'srcrev',
> > 'auto'], default=3D'auto', help=3D'Update mode (where %(metavar)s is
> %(choices)s;
> > default is %(default)s)', metavar=3D'MODE')
> > >      parser_finish.add_argument('--initial-rev', help=3D'Override
> starting revision
> > for patches')
> > >      parser_finish.add_argument('--force', '-f',
> action=3D"store_true",
> > > help=3D'Force continuing even if there are uncommitted changes in the
> > > source tree repository')
> > > +    parser_finish.add_argument('--remove-work', '-r',
> > > + action=3D"store_true", help=3D'Clean the sources directory under
> > > + workspace')
> > >      parser_finish.add_argument('--no-clean', '-n',
> action=3D"store_true",
> > help=3D'Don\'t clean the sysroot to remove recipe output')
> > >      parser_finish.add_argument('--no-overrides', '-O',
> action=3D"store_true",
> > help=3D'Do not handle other override branches (if they exist)')
> > >      parser_finish.add_argument('--dry-run', '-N',
> > > action=3D"store_true", help=3D'Dry-run (just report changes instead o=
f
> > > writing them)')
> > > --
> > > 2.7.4
> > >
>=20
> Thanks,
> Chandana

//Peter

