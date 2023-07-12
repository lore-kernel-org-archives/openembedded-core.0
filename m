Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6738AEB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 18:00:25 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.2840.1689184816524525680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 11:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AGAslp1w;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: chuckwolber@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6b91ad1f9c1so4594223a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689184815; x=1691776815;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7Li4ezddWM+V7qaHYXjW+9JA4+Fcuo2VEn5tVjSlxQE=;
        b=AGAslp1w+j5zuUkGyoDXbZJNZtn7m0rrz3noXwGyFy3rMqDtFO1K2t4hskvFsKLj7+
         oBmZQJEGftStZLa+vLvTbmDAsQtl1hzYoDDkkV5SBzH+T6O8yADDWqgTCWCU2OJcIpNR
         E0BNJdw5sSdZrKh6AnyUvC1/wgMBt2BSDjSQ8ixcB5BSUv0+Qcq2l1nfgkS8VAHHo3U5
         Yb0BE8qTUj81WlYfWPO9UNlqM5KE2dcYpW8utF+e4NRWskSffEPMenir/UQyInrd6dOj
         JRhTNC3WN4sUAKetc+woDbndqfm756dD5UtqNknGTxgxLBnAYGwSpCs2NoGYYpAQ4NJ5
         LMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689184815; x=1691776815;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Li4ezddWM+V7qaHYXjW+9JA4+Fcuo2VEn5tVjSlxQE=;
        b=KyM/1IZiyBfZYIuM7ezw9eA+lnnIzAkGW7As4/NyijhCcBOV2fuL5EB9HWaUAyQUDa
         KDoTyTDWPXF91n0O0Frm2CwIEbT356Ib98L9/HwL5AYa3F0TgNLpEY1Jh5CFA0B4rL5Y
         67gmS80Y7kMn0dXGkBqqbZOsVyCv/s5wbmipD30F9AEDkjqkVdo4PlMeeD6g79MT3WU4
         iwGSzlECUZBmHBUfETyF6CbqXHUDGIkAhhdYUdKmcN6wHgPFiVNDVQj9syUf8lawvgtT
         4GJlqAcFf+7SLVGswaAoYB/F2k2+EqefulMc1DINCSiL7KTRXWwwY33F1ZlmLv2fuTL7
         IbXg==
X-Gm-Message-State: ABy/qLaHjlXj7hwBM61+TA/KPtX5QYOT6Ag4qUdQu0TJK/iw5yNszwLb
	gcO8CVABwbF3WgvJWegoDS5USRmbhJuezGaZYc8Vdl12aZA=
X-Google-Smtp-Source: APBJJlG3wExWaKlR0in+Y7lEnbCyYrCjABL31airMJJg0m8MH7e41ksGoRCclkiCXD6/q8cdhViiRYtRCfgyt1CgLG8=
X-Received: by 2002:a05:6870:c69e:b0:1a2:8ebd:7d46 with SMTP id
 cv30-20020a056870c69e00b001a28ebd7d46mr21261262oab.21.1689184815177; Wed, 12
 Jul 2023 11:00:15 -0700 (PDT)
MIME-Version: 1.0
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Wed, 12 Jul 2023 11:00:04 -0700
Message-ID: <CAB=6tBRhQaqO8jkM7CCpRfNAyYiByB4V4dFbbbWhu7A6QN6KTQ@mail.gmail.com>
Subject: [OE-Core][RFC] update-layers: Update layers managed by setup-layers
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000de649106004dfcd0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 18:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184211

--000000000000de649106004dfcd0
Content-Type: text/plain; charset="UTF-8"

I wrote this tool to do automatic updating of layers managed by the
setup-layers script. This
addresses some of the functionality I discussed in my OSSNA 2023 talk
<https://www.youtube.com/watch?v=MiTwL9xZdW4>.

A detailed explanation of what the following script does is found in the
comments, but in
a nutshell:

