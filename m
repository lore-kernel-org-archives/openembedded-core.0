Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C85C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 19:05:20 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.139502.1680721511883757544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 12:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G2WhcZoc;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id q16so47959417lfe.10
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 12:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680721510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qc37+bHgY+QwKMZu64iS24xes03CLZ5wNjmgzmbHNFY=;
        b=G2WhcZocz0X1clXL0lQiEcf9mffnwgurjsJ3dyzpPz/K3u+b9qpIuTx7jZWjMXP180
         C58YgCir9Cq4D42DhX3YFlrfUXgn9FOcxGl6jkG2Cf3SrH8YMMV+SeJBpjw1sLAvwzqT
         U+B5Yx33UGkhfj5KyiNypH3SsXD4QLJ4eJiqicRjzl0CB4y52UaP+/EXXzRKd/PpLflE
         m+WQBxkwVBqdF+eS6QsVgu8oBjMzFEeatn9xy42qXIhEYcQDEfiQdJCKNI3ZBaKZZ3B1
         PuWXmXn32WHViipk+ZJycRR+lEuODei7F3nJL//aXYS9v0hRqH6Lb50pFvwVDhLe73nY
         a4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680721510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qc37+bHgY+QwKMZu64iS24xes03CLZ5wNjmgzmbHNFY=;
        b=HBQ4vkXKTNS4gNgqjc15H4KaVwDpmxePuNdqa05e8VQHSafH3aog/LqlNJ88upiSIF
         OiN3uO6aG/EdAeykH11ONBHkdisNJNXmLImIyyuu5xxbLf2bkLZxNKjq6f7AnU1ZFR7/
         fFC2P281wDVZLKpxnZzH0IZv+Xbc7YftWx5J44FhsU0+9Qv3B5pbqTNZTSDCucmQ+GUE
         RI+sKAC9zz0sGifP6uZIg7famfIu7RHmsAbTYtsxuJ3Fj5czzRW+jND0hqeZSfMevuN2
         hk620GDCqPGSZL5OH9nls+LpJ+a0EcGTfqN4aY6E+siSdnd+UGQgWnu/a6oLqVTo/S0r
         e20g==
X-Gm-Message-State: AAQBX9fYvQ7oabBOXs4aqp4gv1b2A75pQggiLocUuCkJoGqz/QPe7N3i
	JJ2JWKp+L7WZRm/UtS9U0bs1IKOPHPCAK6wab30=
X-Google-Smtp-Source: AKy350YHJMmZLMzipVIB7W/5OPHDFdg1/35S4o+4iN0FxIflI/f5kdd8MWkpz4OaTsUTLC/0H1VgEUT4xTF1UAjXY/4=
X-Received: by 2002:ac2:538a:0:b0:4d5:ca43:7049 with SMTP id
 g10-20020ac2538a000000b004d5ca437049mr2273612lfh.12.1680721509683; Wed, 05
 Apr 2023 12:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <17531B0D0DFA1CB6.3977@lists.openembedded.org> <41ad289e-fffb-b9a1-ab53-0c0510c3d324@bootlin.com>
In-Reply-To: <41ad289e-fffb-b9a1-ab53-0c0510c3d324@bootlin.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 5 Apr 2023 21:04:58 +0200
Message-ID: <CA+cAkeoPkXN+4Z39DWewrhSL1c3GSsbadPhY-_=Rf9p-Na5u+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] migration-guides: update 4.2 migration and
 release notes
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <rybczynska@gmail.com>, Paul Eggleton <paul.eggleton@linux.microsoft.com>, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008d1f8d05f89b7803"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 19:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179748

