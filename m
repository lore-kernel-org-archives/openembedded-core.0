Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6236FC32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 17:52:48 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.1159.1664214766974615988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 10:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A/BNlhuV;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id n15so11423822wrq.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LfeEIkF0AEuIn7DjVCihnC9BTSpTxhnGsdU9ODmRcMU=;
        b=A/BNlhuVLA319IsEg2L10AwnDZNOFTKuf7gFx67xJbX+9uNXVw5LSZagNklT6WBEJz
         KCl1MCgcnKXBZ2+YpW3MZhvV8JR2BqNQ14DdnoOfNkr1K3dO4l7+Z7Lr5aM/bNq2eV+P
         94cxJk0tfkPnVqaNGBBR0VA6bCO/4bC2wegwKcOjYU1XmP+r+YrAstmouRSpXPpogcNt
         w0c8I76BYwCT/7aAvwy6FJBYvA8qYThtX19i1RBqAyl0fqPPQmgcDBtmYtpbR3HtFc0x
         QRk5TN6JP64uDXK9B1kEonFJf2uWZcgo41CidAI1fvVGfasrCBWSXd9KY6+O/6IFPT6I
         8jUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LfeEIkF0AEuIn7DjVCihnC9BTSpTxhnGsdU9ODmRcMU=;
        b=5NGdJmbAPk/98HW0Ch3bj+wn0LIGeEbChA8Zs3DOFNcj34x++X1KQeAu0WR5nvwB4h
         hxcl5zYYgxgVYwMwQrY9NoKYif7fNEQSyvfbmL/iWJdpn002dT9peJf34mBLL6HE6v/W
         u+ivJl/czjtQECrsDPJL2JdS6XV4tssMRppNAyxa8SN/J6pAiRkOzEbw8b6YPM/csGTB
         /4ObfCDvkUCHWQXPdP6Y/bqI0Ij5T3sE24TCw0h9esMfQdOoPsmR+bOf9kDQEta3hvUC
         XDModq+Ib54/ZG1+WObC1DhzfziCelr26OPZ53ZY+jPt8tPFA3Sj7Nv8h+KtN53WAvMQ
         PtDQ==
X-Gm-Message-State: ACrzQf3SPFw7vKaj6LH2BG+OLMh8QzzO45KwHzmqegrG3Ytm2fr77R6U
	hjvRAOBzqfToBXeig8EBkxTtdIOUddOKXU3270M=
X-Google-Smtp-Source: 
 AMsMyM79QBoHOpBZWOwxiaGHUtoS3xFL4hw8C/MR13NjmUGOmF3GRMLZscOB9hRvrMB7tMfbaY3+iF5TpV5ONyWUnW8=
X-Received: by 2002:a5d:6f14:0:b0:228:e3c6:fa2 with SMTP id
 ay20-20020a5d6f14000000b00228e3c60fa2mr14556540wrb.516.1664214765252; Mon, 26
 Sep 2022 10:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <Yyouc28ZITHHQlcp@mail.local>
 <18402.1664207376148460909@lists.openembedded.org>
In-Reply-To: <18402.1664207376148460909@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Sep 2022 19:52:32 +0200
Message-ID: 
 <CA+chaQeTobLcWi+LiXDnBo7gCEzg+iSgGOf-_zxyHp3zhZ5_WA@mail.gmail.com>
Subject: Re: [OE-core] PR to fix WantedBy parsing of systemctl
To: robert_henz@jabil.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e9b71205e99831dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 17:52:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171072

--000000000000e9b71205e99831dd
Content-Type: text/plain; charset="UTF-8"

Looks like your badger remote is still using git:// protocol which isn't
supported by github.com anymore, you need to change it to https://.

On Mon, Sep 26, 2022 at 5:49 PM Robert Henz via lists.openembedded.org
<robert_henz=jabil.com@lists.openembedded.org> wrote:

