Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11916C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 15:13:48 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.86225.1717427618080111571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 08:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tl2yjNEw;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: tim.orling@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so5452972a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1717427616; x=1718032416; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3FlFXdccBINqrFdAhT+pdhOqAwnEfGmw/XW8k6xCwhQ=;
        b=tl2yjNEwdWu2FyfKverXzBYmWnzFDg9OZM/mBPNnG6RqSLfOMbLbYtxYwEzvk6++/G
         caa5K5Oan42q24KJhzyFuXDeCNAho7xRHd1llpIOdkcXWfzAa9QoUCd1oR2QiHvTrSyp
         cEUsmwByQwnVhr5744juFtOf6Xm9BVNPIYi5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717427616; x=1718032416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FlFXdccBINqrFdAhT+pdhOqAwnEfGmw/XW8k6xCwhQ=;
        b=vwCYeYz06BLunYOLWmEizeLwdRT8LDfkL87zsAYKHEXuohty7T6HuWW3Qh7ZPog3DO
         X9a1viEEkc0GFp92bLHBXbIkv7Nx8MkwLMD3UNzGV/4CYlWjZG92S/xyAAwmGppwEEuI
         X9OoAI+awYfJ+fEc97oVWVLt30H614lv2ZWjpTg5hgqWaCwmx2orYRNHYn45X6m+wOju
         bqJXq6+de30wkWRnyJdS+t2fnxsheuRd6Jipiu/dzD4gEtnZuPn5CXkEZXPVajO9yL7R
         mlTXUk7+oFh5gkOmjYSqQxEi8IXkWwdj6/C+ggJ2vPOF/ddWSCdGechMrHXp7GFMQHhf
         vK0g==
X-Gm-Message-State: AOJu0YwihHSdWgR0+UY+FmmYw4tDmHqlvH6ZvzE6AlNmkVA6+b8CO3Zl
	Pki9ZhlbOISWGtLjncDrE4RqF78qQh5M9RQ3qPKPeeGhDw7XGjnkTgXKAF3DnExpazl50UcdE1e
	zpBVpkx2guSIXE3JXV3IdT1w7pQ84gJOippVSVg==
X-Google-Smtp-Source: AGHT+IErgw3NVvtjTF++XXX8xy4lXbTmk9a6njvtqM759QeQ8aWX7McTjeNFdQYMO3LipLAmrlV8LU1xgmYdGZFD5vc=
X-Received: by 2002:a50:8adc:0:b0:57a:2fb9:a0e1 with SMTP id
 4fb4d7f45d1cf-57a36384288mr6211510a12.15.1717427616089; Mon, 03 Jun 2024
 08:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717361301.git.tim.orling@konsulko.com> <d29724bf4472b3b4f5db512b611946b77ef3f8ee.camel@linuxfoundation.org>
In-Reply-To: <d29724bf4472b3b4f5db512b611946b77ef3f8ee.camel@linuxfoundation.org>
From: Tim Orling <tim.orling@konsulko.com>
Date: Mon, 3 Jun 2024 08:13:24 -0700
Message-ID: <CAOyo-85re7eCm3m8_X8pk2WGn8RpxudvYg4_tcFjyOUojabkfQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/3] Implement RECIPE_UPDATE_EXTRA_TASKS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>, bluelightning@bluelightning.org
Content-Type: multipart/alternative; boundary="000000000000fc3a200619fdc665"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 15:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200263

--000000000000fc3a200619fdc665
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 7:08=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2024-06-02 at 14:00 -0700, Tim Orling via lists.openembedded.org
> wrote:
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
>
> This looks good to me, thanks.
>
> Would we want to add the task that updates the python recipe's manifest
> to this?
>

Probably yes. Good idea. Which then brings up perl which has a similar
issue with the perl-rdepends.txt.


>
> Cheers,
>
> Richard
>
>
>

--000000000000fc3a200619fdc665
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 3, 2024 at 7:08=E2=80=AFA=
M Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Sun, 2024-06-02 at 14:00 -0700, Tim Or=
ling via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; <br>
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
&gt; <br>
&gt; Add a new variable RECIPE_UPDATE_EXTRA_TASKS which is a string delimit=
ed<br>
&gt; list of tasks to be run during the upgrade() method of<br>
&gt; meta/lib/devtool/upgrade.py.<br>
&gt; <br>
&gt; To solve the problem described above, the solution is for all recipes =
which<br>
&gt; inherit cargo-update-recipe-crates to add the &quot;do_update_crates&q=
uot; task to<br>
&gt; the RECIPE_UPDATE_EXTRA_TASKS variable. Add this to the bbclass.<br>
&gt; <br>
&gt; Add test case based on the guessing-game source we currently use for t=
he<br>
&gt; maturin runtime test cases, based on <a href=3D"https://www.maturin.rs=
/tutorial" rel=3D"noreferrer" target=3D"_blank">https://www.maturin.rs/tuto=
rial</a>.<br>
&gt; This oe-selftest case checks for both the change in the recipe file an=
d<br>
&gt; the recipe -crates.inc file.<br>
&gt; <br>
&gt; This will rely on a new &quot;guessing-game&quot; git repository to be=
 added to<br>
&gt; <a href=3D"http://git.yoctoproject.org/guessing-game" rel=3D"noreferre=
r" target=3D"_blank">git.yoctoproject.org/guessing-game</a> (currently host=
ed on GitHub for the<br>
&gt; purposes of this RFC).<br>
&gt; <br>
&gt; Currently, update_crates is the only task known to the author to fall =
into<br>
&gt; this RECIPE_UPDATE_EXTRA_TASKS use case. If anyone can think of other =
use<br>
&gt; cases that can also be added (and tested!), please let me know.<br>
<br>
This looks good to me, thanks.<br>
<br>
Would we want to add the task that updates the python recipe&#39;s manifest=
<br>
to this?<br></blockquote><div><br></div><div>Probably yes. Good idea. Which=
 then brings up perl which has a similar issue with the perl-rdepends.txt.<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--000000000000fc3a200619fdc665--