--0000000000008d1f8d05f89b7803
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Apr 2023 at 20:40, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Greetings,
>
> I copied the OE-core mailing list to get the attention of contributors.
> If you want your new features to be featured in the release and
> migration notes for 4.2, it's time to speak!
>
> What I wrote so far is a very early draft meant to help you detect
> what's missing and correct what I've written so far.
>
> See my questions and comments below...
>
> On 05.04.23 at 19:46, Michael Opdenacker via lists.openembedded.org wrote:
> > diff --git a/documentation/migration-guides/migration-4.2.rst
> b/documentation/migration-guides/migration-4.2.rst
> > index 1339411b3e..3b04e072cb 100644
> > ...
> > +Rust: mandatory checksums for crates
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +This release now supports checksums for Rust crates and make
> > +them mandatory for each crate in a recipe. See
> :yocto_git:`python3_bcrypt recipe changes
> >
> +</poky/commit/?h=mickledore&id=0dcb5ab3462fdaaf1646b05a00c7150eea711a9a>`
> > +for example.
> > +
> > +The ``cargo-update-recipe-crates`` utility
> > +:yocto_git:`has been extended
> </poky/commit/?h=mickledore&id=eef7fbea2c5bf59369390be4d5efa915591b7b22>`
> > +to include such checksums.
>
>
> Any more Rust changes we should mention in the migration notes?
>
>
Maybe mention a specific procedure to update a cargo based recipe from
scratch (i.e. a recipe that
didn't use the cargo-update-recipe-crates inheritance):

To bootstrap a cargo base recipe which have not the checksum list, below are
the steps to make:
  - make the recipe inherit cargo-update-recipe-crates
  - remove all crate:// from the recipe
  - create an empty ${BPN}-crates.inc file and make your recipe requires it
  - execute "bitbake -c update_crates your_recipe"
  - copy paste the output of bitbake about the missing checksums in your
${BPN}-crates.inc

The last step requires a bitbake patch to show all the missing checksum
which I don't know
if it will be in 4.2.


> > +
> > +-  Rust improvements:
> > +
> > +   -  This release adds Cargo support on the target, and includes
> > +      automated QA tests for this functionality.
> > +
> > +   -  It also supports checksums for Rust crates and makes
> > +      them mandatory for each crate in a recipe.
>
>
> More Rust changes we should highlight?
>

This one seems redundant with the previously mentioned rust changes, isn't
it ?
 Nevertheless, I'd maybe add a line about the fact that now we can develop
rust project which contains "private" crate (i.e. crates that would be
hosted
in a git repository instead of crates.io registry), and by develop, it
means we
can of course build such a package but perform devtool operation on it (at
least devtool modify and devtool deploy-target)

--0000000000008d1f8d05f89b7803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, 5 Apr 2023 at 20:40, Michael Opde=
nacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.opdena=
cker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Greetings,<br>
<br>
I copied the OE-core mailing list to get the attention of contributors. <br=
>
If you want your new features to be featured in the release and <br>
migration notes for 4.2, it&#39;s time to speak!<br>
<br>
What I wrote so far is a very early draft meant to help you detect <br>
what&#39;s missing and correct what I&#39;ve written so far.<br>
<br>
See my questions and comments below...<br>
<br>
On 05.04.23 at 19:46, Michael Opdenacker via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a>=
 wrote:<br>
&gt; diff --git a/documentation/migration-guides/migration-4.2.rst b/docume=
ntation/migration-guides/migration-4.2.rst<br>
&gt; index 1339411b3e..3b04e072cb 100644<br>
&gt; ...<br>
&gt; +Rust: mandatory checksums for crates<br>
&gt; +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; +<br>
&gt; +This release now supports checksums for Rust crates and make<br>
&gt; +them mandatory for each crate in a recipe. See :yocto_git:`python3_bc=
rypt recipe changes<br>
&gt; +&lt;/poky/commit/?h=3Dmickledore&amp;id=3D0dcb5ab3462fdaaf1646b05a00c=
7150eea711a9a&gt;`<br>
&gt; +for example.<br>
&gt; +<br>
&gt; +The ``cargo-update-recipe-crates`` utility<br>
&gt; +:yocto_git:`has been extended &lt;/poky/commit/?h=3Dmickledore&amp;id=
=3Deef7fbea2c5bf59369390be4d5efa915591b7b22&gt;`<br>
&gt; +to include such checksums.<br>
<br>
<br>
Any more Rust changes we should mention in the migration notes?<br>
<br></blockquote><div><br></div><div>Maybe mention a specific procedure to =
update a cargo based recipe from scratch (i.e. a recipe that=C2=A0</div><di=
v>didn&#39;t use the cargo-update-recipe-crates inheritance):</div><div><br=
></div><div><div>To bootstrap=C2=A0a cargo base recipe which have not the c=
hecksum list, below are</div><div>the steps to make:</div><div>=C2=A0 - mak=
e the recipe inherit cargo-update-recipe-crates</div><div>=C2=A0 - remove a=
ll crate:// from the recipe</div><div>=C2=A0 - create an empty ${BPN}-crate=
s.inc file and make your recipe requires it</div><div>=C2=A0 - execute &quo=
t;bitbake -c update_crates your_recipe&quot;</div><div>=C2=A0 - copy paste =
the output of bitbake about the missing checksums in your ${BPN}-crates.inc=
</div></div><div><br></div><div>The last step requires a bitbake patch to s=
how all the missing checksum which I don&#39;t know</div><div>if it will be=
 in 4.2.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
&gt; +<br>
&gt; +-=C2=A0 Rust improvements:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0-=C2=A0 This release adds Cargo support on the target, a=
nd includes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 automated QA tests for this functionality.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0-=C2=A0 It also supports checksums for Rust crates and m=
akes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 them mandatory for each crate in a recipe.<br>
<br>
<br>
More Rust changes we should highlight?<br></blockquote><div><br></div><div>=
This one seems redundant with the previously mentioned rust changes, isn&#3=
9;t it ?</div><div>=C2=A0Nevertheless, I&#39;d maybe add a line about the f=
act that now we can develop</div><div>rust project which contains &quot;pri=
vate&quot; crate (i.e. crates that would be hosted</div><div>in a git repos=
itory instead of <a href=3D"http://crates.io">crates.io</a> registry), and =
by develop, it means we</div><div>can of course build such a package but pe=
rform devtool operation on it (at</div><div>least devtool modify and devtoo=
l deploy-target)</div><div><br></div></div></div>

--0000000000008d1f8d05f89b7803--

