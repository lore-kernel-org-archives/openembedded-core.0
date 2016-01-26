Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id E3FE676FFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 03:14:14 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id z14so48680734igp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 19:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=QJy4DzpzvjpovRDgP5I2tARyzQwlZUNCyXm3qxGTD5U=;
	b=IWc5EebwmpXNGAMuIVoGW29zovWSS90P5B1WazhGROaNQccgK9n0CJY3nGw3KCi6Xi
	5VDH0ljK0dd4CXb0u0XW5toyQv40qI1fIAFpO2RB+TXbwbyB3YEtDfaU05cc0U/aALwp
	G+ikYF7WUkMxxTRhAKE8SpSx9UaIAFBZlJVnrrjFmIz/r1xQwjzmsE49nzWAiHzI2Qgc
	0AIG7b9Pb2PjaAHTOyPDMOckmh1oHN8Q0Sx7JFFX/bznVgNuOtrLtVn1vm/7keUOniof
	3sEI83o68gjkpP5ZdWAVrieWWkV/4gqXO7kO0RWDc+VUJAiMoT1s/AgV06Q2gx0DOlwf
	ttKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=QJy4DzpzvjpovRDgP5I2tARyzQwlZUNCyXm3qxGTD5U=;
	b=Y3Xq/OkP00+Xsk62pCwIrdwo6cY91dF1lqnRAoPnheSuMCnSWyPUik/H3oN7JcPQ+X
	VF/1OeBSXJOFCUXZhxgd5GSYuMLuOapuF6mGFn6cxVroAM2UaTSH7E5ns1m95S4cOr2T
	OcVVcm+M4IS4aOcW40XoIlrl+AAFL2OflSO3tmvrX4pkvd19iFN7+siWkGetvnHP3PdZ
	KIH13BiTJVVWe1fnwKB47nkm1muOM3b2l5AIbFjnN8spNvFAeDsH5xaw0HkQxFT9tMNH
	oY9CkidzTm+Q/OLqv5yop9EdJSTrun9Ga9u1X44dyW2kUl1vHefXrx7mpWdeDYxzW0kt
	O5ow==
X-Gm-Message-State: AG10YOR19O/m1x4dZf4hdlbkop9ry/h6pUpX30KpMZM2f1uXfOBS4dAqpZOyN12S//xV9w==
X-Received: by 10.50.33.20 with SMTP id n20mr20830769igi.17.1453778055189;
	Mon, 25 Jan 2016 19:14:15 -0800 (PST)
Received: from [172.20.3.0] ([216.127.112.200])
	by smtp.gmail.com with ESMTPSA id a5sm742719iga.7.2016.01.25.19.14.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jan 2016 19:14:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <f0d6af6cc36a915e3fa5419de800d51c30162c37.1453776397.git.paul.eggleton@linux.intel.com>
Date: Mon, 25 Jan 2016 22:14:09 -0500
Message-Id: <7904F7D3-27C7-4A18-8A7E-2D201E9F048A@gmail.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
	<cover.1453776397.git.paul.eggleton@linux.intel.com>
	<f0d6af6cc36a915e3fa5419de800d51c30162c37.1453776397.git.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] devtool: add configure-help subcommand
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
X-List-Received-Date: Tue, 26 Jan 2016 03:14:17 -0000
X-Groupsio-MsgNum: 76891
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F27912AF-7943-4018-8831-2CC01F5C55BC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F27912AF-7943-4018-8831-2CC01F5C55BC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 25, 2016, at 9:53 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> When you need to set EXTRA_OECONF for a recipe, you need to know what
> options the configure script actually supports; the configure script
> however is only accessible from within a devshell and (at least in the
> case of autotooled software fetched from an SCM repository) may not
> actually exist until do_configure has run. Thus, provide a "devtool
> configure-help" subcommand that runs the configure script for a recipe
> with --help and shows you the output through a pager (e.g. less),
> prefaced by a header describing the current options being specified.
>=20
> There is basic support for autotools, cmake and bare configure =
scripts.
> The cmake support is a little hacky since cmake doesn't really have a
> concise help option that lists user-defined knobs (without actually
> running through the configure process), however that being a design
> feature of cmake there's not much I can think of to do about that at
> the moment.
>=20

