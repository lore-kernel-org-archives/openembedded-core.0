Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 92C747E687
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 18:40:22 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id h144so30854234iof.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 11:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3t6RXPsRJOHgXK0KkHTgfT+Lz+SCXaAq9iBZAGH2nKM=;
	b=hYgiZ5oAeo2rbaIRyRYFQQFN6+D3ujVHDJLDa+xhf4b+8kbWCdkosc4Mw7AOV6OxST
	LAUAMozCWxrNLo0IwvHbxmzdpRceftp+HzMAev05YHoFpxubMLrjsWnUCpTSfgFSz3xG
	Co37uV3V2CvAVB0sdA+icy0IvN7mr0glZBOT4ic+34Okdu39zXrp2lfHRfID1uTGA53h
	kDLk/FMAjL1pLHIMhh3sElBLrvGBlk7EE1YBHpYVotAjBYpvF/59WRUsg45/jfF8sSuH
	mhnefVyN4DHD2RGQSIJV1VIX02nMqi2zWtJ4IT/xQe708HW55i9+hHgfCwzPxRL40Sap
	Es5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3t6RXPsRJOHgXK0KkHTgfT+Lz+SCXaAq9iBZAGH2nKM=;
	b=AMqG2LKMMZjNWjtUyVyAk1uUMoc2qoME97fwApt9uqha7lKO6Oiu2/UFHsS3KgjZCP
	cI2xo1XznWDyTrimKtwG0xbjrIuEQT2vaRLyoq+OmcVI2tVH2/NZUiWDDAV2hzS20hBd
	pWrSJKTVRWCBlcYiUbK1KEjG6VlNaGpV9N3RPPuoj0U4r5dcGZPDlwTVnX+5DFb6vqqJ
	lRJnepU99CSU5yO71FaNGrgl9umiR4uK+qs7r80RrebR89RRdYX7atpikLz+xPKhLQ4x
	BRRwZn2Ts8VUnsevJiquUIcRdWMUwUfqVTT8kSvBjPWGBh045bZEKg+NK5oypu2bJyMA
	IVzg==
X-Gm-Message-State: APjAAAVYQvr+a7NLvmOEoF1RRbd9+6NLVIaq2m/C6r8VhWLIm6ZZxbmW
	JxHrZK8/ItbszyhZ0YMBB2ZXeHwhAfxP/ODPN6iE26Da
X-Google-Smtp-Source: APXvYqwZzbbP6p1p9pX4qci/PSd3MQit1YgXHVyZa6N99Nfre/YAn8sWjhUiUi4ZaoNCur4Bj9RAIOQWwZ7RoWl1cS0=
X-Received: by 2002:a92:d2d2:: with SMTP id w18mr29937700ilg.220.1570473623170;
	Mon, 07 Oct 2019 11:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <1570473350-6427-1-git-send-email-chandana.kalluri@xilinx.com>
In-Reply-To: <1570473350-6427-1-git-send-email-chandana.kalluri@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Oct 2019 11:39:57 -0700
Message-ID: <CAMKF1sr2yLJBiE6VdORpxJDg9fvYbNNXb2z7ZbMWcE8rKFkfUQ@mail.gmail.com>
To: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
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
X-List-Received-Date: Mon, 07 Oct 2019 18:40:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 7, 2019 at 11:36 AM Sai Hari Chandana Kalluri
<chandana.kalluri@xilinx.com> wrote:
>
> Enable --remove-work option for devtool reset command that allows user
> to clean up source directory within workspace.
>
> Currently devtool reset command only removes recipes and user is forced
> to manually remove the sources directory within the workspace before
> running devtool modify again.
>
> Using devtool reset -r or devtool reset --remove-work option, user can
> cleanup the sources directory along with the recipe instead of manually
> cleaning it.

perhaps we can have another cmd like "reset-all" like cleanall ?
which would remove everything that devtool did external to bblayers
for that recipe.

