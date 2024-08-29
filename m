Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98C1CA0EC3
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 21:13:47 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.32152.1724966024272000492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 14:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RjPaiE5K;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c0ba23a5abso1242142a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724966022; x=1725570822; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VikGQvYzL5mVoj+Xbb+VlDsUgeV4JM36739fcE79SPA=;
        b=RjPaiE5KhnGR+T93CwcWwzyCem6f0cvGVLaxDlgEas8NrJMPT/AHyotDmTl0xOdnUb
         7lWyZACKDm+qnCF3wgzk4JbHmihEf/HCLUV6/uEeGzmiw+zi4Hqt0virWlLyubl/lMSO
         VURZOuZu3mAwzenoYRCDpG49bDqtR+HWNOnXVa/VNxuyjAmpwjz3lkBs3VHh81PGBfR8
         7/yfcngp9+hQqZe5gXrLleB1+ajmHHgaKTVk1Zr+atA1av8d+vRs7ldc0rNwHbhLhZae
         V5i4xTLlZnOW9ajqsQqqsi/Gt42zF3B78UzxmC9sIichuuPuTZKZi4c4IIw3M8rKhf1l
         ZcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724966022; x=1725570822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VikGQvYzL5mVoj+Xbb+VlDsUgeV4JM36739fcE79SPA=;
        b=CrlXloRP/AVQAr+k6FwB/LC5/O0g0WT8D1rT0rSuNxMDoP4aqjzGKCGLQGlth0S9bv
         YYS9IyyulwBEEtCNAQAsN1waMcjfv/27Uh/Em2jOJPBXnMx1aEEbg6DIA4XeqR2zgU2c
         wsJJWf3L/DD/xuD8ycYJircVT8z8TS8rwz+0WtbGN2HTEY6M3QPZVt5vxVxIIrKXYqdE
         IhoW6nrkxhFTxP8ZvAyZW79QHRmBYwR9n3BEFJqTJ/sR8e6Dh4UwusmTOAYIyxdm+fUb
         gfKsEvBka3/cPifxyu+3YAgckLWZyCAWNcxw5weUjxO4EGYKayZu0BrexxMacIA93ebi
         ALcQ==
X-Gm-Message-State: AOJu0YyctngZjSxNMbI9XzPlTurc+nbW6Fr/c4itzdWJXWL3DiOkb6ii
	AjeZFPPXcQBU6crpLPd1i970DF0+4KX3xGBfnQjzmNxa+cfeIuDmGa5AsN3PYrxRcu+p0faYWMA
	ZSbGllyUnkKVWaR+EbiXuRqRFYfE=
X-Google-Smtp-Source: AGHT+IGqKCPt4kuxebuYa1YebXirCisFlKwp4LFdjY2VWuFSMHSVqtYQLihFTE79Haq1hqGB16MybP4Dz0kGpOorkc4=
X-Received: by 2002:a05:6402:2353:b0:5bf:a2c:4f35 with SMTP id
 4fb4d7f45d1cf-5c21ed3fd0fmr3612038a12.10.1724966021925; Thu, 29 Aug 2024
 14:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1srySLdab0SR9map64pZ9nvGVzsE=K13hqUs_J-RqTi62g@mail.gmail.com>
 <18822.1724963809858109674@lists.openembedded.org>
In-Reply-To: <18822.1724963809858109674@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Aug 2024 23:13:30 +0200
Message-ID: <CANNYZj9c951Ye5xbe13KTGLNMqDdnJEtgGLZ56QTyz2Yo18xNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sysvinit: upgrade 3.04 -> 3.10
To: mr.name@web.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fc95280620d8f214"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 21:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203947

--000000000000fc95280620d8f214
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note that putting patches on GitHub really makes reviews very difficult for
everyone. It=E2=80=99s okay to ask ppl to take your patch from there once b=
ut if
you need to do fix ups and follow-ups you really should fix your email
sending.

Alex

On Thu 29. Aug 2024 at 22.36, Sven Reschke via lists.openembedded.org <
mr.name=3Dweb.de@lists.openembedded.org> wrote:

