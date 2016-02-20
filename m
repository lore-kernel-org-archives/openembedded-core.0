Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id C8E2777284
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 19:21:11 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id y9so86880127qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 11:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=co5rjLwi42WI5KzMYRjNwQX/d/XIlrWQV/a+znP/RMo=;
	b=BXFqYGb6l1VPds0/jzGT11UehEW9D8EdUxG4ZeBZL/5dgLePoXuCZit2vGaGO8eFaa
	x+IIhLuCwSlG5JaOXJLeYSiX8egmZG/Qet5fd/tZOhnH+SXQn4Pk1A2JCENmHJXRUsKB
	U90QWtdQ0yYulCfF++zD1jj4yJlhucalef5POhU8VsdUZjgvv0oN+BLq/ShP+L5aJ1Pl
	wvfATN6cmf3Nj44A8MHcynvSMnNQ4obxbvytx/gQN1110LDSZyLO2xJHWJkTv1QRYtPm
	g8I1GnucnfptlUDr8Ih/UJ0DgMAbCKOXj1xYCLWU+ns9sVixTxi1unUhKY+izXPoCH4p
	U3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=co5rjLwi42WI5KzMYRjNwQX/d/XIlrWQV/a+znP/RMo=;
	b=Nfx0jYTpxbTibE0mjtW+vqoE/lTxVeo1zSSr/1vDQyp5eBhYin+Fb30lzWwcPz90QP
	vGeBW38QYC/H9nQB/xfqCtMR+hoirpYc1zOHiMoW3SQbmvKxpbH/3pYythEOCZBgYH1+
	eob9B+G3NU3gUT18QM1l28buVe8Lfify/pSEoI4BrsX+5kABZxRQ6it6AU3t/0ESve98
	NS2kjpx8qaxEwoLQESA3SZyZShx4iPqPaoI8uVYPNaOM3eZdon09W3ouFI9qAjtgukMg
	2M9Q9JsRHL/UCgjG0WDi9cHsDTjd7L539WgyC3y+EHFy6WL7zGQ5pgl8fhpgrcPyY1yz
	Z7Ow==
X-Gm-Message-State: AG10YOTrJbB0io4JUvwAwn0RfTZnLj7sjW/5gog2NR0TxcOBKadytBCB5ObRxiAXzw5X2HYLUdDJjuAwaQ3XIA==
X-Received: by 10.140.108.181 with SMTP id j50mr24186315qgf.104.1455996071864; 
	Sat, 20 Feb 2016 11:21:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 20 Feb 2016 11:20:42 -0800 (PST)
In-Reply-To: <b2f6e7831b5d83d8ac11f4c0f11b76a695a6b124.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
	<b2f6e7831b5d83d8ac11f4c0f11b76a695a6b124.1455874585.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Feb 2016 11:20:42 -0800