> On Tue, Sep 20, 2022 at 05:19 PM, Alexandre Belloni wrote:
>
> Hello,
>
> On 20/09/2022 17:55:42+0000, Robert Henz via lists.openembedded.org wrote:
>
> Hi everyone,
>
> I have a PR to fix the WantedBy parsing of the systemctl script. I
> tried to follow the process described in your wiki
> (https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded),
> but ran into some problems I wasn't able to figure out. I will attach
> the patch file for my suggested change to this email but I also went
> ahead and created a fork and generated a GitHub PR in case that is
> ok/easier?
>
> This is not easier to me. However, I'm interested to know more about the
> issues you couldn't solve as this is a recurring topic.
>
> I am following the instructions (
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_via_a_pull_request)
> under "Sending via a pull request".
> I created a github fork (cloned it, created my commit and pushed it back
> to a branch of my forked repo).
>
> The problem I've run into is this:
>
> ```
>
> bobhenz@hound:~/src/openembedded-core$ scripts/create-pull-request -u
> badger
> NOTE: Assuming remote branch 'fix-wantedby-clearing', use -b to override.
> NOTE: Assuming local branch HEAD, use -l to override.
> fatal: unable to connect to github.com:
> github.com[0: 140.82.114.4]: errno=Connection timed out
>
> warn: No match for commit b637a46f58b5adc7dcc76bdef90a7be8c8462df8 found
> at git://github.com/BadgerTechnologies/openembedded-core
> warn: Are you sure you pushed 'fix-wantedby-clearing' there?
> ERROR: git request-pull reported an error
> bobhenz@hound:~/src/openembedded-core$ git log
> commit b637a46f58b5adc7dcc76bdef90a7be8c8462df8 (HEAD ->
> fix-wantedby-clearing, badger/fix-wantedby-clearing)
> Author: Bob Henz <robert_henz@jabil.com>
> Date:   Mon Sep 19 22:02:58 2022 -0400
>
>     Fix WantedBy processing
>
>     An empty string assignment to WantedBy should clear all prior WantedBy
>     settings. This matches behavior of the current systemd implementation.
>
>     Signed-off-by: Bob Henz <robert_henz@jabil.com>
>
> commit 68b07bb7f0f01925f9da1cb966239ee49d5c84e3 (origin/master,
> origin/HEAD, badger/master, master)
> Author: He Zhe <zhe.he@windriver.com>
> Date:   Mon Sep 26 16:08:07 2022 +0800
>
>     lttng-tools: Disable on qemuriscv32
>
>     lttng-tools requires SYS_ppoll and SYS_pselect6 which are not
> supported on
>     riscv32. This has been confirmed by lttng-tools upstream.
>     https://github.com/lttng/lttng-tools/pull/162
>
>     It's also turned off for riscv32 in meta-riscv.
>     https://github.com/riscv/meta-riscv/blob/master/conf/layer.conf
>
>     Signed-off-by: He Zhe <zhe.he@windriver.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ```
>
> (As you can see from the git log, that commit was pushed to the remote
> forked repo called "badger".)
>
> From 6cdb207ed99bc82324fb7b85126425ac8d439070 Mon Sep 17 00:00:00 2001
> From: Bob Henz <robert_henz@jabil.com>
> Date: Mon, 19 Sep 2022 22:02:58 -0400
> Subject: [PATCH] Fix WantedBy processing
>
> An empty string assignment to WantedBy should clear all prior WantedBy
> settings. This matches behavior of the current systemd implementation.
>
> Your SoB is missing here and this is mandatory.
>
> I will attach a new patch with a SoB. Can you explain the value of having
> me sign off on my own PR? I guess I thought someone with more authority
> would be signing off on the change...
>
> Thanks for your guidance
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171068):
> https://lists.openembedded.org/g/openembedded-core/message/171068
> Mute This Topic: https://lists.openembedded.org/mt/93809846/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e9b71205e99831dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like your badger remote is still using git:// protoc=
ol which isn&#39;t supported by <a href=3D"http://github.com">github.com</a=
> anymore, you need to change it to https://.</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 26, 2022 at 5:49 P=
M Robert Henz via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;robert_henz=3D<a href=3D"mailto:jabil.com@lists.openembedde=
d.org">jabil.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Tue, Sep 20, 2022 at 05:19 PM, Al=
exandre Belloni wrote:<br>
<blockquote>Hello,<br><br>On 20/09/2022 17:55:42+0000, Robert Henz via <a h=
ref=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.=
org</a> wrote:<br>
<blockquote>Hi everyone,<br><br>I have a PR to fix the WantedBy parsing of =
the systemctl script. I<br>tried to follow the process described in your wi=
ki<br>(<a href=3D"https://www.openembedded.org/wiki/How_to_submit_a_patch_t=
o_OpenEmbedded" rel=3D"noopener" target=3D"_blank">https://www.openembedded=
.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a>),<br>but ran into some =
problems I wasn&#39;t able to figure out. I will attach<br>the patch file f=
or my suggested change to this email but I also went<br>ahead and created a=
 fork and generated a GitHub PR in case that is<br>ok/easier?</blockquote>