> On Thu, Aug 29, 2024 at 1:52=E2=80=AFAM Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@...> wrote:
>
> On Mon, 2024-08-26 at 12:01 -0700, Sven Reschke via
> lists.openembedded.org wrote:
>
> Hi Alex and Alexandre,
>
> sorry for the delay.
> I've created a PR on Github on top of your latest changes:
> https://github.com/Nanowires/oe-core-clone/pull/1
>
> I did try this on our automated testing and there were some issues:
>
> musl build failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9440/st=
eps/11/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9456/st=
eps/11/logs/stdio
>
> This can be fixed by using realpath(path, NULL) API instead of
> canonicalize_file_name(path), we have done such changes
> in few packages e.g. elfutils
>
> https://sourceware.org/git/?p=3Delfutils.git
> ;a=3Dcommitdiff;h=3D06263dda990be6778a4beb33481cfd39ce60c623;hp=3Dfd0cee6=
3fb02455a5021ca298da8dadb4df63a9a
>
> there is a meta-oe patch for ssiapi
>
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppo=
rt/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch
>
>
> first of all: Thanks for the automated testing :-)
> Yes, I broke the realpath.patch with my update. I've pushed a fix, which
> should solve this issue.
>
>
> systemd+sysvinit build failure:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/9431/st=
eps/25/logs/stdio
>
> Cheers,
>
> Richard
>
> For this I fixed the install.patch (which I removed in the first place).
> Could you re-run the tests with my latest commits? ;-)
>
> Best regards,
> Sven
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203946):
> https://lists.openembedded.org/g/openembedded-core/message/203946
> Mute This Topic: https://lists.openembedded.org/mt/107960881/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fc95280620d8f214
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Note that putting patches on GitHub really makes reviews =
very difficult for everyone. It=E2=80=99s okay to ask ppl to take your patc=
h from there once but if you need to do fix ups and follow-ups you really s=
hould fix your email sending.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu 29. Aug 2024 at 22.36, Sven Reschke via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;<a href=3D"htt=
p://mr.name">mr.name</a>=3D<a href=3D"mailto:web.de@lists.openembedded.org"=
>web.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><bl=
ockquote>
<div>On Thu, Aug 29, 2024 at 1:52=E2=80=AFAM Richard Purdie via<br><a href=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org=
</a><br>&lt;richard.purdie=3Dlinuxfoundation.org@...&gt; wrote:<br>
<blockquote>On Mon, 2024-08-26 at 12:01 -0700, Sven Reschke via<br><a href=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org=
</a> wrote:<br>
<blockquote>Hi Alex and Alexandre,<br><br>sorry for the delay.<br>I&#39;ve =
created a PR on Github on top of your latest changes:<br><a href=3D"https:/=
/github.com/Nanowires/oe-core-clone/pull/1" rel=3D"noopener" target=3D"_bla=
nk">https://github.com/Nanowires/oe-core-clone/pull/1</a></blockquote>
I did try this on our automated testing and there were some issues:<br><br>=
musl build failures:<br><a href=3D"https://autobuilder.yoctoproject.org/typ=
hoon/#/builders/64/builds/9440/steps/11/logs/stdio" rel=3D"noopener" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/64/buil=
ds/9440/steps/11/logs/stdio</a><br><a href=3D"https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/45/builds/9456/steps/11/logs/stdio" rel=3D"noope=
ner" target=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/build=
ers/45/builds/9456/steps/11/logs/stdio</a></blockquote>
This can be fixed by using realpath(path, NULL) API instead of<br>canonical=
ize_file_name(path), we have done such changes<br>in few packages e.g. elfu=
tils<br><br><a href=3D"https://sourceware.org/git/?p=3Delfutils.git" rel=3D=
"noopener" target=3D"_blank">https://sourceware.org/git/?p=3Delfutils.git</=
a>;a=3Dcommitdiff;h=3D06263dda990be6778a4beb33481cfd39ce60c623;hp=3Dfd0cee6=
3fb02455a5021ca298da8dadb4df63a9a<br><br>there is a meta-oe patch for ssiap=
i<br><a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-oe=
/recipes-support/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-rea=
lpath.patch" rel=3D"noopener" target=3D"_blank">https://git.openembedded.or=
g/meta-openembedded/tree/meta-oe/recipes-support/ssiapi/ssiapi/0003-replace=
-canonicalize_file_name-with-realpath.patch</a></div>
<div>=C2=A0</div>
</blockquote>
<div>first of all: Thanks for the automated testing :-)</div>
<div>Yes, I broke the realpath.patch with my update. I&#39;ve pushed a fix,=
 which should solve this issue.</div>
<div><br><br>
<blockquote>systemd+sysvinit build failure:<br><br><a href=3D"https://autob=
uilder.yoctoproject.org/typhoon/#/builders/72/builds/9431/steps/25/logs/std=
io" rel=3D"noopener" target=3D"_blank">https://autobuilder.yoctoproject.org=
/typhoon/#/builders/72/builds/9431/steps/25/logs/stdio</a><br><br>Cheers,<b=
r><br>Richard</blockquote>
For this I fixed the install.patch (which I removed in the first place). Co=
uld you re-run the tests with my latest commits? ;-)</div>
<div>=C2=A0</div>
<div>Best regards,</div>
<div>Sven</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#203946): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/203946" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/203946</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107960881/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107960881/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000fc95280620d8f214--

