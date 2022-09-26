Return-Path: <robert_henz@jabil.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBE3C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 19:50:19 +0000 (UTC)
Subject: Re: PR to fix WantedBy parsing of systemctl
To: openembedded-core@lists.openembedded.org
From: "Robert Henz" <robert_henz@jabil.com>
X-Originating-Location: Versailles, Kentucky, US (217.180.201.84)
X-Originating-Platform: Linux Firefox 104
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 26 Sep 2022 12:50:09 -0700
References: 
 <CA+chaQeTobLcWi+LiXDnBo7gCEzg+iSgGOf-_zxyHp3zhZ5_WA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQeTobLcWi+LiXDnBo7gCEzg+iSgGOf-_zxyHp3zhZ5_WA@mail.gmail.com>
Message-ID: <27206.1664221809231976757@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OZ1VWA7X6mZ8i7hLlbIY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 19:50:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171073

--OZ1VWA7X6mZ8i7hLlbIY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I think I'm missing some context. Not really understanding what this script=
 is trying to accomplish I don't know what "remote branch" is vs "local bra=
nch". Should "remote branch" be "master" and the local branch be the branch=
 with the change I want to make? Here's that script running with "set -x" t=
urned on 1/2 way through...

bobhenz@hound:~/src/openembedded-core$ scripts/create-pull-request -u badge=
r
+ USER_RE=3D[A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?
+ PROTO_RE=3D[a-z][a-z+]*://
+ GIT_RE=3D\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)=
\?\([^:/]*\)[:/]\(.*\)
+ REMOTE_URL=3Dhttps://github.com/BadgerTechnologies/openembedded-core
+ echo https://github.com/BadgerTechnologies/openembedded-core
+ sed s#\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)\?\=
([^:/]*\)[:/]\(.*\)#\5#
+ REMOTE_REPO=3DBadgerTechnologies/openembedded-core
+ echo https://github.com/BadgerTechnologies/openembedded-core
+ sed s#\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)\?\=
([^:/]*\)[:/]\(.*\)#git://\4/\5#
+ REMOTE_URL=3Dgit://github.com/BadgerTechnologies/openembedded-core
+ [ -z=C2=A0 ]
+ git branch
+ grep -e ^\*
+ cut -d=C2=A0 -f2
+ BRANCH=3Dfix-wantedby-clearing
+ echo NOTE: Assuming remote branch 'fix-wantedby-clearing', use -b to over=
ride.
NOTE: Assuming remote branch 'fix-wantedby-clearing', use -b to override.
+ [ -z=C2=A0 ]
+ L_BRANCH=3DHEAD
+ echo NOTE: Assuming local branch HEAD, use -l to override.
NOTE: Assuming local branch HEAD, use -l to override.
+ [ 0 -eq 1 ]
+ WEB_URL=3D
+ WEB_URL=3Dhttps://github.com/BadgerTechnologies/openembedded-core/tree/fi=
x-wantedby-clearing
+ [ -n https://github.com/BadgerTechnologies/openembedded-core/tree/fix-wan=
tedby-clearing ]
+ [=C2=A0 =3D 1 ]
+ wget --no-check-certificate -q https://github.com/BadgerTechnologies/open=
embedded-core/tree/fix-wantedby-clearing -O /dev/null
+ [ 0 -ne 0 ]
+ [ -e pull-186156 ]
+ mkdir pull-186156
+ [ -n=C2=A0 ]
+ git format-patch -M40 --subject-prefix=3DPATCH -n -o pull-186156 --thread=
=3Dshallow --cover-letter master..HEAD
+ ls -A pull-186156
+ [ -z 0000-cover-letter.patch
0001-Fix-WantedBy-processing.patch ]
+ [ -n=C2=A0 ]
+ echo pull-186156/0000-cover-letter.patch
+ CL=3Dpull-186156/0000-cover-letter.patch
+ PM=3Dpull-186156/pull-msg
+ + trgit -d --version
[:alpha:][:space:].
+ sed s/\(...\).*/\1/
+ git version 2.25.1
+ GIT_VERSION=3D225
+ NEWER_GIT_VERSION=3D210
+ [ 225 -lt 210 ]
+ git request-pull master git://github.com/BadgerTechnologies/openembedded-=
core HEAD:fix-wantedby-clearing
fatal: unable to connect to github.com:
github.com[0: 140.82.113.3]: errno=3DConnection timed out

warn: No match for commit b637a46f58b5adc7dcc76bdef90a7be8c8462df8 found at=
 git://github.com/BadgerTechnologies/openembedded-core
warn: Are you sure you pushed 'fix-wantedby-clearing' there?
+ [ 1 -ne 0 ]
+ echo ERROR: git request-pull reported an error
ERROR: git request-pull reported an error
+ rm -rf pull-186156
+ exit 1