This is not easier to me. However, I&#39;m interested to know more about th=
e<br>issues you couldn&#39;t solve as this is a recurring topic.</blockquot=
e>
<p>I am following the instructions (<a href=3D"https://www.openembedded.org=
/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_via_a_pull_request" tar=
get=3D"_blank">https://www.openembedded.org/wiki/How_to_submit_a_patch_to_O=
penEmbedded#Sending_via_a_pull_request</a>) under &quot;Sending via a pull =
request&quot;.<br>I created a github fork (cloned it, created my commit and=
 pushed it back to a branch of my forked repo).<br><br>The problem I&#39;ve=
 run into is this:</p>
<p>```</p>
<p>bobhenz@hound:~/src/openembedded-core$ scripts/create-pull-request -u ba=
dger<br>NOTE: Assuming remote branch &#39;fix-wantedby-clearing&#39;, use -=
b to override.<br>NOTE: Assuming local branch HEAD, use -l to override.<br>=
fatal: unable to connect to <a href=3D"http://github.com" target=3D"_blank"=
>github.com</a>:<br><a href=3D"http://github.com" target=3D"_blank">github.=
com</a>[0: 140.82.114.4]: errno=3DConnection timed out<br><br>warn: No matc=
h for commit b637a46f58b5adc7dcc76bdef90a7be8c8462df8 found at git://<a hre=
f=3D"http://github.com/BadgerTechnologies/openembedded-core" target=3D"_bla=
nk">github.com/BadgerTechnologies/openembedded-core</a><br>warn: Are you su=
re you pushed &#39;fix-wantedby-clearing&#39; there?<br>ERROR: git request-=
pull reported an error<br>bobhenz@hound:~/src/openembedded-core$ git log<br=
>commit b637a46f58b5adc7dcc76bdef90a7be8c8462df8 (HEAD -&gt; fix-wantedby-c=
learing, badger/fix-wantedby-clearing)<br>Author: Bob Henz &lt;<a href=3D"m=
ailto:robert_henz@jabil.com" target=3D"_blank">robert_henz@jabil.com</a>&gt=
;<br>Date:=C2=A0=C2=A0 Mon Sep 19 22:02:58 2022 -0400<br><br>=C2=A0=C2=A0=
=C2=A0 Fix WantedBy processing<br>=C2=A0=C2=A0 =C2=A0<br>=C2=A0=C2=A0=C2=A0=
 An empty string assignment to WantedBy should clear all prior WantedBy<br>=
=C2=A0=C2=A0=C2=A0 settings. This matches behavior of the current systemd i=
mplementation.<br>=C2=A0=C2=A0 =C2=A0<br>=C2=A0=C2=A0=C2=A0 Signed-off-by: =
Bob Henz &lt;<a href=3D"mailto:robert_henz@jabil.com" target=3D"_blank">rob=
ert_henz@jabil.com</a>&gt;<br><br>commit 68b07bb7f0f01925f9da1cb966239ee49d=
5c84e3 (origin/master, origin/HEAD, badger/master, master)<br>Author: He Zh=
e &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_blank">zhe.he@wind=
river.com</a>&gt;<br>Date:=C2=A0=C2=A0 Mon Sep 26 16:08:07 2022 +0800<br><b=
r>=C2=A0=C2=A0=C2=A0 lttng-tools: Disable on qemuriscv32<br>=C2=A0=C2=A0 =
=C2=A0<br>=C2=A0=C2=A0=C2=A0 lttng-tools requires SYS_ppoll and SYS_pselect=
6 which are not supported on<br>=C2=A0=C2=A0=C2=A0 riscv32. This has been c=
onfirmed by lttng-tools upstream.<br>=C2=A0=C2=A0=C2=A0 <a href=3D"https://=
github.com/lttng/lttng-tools/pull/162" target=3D"_blank">https://github.com=
/lttng/lttng-tools/pull/162</a><br>=C2=A0=C2=A0 =C2=A0<br>=C2=A0=C2=A0=C2=
=A0 It&#39;s also turned off for riscv32 in meta-riscv.<br>=C2=A0=C2=A0=C2=
=A0 <a href=3D"https://github.com/riscv/meta-riscv/blob/master/conf/layer.c=
onf" target=3D"_blank">https://github.com/riscv/meta-riscv/blob/master/conf=
/layer.conf</a><br>=C2=A0=C2=A0 =C2=A0<br>=C2=A0=C2=A0=C2=A0 Signed-off-by:=
 He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_blank">zhe.h=
e@windriver.com</a>&gt;<br>=C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie=
 &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt;<br>```<br><br>(As you can see =
from the git log, that commit was pushed to the remote forked repo called &=
quot;badger&quot;.)<br><br></p>
<blockquote>
<blockquote>From 6cdb207ed99bc82324fb7b85126425ac8d439070 Mon Sep 17 00:00:=
00 2001<br>From: Bob Henz &lt;<a href=3D"mailto:robert_henz@jabil.com" targ=
et=3D"_blank">robert_henz@jabil.com</a>&gt;<br>Date: Mon, 19 Sep 2022 22:02=
:58 -0400<br>Subject: [PATCH] Fix WantedBy processing<br><br>An empty strin=
g assignment to WantedBy should clear all prior WantedBy<br>settings. This =
matches behavior of the current systemd implementation.</blockquote>
Your SoB is missing here and this is mandatory.</blockquote>
I will attach a new patch with a SoB. Can you explain the value of having m=
e sign off on my own PR? I guess I thought someone with more authority woul=
d be signing off on the change...<br><br>Thanks for your guidance
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171068): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171068" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171068</a><br>
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

--000000000000e9b71205e99831dd--

