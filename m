Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C20C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 15:14:37 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.86244.1717427671883898126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 08:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DQm52lo9;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: tim.orling@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57a32b0211aso4000368a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 08:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1717427670; x=1718032470; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HfJbFy8x7YEoaVagehGU6O/65gTqCm7DnNCMwHvYhXQ=;
        b=DQm52lo99qwF/HmVvTfK7to4xXgY/seDUhHAL6Ah5uiLYdhf5HXa21A8Lxb1qejNHk
         xPrBwmsVKuWmNPzPFi+ob0nMYlolAQei3JU94tqWVLjmpiQCXckxi1iNsXG9GujLoGFu
         QJndk/gss7DzezKG21NLBmus29ELgmi3kDYOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717427670; x=1718032470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfJbFy8x7YEoaVagehGU6O/65gTqCm7DnNCMwHvYhXQ=;
        b=BwVTwf/BMM6Wvio4dgAlNOwi1a0ROlQGBDNURBskRHvomEgyZdY+LnGO3abw+fBQ4P
         AWaOtJn/NZsLiGrdnfNKF82HvbWXtAVJHzq3Wjg1+XvZokSsLS+w1+dPR4gpuxpv6LOR
         7n+CyWBdNS1fy2szB3EGqq0pD5vuxWZQ0mLXTITDbjEXeGFGVwjFMXleuSiAi+RfRy+N
         HbijJloHwIPeiPJnSKWWZx1Vq9qEFolIJjRVv1O3mWeqVUWBnMLaBOXru5+/zrkPRd9K
         7/Ba98MbUilUgYmvEBH2JSNmgU68bwYAv+Tly6V2/PCugD7s0yG+RIIocZb2Zn//E0Gy
         g4VA==
X-Gm-Message-State: AOJu0YzUrqjLtpaal7j7VxZvOV2LYdq37BPd3Y8FjBMojLr+pIR5B+5r
	bzo5CxdZvWmMBKLtE2H719/+OUnBvO1GJulqjKSbWgZwQLrwMNTwF3p9dqJVCydiLh8je/XM/Fa
	aTwLNdkMuKpYDl7pbsQMEx79NH7Z5TJadKWhTRpEMHVEyZJAuyU0=
X-Google-Smtp-Source: AGHT+IHs/p8vhY4Jv+Y4aYn/Xy4PWyB/kRHPR5qgOIJ0bqMBJMNZ54Kf+3qwhiAZG0J7P8nKyrOHkfzMyuTzDLY6zYI=
X-Received: by 2002:a50:cd83:0:b0:57a:79c2:e9d0 with SMTP id
 4fb4d7f45d1cf-57a79c2eb22mr141449a12.3.1717427670278; Mon, 03 Jun 2024
 08:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717361301.git.tim.orling@konsulko.com> <CANNYZj-VbOsKOrbanT36Tfb3CsnVDtE8uRmbUssmuoFb162VeA@mail.gmail.com>
In-Reply-To: <CANNYZj-VbOsKOrbanT36Tfb3CsnVDtE8uRmbUssmuoFb162VeA@mail.gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Mon, 3 Jun 2024 08:14:19 -0700
Message-ID: <CAOyo-84ouc5QLwST-359=JJisGOBEgbgMUNV=3GUT_dS_UheLg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/3] Implement RECIPE_UPDATE_EXTRA_TASKS
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, bluelightning@bluelightning.org
Content-Type: multipart/alternative; boundary="0000000000003705010619fdca8f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 15:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200264

--0000000000003705010619fdca8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 2:09=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> Thanks, I like the idea. There are a number of other recipes that for
> various reasons need 'special handling' in version updates that
> devtool doesn't know how to perform, and this could be used to define
> that handling where it belongs, which is in the recipe itself.
>
> E.g. updating cmake could also rename cmake-native_*.bb to match.
>

Good point. I had not considered that. As RP pointed out, python manifest
is another.

I suspect we will find many use cases for this pattern.


