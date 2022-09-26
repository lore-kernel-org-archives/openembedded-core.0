Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F417C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 20:32:19 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.2994.1664224333976091110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 13:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZOAgg/KW;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id bk15so4226159wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 13:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=H9WAxvLLhG9ddzrAjKXUE0XRuwXcxYHPATNm9Fkl0dQ=;
        b=ZOAgg/KW7pzzjMELi+hLhi90N42Xna2ESRWnoMwscbHvFfEsy8CuUNQ1V3XBxyQWr0
         V6z93E+JOuFlUKZs9D0Ocr0N6KIttgT77loablqVXATfJUNGyeyJF5nO1id2ts7QySE0
         grkeBAYSV0jmzVvILSeHG85P8oOSxmLueH6hRvW1TB03BZ3LXueeTTPVTsB0QqhH/ys6
         Gcy2/+UoHghXqTy2Hn1OfU11ewYxvfAe8nVMkBshwhh0pqQqKf8zmejOj/EN8/THmtDC
         X6gDbGK9ASwFhvh1hj5HiAZUY85MZTlJk+NUapS1GPYilhuGRnyVZOdr9q9AfEt5Db/N
         gfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=H9WAxvLLhG9ddzrAjKXUE0XRuwXcxYHPATNm9Fkl0dQ=;
        b=i2kI/zeqO9kCW0eltFu/iDYaIJrwimiq9Sbeap9skHec5FJKWj6aTEPjGOZQYE3Qr6
         NpdqIuR/ID/06oCuDjYU5kd/ixsodc8BMSi6lsd5NYWfd2jLQVoH5XlbIEssTGLKRMnR
         jVXSsyXCp/9cE+AwgDXVACuSf6pqTUQhOpR/FFbXCCm+CTMcbkAF659mZLMyCZvGIcU3
         UrdSsFZEgy/jJvPjmxp5nYZqJd0CQGL4iE6f1yHY3kEkdLf9h0eYXdi4YuIfmUvwFezc
         ITMSCp6QmhzmEW54OEbs3bim8pvWc7F/9EHvO8AIpDGV2DfvDZQhGXEySpC6WEL3Aq1V
         oi5Q==
X-Gm-Message-State: ACrzQf0vOWISdhHUTAlXn+PR8kZQ32wmHzSVntCeIspFW1gIkbfgKitp
	c1J9LVKDQ5Z9f5WJ1WFEacXuOYL9phtMSJAcSPY=
X-Google-Smtp-Source: 
 AMsMyM6hYwVsKt3781Nxi9bBDBo5NzIcdLuEQS/QTBedz7D64JxLAy2Dayvz5mRPSp+rarRuX+u9MQIpLfSgPcIlsdo=
X-Received: by 2002:a05:6000:1681:b0:22a:fc6b:f83c with SMTP id
 y1-20020a056000168100b0022afc6bf83cmr13857800wrd.507.1664224332203; Mon, 26
 Sep 2022 13:32:12 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CA+chaQeTobLcWi+LiXDnBo7gCEzg+iSgGOf-_zxyHp3zhZ5_WA@mail.gmail.com>
 <27206.1664221809231976757@lists.openembedded.org>
In-Reply-To: <27206.1664221809231976757@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Sep 2022 22:31:59 +0200
Message-ID: 
 <CA+chaQfvo9FLBja8sgZiR_oCR5_e0nds-HzLjRt89b_gLF7UzA@mail.gmail.com>
Subject: Re: [OE-core] PR to fix WantedBy parsing of systemctl
To: robert_henz@jabil.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000025cb2c05e99a6c95"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 20:32:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171075

--00000000000025cb2c05e99a6c95
Content-Type: text/plain; charset="UTF-8"

see the REMOTE_URL changes shown in set -x, relevant context is in:
https://git.openembedded.org/openembedded-core/commit/?id=675e88e6e0bbd5ab2dcd4bdf97b0de59925a1be6

We forgot to update it after:
https://github.blog/2021-09-01-improving-git-protocol-security-github/#no-more-unauthenticated-git
and unfortunately it shows how rarely this script is being used.

I've sent a fix for this, please test it.

On Mon, Sep 26, 2022 at 9:50 PM Robert Henz via lists.openembedded.org
<robert_henz=jabil.com@lists.openembedded.org> wrote:

