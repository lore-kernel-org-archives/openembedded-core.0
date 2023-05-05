Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F421C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 18:27:00 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.2288.1683311219805983512
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 11:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ks6SEcDG;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f11d267d8bso2374831e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683311218; x=1685903218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qkowMOV97xXtM2k9qWy9+CZPCdheJlF+fAjMuemfvrs=;
        b=ks6SEcDGGVxcMvDgX4R/v6zU1yYciSfOJdTjRE4R+eSHftCJMPq1i9LFH01R6CF7Bw
         UA2Mm53t8tsArGFsQTcA7a/MQqk9NdS6rwo+0PmrG+iD844egSfsRkhGkxBRdptVRAJk
         BO25o+lWgjxS1ib9cnVyjvVWvbky1ZL/VXOZYblTgSRHzm+PqGGn0w8zCEciDm6/IwEm
         E/lPPM5jdPoUHDS0Zc9U1cg16nxJCYBvZ07U4FPtCk7SxrnOV+D/0wSzKYDw18Mvjh9g
         pDXmOgJcpIpZnOphc3x3E+tNd2IJvgRnktv54N5SvthclzCl5LIxFGq8xCi3FlGiWCYz
         WFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683311218; x=1685903218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkowMOV97xXtM2k9qWy9+CZPCdheJlF+fAjMuemfvrs=;
        b=ecB2FToPFKVGngpA6Kq7qywgW81+BzHjjIDDs12plN7FcSbde7SijqMWk//cN04jmC
         SbwnSXP76I4KpcDGfT66z+hRNmuZGidQxNEb/t1nq3pTjZ2QOxk9PSCUHO1bTgHqorHF
         OlM0Zw1fr9KBAGAYNbVUk5qpDwRqkx7qphwOxslsIZpkiJ0CTAA8Jy2nDZIA9ghCEX4i
         lDS7A55DajT71SAhJlIYKv3qoszhPvEbnHnk1A/Dr4Sw9r8mIAP/MKRO7K8Km2J5FgKt
         A8zsM2B/eaTQ0ZAnTIvUa48a/pdGHGmTcQv4o/zD6eqaONkWDdJDXFaLdKjpqnVAl/mP
         AFPw==
X-Gm-Message-State: AC+VfDx3kWHfusALTrJyepKI8MjK1ZkocVsa53m+dm6BxIXFLD+6sh2v
	pmWbHNyo6UQqUeicgMZVHHqnTGMBx/A87Q/FhmE=
X-Google-Smtp-Source: ACHHUZ6NOZZ1Ip7BBz05gt5RdNeq3ZLqfHDS/DZ8X7MxkCurw2ETqyplvaOWr67mCWh2zmQih6qf3j1s8xY48YR93bM=
X-Received: by 2002:ac2:5fa8:0:b0:4ef:ef8e:56f1 with SMTP id
 s8-20020ac25fa8000000b004efef8e56f1mr806443lfe.49.1683311217660; Fri, 05 May
 2023 11:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
 <CANNYZj-q+5jxDxWDp_4B2kD4NVqWA-Fok2wuTUiLzzsO_5iYYw@mail.gmail.com>
In-Reply-To: <CANNYZj-q+5jxDxWDp_4B2kD4NVqWA-Fok2wuTUiLzzsO_5iYYw@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 5 May 2023 20:26:45 +0200
Message-ID: <CA+cAkeqLrwgk4e-Lzk0e_k8AFKCT6nqSY7+JQNZ-fPbarK0ngw@mail.gmail.com>
Subject: Re: [OE-core] Contributing, how it works?
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002cd8fa05faf66fa4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 18:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180966

--0000000000002cd8fa05faf66fa4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 5 mai 2023, 19:37, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> There is
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded


I do know this one.

>
> and some additional pages linked from it:
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> http://www.openembedded.org/wiki/Styleguide


I didn't know about these two links, thanks Alexander (and I'll slap myself
for not following the links from the first page you mentioned)


>
> The wiki is not great, and needs improvements, but the problem is it's
> difficult to write an authoritative and comprehensive answer to the
> questions you ask because there's just so many possible things one
> could check with any change to yocto. If you touch a recipe, you
> should of course check that 'bitbake recipe' still completes without
> an error. But that's obvious, isn't it?


Of course it is. I even do a clean of shared state before that, just to be
sure (shared state had often caused me trouble in the past).

Beyond that... it depends. And
> requires a bit of intuition and experience, or advice from someone who
> knows the specific item better.
>
> We generally don't expect people to learn 'the rules' upfront - just
> write some code, and if you're not certain how to test it properly or
> whether it even makes sense, submit the patch as RFC and ask to take a
> look.


