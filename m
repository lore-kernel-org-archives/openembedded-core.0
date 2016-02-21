Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6964F77202
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 20:04:07 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id o6so49382268qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 12:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ndCadYcgRlKAGXGInhS1JUK/Z4PNfMpC5O0KsIy2x7A=;
	b=pHriderXtx6lOGT63MkZoz1wisxL7MJ7EwwqRHCpNfg1caktBRwjsTt/8SSCKhuF2T
	LdfHoO1/XbwNqJI4uSdBfH1AtiOAofQKj67KOGaajYsvJ2Uo5ISOoenePSIjoPaR96FB
	mDsX2W35esy0a0+i/t1UK4H8/pu4FMKlWlRdrvF+b/E2H7SwOQIbH6a0TMKCiU/qA7xd
	JVmxdBCBEtzvafiXzXH95XDHSdxi2s6gMc2lFWPwmGsteQDCi5TuWp9CB/tu7LIPOljj
	IBAOCz6ebxsMmSKF/BgR7OvFhSxr7/PQJmgXJlwxtvKFxlk95AfJsUIraVca44YIXUbL
	NB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ndCadYcgRlKAGXGInhS1JUK/Z4PNfMpC5O0KsIy2x7A=;
	b=Ifdm16TpxAhlE/4vXE816lkaV0vQWIvPqgixq0uMN6JgISVAAsyZZiTO7SP9MaOwT/
	2QzPMazxIvbZQ3huzsram+yaprOjtkf7yi8WRNuYT0Fl/Om9pceDPU82vaHElplXh1rT
	T+vDT1gsi9ixpzvmNcvDforsVT0TowDvltiaEBZWEPSnZFImNgQgihXkB3yHNa1SSBcA
	ncc8qdvgkMlN2x6bg94HA9XFmNywreVZBNhUJnvtGzzTKEyfMq1+SjKwLKgjZoylHz4r
	i1OWYFhfcnUMqWyIwcL1EJYxCvd1UwSSBSvaLvAjCTP3+m954qyb6pmbBobJj/wQBS9H
	AOWQ==
X-Gm-Message-State: AG10YOR1TwkqnrRIiv7r8AcD6DzZNGms/Pq09rCEXHNYpttmLybT3CVdVamiU9PDmmowhp+EMBN3sxIWvIMdfg==
X-Received: by 10.55.74.197 with SMTP id x188mr30347591qka.104.1456085048284; 
	Sun, 21 Feb 2016 12:04:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sun, 21 Feb 2016 12:03:38 -0800 (PST)
In-Reply-To: <1632772.bzTqIUMtMe@peggleto-mobl.ger.corp.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
	<b2f6e7831b5d83d8ac11f4c0f11b76a695a6b124.1455874585.git.paul.eggleton@linux.intel.com>
	<CAMKF1sqQeXqAX-=rfHnsebK+41g19ztppRbbw0iciz1FNz2VJA@mail.gmail.com>
	<1632772.bzTqIUMtMe@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Feb 2016 12:03:38 -0800