> I think I'm missing some context. Not really understanding what this
> script is trying to accomplish I don't know what "remote branch" is vs
> "local branch". Should "remote branch" be "master" and the local branch be
> the branch with the change I want to make? Here's that script running with
> "set -x" turned on 1/2 way through...
>
> bobhenz@hound:~/src/openembedded-core$ scripts/create-pull-request -u
> badger
> + USER_RE=[A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?
> + PROTO_RE=[a-z][a-z+]*://
> + GIT_RE=\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@
> -]*$\?@\)\?\([^:/]*\)[:/]\(.*\)
> + REMOTE_URL=https://github.com/BadgerTechnologies/openembedded-core
> + echo https://github.com/BadgerTechnologies/openembedded-core
> + sed s#\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@
> -]*$\?@\)\?\([^:/]*\)[:/]\(.*\)#\5#
> + REMOTE_REPO=BadgerTechnologies/openembedded-core
> + echo https://github.com/BadgerTechnologies/openembedded-core
> + sed s#\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@
> -]*$\?@\)\?\([^:/]*\)[:/]\(.*\)#git://\4/\5#
> + REMOTE_URL=git://github.com/BadgerTechnologies/openembedded-core
> + [ -z  ]
> + git branch
> + grep -e ^\*
> + cut -d  -f2
> + BRANCH=fix-wantedby-clearing
> + echo NOTE: Assuming remote branch 'fix-wantedby-clearing', use -b to
> override.
> NOTE: Assuming remote branch 'fix-wantedby-clearing', use -b to override.
> + [ -z  ]
> + L_BRANCH=HEAD
> + echo NOTE: Assuming local branch HEAD, use -l to override.
> NOTE: Assuming local branch HEAD, use -l to override.
> + [ 0 -eq 1 ]
> + WEB_URL=
> + WEB_URL=
> https://github.com/BadgerTechnologies/openembedded-core/tree/fix-wantedby-clearing
> + [ -n
> https://github.com/BadgerTechnologies/openembedded-core/tree/fix-wantedby-clearing
> ]
> + [  = 1 ]
> + wget --no-check-certificate -q
> https://github.com/BadgerTechnologies/openembedded-core/tree/fix-wantedby-clearing
> -O /dev/null
> + [ 0 -ne 0 ]
> + [ -e pull-186156 ]
> + mkdir pull-186156
> + [ -n  ]
> + git format-patch -M40 --subject-prefix=PATCH -n -o pull-186156
> --thread=shallow --cover-letter master..HEAD
> + ls -A pull-186156
> + [ -z 0000-cover-letter.patch
> 0001-Fix-WantedBy-processing.patch ]
> + [ -n  ]
> + echo pull-186156/0000-cover-letter.patch
> + CL=pull-186156/0000-cover-letter.patch
> + PM=pull-186156/pull-msg
> + + trgit -d --version
>  [:alpha:][:space:].
> + sed s/\(...\).*/\1/
> + git version 2.25.1
> + GIT_VERSION=225
> + NEWER_GIT_VERSION=210
> + [ 225 -lt 210 ]
> + git request-pull master git://
> github.com/BadgerTechnologies/openembedded-core HEAD:fix-wantedby-clearing
> fatal: unable to connect to github.com:
> github.com[0: 140.82.113.3]: errno=Connection timed out
>
> warn: No match for commit b637a46f58b5adc7dcc76bdef90a7be8c8462df8 found
> at git://github.com/BadgerTechnologies/openembedded-core
> warn: Are you sure you pushed 'fix-wantedby-clearing' there?
> + [ 1 -ne 0 ]
> + echo ERROR: git request-pull reported an error
> ERROR: git request-pull reported an error
> + rm -rf pull-186156
> + exit 1
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171073):
> https://lists.openembedded.org/g/openembedded-core/message/171073
> Mute This Topic: https://lists.openembedded.org/mt/93809846/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000025cb2c05e99a6c95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">see the REMOTE_URL changes shown in set -x, relevant conte=
xt is in: <a href=3D"https://git.openembedded.org/openembedded-core/commit/=
?id=3D675e88e6e0bbd5ab2dcd4bdf97b0de59925a1be6">https://git.openembedded.or=
g/openembedded-core/commit/?id=3D675e88e6e0bbd5ab2dcd4bdf97b0de59925a1be6</=
a><br><div><br></div><div>We forgot to update it after:</div><div><a href=
=3D"https://github.blog/2021-09-01-improving-git-protocol-security-github/#=
no-more-unauthenticated-git">https://github.blog/2021-09-01-improving-git-p=
rotocol-security-github/#no-more-unauthenticated-git</a><br></div><div>and =
unfortunately it shows how rarely this script is being used.</div><div><br>=
</div><div>I&#39;ve sent a fix for this, please test it.</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 2=
6, 2022 at 9:50 PM Robert Henz via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;robert_henz=3D<a href=3D"mailto:jabil.com@=
lists.openembedded.org">jabil.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">I think I&#39;m mis=
sing some context. Not really understanding what this script is trying to a=
ccomplish I don&#39;t know what &quot;remote branch&quot; is vs &quot;local=
 branch&quot;. Should &quot;remote branch&quot; be &quot;master&quot; and t=
