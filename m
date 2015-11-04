Return-Path: <roylee17@currantlabs.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADAB7702B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 22:56:34 +0000 (UTC)
Received: by oiad129 with SMTP id d129so37113720oia.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Nov 2015 14:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=currantlabs_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nnTrqVZtKn5kXOgSQtalByFTIAtyXS49h80JsJi18zE=;
	b=mz5VnDvMV+LQWRNrFD9Q5r/U693p5/dd1AmS4y3sq91RPNfZyV2VIqjye6ydJRAxcq
	tdH/6x4P3q51Qz7GJ8MOmxzF30CvSf8sP5MOlBe9WehGbbhwbJJN365qA8sYwLXBSe3M
	HzRCdHPVqFtfuyP3ImiDvc1TNmSjmIP99Fur0PguBmxypPuue/T5Vbe5fhuC74JH0S9c
	OMlyqkL+nBCWbrnZjR6koLtKgpdzgl1TKvvI2hf2cFt0BD0076ezOxSm4mFAfZiQr05M
	NDiKGZfu/QHuazfTisli4pqC2nWVmWbep4167pK2D4yoZkfepXqzlD1wvJ84kjcffRQt
	UJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=nnTrqVZtKn5kXOgSQtalByFTIAtyXS49h80JsJi18zE=;
	b=NiuFrgok+f2NAC6CA4BaGQ/Bv+DRLkoX9pM14iEuy6M9HWyV9PvRk8Y4E2hnEQKDNg
	BdZdZc9xjUxOyhW0Ty7Pv4B0UCOIJdEMNPaWxuPf3HBVzfhZJUv34aUBEmh+HCqkjTZ7
	GSFxGKjIJ+tfi3Yq6O/ySC6ThsIWrk4ISZRDjcAwkr92CH9QsslC2B9lFbtmDqCzLQTR
	w1sewUn9zPoa1HTRS+OjKBiWC31XT4m2wkk+TMh5eI0mFwGRKKvhMtM6kjpsp8RZFd51
	0NIrDN8bdoJHoJzbKoWsM+biJZiOq1bOZq6y8K8Lj1cySaRNzubpjtjWdZ6vQgUT7H4j
	Dhrg==
X-Gm-Message-State: ALoCoQkQW5eByPOY1FSfE5D+IDdNAkCwTH3EPYK0SfF04H1iOCcJ/TK8Lk54jL9iCQOOsAhwF7Nq
MIME-Version: 1.0
X-Received: by 10.202.175.216 with SMTP id y207mr1967312oie.22.1446677794275; 
	Wed, 04 Nov 2015 14:56:34 -0800 (PST)
Received: by 10.60.95.38 with HTTP; Wed, 4 Nov 2015 14:56:34 -0800 (PST)
In-Reply-To: <28368483.pNfb4kAufo@peggleto-mobl.ger.corp.intel.com>
References: <1445468805-22100-1-git-send-email-roylee17@currantlabs.com>
	<7693189.S1Wl4IG7qW@peggleto-mobl.ger.corp.intel.com>
	<CAHZ5O5wJAsNPv52=_YDFUebC5H3H1N9Z3zsPN7QRakpox14B1A@mail.gmail.com>
	<28368483.pNfb4kAufo@peggleto-mobl.ger.corp.intel.com>
Date: Wed, 4 Nov 2015 14:56:34 -0800
Message-ID: <CAHZ5O5wc-mLh9akYz=tnbDiw9ngH7PJNRr_0WsTJbiB6ae8L0w@mail.gmail.com>
From: Tzu-Jung Lee <roylee17@currantlabs.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] devtool: add sync command
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
X-List-Received-Date: Wed, 04 Nov 2015 22:56:36 -0000
Content-Type: multipart/alternative; boundary=001a113cf544085f5c0523beecf2