>
> syntax: devtool reset -r <recipename>
>     Ex: devtool reset -r zip
>
>         devtool finish -r <recipename> <layer-name>
>     Ex: devtool finish -r zip meta-yocto-bsp
>
> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> ---
>  scripts/lib/devtool/standard.py | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
> index 60c9a04..1c0cd8a 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -1852,7 +1852,7 @@ def status(args, config, basepath, workspace):
>      return 0
>
>
> -def _reset(recipes, no_clean, config, basepath, workspace):
> +def _reset(recipes, no_clean, remove_work, config, basepath, workspace):
>      """Reset one or more recipes"""
>      import oe.path
>
> @@ -1930,10 +1930,15 @@ def _reset(recipes, no_clean, config, basepath, workspace):
>          srctreebase = workspace[pn]['srctreebase']
>          if os.path.isdir(srctreebase):
>              if os.listdir(srctreebase):
> -                # We don't want to risk wiping out any work in progress
> -                logger.info('Leaving source tree %s as-is; if you no '
> -                            'longer need it then please delete it manually'
> -                            % srctreebase)
> +                    if remove_work:
> +                        logger.info('-r argument used on %s, removing source tree.'
> +                                    ' You will lose any unsaved work' %pn)
> +                        shutil.rmtree(srctreebase)
> +                    else:
> +                        # We don't want to risk wiping out any work in progress
> +                        logger.info('Leaving source tree %s as-is; if you no '
> +                                    'longer need it then please delete it manually'
> +                                    % srctreebase)
>              else:
>                  # This is unlikely, but if it's empty we can just remove it
>                  os.rmdir(srctreebase)
> @@ -1943,6 +1948,10 @@ def _reset(recipes, no_clean, config, basepath, workspace):
>  def reset(args, config, basepath, workspace):
>      """Entry point for the devtool 'reset' subcommand"""
>      import bb
> +    import shutil
> +
> +    recipes = ""
> +
>      if args.recipename:
>          if args.all:
>              raise DevtoolError("Recipe cannot be specified if -a/--all is used")
> @@ -1957,7 +1966,7 @@ def reset(args, config, basepath, workspace):
>      else:
>          recipes = args.recipename
>
> -    _reset(recipes, args.no_clean, config, basepath, workspace)
> +    _reset(recipes, args.no_clean, args.remove_work, config, basepath, workspace)
>
>      return 0
>
> @@ -2009,6 +2018,7 @@ def finish(args, config, basepath, workspace):
>              raise DevtoolError('Source tree is not clean:\n\n%s\nEnsure you have committed your changes or use -f/--force if you are sure there\'s nothing that needs to be committed' % dirty)
>
>      no_clean = args.no_clean
> +    remove_work=args.remove_work
>      tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
>      try:
>          rd = parse_recipe(config, tinfoil, args.recipename, True)
> @@ -2160,7 +2170,7 @@ def finish(args, config, basepath, workspace):
>      if args.dry_run:
>          logger.info('Resetting recipe (dry-run)')
>      else:
> -        _reset([args.recipename], no_clean=no_clean, config=config, basepath=basepath, workspace=workspace)
> +        _reset([args.recipename], no_clean=no_clean, remove_work=remove_work, config=config, basepath=basepath, workspace=workspace)
>
>      return 0
>
> @@ -2272,6 +2282,7 @@ def register_commands(subparsers, context):
>      parser_reset.add_argument('recipename', nargs='*', help='Recipe to reset')
>      parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
>      parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
> +    parser_reset.add_argument('--remove-work', '-r', action="store_true", help='Clean the sources directory along with append')
>      parser_reset.set_defaults(func=reset)
>
>      parser_finish = subparsers.add_parser('finish', help='Finish working on a recipe in your workspace',
> @@ -2282,6 +2293,7 @@ def register_commands(subparsers, context):
>      parser_finish.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
>      parser_finish.add_argument('--initial-rev', help='Override starting revision for patches')
>      parser_finish.add_argument('--force', '-f', action="store_true", help='Force continuing even if there are uncommitted changes in the source tree repository')
> +    parser_finish.add_argument('--remove-work', '-r', action="store_true", help='Clean the sources directory under workspace')
>      parser_finish.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
>      parser_finish.add_argument('--no-overrides', '-O', action="store_true", help='Do not handle other override branches (if they exist)')
>      parser_finish.add_argument('--dry-run', '-N', action="store_true", help='Dry-run (just report changes instead of writing them)')
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

