Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23E2C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 13:08:10 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.11869.1635253689464367891
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 06:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AQEfQO3A;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id w12so7656570edd.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 06:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NLc2EjAt15FhXZwNZBwM3TYQAzbsRdAbTth5io23qE0=;
        b=AQEfQO3A7DjGahisMsbAIbGGvy1dkkysZt2Hm88geN/q36Cm/f+XD+C8KIoc4F7j+y
         lSNZF08YtAaxgcYWaW1H0LWG+Hn249g4wkS+uQu7nztu+0h3NgVtKVLWcuffBrVjkY1j
         lSW38VtA4XU4Nv9crKHN/7ZqeDxaEZg4hMWtnKlwfBrBMIUQqQ/elERqOYSIHdDKQbFz
         3dCwsBjj7XCFniofWJg121mZMV8ZOXWDmMxOWLVMPSGvFsLnbnLk10a9DnL9wdXT9Sjl
         GtKL+pHtCbhXpC4ncKgqA5PG8Vt41MtETlPxohFNkBZCTMAJR9Y7nNKkGMgK852KrZfm
         zBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NLc2EjAt15FhXZwNZBwM3TYQAzbsRdAbTth5io23qE0=;
        b=HgfAsdOc8MOcZUXqINSdO1CZpsrHE60U/Re4PijPUTmjw7MsLg4rE69l8xvlhxFClA
         d0EUuBfwoI7p+CKODQF+G0+KAMoBas5vrP3DF9nc9rN8F0gP+sAWhPTtaO8TL5cumSbJ
         LLaMj7SOJTQ3mIQPo4Z3MWYwOYGscr/1i0JgMNpDKdD+Go1Hf7lwtGj3G74cd7ZoevlW
         ffqh0SDFHRtPKLFJyOtl+EOKDZ9eZ3LFwp8mTVFd2C5XTvjxZwfwsBwkAXCtFhTVJUYM
         XFpkie7CipCl4jhZJLAePLoDHmHVTq3ORy6N7oAX9ds3YLHyMBPZ86B8qyo9gU5McYyv
         IjzQ==
X-Gm-Message-State: AOAM533b2dOo0O4l0TRmr0tPfmBokbALlnLZMCUWkcj3cWs9KjplRnoW
	JhmzBNO4Xh/S74PqGSWpkMkyZFEZFWsUtiLqmIU=
X-Google-Smtp-Source: 
 ABdhPJybyqYZvmh9fIan54swl5Kxo8nkagV4Iq/my+pIqFni64hr9xpar68msWmqmhbC5RENtS5enyaw+0D6EWwk08Y=
X-Received: by 2002:a17:906:9bf9:: with SMTP id
 de57mr14464153ejc.35.1635253673204;
 Tue, 26 Oct 2021 06:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211026073406.3516-1-tomasz.dziendzielski@gmail.com>
In-Reply-To: <20211026073406.3516-1-tomasz.dziendzielski@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 26 Oct 2021 09:07:42 -0400
Message-ID: 
 <CADkTA4OaJLX05_oNFPu+LvOkZpEUtJxTDGUa=cDJRgKT+EaQuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: Add KERNEL_SKIP_BRANCH_CONVERSION
 var to skip branch conversion from remote to local
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Jan Brzezanski <jan.brzezanski@gmail.com>,
 Ricardo Rodrigues <rrodrigues80@gmail.com>,
	Szymon Czarnuch <szymek125.14@gmail.com>, Kamil Kwiek <kamil.kwiek@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004f205305cf412a17"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 13:08:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157393

--0000000000004f205305cf412a17
Content-Type: text/plain; charset="UTF-8"

It's typically a good idea to cc' me on kernel-yocto commits, but I did
happen to notice this one, so all is well.

On Tue, Oct 26, 2021 at 3:34 AM Tomasz Dziendzielski <
tomasz.dziendzielski@gmail.com> wrote:

> Introduced poky upstream commit:
> 14df6d53b6 linux-yocto: improve checkout error handling and reporting
>
> converts all remote branches to local branches.
> Our Linux repo has ~4500 remote branches:
> git branch -a | grep remotes |wc -l  -> 4575
>
>
One would argue that having that many remote branches isn't a great idea ..
but I'll stay out of that. A wise person doesn't mess with someone else's
repository structure and workflow :)



> This costs our best workstations ~20 minutes to simply do that conversion
> in do_kernel_checkout which is not needed (at least I do not see any
> benefit after testing with this patch).
>
> Since this conversion is required for some linux-yocto workflows we
> introduce variable that allows skipping this on demand.
>

Right, it definitely is required for quite a few.