--001a113cf544085f5c0523beecf2
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 4, 2015 at 7:48 AM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> On Monday 26 October 2015 10:29:24 Tzu-Jung Lee wrote:
> > Hi Paul
> >
> > On Mon, Oct 26, 2015 at 2:20 AM, Paul Eggleton <
> >
> > paul.eggleton@linux.intel.com> wrote:
> > > Hi Tzu-Jung,
> > >
> > > Thanks for the patch.
> > >
> > > On Wednesday 21 October 2015 23:06:45 Tzu-Jung Lee wrote:
> > > > The sync command is similar to the extract command, except it
> > > > fetches the sync'ed and patched branch to an existing git repository.
> > > >
> > > > This enables users to keep track the upstream development while
> > > > maintaining their own local git repository at the same time.
> > > >
> > > > Signed-off-by: Tzu-Jung Lee <roylee17@currantlabs.com>
> > > > ---
> > > >
> > > >  scripts/lib/devtool/standard.py | 73
> > > >
> > > > +++++++++++++++++++++++++++++++---------- 1 file changed, 56
> > >
> > > insertions(+),
> > >
> > > > 17 deletions(-)
> > > >
> > > > diff --git a/scripts/lib/devtool/standard.py
> > > > b/scripts/lib/devtool/standard.py index 5d7e903..2c6b7b3 100644
> > > > --- a/scripts/lib/devtool/standard.py
> > > > +++ b/scripts/lib/devtool/standard.py
> > > >
> > > > @@ -234,7 +234,29 @@ def extract(args, config, basepath, workspace):
> > > >          return 1
> > > >
> > > >      srctree = os.path.abspath(args.srctree)
> > > >
> > > > -    initial_rev = _extract_source(srctree, args.keep_temp,
> args.branch,
> > >
> > > rd)
> > >
> > > > +    initial_rev = _extract_source(srctree, args.keep_temp,
> args.branch,
> > > > False, rd)
> > > > +    logger.info('Source tree extracted to %s' % srctree)
> > > > +
> > > > +    if initial_rev:
> > > > +        return 0
> > > > +    else:
> > > > +        return 1
> > >
> > > Hmm, so your patch shows this check being added but it's there in
> master.
> > > Are
> > > you patching an older version?
> >
> > Not really, it was patched against the tip of master.
> > But git is sometimes confused by the boundary of back-to-back similar
> > functions.
> > So that checks are actually belongs to "def sync", which was copied from
> > "def extract"
> >
> >     def extract
> >         ...
> > --------------------
> >
> > |      [checks]
> > |
> > |   def sync
> > |
> > |       ...
> >
> > --------------------
> >        [checks]
> >
> > > +def sync(args, config, basepath, workspace):
> > > > +    """Entry point for the devtool 'sync' subcommand"""
> > > > +    import bb
> > > > +
> > > > +    tinfoil = _prep_extract_operation(config, basepath,
> > > > args.recipename)
> > > > +    if not tinfoil:
> > > > +        # Error already shown
> > > > +        return 1
> > > > +
> > > > +    rd = parse_recipe(config, tinfoil, args.recipename, True)
> > > > +    if not rd:
> > > > +        return 1
> > > > +
> > > > +    srctree = os.path.abspath(args.srctree)
> > > > +    initial_rev = _extract_source(srctree, args.keep_temp,
> args.branch,
> > > > True, rd) logger.info('Source tree extracted to %s' % srctree)
> > > >
> > > >      if initial_rev:
> > > > @@ -289,7 +311,7 @@ def _prep_extract_operation(config, basepath,
> > > > recipename): return tinfoil
> > > >
> > > >
> > > > -def _extract_source(srctree, keep_temp, devbranch, d):
> > > >
> > > > +def _extract_source(srctree, keep_temp, devbranch, sync, d):
> > > >      """Extract sources of a recipe"""
> > > >      import bb.event
> > > >      import oe.recipeutils
> > > >
> > > > @@ -308,21 +330,26 @@ def _extract_source(srctree, keep_temp,
> devbranch,
> > >
> > > d):
> > > >      _check_compatible_recipe(pn, d)
> > > >
> > > > -    if os.path.exists(srctree):
> > > > -        if not os.path.isdir(srctree):
> > > > -            raise DevtoolError("output path %s exists and is not a
> > > > directory" % -                               srctree)
> > > > -        elif os.listdir(srctree):
> > > > -            raise DevtoolError("output path %s already exists and
> is "
> > > > -                               "non-empty" % srctree)
> > > > +    if sync:
> > > > +        if not os.path.exists(srctree):
> > > > +                raise DevtoolError("output path %s does not exist" %
> > > > srctree) +    else:
> > > > +        if os.path.exists(srctree):
> > > > +            if not os.path.isdir(srctree):
> > > > +                raise DevtoolError("output path %s exists and is
> not a
> > > > directory" % +                                   srctree)
> > > > +            elif os.listdir(srctree):
> > > > +                raise DevtoolError("output path %s already exists
> and
> > >
> > > is "
> > >
> > > > +                                   "non-empty" % srctree)
> > > >
> > > > -    if 'noexec' in (d.getVarFlags('do_unpack', False) or []):
> > > > -        raise DevtoolError("The %s recipe has do_unpack disabled,
> > >
> > > unable to
> > >
> > > > " -                           "extract source" % pn)
> > > > +        if 'noexec' in (d.getVarFlags('do_unpack', False) or []):
> > > > +            raise DevtoolError("The %s recipe has do_unpack
> disabled,
> > > > unable to " +                               "extract source" % pn)
> > > >
> > > > -    # Prepare for shutil.move later on
> > > > -    bb.utils.mkdirhier(srctree)
> > > > -    os.rmdir(srctree)
> > > > +    if not sync:
> > > > +        # Prepare for shutil.move later on
> > > > +        bb.utils.mkdirhier(srctree)
> > > > +        os.rmdir(srctree)
> > > >
> > > >      # We don't want notes to be printed, they are too verbose
> > > >      origlevel = bb.logger.getEffectiveLevel()
> > > >
> > > > @@ -431,8 +458,11 @@ def _extract_source(srctree, keep_temp,
> devbranch,
> > >
> > > d):
> > > >              logger.info('Adding local source files to srctree...')
> > > >              shutil.move(os.path.join(tempdir, 'oe-local-files'),
> > >
> > > srcsubdir)
> > >
> > > > +        if sync:
> > > > +            bb.process.run('git fetch file://' + srcsubdir + ' ' +
> > > > devbranch + ':' + devbranch, cwd=srctree)
> > > > +        else:
> > > > +            shutil.move(srcsubdir, srctree)
> > > >
> > > > -        shutil.move(srcsubdir, srctree)
> > > >
> > > >      finally:
> > > >          bb.logger.setLevel(origlevel)
> > > >
> > > > @@ -532,7 +562,7 @@ def modify(args, config, basepath, workspace):
> > > >      commits = []
> > > >      srctree = os.path.abspath(args.srctree)
> > > >
> > > >      if args.extract:
> > > > -        initial_rev = _extract_source(args.srctree, False,
> args.branch,
> > >
> > > rd)
> > >
> > > > +        initial_rev = _extract_source(args.srctree, False,
> args.branch,
> > > >
> > > > False, rd) if not initial_rev:
> > > >              return 1
> > > >
> > > >          logger.info('Source tree extracted to %s' % srctree)
> > > >
> > > > @@ -1107,6 +1137,15 @@ def register_commands(subparsers, context):
> > > >      parser_extract.add_argument('--keep-temp', action="store_true",
> > > >
> > > > help='Keep temporary directory (for debugging)')
> > > > parser_extract.set_defaults(func=extract)
> > > >
> > > > +    parser_sync = subparsers.add_parser('sync', help='Synchronize
> the
> > > > source for an existing recipe', +
> > > > description='Synchronize the source for an existing recipe', +
> > > >
> > > > formatter_class=argparse.ArgumentDefaultsHelpFormatter) +
> > > > parser_sync.add_argument('recipename', help='Name for recipe to sync
> the
> > > > source for') +    parser_sync.add_argument('srctree', help='Path to
> > > > where
> > > > to sync the source tree') +    parser_sync.add_argument('--branch',
> > > > '-b',
> > > > default="devtool", help='Name for development branch to checkout') +
> > > > parser_sync.add_argument('--keep-temp', action="store_true",
> help='Keep
> > > > temporary directory (for debugging)') +
> > > > parser_sync.set_defaults(func=sync)
> > > > +
> > > >
> > > >      parser_update_recipe = subparsers.add_parser('update-recipe',
> > > >
> > > > help='Apply changes from external source tree to recipe',
> > > > description='Applies changes from external source tree to a recipe
> > > > (updating/adding/removing patches as necessary, or by updating
> SRCREV)')
> > > > parser_update_recipe.add_argument('recipename', help='Name of recipe
> to
> > > > update')
> > >
> > > Exploring the use case a bit more, do you anticipate using this sync
> > > command
> > > in conjunction with a recipe that's in the workspace, or standalone?
> >
> > The use case is for workspace to keep git repos up-to-date. (Kind of
> > rebasing) So the assumption is that the recipes have a corresponding git
> > repository already, which could be an existing internal one, or a freshly
> > constructed by an earlier devtool modify/extract. For standalone recipes,
> > they can still go through the workspace :-)
>
> I guess what I was wondering was is there a way we can better fit this in
> with
> devtool's workflow for when the recipe is in the workspace. However, other
> than
> perhaps not expecting the path to the source tree when the recipe is in the
> workspace I can't think of anything though. I guess we can always improve
> it
> later.
>

Maybe we can fit it like the following:

1. Start to modify a recipe by either:

     a. reusing an existing <srctree>

        $ devtool modify <recipename> <srctree>

     b. or creating a new one with the -x option

        $ devtool modify <recipename> -x <srctree>

2. Work on the <srctree>

3. After a while, the upstream of <recipename> moves forward before we
contribute our changes back.

4. Sync up the upstream changes into <srctree> with a new branch
<branchname>

     $ devtool sync <recipename> <srctree> --branch <branchname>

5. Rebase our working branch onto the tip of the upstream <branchname>

    $ git rebase <branchname> devtool

[ Repeat 2 - 5 ]

6. Apply the changes back to the recipe.

    $ devtool update-recipe <branchname>

- Roy



> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--001a113cf544085f5c0523beecf2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Nov 4, 2015 at 7:48 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a =
href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.egglet=
on@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-colo=
r:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div><div>On M=
onday 26 October 2015 10:29:24 Tzu-Jung Lee wrote:<br>
&gt; Hi Paul<br>
&gt;<br>
&gt; On Mon, Oct 26, 2015 at 2:20 AM, Paul Eggleton &lt;<br>
&gt;<br>
&gt; <a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">pau=
l.eggleton@linux.intel.com</a>&gt; wrote:<br>
&gt; &gt; Hi Tzu-Jung,<br>
&gt; &gt;<br>
&gt; &gt; Thanks for the patch.<br>
&gt; &gt;<br>
&gt; &gt; On Wednesday 21 October 2015 23:06:45 Tzu-Jung Lee wrote:<br>
&gt; &gt; &gt; The sync command is similar to the extract command, except i=
t<br>
&gt; &gt; &gt; fetches the sync&#39;ed and patched branch to an existing gi=
t repository.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This enables users to keep track the upstream development wh=
ile<br>
&gt; &gt; &gt; maintaining their own local git repository at the same time.=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Tzu-Jung Lee &lt;<a href=3D"mailto:roylee17@c=
urrantlabs.com" target=3D"_blank">roylee17@currantlabs.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 scripts/lib/devtool/standard.py | 73<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +++++++++++++++++++++++++++++++---------- 1 file changed, 56=
<br>
&gt; &gt;<br>
&gt; &gt; insertions(+),<br>
&gt; &gt;<br>
&gt; &gt; &gt; 17 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/scripts/lib/devtool/standard.py<br>
&gt; &gt; &gt; b/scripts/lib/devtool/standard.py index 5d7e903..2c6b7b3 100=
644<br>
&gt; &gt; &gt; --- a/scripts/lib/devtool/standard.py<br>
&gt; &gt; &gt; +++ b/scripts/lib/devtool/standard.py<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -234,7 +234,29 @@ def extract(args, config, basepath, wor=
kspace):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 srctree =3D os.path.abspath(args.srctree=
)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 initial_rev =3D _extract_source(srctree, args=
.keep_temp, args.branch,<br>
&gt; &gt;<br>
&gt; &gt; rd)<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 initial_rev =3D _extract_source(srctree, args=
.keep_temp, args.branch,<br>
&gt; &gt; &gt; False, rd)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"norefer=
rer" target=3D"_blank">logger.info</a>(&#39;Source tree extracted to %s&#39=
; % srctree)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if initial_rev:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 else:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
&gt; &gt;<br>
&gt; &gt; Hmm, so your patch shows this check being added but it&#39;s ther=
e in master.<br>
&gt; &gt; Are<br>
&gt; &gt; you patching an older version?<br>
&gt;<br>
&gt; Not really, it was patched against the tip of master.<br>
&gt; But git is sometimes confused by the boundary of back-to-back similar<=
br>
&gt; functions.<br>
&gt; So that checks are actually belongs to &quot;def sync&quot;, which was=
 copied from<br>
&gt; &quot;def extract&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0def extract<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
&gt; --------------------<br>
&gt;<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 [checks]<br>
&gt; |<br>
&gt; |=C2=A0 =C2=A0def sync<br>
&gt; |<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
&gt;<br>
&gt; --------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 [checks]<br>
&gt;<br>
&gt; &gt; +def sync(args, config, basepath, workspace):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Entry point for the devtool=
 &#39;sync&#39; subcommand&quot;&quot;&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 import bb<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 tinfoil =3D _prep_extract_operation(config, b=
asepath,<br>
&gt; &gt; &gt; args.recipename)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if not tinfoil:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Error already shown<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 rd =3D parse_recipe(config, tinfoil, args.rec=
ipename, True)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if not rd:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 srctree =3D os.path.abspath(args.srctree)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 initial_rev =3D _extract_source(srctree, args=
.keep_temp, args.branch,<br>
&gt; &gt; &gt; True, rd) <a href=3D"http://logger.info" rel=3D"noreferrer" =
target=3D"_blank">logger.info</a>(&#39;Source tree extracted to %s&#39; % s=
rctree)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if initial_rev:<br>
&gt; &gt; &gt; @@ -289,7 +311,7 @@ def _prep_extract_operation(config, base=
path,<br>
&gt; &gt; &gt; recipename): return tinfoil<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -def _extract_source(srctree, keep_temp, devbranch, d):<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +def _extract_source(srctree, keep_temp, devbranch, sync, d)=
:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Extract sources of a r=
ecipe&quot;&quot;&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 import bb.event<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 import oe.recipeutils<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -308,21 +330,26 @@ def _extract_source(srctree, keep_temp=
, devbranch,<br>
&gt; &gt;<br>
&gt; &gt; d):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 _check_compatible_recipe(pn, d)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 if os.path.exists(srctree):<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isdir(srctree):<=
br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolErro=
r(&quot;output path %s exists and is not a<br>
&gt; &gt; &gt; directory&quot; % -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srctr=
ee)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif os.listdir(srctree):<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolErro=
r(&quot;output path %s already exists and is &quot;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;non-empty&quot; %=
 srctree)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if sync:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(srctree):=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rai=
se DevtoolError(&quot;output path %s does not exist&quot; %<br>
&gt; &gt; &gt; srctree) +=C2=A0 =C2=A0 else:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(srctree):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.is=
dir(srctree):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rai=
se DevtoolError(&quot;output path %s exists and is not a<br>
&gt; &gt; &gt; directory&quot; % +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0srctree)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif os.listdir(s=
rctree):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rai=
se DevtoolError(&quot;output path %s already exists and<br>
&gt; &gt;<br>
&gt; &gt; is &quot;<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;non=
-empty&quot; % srctree)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 if &#39;noexec&#39; in (d.getVarFlags(&#39;do=
_unpack&#39;, False) or []):<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(&quot;The %s=
 recipe has do_unpack disabled,<br>
&gt; &gt;<br>
&gt; &gt; unable to<br>
&gt; &gt;<br>
&gt; &gt; &gt; &quot; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;extract source&quot; % p=
n)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;noexec&#39; in (d.getVa=
rFlags(&#39;do_unpack&#39;, False) or []):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolErro=
r(&quot;The %s recipe has do_unpack disabled,<br>
&gt; &gt; &gt; unable to &quot; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
extract source&quot; % pn)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 # Prepare for shutil.move later on<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 bb.utils.mkdirhier(srctree)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 os.rmdir(srctree)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if not sync:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Prepare for shutil.move later=
 on<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(srctree)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.rmdir(srctree)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 # We don&#39;t want notes to be printed,=
 they are too verbose<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 origlevel =3D bb.logger.getEffectiveLeve=
l()<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -431,8 +458,11 @@ def _extract_source(srctree, keep_temp,=
 devbranch,<br>
&gt; &gt;<br>
&gt; &gt; d):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"h=
ttp://logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#3=
9;Adding local source files to srctree...&#39;)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(=
os.path.join(tempdir, &#39;oe-local-files&#39;),<br>
&gt; &gt;<br>
&gt; &gt; srcsubdir)<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if sync:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.process.run(&#=
39;git fetch file://&#39; + srcsubdir + &#39; &#39; +<br>
&gt; &gt; &gt; devbranch + &#39;:&#39; + devbranch, cwd=3Dsrctree)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(srcsu=
bdir, srctree)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(srcsubdir, srctree)=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 finally:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.logger.setLevel(origlev=
el)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -532,7 +562,7 @@ def modify(args, config, basepath, works=
pace):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 commits =3D []<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 srctree =3D os.path.abspath(args.srctree=
)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if args.extract:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 initial_rev =3D _extract_source=
(args.srctree, False, args.branch,<br>
&gt; &gt;<br>
&gt; &gt; rd)<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initial_rev =3D _extract_source=
(args.srctree, False, args.branch,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; False, rd) if not initial_rev:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.i=
nfo" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Source tree =
extracted to %s&#39; % srctree)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -1107,6 +1137,15 @@ def register_commands(subparsers, con=
text):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_extract.add_argument(&#39;--keep-=
temp&#39;, action=3D&quot;store_true&quot;,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; help=3D&#39;Keep temporary directory (for debugging)&#39;)<b=
r>
&gt; &gt; &gt; parser_extract.set_defaults(func=3Dextract)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 parser_sync =3D subparsers.add_parser(&#39;sy=
nc&#39;, help=3D&#39;Synchronize the<br>
&gt; &gt; &gt; source for an existing recipe&#39;, +<br>
&gt; &gt; &gt; description=3D&#39;Synchronize the source for an existing re=
cipe&#39;, +<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; formatter_class=3Dargparse.ArgumentDefaultsHelpFormatter) +<=
br>
&gt; &gt; &gt; parser_sync.add_argument(&#39;recipename&#39;, help=3D&#39;N=
ame for recipe to sync the<br>
&gt; &gt; &gt; source for&#39;) +=C2=A0 =C2=A0 parser_sync.add_argument(&#3=
9;srctree&#39;, help=3D&#39;Path to<br>
&gt; &gt; &gt; where<br>
&gt; &gt; &gt; to sync the source tree&#39;) +=C2=A0 =C2=A0 parser_sync.add=
_argument(&#39;--branch&#39;,<br>
&gt; &gt; &gt; &#39;-b&#39;,<br>
&gt; &gt; &gt; default=3D&quot;devtool&quot;, help=3D&#39;Name for developm=
ent branch to checkout&#39;) +<br>
&gt; &gt; &gt; parser_sync.add_argument(&#39;--keep-temp&#39;, action=3D&qu=
ot;store_true&quot;, help=3D&#39;Keep<br>
&gt; &gt; &gt; temporary directory (for debugging)&#39;) +<br>
&gt; &gt; &gt; parser_sync.set_defaults(func=3Dsync)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 parser_update_recipe =3D subparsers.add_=
parser(&#39;update-recipe&#39;,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; help=3D&#39;Apply changes from external source tree to recip=
e&#39;,<br>
&gt; &gt; &gt; description=3D&#39;Applies changes from external source tree=
 to a recipe<br>
&gt; &gt; &gt; (updating/adding/removing patches as necessary, or by updati=
ng SRCREV)&#39;)<br>
&gt; &gt; &gt; parser_update_recipe.add_argument(&#39;recipename&#39;, help=
=3D&#39;Name of recipe to<br>
&gt; &gt; &gt; update&#39;)<br>
&gt; &gt;<br>
&gt; &gt; Exploring the use case a bit more, do you anticipate using this s=
ync<br>
&gt; &gt; command<br>
&gt; &gt; in conjunction with a recipe that&#39;s in the workspace, or stan=
dalone?<br>
&gt;<br>
&gt; The use case is for workspace to keep git repos up-to-date. (Kind of<b=
r>
&gt; rebasing) So the assumption is that the recipes have a corresponding g=
it<br>
&gt; repository already, which could be an existing internal one, or a fres=
hly<br>
&gt; constructed by an earlier devtool modify/extract. For standalone recip=
es,<br>
&gt; they can still go through the workspace :-)<br>
<br>
</div></div>I guess what I was wondering was is there a way we can better f=
it this in with<br>
devtool&#39;s workflow for when the recipe is in the workspace. However, ot=
her than<br>
perhaps not expecting the path to the source tree when the recipe is in the=
<br>
workspace I can&#39;t think of anything though. I guess we can always impro=
ve it<br>
later.<br></blockquote><div><br></div><div>Maybe we can fit it like the fol=
lowing:</div><div><br></div><div>1. Start to modify a recipe by either:</di=
v><div><br></div><div>=C2=A0 =C2=A0 =C2=A0a. reusing an existing &lt;srctre=
e&gt;</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ devtool modify=
 &lt;recipename&gt; &lt;srctree&gt;</div><div><br></div><div>=C2=A0 =C2=A0 =
=C2=A0b. or creating a new one with the -x option</div><div><br></div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ devtool modify &lt;recipename&gt; -x &lt;srct=
ree&gt;</div><div><br></div><div>2. Work on the &lt;srctree&gt;=C2=A0</div>=
<div><br></div><div>3. After a while, the upstream of &lt;recipename&gt; mo=
ves forward before we contribute our changes back.</div><div><br></div><div=
>4. Sync up the upstream changes into &lt;srctree&gt; with a new branch &lt=
;branchname&gt;</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0$ devtool sync=
 &lt;recipename&gt; &lt;srctree&gt; --branch &lt;branchname&gt;</div><div><=
br></div><div>5. Rebase our working branch onto the tip of the upstream &lt=
;branchname&gt;=C2=A0</div><div><br></div><div>=C2=A0 =C2=A0 $ git rebase &=
lt;branchname&gt; devtool</div><div><br></div><div>[ Repeat 2 - 5 ]</div><d=
iv><br></div><div>6. Apply the changes back to the recipe.</div><div><br></=
div><div>=C2=A0 =C2=A0 $ devtool=C2=A0update-recipe &lt;branchname&gt;</div=
><div><br></div><div>- Roy</div><div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left=
:1ex">
Acked-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com=
" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;<br>
<div><div><br>
Cheers,<br>
Paul<br>
<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</div></div></blockquote></div><br></div></div>

--001a113cf544085f5c0523beecf2--