>
> Alex
>
> On Sun, 2 Jun 2024 at 23:01, Tim Orling via lists.openembedded.org
> <tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:
> >
> > From: Tim Orling <tim.orling@konsulko.com>
> >
> > Whenever a recipe which inherits cargo-update-recipe-crates is upgraded
> with
> > devtool (such as with the Auto Upgrade Helper) we frequently see
> failures.
> > If the upstream Cargo.toml or Cargo.lock has been changed, the
> corresponding
> > <recipe_name>-crates.inc needs to be updated. This is done by running t=
he
> > "bitbake -c update_crates <recipe_name>" task, but this has until now
> been
> > a manual operation.
> >
> > Add a new variable RECIPE_UPDATE_EXTRA_TASKS which is a string delimite=
d
> > list of tasks to be run during the upgrade() method of
> > meta/lib/devtool/upgrade.py.
> >
> > To solve the problem described above, the solution is for all recipes
> which
> > inherit cargo-update-recipe-crates to add the "do_update_crates" task t=
o
> > the RECIPE_UPDATE_EXTRA_TASKS variable. Add this to the bbclass.
> >
> > Add test case based on the guessing-game source we currently use for th=
e
> > maturin runtime test cases, based on https://www.maturin.rs/tutorial.
> > This oe-selftest case checks for both the change in the recipe file and
> > the recipe -crates.inc file.
> >
> > This will rely on a new "guessing-game" git repository to be added to
> > git.yoctoproject.org/guessing-game (currently hosted on GitHub for the
> > purposes of this RFC).
> >
> > Currently, update_crates is the only task known to the author to fall
> into
> > this RECIPE_UPDATE_EXTRA_TASKS use case. If anyone can think of other u=
se
> > cases that can also be added (and tested!), please let me know.
> >
> > Two obvious use cases that would be nice to add with changes in oe-core
> are:
> > (1) some kind of "go-mod://" update class to use a similar
> <recipe>-go-mods.inc
> > (2) some kind of rework of the "npm://" fetcher to use
> <recipe>-npm-mods.inc
> > But both of those are out of scope for this proposal.
> >
> > The _run_recipe_update_extra_tasks() method added to
> lib/devtool/upgrade.py
> > is functional, but could probably use some more guards and checks. Idea=
s
> for
> > improvements are welcome, hence the RFC.
> >
> > An attempt at documenting the new variable has been added to ref-manual=
,
> > but if anyone has some ideas for better clarification, input is welcome=
.
> >
> > The following changes since commit
> af6d28d2b0abdfcfa70edcc95abd99a3c1a64ac8:
> >
> >   sanity: Check if tar is gnutar (2024-05-31 16:58:36 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://git.yoctoproject.org/poky-contrib
> timo/RECIPE_UPDATE_EXTRA_TASKS
> >
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/RECIPE_UPDATE_EXT=
RA_TASKS
> >
> > Tim Orling (5):
> >   devtool upgrade: enable RECIPE_UPDATE_EXTRA_TASKS
> >   cargo-update-recipe-crates: add RECIPE_UPDATE_EXTRA_TASKS
> >   ref-manual: add RECIPE_UPDATE_EXTRA_TASKS variable
> >   meta-selftest: add python3-guessing-game
> >   oe-selftest: add RECIPE_UPDATE_EXTRA_TASKS test
> >
> >  documentation/ref-manual/variables.rst        |  7 ++
> >  .../python/python3-guessing-game-crates.inc   | 82 +++++++++++++++++
> >  .../python3-guessing-game-crates.inc.upgraded | 88 +++++++++++++++++++
> >  .../python/python3-guessing-game_git.bb       | 19 ++++
> >  .../python3-guessing-game_git.bb.upgraded     | 19 ++++
> >  .../cargo-update-recipe-crates.bbclass        |  2 +
> >  meta/lib/oeqa/selftest/cases/devtool.py       | 46 ++++++++++
> >  scripts/lib/devtool/upgrade.py                | 12 +++
> >  8 files changed, 275 insertions(+)
> >  create mode 100644
> meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc
> >  create mode 100644
> meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc.up=
graded
> >  create mode 100644 meta-selftest/recipes-devtools/python/
> python3-guessing-game_git.bb
> >  create mode 100644
> meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgrad=
ed
> >
> > --
> > 2.45.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#200216):
> https://lists.openembedded.org/g/openembedded-core/message/200216
> > Mute This Topic: https://lists.openembedded.org/mt/106450866/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000003705010619fdca8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 3, 2024 at 2:09=E2=80=AFA=
M Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kana=
vin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Thanks, I like the idea. There are a number of other recipes t=
hat for<br>
various reasons need &#39;special handling&#39; in version updates that<br>
devtool doesn&#39;t know how to perform, and this could be used to define<b=
r>
that handling where it belongs, which is in the recipe itself.<br>
<br>
E.g. updating cmake could also rename cmake-native_*.bb to match.<br></bloc=
kquote><div><br></div><div>Good point. I had not considered that. As RP poi=
nted out, python manifest is another.</div><div><br></div><div>I suspect we=
 will find many use cases for this pattern.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
On Sun, 2 Jun 2024 at 23:01, Tim Orling via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><=
br>
&lt;tim.orling=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org" tar=
get=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;<br>
&gt; Whenever a recipe which inherits cargo-update-recipe-crates is upgrade=
d with<br>
&gt; devtool (such as with the Auto Upgrade Helper) we frequently see failu=
res.<br>
&gt; If the upstream Cargo.toml or Cargo.lock has been changed, the corresp=
onding<br>
&gt; &lt;recipe_name&gt;-crates.inc needs to be updated. This is done by ru=
nning the<br>
&gt; &quot;bitbake -c update_crates &lt;recipe_name&gt;&quot; task, but thi=
s has until now been<br>
&gt; a manual operation.<br>
&gt;<br>
&gt; Add a new variable RECIPE_UPDATE_EXTRA_TASKS which is a string delimit=
ed<br>
&gt; list of tasks to be run during the upgrade() method of<br>
&gt; meta/lib/devtool/upgrade.py.<br>
&gt;<br>
&gt; To solve the problem described above, the solution is for all recipes =
which<br>
&gt; inherit cargo-update-recipe-crates to add the &quot;do_update_crates&q=
uot; task to<br>
&gt; the RECIPE_UPDATE_EXTRA_TASKS variable. Add this to the bbclass.<br>
&gt;<br>
&gt; Add test case based on the guessing-game source we currently use for t=
he<br>
&gt; maturin runtime test cases, based on <a href=3D"https://www.maturin.rs=
/tutorial" rel=3D"noreferrer" target=3D"_blank">https://www.maturin.rs/tuto=
rial</a>.<br>
&gt; This oe-selftest case checks for both the change in the recipe file an=
d<br>
&gt; the recipe -crates.inc file.<br>
&gt;<br>
&gt; This will rely on a new &quot;guessing-game&quot; git repository to be=
 added to<br>
&gt; <a href=3D"http://git.yoctoproject.org/guessing-game" rel=3D"noreferre=
r" target=3D"_blank">git.yoctoproject.org/guessing-game</a> (currently host=
ed on GitHub for the<br>
&gt; purposes of this RFC).<br>
&gt;<br>
&gt; Currently, update_crates is the only task known to the author to fall =
into<br>
&gt; this RECIPE_UPDATE_EXTRA_TASKS use case. If anyone can think of other =
use<br>
&gt; cases that can also be added (and tested!), please let me know.<br>
&gt;<br>
&gt; Two obvious use cases that would be nice to add with changes in oe-cor=
e are:<br>
&gt; (1) some kind of &quot;go-mod://&quot; update class to use a similar &=
lt;recipe&gt;-go-mods.inc<br>
&gt; (2) some kind of rework of the &quot;npm://&quot; fetcher to use &lt;r=
ecipe&gt;-npm-mods.inc<br>
&gt; But both of those are out of scope for this proposal.<br>
&gt;<br>
&gt; The _run_recipe_update_extra_tasks() method added to lib/devtool/upgra=
de.py<br>
&gt; is functional, but could probably use some more guards and checks. Ide=
as for<br>
&gt; improvements are welcome, hence the RFC.<br>
&gt;<br>
&gt; An attempt at documenting the new variable has been added to ref-manua=
l,<br>
&gt; but if anyone has some ideas for better clarification, input is welcom=
e.<br>
&gt;<br>
&gt; The following changes since commit af6d28d2b0abdfcfa70edcc95abd99a3c1a=
64ac8:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0sanity: Check if tar is gnutar (2024-05-31 16:58:36 +0100)=
<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.yoctoproject.org/poky-contrib" rel=
=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky-contrib=
</a> timo/RECIPE_UPDATE_EXTRA_TASKS<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?=
h=3Dtimo/RECIPE_UPDATE_EXTRA_TASKS" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/RECIPE_UPDATE_EXTRA_T=
ASKS</a><br>
&gt;<br>
&gt; Tim Orling (5):<br>
&gt;=C2=A0 =C2=A0devtool upgrade: enable RECIPE_UPDATE_EXTRA_TASKS<br>
&gt;=C2=A0 =C2=A0cargo-update-recipe-crates: add RECIPE_UPDATE_EXTRA_TASKS<=
br>
&gt;=C2=A0 =C2=A0ref-manual: add RECIPE_UPDATE_EXTRA_TASKS variable<br>
&gt;=C2=A0 =C2=A0meta-selftest: add python3-guessing-game<br>
&gt;=C2=A0 =C2=A0oe-selftest: add RECIPE_UPDATE_EXTRA_TASKS test<br>
&gt;<br>
&gt;=C2=A0 documentation/ref-manual/variables.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 7 ++<br>
&gt;=C2=A0 .../python/python3-guessing-game-crates.inc=C2=A0 =C2=A0| 82 +++=
++++++++++++++<br>
&gt;=C2=A0 .../python3-guessing-game-crates.inc.upgraded | 88 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-guessing-game_git.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-guessing-game_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 19 ++++<br>
&gt;=C2=A0 .../python3-guessing-game_git.bb.upgraded=C2=A0 =C2=A0 =C2=A0| 1=
9 ++++<br>
&gt;=C2=A0 .../cargo-update-recipe-crates.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/devtool.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 46 ++++++++++<br>
&gt;=C2=A0 scripts/lib/devtool/upgrade.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 12 +++<br>
&gt;=C2=A0 8 files changed, 275 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-selftest/recipes-devtools/python/python3=
-guessing-game-crates.inc<br>
&gt;=C2=A0 create mode 100644 meta-selftest/recipes-devtools/python/python3=
-guessing-game-crates.inc.upgraded<br>
&gt;=C2=A0 create mode 100644 meta-selftest/recipes-devtools/python/<a href=
=3D"http://python3-guessing-game_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-guessing-game_git.bb</a><br>
&gt;=C2=A0 create mode 100644 meta-selftest/recipes-devtools/python/python3=
-guessing-game_git.bb.upgraded<br>
&gt;<br>
&gt; --<br>
&gt; 2.45.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#200216): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/200216" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/200216</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10645086=
6/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/106450866/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000003705010619fdca8f--