That's what I did for unit test of rust recipes and I didn't get much
comments beside you and khem 15 days ago. And I still don't know if my
patches are an issue or if nobody had the time to look at them, it's pretty
frustrating.

By the way, the statement "just write some code and publish on the list for
comments" can be a blocker for a newcomer which don't know about the rules.
During my career, I often saw people too shy to contribute because they
thought they didn't meet the requirements.

 I'm sure everyone here is willing to help newcomers but having a clear
entry point (a front web page on oe/yocto site on how to make a good
contribution and clear guidelines to follow ) can be a relief for shy
people.

If it fails in integration testing, you'll hear about it too,
> and that's normal and expected for anything more complex than a typo
> fix. My patches appear 'perfect' only because I pre-test them myself
> on the autobuilder :)
>

I would like to know about these, I hear a lot in this list about
autobuilder and it seems close to what I know of continuous integration
(some build of multiple configuration with the submitted patch and tests
towards that) but I don't know how to replicate the config of those locally
on my machine (in case of errors), do you have any links for that?

Where we would *greatly* appreciate help is a special bot called
> patchtest that used to check mailing list submissions for common
> problems. That fell into disrepair due to lack of maintenance. Fixing
> that would be fantastic - and people could run it locally too. That
> could act as both a repository of rules-as-code, and a way to check
> them automatically. It could also offer hints for testing, depending
> on what the change touches. All sorts of nice things, if there is a
> person looking after it.
>
> Alex
>

Ah great, if you point me to where I can find insights about this patchset
test framework, I would gladly offer my help to fox the issue. From what
you are saying, I understand that fixing this will make the contribution
smoothier.


On Fri, 5 May 2023 at 19:17, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Hello list
> >
> > I'm wondering if there are documentations on how contribution are
> managed for the project.
> >
> > I try to find some but didn't manage to. There are easily reachable doc
> about how to contribute of course (how to make patches, fixe your identit=
y,
> send mail via git... etc) but I didn't find what I usually find on other
> open source project (CONTRIBUTING.md file most of the time) like
> >   - what are the tests do should I run before submitting (I learnt by
> practice about test image or bitbake selftest for example) ?
> >   - is there a specific configuration that I should test before
> submitting (poky is ok, or should I also test another distro)?
> >   - does some commit writing rules exist ? (some projects want commits
> to begin with a prefix, usually the software component that is modified b=
y
> the patch for example)
> >  - what are the coding rules you should follow, if any? (having common
> coding rules helps greatly the review of patches, pylint for python code
> for example, and I saw there are some bitbake recipes linter from meta-sc=
a
> layer)
> >
> > Long story short, I really would like to know what are the different
> steps a patch should go through before being merged into master (and as a
> side question, what are the steps for a patch to be backported into one o=
f
> the LTS branch).
> >
> > I'm deeply sorry if all these questions are obvious to you and have bee=
n
> already answered somewhere, in that case, please just give me the link.
> >
> > I recently started to contribute to yocto / oe and I think it will help
> me to make better contributions if I know more of how it works "under the
> hood".
> >
> > Best regards.
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180960):
> https://lists.openembedded.org/g/openembedded-core/message/180960
> > Mute This Topic: https://lists.openembedded.org/mt/98710419/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000002cd8fa05faf66fa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le ven. 5 mai 2023, 19:37, Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">a=
lex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">There is<br>
<a href=3D"http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEm=
bedded" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http://w=
ww.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I do know thi=
s one.=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><br>
and some additional pages linked from it:<br>
<a href=3D"http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http://www.ope=
nembedded.org/wiki/Commit_Patch_Message_Guidelines</a><br>
<a href=3D"http://www.openembedded.org/wiki/Styleguide" rel=3D"noreferrer n=
oreferrer noreferrer" target=3D"_blank">http://www.openembedded.org/wiki/St=
yleguide</a></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I didn&#39;t know about these two links, thanks Alexander (and I&=
#39;ll slap myself for not following the links from the first page you ment=
ioned)=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
The wiki is not great, and needs improvements, but the problem is it&#39;s<=
br>
difficult to write an authoritative and comprehensive answer to the<br>
questions you ask because there&#39;s just so many possible things one<br>
could check with any change to yocto. If you touch a recipe, you<br>
should of course check that &#39;bitbake recipe&#39; still completes withou=
t<br>
an error. But that&#39;s obvious, isn&#39;t it?</blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Of course it is. I even do a cle=
an of shared state before that, just to be sure (shared state had often cau=
sed me trouble in the past).=C2=A0</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> Beyon=
d that... it depends. And<br>
requires a bit of intuition and experience, or advice from someone who<br>
knows the specific item better.<br>
<br>
We generally don&#39;t expect people to learn &#39;the rules&#39; upfront -=
 just<br>