>
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> Signed-off-by: Jan Brzezanski <jan.brzezanski@gmail.com>
> Signed-off-by: Ricardo Rodrigues <rrodrigues80@gmail.com>
> Signed-off-by: Szymon Czarnuch <szymek125.14@gmail.com>
> Signed-off-by: Kamil Kwiek <kamil.kwiek@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 1d5a8cdf29..68fb1af821 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -363,13 +363,15 @@ do_kernel_checkout() {
>                 cd ${S}
>
>                 # convert any remote branches to local tracking ones
> -               for i in `git branch -a --no-color | grep remotes | grep
> -v HEAD`; do
> -                       b=`echo $i | cut -d' ' -f2 | sed
> 's%remotes/origin/%%'`;
> -                       git show-ref --quiet --verify -- "refs/heads/$b"
> -                       if [ $? -ne 0 ]; then
> -                               git branch $b $i > /dev/null
> -                       fi
> -               done
> +               if [ "${KERNEL_SKIP_BRANCH_CONVERSION}" != "1" ]; then
>

A new variable like this would need to be documented, so an accompanying
patch to documentation would be required.

As for the variable, something like KERNEL_YOCTO_REMOTES_TO_LOCAL would be
better, and set the default to non-zero (i.e. "t" )

so it could be: if [ -n "${KERNEL_YOCTO_REMOTES_TO_LOCAL}" ]; then
...



> +                       for i in `git branch -a --no-color | grep remotes
> | grep -v HEAD`; do
> +                               b=`echo $i | cut -d' ' -f2 | sed
> 's%remotes/origin/%%'`;
> +                               git show-ref --quiet --verify --
> "refs/heads/$b"
> +                               if [ $? -ne 0 ]; then
> +                                       git branch $b $i > /dev/null
> +                               fi
> +                       done
> +               fi
>
>
Not all git versions automatically track a remote -> local, which is why
that code was initially required. To be safe this needs to at least convert
KBRANCH to a local, since it will be checked out by the code that follows.

There are other parts of the patching/merging/meta processes that need
local branches, but since this wouldn't be on by default, we don't have to
worry about converting the other possible branches to local.

Bruce



>                 # Create a working tree copy of the kernel by checking out
> a branch
>                 machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157376):
> https://lists.openembedded.org/g/openembedded-core/message/157376
> Mute This Topic: https://lists.openembedded.org/mt/86597675/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004f205305cf412a17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">It&#39;s typically a good idea to cc&#39; me on kernel-yocto =
commits, but I did happen to notice this one, so all is well.</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
Oct 26, 2021 at 3:34 AM Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.d=
ziendzielski@gmail.com">tomasz.dziendzielski@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Introduced poky upstr=
eam commit:<br>
14df6d53b6 linux-yocto: improve checkout error handling and reporting<br>
<br>
converts all remote branches to local branches.<br>
Our Linux repo has ~4500 remote branches:<br>
git branch -a | grep remotes |wc -l=C2=A0 -&gt; 4575<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">One would argue that having that many remote branches isn&=
#39;t a great idea .. but I&#39;ll stay out of that. A wise person doesn&#3=
9;t mess with someone else&#39;s repository structure and workflow :)</div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
This costs our best workstations ~20 minutes to simply do that conversion<b=
r>
in do_kernel_checkout which is not needed (at least I do not see any<br>
benefit after testing with this patch).<br>
<br>
Since this conversion is required for some linux-yocto workflows we<br>
introduce variable that allows skipping this on demand.<br></blockquote><di=
v><br></div><div class=3D"gmail_default" style=3D"font-size:small">Right, i=
t definitely is required for quite a few.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.dziendziel=
ski@gmail.com" target=3D"_blank">tomasz.dziendzielski@gmail.com</a>&gt;<br>
Signed-off-by: Jan Brzezanski &lt;<a href=3D"mailto:jan.brzezanski@gmail.co=
m" target=3D"_blank">jan.brzezanski@gmail.com</a>&gt;<br>
Signed-off-by: Ricardo Rodrigues &lt;<a href=3D"mailto:rrodrigues80@gmail.c=
om" target=3D"_blank">rrodrigues80@gmail.com</a>&gt;<br>
Signed-off-by: Szymon Czarnuch &lt;<a href=3D"mailto:szymek125.14@gmail.com=
" target=3D"_blank">szymek125.14@gmail.com</a>&gt;<br>
Signed-off-by: Kamil Kwiek &lt;<a href=3D"mailto:kamil.kwiek@gmail.com" tar=
get=3D"_blank">kamil.kwiek@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.bbclass | 16 +++++++++-------<br>
=C2=A01 file changed, 9 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.=
bbclass<br>
index 1d5a8cdf29..68fb1af821 100644<br>
--- a/meta/classes/kernel-yocto.bbclass<br>
+++ b/meta/classes/kernel-yocto.bbclass<br>
@@ -363,13 +363,15 @@ do_kernel_checkout() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # convert any remot=
e branches to local tracking ones<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in `git branc=
h -a --no-color | grep remotes | grep -v HEAD`; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0b=3D`echo $i | cut -d&#39; &#39; -f2 | sed &#39;s%remotes/origin/=
%%&#39;`;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0git show-ref --quiet --verify -- &quot;refs/heads/$b&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ $? -ne 0 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git branch $b $i &gt; /dev/null<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${KERNEL=
_SKIP_BRANCH_CONVERSION}&quot; !=3D &quot;1&quot; ]; then<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">A=
 new variable like this would need to be documented, so an accompanying pat=
ch to documentation would be required.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">As for the variable, something like KERNEL_YOCTO_REMOTES_TO_L=
OCAL would be better, and set the default to non-zero (i.e. &quot;t&quot; )=
<br></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">so it could be: if [=
 -n &quot;${KERNEL_YOCTO_REMOTES_TO_LOCAL}&quot; ]; then</div><div class=3D=
"gmail_default" style=3D"font-size:small">...</div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0for i in `git branch -a --no-color | grep remotes | grep -v HEAD`=
; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b=3D`echo $i | cut -d&#39; &#39; -f2 =
| sed &#39;s%remotes/origin/%%&#39;`;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git show-ref --quiet --verify -- &quo=
t;refs/heads/$b&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git branc=
h $b $i &gt; /dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Not all git versions automatically track a remote -&gt; lo=
cal, which is why that code was initially required. To be safe this needs t=
o at least convert KBRANCH to a local, since it will be checked out by the =
code that follows.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">There =
are other parts of the patching/merging/meta processes that need local bran=
ches, but since this wouldn&#39;t be on by default, we don&#39;t have to wo=
rry about converting the other possible branches to local.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create a working =
tree copy of the kernel by checking out a branch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 machine_branch=3D&q=
uot;${@ get_machine_branch(d, &quot;${KBRANCH}&quot; )}&quot;<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157376): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157376" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157376</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86597675/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86597675/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000004f205305cf412a17--