Message-ID: <CAMKF1sqQeXqAX-=rfHnsebK+41g19ztppRbbw0iciz1FNz2VJA@mail.gmail.com>
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
X-List-Received-Date: Sat, 20 Feb 2016 19:21:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2016 at 1:38 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> If files would be overwritten by the deployment, preserve them in a
> separate location on the target so that they can be restored if you
> later run devtool undeploy-target.
>
> At the same time, also check for sufficient space before starting the
> operation so that we avoid potentially failing part way through.
>
> Fixes [YOCTO #8978].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/lib/devtool/deploy.py | 87 +++++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 78 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.p=
y
> index d54f6ba..66644cc 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -28,7 +28,7 @@ logger =3D logging.getLogger('devtool')
>
>  deploylist_path =3D '/.devtool'
>
> -def _prepare_remote_script(deploy, verbose=3DFalse, dryrun=3DFalse, unde=
ployall=3DFalse):
> +def _prepare_remote_script(deploy, verbose=3DFalse, dryrun=3DFalse, unde=
ployall=3DFalse, nopreserve=3DFalse, nocheckspace=3DFalse):
>      """
>      Prepare a shell script for running on the target to
>      deploy/undeploy files. We have to be careful what we put in this
> @@ -48,6 +48,7 @@ def _prepare_remote_script(deploy, verbose=3DFalse, dry=
run=3DFalse, undeployall=3DFals
>          if not deploy:
>              lines.append('echo "Previously deployed files for $1:"')
>      lines.append('manifest=3D"%s/$1.list"' % deploylist_path)
> +    lines.append('preservedir=3D"%s/$1.preserve"' % deploylist_path)
>      lines.append('if [ -f $manifest ] ; then')
>      # Read manifest in reverse and delete files / remove empty dirs
>      lines.append('    sed \'1!G;h;$!d\' $manifest | while read file')
> @@ -58,7 +59,10 @@ def _prepare_remote_script(deploy, verbose=3DFalse, dr=
yrun=3DFalse, undeployall=3DFals
>          lines.append('        fi')
>      else:
>          lines.append('        if [ -d $file ] ; then')
> -        lines.append('            rmdir $file > /dev/null 2>&1 || true')
> +        # Avoid deleting a preserved directory in case it has special pe=
rms
> +        lines.append('            if [ ! -d $preservedir/$file ] ; then'=
)
> +        lines.append('                rmdir $file > /dev/null 2>&1 || tr=
ue')
> +        lines.append('            fi')
>          lines.append('        else')
>          lines.append('            rm $file')
>          lines.append('        fi')
> @@ -71,6 +75,39 @@ def _prepare_remote_script(deploy, verbose=3DFalse, dr=
yrun=3DFalse, undeployall=3DFals
>      lines.append('fi')
>
>      if deploy:
> +        if not nocheckspace:
> +            # Check for available space
> +            # FIXME This doesn't take into account files spread across m=
ultiple
> +            # partitions, but doing that is non-trivial
> +            # Find the part of the destination path that exists
> +            lines.append('checkpath=3D"$2"')
> +            lines.append('while [ "$checkpath" !=3D "/" ] && [ ! -e $che=
ckpath ]')
> +            lines.append('do')
> +            lines.append('    checkpath=3D`dirname "$checkpath"`')
> +            lines.append('done')
> +            lines.append('freespace=3D`df -P $checkpath | sed "1d" | awk=
 \'{ print $4 }\'`')
> +            # First line of the file is the total space
> +            lines.append('total=3D`head -n1 $3`')
> +            lines.append('if [ $total -gt $freespace ] ; then')
> +            lines.append('    echo "ERROR: insufficient space on target =
(available ${freespace}, needed ${total})"')
> +            lines.append('    exit 1')
> +            lines.append('fi')
> +        if not nopreserve:
> +            # Preserve any files that exist. Note that this will add to =
the
> +            # preserved list with successive deployments if the list of =
files
> +            # deployed changes, but because we've deleted any previously
> +            # deployed files at this point it will never preserve anythi=
ng
> +            # that was deployed, only files that existed prior to any de=
ploying
> +            # (which makes the most sense)
> +            lines.append('cat $3 | sed "1d" | while read file fsize')
> +            lines.append('do')
> +            lines.append('    if [ -e $file ] ; then')
> +            lines.append('    dest=3D"$preservedir/$file"')
> +            lines.append('    mkdir -p `dirname $dest`')
> +            lines.append('    mv $file $dest')
> +            lines.append('    fi')
> +            lines.append('done')
> +            lines.append('rm $3')
>          lines.append('mkdir -p `dirname $manifest`')
>          lines.append('mkdir -p $2')
>          if verbose:
> @@ -78,6 +115,14 @@ def _prepare_remote_script(deploy, verbose=3DFalse, d=
ryrun=3DFalse, undeployall=3DFals
>          else:
>              lines.append('    tar xv -C $2 -f - > $manifest')
>          lines.append('sed -i "s!^./!$2!" $manifest')
> +    elif not dryrun:
> +        # Put any preserved files back
> +        lines.append('if [ -d $preservedir ] ; then')
> +        lines.append('    cd $preservedir')
> +        lines.append('    find . -type f -exec mv {} /{} \;')
> +        lines.append('    cd /')
> +        lines.append('    rm -rf $preservedir')
> +        lines.append('fi')
>
>      if undeployall:
>          if not dryrun:
> @@ -94,6 +139,7 @@ def _prepare_remote_script(deploy, verbose=3DFalse, dr=
yrun=3DFalse, undeployall=3DFals
>  def deploy(args, config, basepath, workspace):
>      """Entry point for the devtool 'deploy' subcommand"""
>      import re
> +    import math
>      import oe.recipeutils
>
>      check_workspace_recipe(workspace, args.recipename, checksrc=3DFalse)
> @@ -119,11 +165,23 @@ def deploy(args, config, basepath, workspace):
>                             'recipe? If so, the install step has not inst=
alled '
>                             'any files.' % args.recipename)
>
> +    filelist =3D []
> +    ftotalsize =3D 0
> +    for root, _, files in os.walk(recipe_outdir):
> +        for fn in files:
> +            # Get the size in kiB (since we'll be comparing it to the ou=
tput of du -k)
> +            # MUST use lstat() here not stat() or getfilesize() since we=
 don't want to
> +            # dereference symlinks
> +            fsize =3D int(math.ceil(float(os.lstat(os.path.join(root, fn=
)).st_size)/1024))
> +            ftotalsize +=3D fsize
> +            # The path as it would appear on the target
> +            fpath =3D os.path.join(destdir, os.path.relpath(root, recipe=
_outdir), fn)
> +            filelist.append((fpath, fsize))
> +
>      if args.dry_run:
>          print('Files to be deployed for %s on target %s:' % (args.recipe=
name, args.target))
> -        for root, _, files in os.walk(recipe_outdir):
> -            for fn in files:
> -                print('  %s' % os.path.join(destdir, os.path.relpath(roo=
t, recipe_outdir), fn))
> +        for item, _ in filelist:
> +            print('  %s' % item)
>          return 0
>
>
> @@ -140,11 +198,20 @@ def deploy(args, config, basepath, workspace):
>      tmpdir =3D tempfile.mkdtemp(prefix=3D'devtool')
>      try:
>          tmpscript =3D '/tmp/devtool_deploy.sh'
> -        shellscript =3D _prepare_remote_script(deploy=3DTrue, verbose=3D=
args.show_status)
> +        tmpfilelist =3D os.path.join(os.path.dirname(tmpscript), 'devtoo=
l_deploy.list')
> +        shellscript =3D _prepare_remote_script(deploy=3DTrue,
> +                                             verbose=3Dargs.show_status,
> +                                             nopreserve=3Dargs.no_preser=
ve,
> +                                             nocheckspace=3Dargs.no_chec=
k_space)
>          # Write out the script to a file
>          with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w'=
) as f:
>              f.write(shellscript)
> -        # Copy it to the target
> +        # Write out the file list
> +        with open(os.path.join(tmpdir, os.path.basename(tmpfilelist)), '=
w') as f:
> +            f.write('%d\n' % ftotalsize)
> +            for fpath, fsize in filelist:
> +                f.write('%s %d\n' % (fpath, fsize))
> +        # Copy them to the target
>          ret =3D subprocess.call("scp %s %s/* %s:%s" % (extraoptions, tmp=
dir, args.target, os.path.dirname(tmpscript)), shell=3DTrue)
>          if ret !=3D 0:
>              raise DevtoolError('Failed to copy script to %s - rerun with=
 -s to '
> @@ -153,7 +220,7 @@ def deploy(args, config, basepath, workspace):
>          shutil.rmtree(tmpdir)
>
>      # Now run the script
> -    ret =3D exec_fakeroot(rd, 'tar cf - . | ssh %s %s \'sh %s %s %s\'' %=
 (extraoptions, args.target, tmpscript, args.recipename, destdir), cwd=3Dre=
cipe_outdir, shell=3DTrue)
> +    ret =3D exec_fakeroot(rd, 'tar cf - . | ssh %s %s \'sh %s %s %s %s\'=
' % (extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfil=
elist), cwd=3Drecipe_outdir, shell=3DTrue)
>      if ret !=3D 0:
>          raise DevtoolError('Deploy failed - rerun with -s to get a compl=
ete '
>                             'error message')
> @@ -213,13 +280,15 @@ def register_commands(subparsers, context):
>      """Register devtool subcommands from the deploy plugin"""
>      parser_deploy =3D subparsers.add_parser('deploy-target',
>                                            help=3D'Deploy recipe output f=
iles to live target machine',
> -                                          description=3D'Deploys a recip=
e\'s build output (i.e. the output of the do_install task) to a live target=
 machine over ssh. Note: this only deploys the recipe itself and not any ru=
ntime dependencies, so it is assumed that those have been installed on the =
target beforehand.',
> +                                          description=3D'Deploys a recip=
e\'s build output (i.e. the output of the do_install task) to a live target=
 machine over ssh. By default, any existing files will be preserved instead=
 of being overwritten and will be restored if you run devtool undeploy-targ=
et. Note: this only deploys the recipe itself and not any runtime dependenc=
ies, so it is assumed that those have been installed on the target beforeha=
nd.',
>                                            group=3D'testbuild')
>      parser_deploy.add_argument('recipename', help=3D'Recipe to deploy')
>      parser_deploy.add_argument('target', help=3D'Live target machine run=
ning an ssh server: user@hostname[:destdir]')
>      parser_deploy.add_argument('-c', '--no-host-check', help=3D'Disable =
ssh host key checking', action=3D'store_true')
>      parser_deploy.add_argument('-s', '--show-status', help=3D'Show progr=
ess/status output', action=3D'store_true')
>      parser_deploy.add_argument('-n', '--dry-run', help=3D'List files to =
be deployed only', action=3D'store_true')
> +    parser_deploy.add_argument('-p', '--no-preserve', help=3D'Do not pre=
serve existing files', action=3D'store_true')
> +    parser_deploy.add_argument('--no-check-space', help=3D'Do not check =
for available space before deploying', action=3D'store_true')

I think this should be single option, so everytime you deploy to
target we should check for space before making changes
this is required even when deploying with out preserving, thinking of
a case where I might build the binary with debug info
or a new version which is large in size and won't fit into rootfs

>      parser_deploy.set_defaults(func=3Ddeploy)
>
>      parser_undeploy =3D subparsers.add_parser('undeploy-target',
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