--OZ1VWA7X6mZ8i7hLlbIY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I think I'm missing some context. Not really understanding what this script=
 is trying to accomplish I don't know what "remote branch" is vs "local bra=
nch". Should "remote branch" be "master" and the local branch be the branch=
 with the change I want to make? Here's that script running with "set -x" t=
urned on 1/2 way through...<br /><br />bobhenz@hound:~/src/openembedded-cor=
e$ scripts/create-pull-request -u badger<br />+ USER_RE=3D[A-Za-z0-9_.@][A-=
Za-z0-9_.@-]*$\?<br />+ PROTO_RE=3D[a-z][a-z+]*://<br />+ GIT_RE=3D\(^\([a-=
z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)\?\([^:/]*\)[:/]\(.=
*\)<br />+ REMOTE_URL=3Dhttps://github.com/BadgerTechnologies/openembedded-=
core<br />+ echo https://github.com/BadgerTechnologies/openembedded-core<br=
 />+ sed s#\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)=
\?\([^:/]*\)[:/]\(.*\)#\5#<br />+ REMOTE_REPO=3DBadgerTechnologies/openembe=
dded-core<br />+ echo https://github.com/BadgerTechnologies/openembedded-co=
re<br />+ sed s#\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$=
\?@\)\?\([^:/]*\)[:/]\(.*\)#git://\4/\5#<br />+ REMOTE_URL=3Dgit://github.c=
om/BadgerTechnologies/openembedded-core<br />+ [ -z&nbsp; ]<br />+ git bran=
ch<br />+ grep -e ^\* <br />+ cut -d&nbsp; -f2<br />+ BRANCH=3Dfix-wantedby=
-clearing<br />+ echo NOTE: Assuming remote branch 'fix-wantedby-clearing',=
 use -b to override.<br />NOTE: Assuming remote branch 'fix-wantedby-cleari=
ng', use -b to override.<br />+ [ -z&nbsp; ]<br />+ L_BRANCH=3DHEAD<br />+ =
echo NOTE: Assuming local branch HEAD, use -l to override.<br />NOTE: Assum=
ing local branch HEAD, use -l to override.<br />+ [ 0 -eq 1 ]<br />+ WEB_UR=
L=3D<br />+ WEB_URL=3Dhttps://github.com/BadgerTechnologies/openembedded-co=
re/tree/fix-wantedby-clearing<br />+ [ -n https://github.com/BadgerTechnolo=
gies/openembedded-core/tree/fix-wantedby-clearing ]<br />+ [&nbsp; =3D 1 ]<=
br />+ wget --no-check-certificate -q https://github.com/BadgerTechnologies=
/openembedded-core/tree/fix-wantedby-clearing -O /dev/null<br />+ [ 0 -ne 0=
 ]<br />+ [ -e pull-186156 ]<br />+ mkdir pull-186156<br />+ [ -n&nbsp; ]<b=
r />+ git format-patch -M40 --subject-prefix=3DPATCH -n -o pull-186156 --th=
read=3Dshallow --cover-letter master..HEAD<br />+ ls -A pull-186156<br />+ =
[ -z 0000-cover-letter.patch<br />0001-Fix-WantedBy-processing.patch ]<br /=
>+ [ -n&nbsp; ]<br />+ echo pull-186156/0000-cover-letter.patch<br />+ CL=
=3Dpull-186156/0000-cover-letter.patch<br />+ PM=3Dpull-186156/pull-msg<br =
/>+ + trgit -d --version<br />&nbsp;[:alpha:][:space:].<br />+ sed s/\(...\=
).*/\1/<br />+ git version 2.25.1<br />+ GIT_VERSION=3D225<br />+ NEWER_GIT=
_VERSION=3D210<br />+ [ 225 -lt 210 ]<br />+ git request-pull master git://=
github.com/BadgerTechnologies/openembedded-core HEAD:fix-wantedby-clearing<=
br />fatal: unable to connect to github.com:<br />github.com[0: 140.82.113.=
3]: errno=3DConnection timed out<br /><br />warn: No match for commit b637a=
46f58b5adc7dcc76bdef90a7be8c8462df8 found at git://github.com/BadgerTechnol=
ogies/openembedded-core<br />warn: Are you sure you pushed 'fix-wantedby-cl=
earing' there?<br />+ [ 1 -ne 0 ]<br />+ echo ERROR: git request-pull repor=
ted an error<br />ERROR: git request-pull reported an error<br />+ rm -rf p=
ull-186156<br />+ exit 1

--OZ1VWA7X6mZ8i7hLlbIY--