he local branch be the branch with the change I want to make? Here&#39;s th=
at script running with &quot;set -x&quot; turned on 1/2 way through...<br><=
br>bobhenz@hound:~/src/openembedded-core$ scripts/create-pull-request -u ba=
dger<br>+ USER_RE=3D[A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?<br>+ PROTO_RE=3D[a-z]=
[a-z+]*://<br>+ GIT_RE=3D\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0=
-9_.@-]*$\?@\)\?\([^:/]*\)[:/]\(.*\)<br>+ REMOTE_URL=3D<a href=3D"https://g=
ithub.com/BadgerTechnologies/openembedded-core" target=3D"_blank">https://g=
ithub.com/BadgerTechnologies/openembedded-core</a><br>+ echo <a href=3D"htt=
ps://github.com/BadgerTechnologies/openembedded-core" target=3D"_blank">htt=
ps://github.com/BadgerTechnologies/openembedded-core</a><br>+ sed s#\(^\([a=
-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)\?\([^:/]*\)[:/]\(=
.*\)#\5#<br>+ REMOTE_REPO=3DBadgerTechnologies/openembedded-core<br>+ echo =
<a href=3D"https://github.com/BadgerTechnologies/openembedded-core" target=
=3D"_blank">https://github.com/BadgerTechnologies/openembedded-core</a><br>=
+ sed s#\(^\([a-z][a-z+]*://\)\?\)\([A-Za-z0-9_.@][A-Za-z0-9_.@-]*$\?@\)\?\=
([^:/]*\)[:/]\(.*\)#git://\4/\5#<br>+ REMOTE_URL=3Dgit://<a href=3D"http://=
github.com/BadgerTechnologies/openembedded-core" target=3D"_blank">github.c=
om/BadgerTechnologies/openembedded-core</a><br>+ [ -z=C2=A0 ]<br>+ git bran=
ch<br>+ grep -e ^\* <br>+ cut -d=C2=A0 -f2<br>+ BRANCH=3Dfix-wantedby-clear=
ing<br>+ echo NOTE: Assuming remote branch &#39;fix-wantedby-clearing&#39;,=
 use -b to override.<br>NOTE: Assuming remote branch &#39;fix-wantedby-clea=
ring&#39;, use -b to override.<br>+ [ -z=C2=A0 ]<br>+ L_BRANCH=3DHEAD<br>+ =
echo NOTE: Assuming local branch HEAD, use -l to override.<br>NOTE: Assumin=
g local branch HEAD, use -l to override.<br>+ [ 0 -eq 1 ]<br>+ WEB_URL=3D<b=
r>+ WEB_URL=3D<a href=3D"https://github.com/BadgerTechnologies/openembedded=
-core/tree/fix-wantedby-clearing" target=3D"_blank">https://github.com/Badg=
erTechnologies/openembedded-core/tree/fix-wantedby-clearing</a><br>+ [ -n <=
a href=3D"https://github.com/BadgerTechnologies/openembedded-core/tree/fix-=
wantedby-clearing" target=3D"_blank">https://github.com/BadgerTechnologies/=
openembedded-core/tree/fix-wantedby-clearing</a> ]<br>+ [=C2=A0 =3D 1 ]<br>=
+ wget --no-check-certificate -q <a href=3D"https://github.com/BadgerTechno=
logies/openembedded-core/tree/fix-wantedby-clearing" target=3D"_blank">http=
s://github.com/BadgerTechnologies/openembedded-core/tree/fix-wantedby-clear=
ing</a> -O /dev/null<br>+ [ 0 -ne 0 ]<br>+ [ -e pull-186156 ]<br>+ mkdir pu=
ll-186156<br>+ [ -n=C2=A0 ]<br>+ git format-patch -M40 --subject-prefix=3DP=
ATCH -n -o pull-186156 --thread=3Dshallow --cover-letter master..HEAD<br>+ =
ls -A pull-186156<br>+ [ -z 0000-cover-letter.patch<br>0001-Fix-WantedBy-pr=
ocessing.patch ]<br>+ [ -n=C2=A0 ]<br>+ echo pull-186156/0000-cover-letter.=
patch<br>+ CL=3Dpull-186156/0000-cover-letter.patch<br>+ PM=3Dpull-186156/p=
ull-msg<br>+ + trgit -d --version<br>=C2=A0[:alpha:][:space:].<br>+ sed s/\=
(...\).*/\1/<br>+ git version 2.25.1<br>+ GIT_VERSION=3D225<br>+ NEWER_GIT_=
VERSION=3D210<br>+ [ 225 -lt 210 ]<br>+ git request-pull master git://<a hr=
ef=3D"http://github.com/BadgerTechnologies/openembedded-core" target=3D"_bl=
ank">github.com/BadgerTechnologies/openembedded-core</a> HEAD:fix-wantedby-=
clearing<br>fatal: unable to connect to <a href=3D"http://github.com" targe=
t=3D"_blank">github.com</a>:<br><a href=3D"http://github.com" target=3D"_bl=
ank">github.com</a>[0: 140.82.113.3]: errno=3DConnection timed out<br><br>w=
arn: No match for commit b637a46f58b5adc7dcc76bdef90a7be8c8462df8 found at =
git://<a href=3D"http://github.com/BadgerTechnologies/openembedded-core" ta=
rget=3D"_blank">github.com/BadgerTechnologies/openembedded-core</a><br>warn=
: Are you sure you pushed &#39;fix-wantedby-clearing&#39; there?<br>+ [ 1 -=
ne 0 ]<br>+ echo ERROR: git request-pull reported an error<br>ERROR: git re=
quest-pull reported an error<br>+ rm -rf pull-186156<br>+ exit 1
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171073): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171073" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171073</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93809846/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93809846/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000025cb2c05e99a6c95--

