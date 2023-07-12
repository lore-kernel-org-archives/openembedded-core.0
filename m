Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DA4EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 21:53:29 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.2604.1689198801603881454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 14:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KwwwHiTC;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: chuckwolber@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6b9aadde448so867a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 14:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689198801; x=1691790801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LVs0vu1dC7GBwUel2W7pULhpcspuGQQawpJ4WFsxAek=;
        b=KwwwHiTChou8zaZQGhq8ahI1VZSNrDaresClCnFycVQHbEB5mTTc1Ugf9MKJVXcf4P
         maxKkzeQ1f7S+5aRgSHZJsgTpRYCDKVyOiNcJPHQsm4CJfEgN1AQpeLv/cvkeYvFR1oK
         S0ni/TpRpfXr/82tV8JsOfkpFz1kKOixLaIjXJWBsRLfLBDdU9aQbJDkCZgc+Os0cZHa
         KFaZMPETgdK2NZZp0xZHs2DqEk1OpdfvOqVLejFHOSJcXvgghiVjgQbZwPToULET65cZ
         F8p3ZbBytuKzrDHnJs9cBGq3FGdfbdWIbDlXjqa4ZPIIpR3Li0apUTOTd6DPHuXBVr6S
         kSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689198801; x=1691790801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVs0vu1dC7GBwUel2W7pULhpcspuGQQawpJ4WFsxAek=;
        b=h2OkNxqzWwvSjG8Zz/7QNN+QWxaRHA6PhdHx9VFbjKD3IPFAwNYfnNNi76DJOkI2oF
         enjn8P+MhSdE5h4PR1lqMC87EwTCCS/w8kLSWhQoQQ25GUw503a8AlgjiEqezAGyy5ia
         Gfo7Ii3CSS6XRt38vXO0l4N3wrXKjP/Cr+b9eL6RNSQraYHGU7xJO++mF/Ez3wpfliu4
         kNhM8f46+BkQhRRQv0pTyx8eIzQC2QRqGGpG/eR+l2IfuIPp2/URiOT9smq6vpYr0USq
         LGYp3r8GK3sW5f/afsj3oJI/BGqJYgC5ACGIljDx0phctKWICkor8sDe3//AN+h4tB9d
         HTUA==
X-Gm-Message-State: ABy/qLZ/5+bHAady+GRNyJxCSuttGYcXOiszXcJ3y6IpIWTF6QZGWToU
	zf224XbhLflnEu1C4jzTwdPZYv42h/nfWk7g8Nk=
X-Google-Smtp-Source: APBJJlHFdbCQ0ptiLrMrpiZ9tFbgt1m7hmqWD235onpBQeVsxuWtM77AFOaUekpCMRv9TU3v7eC35QwuKV1iWjW4ayM=
X-Received: by 2002:a05:6870:41d0:b0:1b7:3364:6269 with SMTP id
 z16-20020a05687041d000b001b733646269mr11061582oac.32.1689198800535; Wed, 12
 Jul 2023 14:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=6tBRhQaqO8jkM7CCpRfNAyYiByB4V4dFbbbWhu7A6QN6KTQ@mail.gmail.com>
 <CANNYZj8S6_P96ACXF8i=Pdw2ytAqq41ZF8WZOizsDrdZqmi7TA@mail.gmail.com>
In-Reply-To: <CANNYZj8S6_P96ACXF8i=Pdw2ytAqq41ZF8WZOizsDrdZqmi7TA@mail.gmail.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Wed, 12 Jul 2023 14:53:09 -0700
Message-ID: <CAB=6tBRY_Y8P2ifqkkcLOahhdPyY_w_Ns3dzh6N394NcCMA3pg@mail.gmail.com>
Subject: Re: [OE-Core][RFC] update-layers: Update layers managed by setup-layers
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007605460600513ecc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 21:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184227

--0000000000007605460600513ecc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That is a good point that I wrestled with. The TL;DR is that it seems to
create a chicken/egg problem.