this option is autotools specific. We need to convey this precisely. may =
be involve autotools
in the option name or something

> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> scripts/lib/devtool/__init__.py |   9 ++-
> scripts/lib/devtool/utilcmds.py | 170 =
++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 175 insertions(+), 4 deletions(-)
>=20
> diff --git a/scripts/lib/devtool/__init__.py =
b/scripts/lib/devtool/__init__.py
> index 0405d22..ff97dfc 100644
> --- a/scripts/lib/devtool/__init__.py
> +++ b/scripts/lib/devtool/__init__.py
> @@ -129,7 +129,7 @@ def get_recipe_file(cooker, pn):
>             logger.error("Unable to find any recipe file matching %s" =
% pn)
>     return recipefile
>=20
> -def parse_recipe(config, tinfoil, pn, appends):
> +def parse_recipe(config, tinfoil, pn, appends, =
filter_workspace=3DTrue):
>     """Parse recipe of a package"""
>     import oe.recipeutils
>     recipefile =3D get_recipe_file(tinfoil.cooker, pn)
> @@ -138,9 +138,10 @@ def parse_recipe(config, tinfoil, pn, appends):
>         return None
>     if appends:
>         append_files =3D =
tinfoil.cooker.collection.get_file_appends(recipefile)
> -        # Filter out appends from the workspace
> -        append_files =3D [path for path in append_files if
> -                        not path.startswith(config.workspace_path)]
> +        if filter_workspace:
> +            # Filter out appends from the workspace
> +            append_files =3D [path for path in append_files if
> +                            not =
path.startswith(config.workspace_path)]
>     else:
>         append_files =3D None
>     return oe.recipeutils.parse_recipe(recipefile, append_files,
> diff --git a/scripts/lib/devtool/utilcmds.py =
b/scripts/lib/devtool/utilcmds.py
> index 375d7a3..a8f5e97 100644
> --- a/scripts/lib/devtool/utilcmds.py
> +++ b/scripts/lib/devtool/utilcmds.py
> @@ -61,6 +61,165 @@ def edit_recipe(args, config, basepath, =
workspace):
>     return 0
>=20
>=20
> +def configure_help(args, config, basepath, workspace):
> +    """Entry point for the devtool 'configure-help' subcommand"""
> +    import oe.utils
> +
> +    check_workspace_recipe(workspace, args.recipename)
> +    tinfoil =3D setup_tinfoil(config_only=3DFalse, basepath=3Dbasepath)=

> +    try:
> +        rd =3D parse_recipe(config, tinfoil, args.recipename, =
appends=3DTrue, filter_workspace=3DFalse)
> +        if not rd:
> +            return 1
> +        b =3D rd.getVar('B', True)
> +        s =3D rd.getVar('S', True)
> +        configurescript =3D os.path.join(s, 'configure')
> +        confdisabled =3D 'noexec' in rd.getVarFlags('do_configure') =
or 'do_configure' not in (rd.getVar('__BBTASKS', False) or [])
> +        configureopts =3D =
oe.utils.squashspaces(rd.getVar('CONFIGUREOPTS', True) or '')
> +        extra_oeconf =3D =
oe.utils.squashspaces(rd.getVar('EXTRA_OECONF', True) or '')
> +        extra_oecmake =3D =
oe.utils.squashspaces(rd.getVar('EXTRA_OECMAKE', True) or '')
> +        do_configure =3D rd.getVar('do_configure', True) or ''
> +        do_configure_noexpand =3D rd.getVar('do_configure', False) or =
''
> +        packageconfig =3D rd.getVarFlags('PACKAGECONFIG') or []
> +        autotools =3D bb.data.inherits_class('autotools', rd) and =
('oe_runconf' in do_configure or 'autotools_do_configure' in =
do_configure)
> +        cmake =3D bb.data.inherits_class('cmake', rd) and =
('cmake_do_configure' in do_configure)
> +        cmake_do_configure =3D rd.getVar('cmake_do_configure', True)
> +        pn =3D rd.getVar('PN', True)
> +    finally:
> +        tinfoil.shutdown()
> +
> +    if 'doc' in packageconfig:
> +        del packageconfig['doc']
> +
> +    if autotools and not os.path.exists(configurescript):
> +        logger.info('Running do_configure to generate configure =
script')
> +        try:
> +            stdout, _ =3D exec_build_env_command(config.init_path, =
basepath,
> +                                               'bitbake -c configure =
%s' % msg, args.recipename,
> +                                               =
stderr=3Dsubprocess.STDOUT)
> +        except bb.process.ExecutionError:
> +            pass
> +
> +    if confdisabled or do_configure.strip() in ('', ':'):
> +        raise DevtoolError("do_configure task has been disabled for =
this recipe")
> +    elif args.no_pager and not os.path.exists(configurescript):
> +        raise DevtoolError("No configure script found and no other =
information to display")
> +    else:
> +        configopttext =3D ''
> +        if autotools and configureopts:
> +            configopttext =3D '''
> +Arguments currently passed to the configure script:
> +
> +%s
> +
> +Some of those are fixed.''' % (configureopts + ' ' + extra_oeconf)
> +            if extra_oeconf:
> +                configopttext +=3D ''' The ones that are specified =
through EXTRA_OECONF (which you can change or add to easily):
> +
> +%s''' % extra_oeconf
> +
> +        elif cmake:
> +            in_cmake =3D False
> +            cmake_cmd =3D ''
> +            for line in cmake_do_configure.splitlines():
> +                if in_cmake:
> +                    cmake_cmd =3D cmake_cmd + ' ' + =
line.strip().rstrip('\\')
> +                    if not line.endswith('\\'):
> +                        break
> +                if line.lstrip().startswith('cmake '):
> +                    cmake_cmd =3D line.strip().rstrip('\\')
> +                    if line.endswith('\\'):
> +                        in_cmake =3D True
> +                    else:
> +                        break
> +            if cmake_cmd:
> +                configopttext =3D '''
> +The current cmake command line:
> +
> +%s
> +
> +Arguments specified through EXTRA_OECMAKE (which you can change or =
add to easily)
> +
> +%s''' % (oe.utils.squashspaces(cmake_cmd), extra_oecmake)
> +            else:
> +                configopttext =3D '''
> +The current implementation of cmake_do_configure:
> +
> +cmake_do_configure() {
> +%s
> +}
> +
> +Arguments specified through EXTRA_OECMAKE (which you can change or =
add to easily)
> +
> +%s''' % (cmake_do_configure.rstrip(), extra_oecmake)
> +
> +        elif do_configure:
> +            configopttext =3D '''
> +The current implementation of do_configure:
> +
> +do_configure() {
> +%s
> +}''' % do_configure.rstrip()
> +            if '${EXTRA_OECONF}' in do_configure_noexpand:
> +                configopttext +=3D '''
> +
> +Arguments specified through EXTRA_OECONF (which you can change or add =
to easily):
> +
> +%s''' % extra_oeconf
> +
> +        if packageconfig:
> +            configopttext +=3D '''
> +
> +Some of these options may be controlled through PACKAGECONFIG; for =
more details please see the recipe.'''
> +
> +        if args.arg:
> +            helpargs =3D ' '.join(args.arg)
> +        elif cmake:
> +            helpargs =3D '-LH'
> +        else:
> +            helpargs =3D '--help'
> +
> +        msg =3D '''configure information for %s
> +------------------------------------------
> +%s''' % (pn, configopttext)
> +
> +        if cmake:
> +            msg +=3D '''
> +
> +The cmake %s output for %s follows. After "-- Cache values" you =
should see a list of variables you can add to EXTRA_OECMAKE (prefixed =
with -D and suffixed with =3D followed by the desired value, without any =
spaces).
> +------------------------------------------''' % (helpargs, pn)
> +        elif os.path.exists(configurescript):
> +            msg +=3D '''
> +
> +The ./configure %s output for %s follows.
> +------------------------------------------''' % (helpargs, pn)
> +
> +        olddir =3D os.getcwd()
> +        tmppath =3D tempfile.mkdtemp()
> +        with tempfile.NamedTemporaryFile('w', delete=3DFalse) as tf:
> +            if not args.no_header:
> +                tf.write(msg + '\n')
> +            tf.close()
> +            try:
> +                try:
> +                    cmd =3D 'cat %s' % tf.name
> +                    if cmake:
> +                        cmd +=3D '; cmake %s %s 2>&1' % (helpargs, s)
> +                        os.chdir(b)
> +                    elif os.path.exists(configurescript):
> +                        cmd +=3D '; %s %s' % (configurescript, =
helpargs)
> +                    if sys.stdout.isatty() and not args.no_pager:
> +                        pager =3D os.environ.get('PAGER', 'less')
> +                        cmd =3D '(%s) | %s' % (cmd, pager)
> +                    subprocess.check_call(cmd, shell=3DTrue)
> +                except subprocess.CalledProcessError as e:
> +                    return e.returncode
> +            finally:
> +                os.chdir(olddir)
> +                shutil.rmtree(tmppath)
> +                os.remove(tf.name)
> +
> +
> def register_commands(subparsers, context):
>     """Register devtool subcommands from this plugin"""
>     parser_edit_recipe =3D subparsers.add_parser('edit-recipe', =
help=3D'Edit a recipe file in your workspace',
> @@ -68,3 +227,14 @@ def register_commands(subparsers, context):
>     parser_edit_recipe.add_argument('recipename', help=3D'Recipe to =
edit')
>     parser_edit_recipe.add_argument('--any-recipe', '-a', =
action=3D"store_true", help=3D'Edit any recipe, not just where the =
recipe file itself is in the workspace')
>     parser_edit_recipe.set_defaults(func=3Dedit_recipe)
> +
> +    # NOTE: Needed to override the usage string here since the =
default
> +    # gets the order wrong - recipename must come before --arg
> +    parser_configure_help =3D subparsers.add_parser('configure-help', =
help=3D'Get help on configure script options',
> +                                         usage=3D'devtool =
configure-help [options] recipename [--arg ...]',
> +                                         description=3D'Displays the =
help for the configure script for the specified recipe (i.e. runs =
./configure --help) prefaced by a header describing the current options =
being specified. Output is piped through less (or whatever PAGER is set =
to, if set) for easy browsing.')
> +    parser_configure_help.add_argument('recipename', help=3D'Recipe =
to show configure help for')
> +    parser_configure_help.add_argument('-p', '--no-pager', =
help=3D'Disable paged output', action=3D"store_true")
> +    parser_configure_help.add_argument('-n', '--no-header', =
help=3D'Disable explanatory header text', action=3D"store_true")
> +    parser_configure_help.add_argument('--arg', help=3D'Pass =
remaining arguments to the configure script instead of --help (useful if =
the script has additional help options)', nargs=3Dargparse.REMAINDER)
> +    parser_configure_help.set_defaults(func=3Dconfigure_help)
> --
> 2.5.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_F27912AF-7943-4018-8831-2CC01F5C55BC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlam5IUACgkQuwUzVZGdMxRiPgCfRtbSGeBLfsFM6HasNjDXba2y
cdQAn0jxDlFabqw/3nsLdwn+lCCZ98Fe
=ujHQ
-----END PGP SIGNATURE-----

--Apple-Mail=_F27912AF-7943-4018-8831-2CC01F5C55BC--