write some code, and if you&#39;re not certain how to test it properly or<b=
r>
whether it even makes sense, submit the patch as RFC and ask to take a<br>
look.</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>That&#39;s what I did for unit test of rust recipes and I didn&#39;t get m=
uch comments beside you and khem 15 days ago. And I still don&#39;t know if=
 my patches are an issue or if nobody had the time to look at them, it&#39;=
s pretty frustrating.<br></div><div dir=3D"auto"><br></div><div dir=3D"auto=
"></div><div dir=3D"auto">By the way, the statement &quot;just write some c=
ode and publish on the list for comments&quot; can be a blocker for a newco=
mer which don&#39;t know about the rules. During my career, I often saw peo=
ple too shy to contribute because they thought they didn&#39;t meet the req=
uirements.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0I&#39;m=
 sure everyone here is willing to help newcomers but having a clear entry p=
oint (a front web page on oe/yocto site on how to make a good contribution =
and clear guidelines to follow ) can be a relief for shy people.=C2=A0</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"> If it fails in integration testing, you&#39;=
ll hear about it too,<br>
and that&#39;s normal and expected for anything more complex than a typo<br=
>
fix. My patches appear &#39;perfect&#39; only because I pre-test them mysel=
f<br>
on the autobuilder :)<br></blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">I would like to know about these, I hear a lot in this=
 list about autobuilder and it seems close to what I know of continuous int=
egration (some build of multiple configuration with the submitted patch and=
 tests towards that) but I don&#39;t know how to replicate the config of th=
ose locally on my machine (in case of errors), do you have any links for th=
at?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
Where we would *greatly* appreciate help is a special bot called<br>
patchtest that used to check mailing list submissions for common<br>
problems. That fell into disrepair due to lack of maintenance. Fixing<br>
that would be fantastic - and people could run it locally too. That<br>
could act as both a repository of rules-as-code, and a way to check<br>
them automatically. It could also offer hints for testing, depending<br>
on what the change touches. All sorts of nice things, if there is a<br>
person looking after it.<br>
<br>
Alex<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Ah great, if you point me to where I can find insights about this patch=
set test framework, I would gladly offer my help to fox the issue. From wha=
t you are saying, I understand that fixing this will make the contribution =
smoothier.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
On Fri, 5 May 2023 at 19:17, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello list<br>
&gt;<br>
&gt; I&#39;m wondering if there are documentations on how contribution are =
managed for the project.<br>
&gt;<br>
&gt; I try to find some but didn&#39;t manage to. There are easily reachabl=
e doc about how to contribute of course (how to make patches, fixe your ide=
ntity, send mail via git... etc) but I didn&#39;t find what I usually find =
on other open source project (CONTRIBUTING.md file most of the time) like<b=
r>
&gt;=C2=A0 =C2=A0- what are the tests do should I run before submitting (I =
learnt by practice about test image or bitbake selftest for example) ?<br>
&gt;=C2=A0 =C2=A0- is there a specific configuration that I should test bef=
ore submitting (poky is ok, or should I also test another distro)?<br>
&gt;=C2=A0 =C2=A0- does some commit writing rules exist ? (some projects wa=
nt commits to begin with a prefix, usually the software component that is m=
odified by the patch for example)<br>
&gt;=C2=A0 - what are the coding rules you should follow, if any? (having c=
ommon coding rules helps greatly the review of patches, pylint for python c=
ode for example, and I saw there are some bitbake recipes linter from meta-=
sca layer)<br>
&gt;<br>
&gt; Long story short, I really would like to know what are the different s=
teps a patch should go through before being merged into master (and as a si=
de question, what are the steps for a patch to be backported into one of th=
e LTS branch).<br>
&gt;<br>
&gt; I&#39;m deeply sorry if all these questions are obvious to you and hav=
e been already answered somewhere, in that case, please just give me the li=
nk.<br>
&gt;<br>
&gt; I recently started to contribute to yocto / oe and I think it will hel=
p me to make better contributions if I know more of how it works &quot;unde=
r the hood&quot;.<br>
&gt;<br>
&gt; Best regards.<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#180960): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/180960" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/mes=
sage/180960</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98710419=
/1686489" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/mt/98710419/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-cor=
e+owner@lists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">http=
s://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto=
:alex.kanavin@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">al=
ex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div></div>

--0000000000002cd8fa05faf66fa4--