Here is my reasoning in (possibly too much) detail.

At a very high level, one of the ingenious aspects of Yocto/OE is that it
(almost) always lets the project
distro "win". This is important because one of the questions that always
needs to be answered when using
OSS tools (especially in a highly regulated industry) is how upstream
change can be locally managed. This
splits along several lines that always end up at, "can this be done sanely
without requiring manual (error
prone) labor". Or to put that a little more succinctly - how much energy
are you prepared to put into proving
to a regulator that every developer did their work in a consistent way that
matches the method used to produce
the product now out in the field (and no one ever reads the documentation,
so you do not get to use that as an
answer)? And I hasten to add - this consistency should benefit
non-regulated use-cases as well, but the
benefits it provides must *FAR* exceed the work required to derive the
benefit or no one will ever use it.

The meta layering, cve-check, source checksumming, automatic license
checking, bbappend, etc. mechanisms
are key to the ideas described above, but there are several missing
elements, some of which are captured in
what was introduced by setup-layers.

I like the idea of setup-layers as a script that is dropped into the distro
project repository so it can operate in
a standalone manner. This is another example of letting the project distro
"win" in a clean way that manages
upstream changes. I, as a distro project maintainer, am then able to add a
call to my distro project copy of
setup-layers (that uses a project specific setup-layers.json) to a project
specific wrapper script that manages
project specific policy (some of which I described in my presentation)
without making developers on the project
team stuff their heads full of error prone local knowledge. One (managed)
wrapper command is all team
members need in order to use all of the Yocto/OE tools while producing a
consistent desktop level result during
their day-to-day work.

It is true that update-layers would not be appropriate to include in a
wrapper like that, as it would only be run by
a special delegate like a project admin or someone specifically tasked with
managing upstream change. That
does indeed point to the logic of folding update-layers directly into
bitbake-layers.

But this is why I chose not to. By definition the setup-layers concept
allows for a project specific repository to
manage change, including change in openembedded-core. The same would go for
update-layers. If we folded
update-layers into bitbake-layers, you get a chicken/egg problem so it made
more sense (in my mind) to treat
update-layers like setup-layers - have it dropped in by bitbake-layers when
it drops in setup-layers.

But your question exposes a missing feature in update-layers - it should do
a final check for an updated setup-layers
and update-layers script and inform the user that the project distro
repository needs to have those scripts updated
as well.

If my reasoning makes sense, I can put the time and energy into a set of
OE-Core patches that reflects the
above thinking.

..Ch:W..