* If the --sync-upstream argument is provided, any layers that have remotes
called
  "origin" and "upstream" have upstream changes on their configured branch
applied
  to the origin remote (and local clone).
* Updates rev and description for all layers managed by setup-layers after
pulling
  the latest changes on the configured branch.
* Leaves the setup-layers.json file in an updated state so git diff will
show changes.
  Changes can then be reviewed and managed based on local project policy.

I am looking for comments and feedback before I send this as a proper patch.

In particular:

* Are there any problems with this general approach?
* Should this be managed in OE-Core in the same way setup-layers is?
* I made some stylistic changes (e.g. main function, --dry-run, etc) that I
plan to also patch into
  setup-layers if this is accepted and there are no objections.


---

#!/usr/bin/env python3
#
# Copyright OpenEmbedded Contributors
#
# SPDX-License-Identifier: MIT
#

# This script is idempotent and assumes that the layers it is updating have
# been managed by setup-layers according to the JSON formatted layers data.
#
# For each layer repository in the JSON formatted layers data file:
#
# * If remotes named upstream and origin exist and the --sync-upstream
argument
# has been provided, merge upstream changes on the configured branch to the
# origin remote.
# * Pull the latest changes on the configured branch from origin.
# * Update the JSON layers data to reflect the latest layer repo HEAD.
# * Leave layer repository in an updated state with the configured branch
# checked out.
#
# After reviewing the changes in the JSON layers data file, they can either
be
# committed or reverted. If they are reverted, it will be necessary to
re-run
# setup-layers to ensure your layer repositories reflect the intent
captured in
# the configuration. For the sake of completeness, you may also wish to
re-run
# setup-layers even if you commit the configuration changes, as this script
# leaves the local layer repo clones checked out to the configured branch
rather
# than the configured rev. The HEAD of the configured branch and the
configured
# rev are identical at the completion of this script, but the latter will be
# more consistent with expectations established by the setup-layers script.
#
# The term "setup-layers" refers to the script found at
# openembedded-core/scripts/oe-setup-layers. Pass the --help argument to
this
# script for the most up to date usage guidance.

import argparse
import json
import os
import subprocess

def _do_git_command(repodir, command):
    print("Running '{}' in {}".format(command, repodir))
    if not args.dry_run:
        subprocess.check_output(command, shell=True, cwd=repodir)