Message-ID: <CAMKF1srmJNXYfTY0VPHiqnYzaeArnuh0fvRN6Nty6zVYHbXZxw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/14] devtool: deploy-target: preserve existing files
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
X-List-Received-Date: Sun, 21 Feb 2016 20:04:08 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 21, 2016 at 11:30 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Khem,
>
> On Sat, 20 Feb 2016 11:20:42 Khem Raj wrote:
>> On Fri, Feb 19, 2016 at 1:38 AM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > If files would be overwritten by the deployment, preserve them in a
>> > separate location on the target so that they can be restored if you
>> > later run devtool undeploy-target.
>> >
>> > At the same time, also check for sufficient space before starting the
>> > operation so that we avoid potentially failing part way through.
>> >
>> > Fixes [YOCTO #8978].
>> >
>> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> > ---
>> >
>> >  scripts/lib/devtool/deploy.py | 87
>> >  ++++++++++++++++++++++++++++++++++++++----- 1 file changed, 78
>> >  insertions(+), 9 deletions(-)
>> >
>> > diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
>> > index d54f6ba..66644cc 100644
>> > --- a/scripts/lib/devtool/deploy.py
>> > +++ b/scripts/lib/devtool/deploy.py
>> > @@ -28,7 +28,7 @@ logger = logging.getLogger('devtool')
>> >
>> >  deploylist_path = '/.devtool'
>> >
>> > -def _prepare_remote_script(deploy, verbose=False, dryrun=False,
>> > undeployall=False):>
>> > +def _prepare_remote_script(deploy, verbose=False, dryrun=False,
> undeployall=False, nopreserve=False, nocheckspace=False):
>> >      """
>> >      Prepare a shell script for running on the target to
>> >      deploy/undeploy files. We have to be careful what we put in this
>> >
>> > @@ -48,6 +48,7 @@ def _prepare_remote_script(deploy, verbose=False,
>> > dryrun=False, undeployall=Fals>
>> >          if not deploy:
>> >              lines.append('echo "Previously deployed files for $1:"')
>> >
>> >      lines.append('manifest="%s/$1.list"' % deploylist_path)
>> >
>> > +    lines.append('preservedir="%s/$1.preserve"' % deploylist_path)
>> >
>> >      lines.append('if [ -f $manifest ] ; then')
>> >      # Read manifest in reverse and delete files / remove empty dirs
>> >      lines.append('    sed \'1!G;h;$!d\' $manifest | while read file')
>> >
>> > @@ -58,7 +59,10 @@ def _prepare_remote_script(deploy, verbose=False,
>> > dryrun=False, undeployall=Fals>
>> >          lines.append('        fi')
>> >
>> >      else:
>> >          lines.append('        if [ -d $file ] ; then')
>> >
>> > -        lines.append('            rmdir $file > /dev/null 2>&1 || true')
>> > +        # Avoid deleting a preserved directory in case it has special
>> > perms +        lines.append('            if [ ! -d $preservedir/$file ] ;
>> > then') +        lines.append('                rmdir $file > /dev/null
>> > 2>&1 || true') +        lines.append('            fi')
>> >
>> >          lines.append('        else')
>> >          lines.append('            rm $file')
>> >          lines.append('        fi')
>> >
>> > @@ -71,6 +75,39 @@ def _prepare_remote_script(deploy, verbose=False,
>> > dryrun=False, undeployall=Fals>
>> >      lines.append('fi')
>> >
>> >      if deploy:
>> > +        if not nocheckspace:
>> > +            # Check for available space
>> > +            # FIXME This doesn't take into account files spread across
>> > multiple +            # partitions, but doing that is non-trivial
>> > +            # Find the part of the destination path that exists
>> > +            lines.append('checkpath="$2"')
>> > +            lines.append('while [ "$checkpath" != "/" ] && [ ! -e
>> > $checkpath ]') +            lines.append('do')
>> > +            lines.append('    checkpath=`dirname "$checkpath"`')
>> > +            lines.append('done')
>> > +            lines.append('freespace=`df -P $checkpath | sed "1d" | awk
>> > \'{ print $4 }\'`') +            # First line of the file is the total
>> > space
>> > +            lines.append('total=`head -n1 $3`')
>> > +            lines.append('if [ $total -gt $freespace ] ; then')
>> > +            lines.append('    echo "ERROR: insufficient space on target
>> > (available ${freespace}, needed ${total})"') +            lines.append('
>> >   exit 1')
>> > +            lines.append('fi')
>> > +        if not nopreserve:
>> > +            # Preserve any files that exist. Note that this will add to
>> > the +            # preserved list with successive deployments if the list
>> > of files +            # deployed changes, but because we've deleted any
>> > previously +            # deployed files at this point it will never
>> > preserve anything +            # that was deployed, only files that
>> > existed prior to any deploying +            # (which makes the most
>> > sense)
>> > +            lines.append('cat $3 | sed "1d" | while read file fsize')
>> > +            lines.append('do')
>> > +            lines.append('    if [ -e $file ] ; then')
>> > +            lines.append('    dest="$preservedir/$file"')
>> > +            lines.append('    mkdir -p `dirname $dest`')
>> > +            lines.append('    mv $file $dest')
>> > +            lines.append('    fi')
>> > +            lines.append('done')
>> > +            lines.append('rm $3')
>> >
>> >          lines.append('mkdir -p `dirname $manifest`')
>> >          lines.append('mkdir -p $2')
>> >
>> >          if verbose:
>> > @@ -78,6 +115,14 @@ def _prepare_remote_script(deploy, verbose=False,
>> > dryrun=False, undeployall=Fals>
>> >          else:
>> >              lines.append('    tar xv -C $2 -f - > $manifest')
>> >
>> >          lines.append('sed -i "s!^./!$2!" $manifest')
>> >
>> > +    elif not dryrun:
>> > +        # Put any preserved files back
>> > +        lines.append('if [ -d $preservedir ] ; then')
>> > +        lines.append('    cd $preservedir')
>> > +        lines.append('    find . -type f -exec mv {} /{} \;')
>> > +        lines.append('    cd /')
>> > +        lines.append('    rm -rf $preservedir')
>> > +        lines.append('fi')
>> >
>> >      if undeployall:
>> >          if not dryrun:
>> > @@ -94,6 +139,7 @@ def _prepare_remote_script(deploy, verbose=False,
>> > dryrun=False, undeployall=Fals>
>> >  def deploy(args, config, basepath, workspace):
>> >      """Entry point for the devtool 'deploy' subcommand"""
>> >      import re
>> >
>> > +    import math
>> >
>> >      import oe.recipeutils
>> >
>> >      check_workspace_recipe(workspace, args.recipename, checksrc=False)
>> >
>> > @@ -119,11 +165,23 @@ def deploy(args, config, basepath, workspace):
>> >                             'recipe? If so, the install step has not
>> >                             installed '
>> >                             'any files.' % args.recipename)
>> >
>> > +    filelist = []
>> > +    ftotalsize = 0
>> > +    for root, _, files in os.walk(recipe_outdir):
>> > +        for fn in files:
>> > +            # Get the size in kiB (since we'll be comparing it to the
>> > output of du -k) +            # MUST use lstat() here not stat() or
>> > getfilesize() since we don't want to +            # dereference symlinks
>> > +            fsize = int(math.ceil(float(os.lstat(os.path.join(root,
>> > fn)).st_size)/1024)) +            ftotalsize += fsize
>> > +            # The path as it would appear on the target
>> > +            fpath = os.path.join(destdir, os.path.relpath(root,
>> > recipe_outdir), fn) +            filelist.append((fpath, fsize))
>> > +
>> >
>> >      if args.dry_run:
>> >          print('Files to be deployed for %s on target %s:' %
>> >          (args.recipename, args.target))>
>> > -        for root, _, files in os.walk(recipe_outdir):
>> > -            for fn in files:
>> > -                print('  %s' % os.path.join(destdir,
>> > os.path.relpath(root, recipe_outdir), fn)) +        for item, _ in
>> > filelist:
>> > +            print('  %s' % item)
>> >
>> >          return 0
>> >
>> > @@ -140,11 +198,20 @@ def deploy(args, config, basepath, workspace):
>> >      tmpdir = tempfile.mkdtemp(prefix='devtool')
>> >
>> >      try:
>> >          tmpscript = '/tmp/devtool_deploy.sh'
>> >
>> > -        shellscript = _prepare_remote_script(deploy=True,
>> > verbose=args.show_status) +        tmpfilelist =
>> > os.path.join(os.path.dirname(tmpscript), 'devtool_deploy.list') +
>> > shellscript = _prepare_remote_script(deploy=True,
>> > +                                             verbose=args.show_status,
>> > +                                             nopreserve=args.no_preserve,
>> > +
>> > nocheckspace=args.no_check_space)>
>> >          # Write out the script to a file
>> >
>> >          with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w')
> as f:
>> >              f.write(shellscript)
>> >
>> > -        # Copy it to the target
>> > +        # Write out the file list
>> > +        with open(os.path.join(tmpdir, os.path.basename(tmpfilelist)),
>> > 'w') as f: +            f.write('%d\n' % ftotalsize)
>> > +            for fpath, fsize in filelist:
>> > +                f.write('%s %d\n' % (fpath, fsize))
>> > +        # Copy them to the target
>> >
>> >          ret = subprocess.call("scp %s %s/* %s:%s" % (extraoptions,
>> >          tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)>
>> >          if ret != 0:
>> >              raise DevtoolError('Failed to copy script to %s - rerun with
>> >              -s to '
>> >
>> > @@ -153,7 +220,7 @@ def deploy(args, config, basepath, workspace):
>> >          shutil.rmtree(tmpdir)
>> >
>> >      # Now run the script
>> >
>> > -    ret = exec_fakeroot(rd, 'tar cf - . | ssh %s %s \'sh %s %s %s\'' %
>> > (extraoptions, args.target, tmpscript, args.recipename, destdir),
>> > cwd=recipe_outdir, shell=True) +    ret = exec_fakeroot(rd, 'tar cf - . |
>> > ssh %s %s \'sh %s %s %s %s\'' % (extraoptions, args.target, tmpscript,
>> > args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)>
>> >      if ret != 0:
>> >          raise DevtoolError('Deploy failed - rerun with -s to get a
>> >          complete '
>> >
>> >                             'error message')
>> >
>> > @@ -213,13 +280,15 @@ def register_commands(subparsers, context):
>> >      """Register devtool subcommands from the deploy plugin"""
>> >      parser_deploy = subparsers.add_parser('deploy-target',
>> >
>> >                                            help='Deploy recipe output
>> >                                            files to live target machine',
>> >
>> > -                                          description='Deploys a
>> > recipe\'s build output (i.e. the output of the do_install task) to a live
>> > target machine over ssh. Note: this only deploys the recipe itself and
>> > not any runtime dependencies, so it is assumed that those have been
>> > installed on the target beforehand.', +
>> >        description='Deploys a recipe\'s build output (i.e. the output of
>> > the do_install task) to a live target machine over ssh. By default, any
>> > existing files will be preserved instead of being overwritten and will be
>> > restored if you run devtool undeploy-target. Note: this only deploys the
>> > recipe itself and not any runtime dependencies, so it is assumed that
>> > those have been installed on the target beforehand.',>
>> >                                            group='testbuild')
>> >
>> >      parser_deploy.add_argument('recipename', help='Recipe to deploy')
>> >      parser_deploy.add_argument('target', help='Live target machine
>> >      running an ssh server: user@hostname[:destdir]')
>> >      parser_deploy.add_argument('-c', '--no-host-check', help='Disable
>> >      ssh host key checking', action='store_true')
>> >      parser_deploy.add_argument('-s', '--show-status', help='Show
>> >      progress/status output', action='store_true')
>> >      parser_deploy.add_argument('-n', '--dry-run', help='List files to be
>> >      deployed only', action='store_true')>
>> > +    parser_deploy.add_argument('-p', '--no-preserve', help='Do not
>> > preserve existing files', action='store_true')
>> > +    parser_deploy.add_argument('--no-check-space', help='Do not check for
>> > available space before deploying', action='store_true')
>>
>> I think this should be single option, so everytime you deploy to
>> target we should check for space before making changes
>> this is required even when deploying with out preserving, thinking of
>> a case where I might build the binary with debug info
>> or a new version which is large in size and won't fit into rootfs
>
> I'm not sure I understand what you're saying. The default is to always check
> for available space; if it were one option then it would not be possible to
> deploy without preserving but still check for available space.

I was meaning to say that option to not check space is redundant.

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