On Wed, Jul 12, 2023 at 11:20=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> Thanks, perhaps this functionality should simply be folded directly
> into bitbake-layers perhaps, as an extension of 'create-layers-setup'?
> Does it need to be in a separate script?
>
> Alex
>
> On Wed, 12 Jul 2023 at 20:00, Chuck Wolber <chuckwolber@gmail.com> wrote:
> >
> > I wrote this tool to do automatic updating of layers managed by the
> setup-layers script. This
> > addresses some of the functionality I discussed in my OSSNA 2023 talk.
> >
> > A detailed explanation of what the following script does is found in th=
e
> comments, but in
> > a nutshell:
> >
> > * If the --sync-upstream argument is provided, any layers that have
> remotes called
> >   "origin" and "upstream" have upstream changes on their configured
> branch applied
> >   to the origin remote (and local clone).
> > * Updates rev and description for all layers managed by setup-layers
> after pulling
> >   the latest changes on the configured branch.
> > * Leaves the setup-layers.json file in an updated state so git diff wil=
l
> show changes.
> >   Changes can then be reviewed and managed based on local project polic=
y.
> >
> > I am looking for comments and feedback before I send this as a proper
> patch.
> >
> > In particular:
> >
> > * Are there any problems with this general approach?
> > * Should this be managed in OE-Core in the same way setup-layers is?
> > * I made some stylistic changes (e.g. main function, --dry-run, etc)
> that I plan to also patch into
> >   setup-layers if this is accepted and there are no objections.
> >
> >
> > ---
> >
> > #!/usr/bin/env python3
> > #
> > # Copyright OpenEmbedded Contributors
> > #
> > # SPDX-License-Identifier: MIT
> > #
> >
> > # This script is idempotent and assumes that the layers it is updating
> have
> > # been managed by setup-layers according to the JSON formatted layers
> data.
> > #
> > # For each layer repository in the JSON formatted layers data file:
> > #
> > # * If remotes named upstream and origin exist and the --sync-upstream
> argument
> > # has been provided, merge upstream changes on the configured branch to
> the
> > # origin remote.
> > # * Pull the latest changes on the configured branch from origin.
> > # * Update the JSON layers data to reflect the latest layer repo HEAD.
> > # * Leave layer repository in an updated state with the configured bran=
ch
> > # checked out.
> > #
> > # After reviewing the changes in the JSON layers data file, they can
> either be
> > # committed or reverted. If they are reverted, it will be necessary to
> re-run
> > # setup-layers to ensure your layer repositories reflect the intent
> captured in
> > # the configuration. For the sake of completeness, you may also wish to
> re-run
> > # setup-layers even if you commit the configuration changes, as this
> script
> > # leaves the local layer repo clones checked out to the configured
> branch rather
> > # than the configured rev. The HEAD of the configured branch and the
> configured
> > # rev are identical at the completion of this script, but the latter
> will be
> > # more consistent with expectations established by the setup-layers
> script.
> > #
> > # The term "setup-layers" refers to the script found at
> > # openembedded-core/scripts/oe-setup-layers. Pass the --help argument t=
o
> this
> > # script for the most up to date usage guidance.
> >
> > import argparse
> > import json
> > import os
> > import subprocess
> >
> > def _do_git_command(repodir, command):
> >     print("Running '{}' in {}".format(command, repodir))
> >     if not args.dry_run:
> >         subprocess.check_output(command, shell=3DTrue, cwd=3Drepodir)
> >
> > def _do_git_checkout_branch(repodir, remote, branch):
> >     _do_git_command(repodir, 'git checkout -B {0} --track {1}/{0}
> --quiet'.format(branch, remote))
> >
> > def _do_git_pull(repodir, remote, branch):
> >     _do_git_fetch(repodir, remote)
> >     _do_git_merge(repodir, remote, branch)
> >
> > def _do_git_fetch(repodir, remote):
> >     _do_git_command(repodir, 'git fetch {} --prune --prune-tags
> --quiet'.format(remote))
> >
> > def _do_git_merge(repodir, remote, branch):
> >     _do_git_command(repodir, 'git merge {}/{} --ff-only
> --quiet'.format(remote, branch))
> >
> > def _do_git_force_push(repodir, remote, branch):
> >     _do_git_command(repodir, 'git push {} heads/{} --force
> --quiet'.format(remote, branch))
> >
> > def _get_git_rev(repodir):
> >     rev =3D subprocess.check_output("git rev-parse HEAD", shell=3DTrue,
> cwd=3Drepodir, stderr=3Dsubprocess.DEVNULL)
> >     return rev.strip().decode("utf-8")
> >
> > def _get_git_desc(repodir):
> >     desc =3D subprocess.check_output("git describe HEAD --always",
> shell=3DTrue, cwd=3Drepodir, stderr=3Dsubprocess.DEVNULL)
> >     return desc.strip().decode("utf-8")
> >
> > def _do_sync_upstream(repodir, repo_name, repo_data):
> >     if not args.sync_upstream:
> >         return
> >
> >     repo_remote =3D repo_data['git-remote']
> >     branch =3D repo_remote['branch']
> >     remotes =3D repo_remote['remotes']
> >
> >     print("Attempting to sync layer repo {} with
> upstream.".format(repo_name))
> >
> >     if 'origin' not in remotes or 'upstream' not in remotes:
> >         print("Origin and/or upstream remotes not found on
> {}".format(repo_name))
> >         return
> >
> >     _do_git_checkout_branch(repodir, 'origin', branch)
> >     _do_git_pull(repodir, 'origin', branch)
> >     _do_git_fetch(repodir, 'upstream')
> >     _do_git_merge(repodir, 'upstream', branch)
> >     _do_git_force_push(repodir, 'origin', branch)
> >
> > def _do_update_layer_json(repodir, repo_name, layer_data):
> >     print("Updating layer JSON for {} repo.".format(repo_name))
> >     branch =3D layer_data['sources'][repo_name]['git-remote']['branch']
> >
> >     _do_git_checkout_branch(repodir, 'origin', branch)
> >     _do_git_pull(repodir, 'origin', branch)
> >
> >     layer_data['sources'][repo_name]['git-remote']['rev'] =3D
> _get_git_rev(repodir)
> >     layer_data['sources'][repo_name]['git-remote']['describe'] =3D
> _get_git_desc(repodir)
> >
> > def _do_update_layers(layer_data):
> >     print("Updating layers...")
> >     repos =3D layer_data['sources']
> >     for repo_name in repos:
> >         repo_data =3D repos[repo_name]
> >         repodir =3D os.path.abspath(os.path.join(args.destdir,
> repo_data['path']))
> >
> >         if 'contains_this_file' in repo_data.keys():
> >             continue
> >
> >         _do_sync_upstream(repodir, repo_name, repo_data)
> >         _do_update_layer_json(repodir, repo_name, layer_data)
> >
> > def _do_save_layer_config(layer_data):
> >     print("Saving updated layer config.")
> >     if args.dry_run:
> >         return
> >
> >     with open(args.jsondata, 'w') as f:
> >         json.dump(layer_data, f, ensure_ascii=3DFalse, indent=3D4)
> >
> >     print("\nReview {} for layer changes.".format(args.jsondata))
> >
> > def _parse_args():
> >     global args
> >
> >     try:
> >         defaultdest =3D os.path.dirname(subprocess.check_output('git
> rev-parse --show-toplevel', universal_newlines=3DTrue, shell=3DTrue,
> cwd=3Dos.path.dirname(__file__)))
> >     except subprocess.CalledProcessError as e:
> >         defaultdest =3D os.path.abspath(".")
> >
> >     parser =3D argparse.ArgumentParser(description=3D"Updates layer set=
up
> JSON in addition to layer repos with upstream remotes.")
> >
> >     parser.add_argument('--destdir', default=3Ddefaultdest, help=3D'Whe=
re to
> find the layers (default is
> {defaultdest}).'.format(defaultdest=3Ddefaultdest))
> >     parser.add_argument('--jsondata', default=3D__file__+".json",
> help=3D'File containing the layer data in json format (default is
> {defaultjson}).'.format(defaultjson=3D__file__+".json"))
> >     parser.add_argument('--sync-upstream', action=3D'store_true',
> help=3D"For repositories with origin and upstream remotes, merge any upst=
ream
> changes to the configured branch.")
> >     parser.add_argument('--dry-run', action=3D'store_true', help=3D"Per=
forms
> a dry run, but does not make any actual changes.")
> >
> >     args =3D parser.parse_args()
> >
> > def _parse_layer_config():
> >     with open(args.jsondata) as f:
> >         layer_data =3D json.load(f)
> >
> >     supported_versions =3D ["1.0"]
> >     if layer_data["version"] not in supported_versions:
> >         raise Exception("File {} has version {}, which is not in
> supported versions: {}".format(args.jsondata, layer_data["version"],
> supported_versions))
> >
> >     return layer_data
> >
> > def main():
> >     _parse_args()
> >
> >     layer_data =3D _parse_layer_config()
> >     _do_update_layers(layer_data)
> >     _do_save_layer_config(layer_data)
> >
> > if __name__=3D=3D"__main__":
> >     main()
> >
> >
> >
> > --
> > "Perfection must be reached by degrees; she requires the slow hand of
> time." - Voltaire
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184211):
> https://lists.openembedded.org/g/openembedded-core/message/184211
> > Mute This Topic: https://lists.openembedded.org/mt/100104869/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--0000000000007605460600513ecc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That is a good point that I wrestled with. The TL;DR =
is that it seems to create a chicken/egg problem.<br></div><div><br></div><=
div>Here is my reasoning in (possibly too much) detail.<br></div><div><br><=
/div><div>At a very high level, one of the ingenious aspects of Yocto/OE is=
 that it (almost) always lets the project</div><div>distro &quot;win&quot;.=
 This is important because one of the questions that always needs to be ans=
wered when using</div><div>OSS tools (especially in a highly regulated indu=
stry) is how upstream change can be locally managed. This</div><div>splits =
along several lines that always end up at, &quot;can this be done sanely wi=
thout requiring manual (error</div><div>prone) labor&quot;. Or to put that =
a little more succinctly - how much energy are you prepared to put into pro=
ving</div><div>to a regulator that every developer did their work in a cons=
istent way that matches the method used to produce=C2=A0</div><div>the prod=
uct now out in the field (and no one ever reads the documentation, so you d=
o not get to use that as an</div><div>answer)? And I hasten to add - this c=
onsistency should benefit non-regulated use-cases as well, but the</div><di=
v>benefits it provides must *FAR* exceed the work required to derive the be=
nefit or no one will ever use it.<br></div><div><br></div><div>The meta lay=
ering, cve-check, source checksumming, automatic license checking, bbappend=
, etc. mechanisms</div><div>are key to the ideas described above, but there=
 are several missing elements, some of which are captured in</div><div>what=
 was introduced by setup-layers.<br></div><div><br></div><div>I like the id=
ea of setup-layers as a script that is dropped into the distro project repo=
sitory so it can operate in</div><div>a standalone manner. This is another =
example of letting the project distro &quot;win&quot; in a clean way that m=
anages</div><div>upstream changes. I, as a distro project maintainer, am th=
en able to add a call to my distro project copy of</div><div>setup-layers (=
that uses a project specific setup-layers.json) to a project specific wrapp=
er script that manages</div><div>project specific policy (some of which I d=
escribed in my presentation) without making developers on the project</div>=
<div>team stuff their heads full of error prone local knowledge. One (manag=
ed) wrapper command is all team</div><div>members need in order to use all =
of the Yocto/OE tools while producing a consistent desktop level result dur=
ing</div><div>their day-to-day work.</div><div><br></div><div>It is true th=
at update-layers would not be appropriate to include in a wrapper like that=
, as it would only be run by</div><div>a special delegate like a project ad=
min or someone specifically tasked with managing upstream change. That</div=
><div>does indeed point to the logic of folding update-layers directly into=
 bitbake-layers.</div><div><br></div><div>But this is why I chose not to. B=
y definition the setup-layers concept allows for a project specific reposit=
ory to</div><div>manage change, including change in openembedded-core. The =
same would go for update-layers. If we folded</div><div>update-layers into =
bitbake-layers, you get a chicken/egg problem so it made more sense (in my =
mind) to treat</div><div>update-layers like setup-layers - have it dropped =
in by bitbake-layers when it drops in setup-layers.<br><br></div><div>But y=
our question exposes a missing feature in update-layers - it should do a fi=
nal check for an updated setup-layers</div><div>and update-layers script an=
d inform the user that the project distro repository needs to have those sc=
ripts updated</div><div>as well.</div><div><br></div><div>If my reasoning m=
akes sense, I can put the time and energy into a set of OE-Core patches tha=
t reflects the</div><div>above thinking.</div><div><br></div><div>..Ch:W..<=
br><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, Jul 12, 2023 at 11:20=E2=80=AFAM Alexander Kanavin &lt=
;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks, pe=
rhaps this functionality should simply be folded directly<br>
into bitbake-layers perhaps, as an extension of &#39;create-layers-setup&#3=
9;?<br>
Does it need to be in a separate script?<br>
<br>
Alex<br>
<br>
On Wed, 12 Jul 2023 at 20:00, Chuck Wolber &lt;<a href=3D"mailto:chuckwolbe=
r@gmail.com" target=3D"_blank">chuckwolber@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I wrote this tool to do automatic updating of layers managed by the se=
tup-layers script. This<br>
&gt; addresses some of the functionality I discussed in my OSSNA 2023 talk.=
<br>
&gt;<br>
&gt; A detailed explanation of what the following script does is found in t=
he comments, but in<br>
&gt; a nutshell:<br>
&gt;<br>
&gt; * If the --sync-upstream argument is provided, any layers that have re=
motes called<br>
&gt;=C2=A0 =C2=A0&quot;origin&quot; and &quot;upstream&quot; have upstream =
changes on their configured branch applied<br>
&gt;=C2=A0 =C2=A0to the origin remote (and local clone).<br>
&gt; * Updates rev and description for all layers managed by setup-layers a=
fter pulling<br>
&gt;=C2=A0 =C2=A0the latest changes on the configured branch.<br>
&gt; * Leaves the setup-layers.json file in an updated state so git diff wi=
ll show changes.<br>
&gt;=C2=A0 =C2=A0Changes can then be reviewed and managed based on local pr=
oject policy.<br>
&gt;<br>
&gt; I am looking for comments and feedback before I send this as a proper =
patch.<br>
&gt;<br>
&gt; In particular:<br>
&gt;<br>
&gt; * Are there any problems with this general approach?<br>
&gt; * Should this be managed in OE-Core in the same way setup-layers is?<b=
r>
&gt; * I made some stylistic changes (e.g. main function, --dry-run, etc) t=
hat I plan to also patch into<br>
&gt;=C2=A0 =C2=A0setup-layers if this is accepted and there are no objectio=
ns.<br>
&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; #!/usr/bin/env python3<br>
&gt; #<br>
&gt; # Copyright OpenEmbedded Contributors<br>
&gt; #<br>
&gt; # SPDX-License-Identifier: MIT<br>
&gt; #<br>
&gt;<br>
&gt; # This script is idempotent and assumes that the layers it is updating=
 have<br>
&gt; # been managed by setup-layers according to the JSON formatted layers =
data.<br>
&gt; #<br>
&gt; # For each layer repository in the JSON formatted layers data file:<br=
>
&gt; #<br>
&gt; # * If remotes named upstream and origin exist and the --sync-upstream=
 argument<br>
&gt; # has been provided, merge upstream changes on the configured branch t=
o the<br>
&gt; # origin remote.<br>
&gt; # * Pull the latest changes on the configured branch from origin.<br>
&gt; # * Update the JSON layers data to reflect the latest layer repo HEAD.=
<br>
&gt; # * Leave layer repository in an updated state with the configured bra=
nch<br>
&gt; # checked out.<br>
&gt; #<br>
&gt; # After reviewing the changes in the JSON layers data file, they can e=
ither be<br>
&gt; # committed or reverted. If they are reverted, it will be necessary to=
 re-run<br>
&gt; # setup-layers to ensure your layer repositories reflect the intent ca=
ptured in<br>
&gt; # the configuration. For the sake of completeness, you may also wish t=
o re-run<br>
&gt; # setup-layers even if you commit the configuration changes, as this s=
cript<br>
&gt; # leaves the local layer repo clones checked out to the configured bra=
nch rather<br>
&gt; # than the configured rev. The HEAD of the configured branch and the c=
onfigured<br>
&gt; # rev are identical at the completion of this script, but the latter w=
ill be<br>
&gt; # more consistent with expectations established by the setup-layers sc=
ript.<br>
&gt; #<br>
&gt; # The term &quot;setup-layers&quot; refers to the script found at<br>
&gt; # openembedded-core/scripts/oe-setup-layers. Pass the --help argument =
to this<br>
&gt; # script for the most up to date usage guidance.<br>
&gt;<br>
&gt; import argparse<br>
&gt; import json<br>
&gt; import os<br>
&gt; import subprocess<br>
&gt;<br>
&gt; def _do_git_command(repodir, command):<br>
&gt;=C2=A0 =C2=A0 =C2=A0print(&quot;Running &#39;{}&#39; in {}&quot;.format=
(command, repodir))<br>
&gt;=C2=A0 =C2=A0 =C2=A0if not args.dry_run:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output(command, shel=
l=3DTrue, cwd=3Drepodir)<br>
&gt;<br>
&gt; def _do_git_checkout_branch(repodir, remote, branch):<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_command(repodir, &#39;git checkout -B {0} -=
-track {1}/{0} --quiet&#39;.format(branch, remote))<br>
&gt;<br>
&gt; def _do_git_pull(repodir, remote, branch):<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_fetch(repodir, remote)<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_merge(repodir, remote, branch)<br>
&gt;<br>
&gt; def _do_git_fetch(repodir, remote):<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_command(repodir, &#39;git fetch {} --prune =
--prune-tags --quiet&#39;.format(remote))<br>
&gt;<br>
&gt; def _do_git_merge(repodir, remote, branch):<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_command(repodir, &#39;git merge {}/{} --ff-=
only --quiet&#39;.format(remote, branch))<br>
&gt;<br>
&gt; def _do_git_force_push(repodir, remote, branch):<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_command(repodir, &#39;git push {} heads/{} =
--force --quiet&#39;.format(remote, branch))<br>
&gt;<br>
&gt; def _get_git_rev(repodir):<br>
&gt;=C2=A0 =C2=A0 =C2=A0rev =3D subprocess.check_output(&quot;git rev-parse=
 HEAD&quot;, shell=3DTrue, cwd=3Drepodir, stderr=3Dsubprocess.DEVNULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0return rev.strip().decode(&quot;utf-8&quot;)<br>
&gt;<br>
&gt; def _get_git_desc(repodir):<br>
&gt;=C2=A0 =C2=A0 =C2=A0desc =3D subprocess.check_output(&quot;git describe=
 HEAD --always&quot;, shell=3DTrue, cwd=3Drepodir, stderr=3Dsubprocess.DEVN=
ULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0return desc.strip().decode(&quot;utf-8&quot;)<br>
&gt;<br>
&gt; def _do_sync_upstream(repodir, repo_name, repo_data):<br>
&gt;=C2=A0 =C2=A0 =C2=A0if not args.sync_upstream:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0repo_remote =3D repo_data[&#39;git-remote&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0branch =3D repo_remote[&#39;branch&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0remotes =3D repo_remote[&#39;remotes&#39;]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0print(&quot;Attempting to sync layer repo {} with u=
pstream.&quot;.format(repo_name))<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if &#39;origin&#39; not in remotes or &#39;upstream=
&#39; not in remotes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&quot;Origin and/or upstream re=
motes not found on {}&quot;.format(repo_name))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_checkout_branch(repodir, &#39;origin&#39;, =
branch)<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_pull(repodir, &#39;origin&#39;, branch)<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_fetch(repodir, &#39;upstream&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_merge(repodir, &#39;upstream&#39;, branch)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_force_push(repodir, &#39;origin&#39;, branc=
h)<br>
&gt;<br>
&gt; def _do_update_layer_json(repodir, repo_name, layer_data):<br>
&gt;=C2=A0 =C2=A0 =C2=A0print(&quot;Updating layer JSON for {} repo.&quot;.=
format(repo_name))<br>
&gt;=C2=A0 =C2=A0 =C2=A0branch =3D layer_data[&#39;sources&#39;][repo_name]=
[&#39;git-remote&#39;][&#39;branch&#39;]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_checkout_branch(repodir, &#39;origin&#39;, =
branch)<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_git_pull(repodir, &#39;origin&#39;, branch)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0layer_data[&#39;sources&#39;][repo_name][&#39;git-r=
emote&#39;][&#39;rev&#39;] =3D _get_git_rev(repodir)<br>
&gt;=C2=A0 =C2=A0 =C2=A0layer_data[&#39;sources&#39;][repo_name][&#39;git-r=
emote&#39;][&#39;describe&#39;] =3D _get_git_desc(repodir)<br>
&gt;<br>
&gt; def _do_update_layers(layer_data):<br>
&gt;=C2=A0 =C2=A0 =C2=A0print(&quot;Updating layers...&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0repos =3D layer_data[&#39;sources&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0for repo_name in repos:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0repo_data =3D repos[repo_name]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0repodir =3D os.path.abspath(os.path.j=
oin(args.destdir, repo_data[&#39;path&#39;]))<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;contains_this_file&#39; in re=
po_data.keys():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_do_sync_upstream(repodir, repo_name,=
 repo_data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_do_update_layer_json(repodir, repo_n=
ame, layer_data)<br>
&gt;<br>
&gt; def _do_save_layer_config(layer_data):<br>
&gt;=C2=A0 =C2=A0 =C2=A0print(&quot;Saving updated layer config.&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0if args.dry_run:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0with open(args.jsondata, &#39;w&#39;) as f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0json.dump(layer_data, f, ensure_ascii=
=3DFalse, indent=3D4)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0print(&quot;\nReview {} for layer changes.&quot;.fo=
rmat(args.jsondata))<br>
&gt;<br>
&gt; def _parse_args():<br>
&gt;=C2=A0 =C2=A0 =C2=A0global args<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defaultdest =3D os.path.dirname(subpr=
ocess.check_output(&#39;git rev-parse --show-toplevel&#39;, universal_newli=
nes=3DTrue, shell=3DTrue, cwd=3Dos.path.dirname(__file__)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError as e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defaultdest =3D os.path.abspath(&quot=
;.&quot;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0parser =3D argparse.ArgumentParser(description=3D&q=
uot;Updates layer setup JSON in addition to layer repos with upstream remot=
es.&quot;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;--destdir&#39;, default=3D=
defaultdest, help=3D&#39;Where to find the layers (default is {defaultdest}=
).&#39;.format(defaultdest=3Ddefaultdest))<br>
&gt;=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;--jsondata&#39;, default=
=3D__file__+&quot;.json&quot;, help=3D&#39;File containing the layer data i=
n json format (default is {defaultjson}).&#39;.format(defaultjson=3D__file_=
_+&quot;.json&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;--sync-upstream&#39;, acti=
on=3D&#39;store_true&#39;, help=3D&quot;For repositories with origin and up=
stream remotes, merge any upstream changes to the configured branch.&quot;)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;--dry-run&#39;, action=3D&=
#39;store_true&#39;, help=3D&quot;Performs a dry run, but does not make any=
 actual changes.&quot;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0args =3D parser.parse_args()<br>
&gt;<br>
&gt; def _parse_layer_config():<br>
&gt;=C2=A0 =C2=A0 =C2=A0with open(args.jsondata) as f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer_data =3D json.load(f)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0supported_versions =3D [&quot;1.0&quot;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0if layer_data[&quot;version&quot;] not in supported=
_versions:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise Exception(&quot;File {} has ver=
sion {}, which is not in supported versions: {}&quot;.format(args.jsondata,=
 layer_data[&quot;version&quot;], supported_versions))<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0return layer_data<br>
&gt;<br>
&gt; def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0_parse_args()<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0layer_data =3D _parse_layer_config()<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_update_layers(layer_data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0_do_save_layer_config(layer_data)<br>
&gt;<br>
&gt; if __name__=3D=3D&quot;__main__&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0main()<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Perfection must be reached by degrees; she requires the slow han=
d of time.&quot; - Voltaire<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184211): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184211" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/184211</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10010486=
9/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100104869/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><b><span style=3D"font-family:monospace">&quot;Perfection must be =
reached by degrees; she requires the slow hand of time.&quot; - Voltaire</s=
pan></b></div></div></div>

--0000000000007605460600513ecc--