def _do_git_checkout_branch(repodir, remote, branch):
    _do_git_command(repodir, 'git checkout -B {0} --track {1}/{0}
--quiet'.format(branch, remote))

def _do_git_pull(repodir, remote, branch):
    _do_git_fetch(repodir, remote)
    _do_git_merge(repodir, remote, branch)

def _do_git_fetch(repodir, remote):
    _do_git_command(repodir, 'git fetch {} --prune --prune-tags
--quiet'.format(remote))

def _do_git_merge(repodir, remote, branch):
    _do_git_command(repodir, 'git merge {}/{} --ff-only
--quiet'.format(remote, branch))

def _do_git_force_push(repodir, remote, branch):
    _do_git_command(repodir, 'git push {} heads/{} --force
--quiet'.format(remote, branch))

def _get_git_rev(repodir):
    rev = subprocess.check_output("git rev-parse HEAD", shell=True,
cwd=repodir, stderr=subprocess.DEVNULL)
    return rev.strip().decode("utf-8")

def _get_git_desc(repodir):
    desc = subprocess.check_output("git describe HEAD --always",
shell=True, cwd=repodir, stderr=subprocess.DEVNULL)
    return desc.strip().decode("utf-8")

def _do_sync_upstream(repodir, repo_name, repo_data):
    if not args.sync_upstream:
        return

    repo_remote = repo_data['git-remote']
    branch = repo_remote['branch']
    remotes = repo_remote['remotes']

    print("Attempting to sync layer repo {} with
upstream.".format(repo_name))

    if 'origin' not in remotes or 'upstream' not in remotes:
        print("Origin and/or upstream remotes not found on
{}".format(repo_name))
        return

    _do_git_checkout_branch(repodir, 'origin', branch)
    _do_git_pull(repodir, 'origin', branch)
    _do_git_fetch(repodir, 'upstream')
    _do_git_merge(repodir, 'upstream', branch)
    _do_git_force_push(repodir, 'origin', branch)

def _do_update_layer_json(repodir, repo_name, layer_data):
    print("Updating layer JSON for {} repo.".format(repo_name))
    branch = layer_data['sources'][repo_name]['git-remote']['branch']

    _do_git_checkout_branch(repodir, 'origin', branch)
    _do_git_pull(repodir, 'origin', branch)

    layer_data['sources'][repo_name]['git-remote']['rev'] =
_get_git_rev(repodir)
    layer_data['sources'][repo_name]['git-remote']['describe'] =
_get_git_desc(repodir)

def _do_update_layers(layer_data):
    print("Updating layers...")
    repos = layer_data['sources']
    for repo_name in repos:
        repo_data = repos[repo_name]
        repodir = os.path.abspath(os.path.join(args.destdir,
repo_data['path']))

        if 'contains_this_file' in repo_data.keys():
            continue

        _do_sync_upstream(repodir, repo_name, repo_data)
        _do_update_layer_json(repodir, repo_name, layer_data)

def _do_save_layer_config(layer_data):
    print("Saving updated layer config.")
    if args.dry_run:
        return

    with open(args.jsondata, 'w') as f:
        json.dump(layer_data, f, ensure_ascii=False, indent=4)

    print("\nReview {} for layer changes.".format(args.jsondata))

def _parse_args():
    global args

    try:
        defaultdest = os.path.dirname(subprocess.check_output('git
rev-parse --show-toplevel', universal_newlines=True, shell=True,
cwd=os.path.dirname(__file__)))
    except subprocess.CalledProcessError as e:
        defaultdest = os.path.abspath(".")

    parser = argparse.ArgumentParser(description="Updates layer setup JSON
in addition to layer repos with upstream remotes.")

    parser.add_argument('--destdir', default=defaultdest, help='Where to
find the layers (default is
{defaultdest}).'.format(defaultdest=defaultdest))
    parser.add_argument('--jsondata', default=__file__+".json", help='File
containing the layer data in json format (default is
{defaultjson}).'.format(defaultjson=__file__+".json"))
    parser.add_argument('--sync-upstream', action='store_true', help="For
repositories with origin and upstream remotes, merge any upstream changes
to the configured branch.")
    parser.add_argument('--dry-run', action='store_true', help="Performs a
dry run, but does not make any actual changes.")

    args = parser.parse_args()

def _parse_layer_config():
    with open(args.jsondata) as f:
        layer_data = json.load(f)

    supported_versions = ["1.0"]
    if layer_data["version"] not in supported_versions:
        raise Exception("File {} has version {}, which is not in supported
versions: {}".format(args.jsondata, layer_data["version"],
supported_versions))

    return layer_data

def main():
    _parse_args()

    layer_data = _parse_layer_config()
    _do_update_layers(layer_data)
    _do_save_layer_config(layer_data)

if __name__=="__main__":
    main()



--
"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire

--000000000000de649106004dfcd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I wrote this tool to do automatic updating of layers =
managed by the setup-layers script. This<br>addresses some of the functiona=
lity I discussed in my <a href=3D"https://www.youtube.com/watch?v=3DMiTwL9x=
ZdW4">OSSNA 2023 talk</a>.</div><div><br></div><div>A detailed explanation =
of what the following script does is found in the comments, but in</div><di=
v>a nutshell:</div><div><br></div><div>* If the --sync-upstream argument is=
 provided, any layers that have remotes called</div><div>=C2=A0 &quot;origi=
n&quot; and &quot;upstream&quot; have upstream changes on their configured =
branch applied</div><div>=C2=A0 to the origin remote (and local clone).<br>=
</div><div>* Updates rev and description for all layers managed by setup-la=
yers after pulling</div><div>=C2=A0 the latest changes on the configured br=
anch.<br></div><div>* Leaves the setup-layers.json file in an updated state=
 so git diff will show changes.</div><div>=C2=A0 Changes can then be review=
ed and managed based on local project policy.<br></div><br><div>I am lookin=
g for comments and feedback before I send this as a proper patch.<br><br>In=
 particular:<br><br>* Are there any problems with this general approach?<br=
>* Should this be managed in OE-Core in the same way setup-layers is?<br><d=
iv>* I made some stylistic changes (e.g. main function, --dry-run, etc) tha=
t I plan to also patch into</div><div>=C2=A0 setup-layers if this is accept=
ed and there are no objections.<br></div><br></div><div><br>--- <br><br>#!/=
usr/bin/env python3<br>#<br># Copyright OpenEmbedded Contributors<br>#<br>#=
 SPDX-License-Identifier: MIT<br>#<br><br># This script is idempotent and a=
ssumes that the layers it is updating have<br># been managed by setup-layer=
s according to the JSON formatted layers data.<br>#<br># For each layer rep=
ository in the JSON formatted layers data file:<br>#<br># * If remotes name=
d upstream and origin exist and the --sync-upstream argument<br># has been =
provided, merge upstream changes on the configured branch to the<br># origi=
n remote.<br># * Pull the latest changes on the configured branch from orig=
in.<br># * Update the JSON layers data to reflect the latest layer repo HEA=
D.<br># * Leave layer repository in an updated state with the configured br=
anch<br># checked out.<br>#<br># After reviewing the changes in the JSON la=
yers data file, they can either be<br># committed or reverted. If they are =
reverted, it will be necessary to re-run<br># setup-layers to ensure your l=
ayer repositories reflect the intent captured in<br># the configuration. Fo=
r the sake of completeness, you may also wish to re-run<br># setup-layers e=
ven if you commit the configuration changes, as this script<br># leaves the=
 local layer repo clones checked out to the configured branch rather<br># t=
han the configured rev. The HEAD of the configured branch and the configure=
d<br># rev are identical at the completion of this script, but the latter w=
ill be<br># more consistent with expectations established by the setup-laye=
rs script.<br>#<br># The term &quot;setup-layers&quot; refers to the script=
 found at<br># openembedded-core/scripts/oe-setup-layers. Pass the --help a=
rgument to this<br># script for the most up to date usage guidance.<br><br>=
import argparse<br>import json<br>import os<br>import subprocess<br><br>def=
 _do_git_command(repodir, command):<br>=C2=A0 =C2=A0 print(&quot;Running &#=
39;{}&#39; in {}&quot;.format(command, repodir))<br>=C2=A0 =C2=A0 if not ar=
gs.dry_run:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output(command,=
 shell=3DTrue, cwd=3Drepodir)<br><br>def _do_git_checkout_branch(repodir, r=
emote, branch):<br>=C2=A0 =C2=A0 _do_git_command(repodir, &#39;git checkout=
 -B {0} --track {1}/{0} --quiet&#39;.format(branch, remote))<br><br>def _do=
_git_pull(repodir, remote, branch):<br>=C2=A0 =C2=A0 _do_git_fetch(repodir,=
 remote)<br>=C2=A0 =C2=A0 _do_git_merge(repodir, remote, branch)<br><br>def=
 _do_git_fetch(repodir, remote):<br>=C2=A0 =C2=A0 _do_git_command(repodir, =
&#39;git fetch {} --prune --prune-tags --quiet&#39;.format(remote))<br><br>=
def _do_git_merge(repodir, remote, branch):<br>=C2=A0 =C2=A0 _do_git_comman=
d(repodir, &#39;git merge {}/{} --ff-only --quiet&#39;.format(remote, branc=
h))<br><br>def _do_git_force_push(repodir, remote, branch):<br>=C2=A0 =C2=
=A0 _do_git_command(repodir, &#39;git push {} heads/{} --force --quiet&#39;=
.format(remote, branch))<br><br>def _get_git_rev(repodir):<br>=C2=A0 =C2=A0=
 rev =3D subprocess.check_output(&quot;git rev-parse HEAD&quot;, shell=3DTr=
ue, cwd=3Drepodir, stderr=3Dsubprocess.DEVNULL)<br>=C2=A0 =C2=A0 return rev=
.strip().decode(&quot;utf-8&quot;)<br><br>def _get_git_desc(repodir):<br>=
=C2=A0 =C2=A0 desc =3D subprocess.check_output(&quot;git describe HEAD --al=
ways&quot;, shell=3DTrue, cwd=3Drepodir, stderr=3Dsubprocess.DEVNULL)<br>=
=C2=A0 =C2=A0 return desc.strip().decode(&quot;utf-8&quot;)<br><br>def _do_=
sync_upstream(repodir, repo_name, repo_data):<br>=C2=A0 =C2=A0 if not args.=
sync_upstream:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br><br>=C2=A0 =C2=A0 r=
epo_remote =3D repo_data[&#39;git-remote&#39;]<br>=C2=A0 =C2=A0 branch =3D =
repo_remote[&#39;branch&#39;]<br>=C2=A0 =C2=A0 remotes =3D repo_remote[&#39=
;remotes&#39;]<br><br>=C2=A0 =C2=A0 print(&quot;Attempting to sync layer re=
po {} with upstream.&quot;.format(repo_name))<br><br>=C2=A0 =C2=A0 if &#39;=
origin&#39; not in remotes or &#39;upstream&#39; not in remotes:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 print(&quot;Origin and/or upstream remotes not found o=
n {}&quot;.format(repo_name))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br><br>=
=C2=A0 =C2=A0 _do_git_checkout_branch(repodir, &#39;origin&#39;, branch)<br=
>=C2=A0 =C2=A0 _do_git_pull(repodir, &#39;origin&#39;, branch)<br>=C2=A0 =
=C2=A0 _do_git_fetch(repodir, &#39;upstream&#39;)<br>=C2=A0 =C2=A0 _do_git_=
merge(repodir, &#39;upstream&#39;, branch)<br>=C2=A0 =C2=A0 _do_git_force_p=
ush(repodir, &#39;origin&#39;, branch)<br><br>def _do_update_layer_json(rep=
odir, repo_name, layer_data):<br>=C2=A0 =C2=A0 print(&quot;Updating layer J=
SON for {} repo.&quot;.format(repo_name))<br>=C2=A0 =C2=A0 branch =3D layer=
_data[&#39;sources&#39;][repo_name][&#39;git-remote&#39;][&#39;branch&#39;]=
<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 _do_git_checkout_branch(repodir, &#39;o=
rigin&#39;, branch)<br>=C2=A0 =C2=A0 _do_git_pull(repodir, &#39;origin&#39;=
, branch)<br><br>=C2=A0 =C2=A0 layer_data[&#39;sources&#39;][repo_name][&#3=
9;git-remote&#39;][&#39;rev&#39;] =3D _get_git_rev(repodir)<br>=C2=A0 =C2=
=A0 layer_data[&#39;sources&#39;][repo_name][&#39;git-remote&#39;][&#39;des=
cribe&#39;] =3D _get_git_desc(repodir)<br><br>def _do_update_layers(layer_d=
ata):<br>=C2=A0 =C2=A0 print(&quot;Updating layers...&quot;)<br>=C2=A0 =C2=
=A0 repos =3D layer_data[&#39;sources&#39;]<br>=C2=A0 =C2=A0 for repo_name =
in repos:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 repo_data =3D repos[repo_name]<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 repodir =3D os.path.abspath(os.path.join(args.d=
estdir, repo_data[&#39;path&#39;]))<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &=
#39;contains_this_file&#39; in repo_data.keys():<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 continue<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 _do_sync_u=
pstream(repodir, repo_name, repo_data)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 _do_u=
pdate_layer_json(repodir, repo_name, layer_data)<br><br>def _do_save_layer_=
config(layer_data):<br>=C2=A0 =C2=A0 print(&quot;Saving updated layer confi=
g.&quot;)<br>=C2=A0 =C2=A0 if args.dry_run:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
return<br><br>=C2=A0 =C2=A0 with open(args.jsondata, &#39;w&#39;) as f:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(layer_data, f, ensure_ascii=3DFalse, =
indent=3D4)<br><br>=C2=A0 =C2=A0 print(&quot;\nReview {} for layer changes.=
&quot;.format(args.jsondata))<br><br>def _parse_args():<br>=C2=A0 =C2=A0 gl=
obal args<br><br>=C2=A0 =C2=A0 try:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 defaultd=
est =3D os.path.dirname(subprocess.check_output(&#39;git rev-parse --show-t=
oplevel&#39;, universal_newlines=3DTrue, shell=3DTrue, cwd=3Dos.path.dirnam=
e(__file__)))<br>=C2=A0 =C2=A0 except subprocess.CalledProcessError as e:<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 defaultdest =3D os.path.abspath(&quot;.&quot;=
)<br><br>=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(description=3D&qu=
ot;Updates layer setup JSON in addition to layer repos with upstream remote=
s.&quot;)<br><br>=C2=A0 =C2=A0 parser.add_argument(&#39;--destdir&#39;, def=
ault=3Ddefaultdest, help=3D&#39;Where to find the layers (default is {defau=
ltdest}).&#39;.format(defaultdest=3Ddefaultdest))<br>=C2=A0 =C2=A0 parser.a=
dd_argument(&#39;--jsondata&#39;, default=3D__file__+&quot;.json&quot;, hel=
p=3D&#39;File containing the layer data in json format (default is {default=
json}).&#39;.format(defaultjson=3D__file__+&quot;.json&quot;))<br>=C2=A0 =
=C2=A0 parser.add_argument(&#39;--sync-upstream&#39;, action=3D&#39;store_t=
rue&#39;, help=3D&quot;For repositories with origin and upstream remotes, m=
erge any upstream changes to the configured branch.&quot;)<br>=C2=A0 =C2=A0=
 parser.add_argument(&#39;--dry-run&#39;, action=3D&#39;store_true&#39;, he=
lp=3D&quot;Performs a dry run, but does not make any actual changes.&quot;)=
<br><br>=C2=A0 =C2=A0 args =3D parser.parse_args()<br><br>def _parse_layer_=
config():<br>=C2=A0 =C2=A0 with open(args.jsondata) as f:<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 layer_data =3D json.load(f)<br><br>=C2=A0 =C2=A0 supported_ve=
rsions =3D [&quot;1.0&quot;]<br>=C2=A0 =C2=A0 if layer_data[&quot;version&q=
uot;] not in supported_versions:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Excep=
tion(&quot;File {} has version {}, which is not in supported versions: {}&q=
uot;.format(args.jsondata, layer_data[&quot;version&quot;], supported_versi=
ons))<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 return layer_data<br><br>def main(=
):<br>=C2=A0 =C2=A0 _parse_args()<br><br>=C2=A0 =C2=A0 layer_data =3D _pars=
e_layer_config()<br>=C2=A0 =C2=A0 _do_update_layers(layer_data)<br>=C2=A0 =
=C2=A0 _do_save_layer_config(layer_data)<br><br>if __name__=3D=3D&quot;__ma=
in__&quot;:<br>=C2=A0 =C2=A0 main()<br><br><br><br>--<br>&quot;Perfection m=
ust be reached by degrees; she requires the slow hand of time.&quot; - Volt=
aire</div></div>

--000000000000de649106004dfcd0--

