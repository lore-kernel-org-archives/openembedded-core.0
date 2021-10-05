Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F45C433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 13:14:23 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web08.132.1633439661890542949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 06:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VLl/0ALE;
 spf=pass (domain: gmail.com, ip: 209.85.217.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id l19so23593032vst.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 06:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T1iV8+pUnhzzjyJshKWy14WvJOs46nAefWZGNYjVF84=;
        b=VLl/0ALE/mzN1i9LHS2QDMQyI7t+rLWUk2pM1EZMSGGGBJZik9jnXniR8uG/ziqqeN
         r8XvgrW3kGzXzxon4ZIUoWKDhFgRh0cdYl5BX1F+U54m30XFYKCq5XNNLVBfD3vBGeal
         RSmUJsM7tcp+wqw8hwvzcoRIH0OoFUZjSV127zUSEsc2jJU1slcn05oTbSghk4pRAFHZ
         YG6ynLvR82p44Wk3Fnblf801aTDjZuACbUgm47o5pqAg5U6kEE4JPST5/zu3Hci25haZ
         MbXfOtGxGsnj9eepG/KZXZHMOdOgH7A/2api3a1NUJa53OLn5M1MNawaPZYujRcPDXg5
         CJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T1iV8+pUnhzzjyJshKWy14WvJOs46nAefWZGNYjVF84=;
        b=lgjtqspJXsVNeJQLARgFH32BBeJW2S1+BdRqmbgTeJ7/3JEwE0XlvBlXI4l/QC14sZ
         Xl/81/q2oq+ANis8MIB4c0LZtdOeXtoq3B8ZmfsqSb/BXLHepzl+q/RDL0ZYW6KUbgdR
         F92e02j88NLCce5ju6bsxu1006zQ7rtFrBHbJhCYSQ9yFYTw+GZzeoYuwW2tHMo7laRb
         y9CKfPRskTaRK5JCh85gFBoTNx1adimKwx6I1UmYBCtgbGH8dqJvIaCDbBknBMCpaiFZ
         ydlFAAU4FvqWjpMzIbFcBvtQUFXkWn8VcT/Yz/uCxVDKDoIuhEmhXDQKUY0NZRPj+IaB
         tMzg==
X-Gm-Message-State: AOAM533F+/qJ9Y+DOOPE4EdlxtTKWImbBMjRNBox+tIYCss3lpFUjB4K
	PKWStoY+Orbn4AZ4YwfcbC3KYKdMz6Dr3y4QZkM=
X-Google-Smtp-Source: 
 ABdhPJziI0Wh+tw5azCNt5DYS9J1im4jetYKLfH00LaQ5M2sPruStjJkq4nmbHf7j53mJpzcz3N2iCh/yvfDajAR0oc=
X-Received: by 2002:a67:bb04:: with SMTP id m4mr18281284vsn.18.1633439661067;
 Tue, 05 Oct 2021 06:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <16AB247E1F8222C3.20282@lists.openembedded.org>
In-Reply-To: <16AB247E1F8222C3.20282@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Oct 2021 15:14:09 +0200
Message-ID: 
 <CANNYZj-9E3G+CKvytvEdmnPQ8qT0BK-Mwxr5=NZaziUc10dZ+g@mail.gmail.com>
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c291b305cd9ace06"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 13:14:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156647

--000000000000c291b305cd9ace06
Content-Type: text/plain; charset="UTF-8"

'devtool add' of course. Test case is in
meta/lib/oeqa/selftest/cases/devtool.py

Alex

On Tue, 5 Oct 2021 at 15:10, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> I think the supposed workflow with the new npm.class was to use 'devtool
> create' which would run some npm magic to to create a single recipe that
> has all of the npm-fetched dependencies inside SRC_URI. Have you tried that?
>
> A layer with thousands of recipes seems totally intractable.
>
> Alex
>
> On Tue, 5 Oct 2021 at 14:48, Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
>> Hi Richard,
>>
>> Am 05.10.2021 um 13:09 schrieb Richard Purdie:
>> > Thanks for bring this up, I've been wondering on the status of our npm
>> support.
>>
>> Do you know any npm users?
>>
>> > On Tue, 2021-10-05 at 12:04 +0200, Stefan Herbrechtsmeier wrote:
>> >> I must improve the npm support for our use cases but need some
>> >> fundamental decisions to proceed. I need to build express and angular
>> >> applications from git repositories.
>> >>
>> >> I have the following changes in my pipeline until now:
>> >> - Support npm packages with missing execute mode for directories
>> >> - Reduce command calls in npm run
>> >> - Add support for local tarball and local link sources
>> >> - Rework crunch license to recognize more variants
>> >> - Move known license checksums to CSV file
>> >> - Pass README as fallback to guess license if a license is missing
>> >> - Add support to pass build arguments to npm install
>> >> - Add support to run build scripts with native packages
>> >> - Parallelize the populate of the npm cache
>> >>
>> >> The build (install) of npm packages leads to problems because of old
>> >> versions in the dependency tree. For example, older versions of
>> packages
>> >> are incompatible with the Node.js version and older versions of
>> node-gyp
>> >> require Python 2.
>> >
>> > Hopefully over time the python2 issue should reduce and fade at least.
>> The
>> > node.js version is trickier.
>>
>> The current implementation works like an project with embedded external
>> dependencies. I both cases I have to patch the embedded dependencies or
>> replace them with external DEPENDS.
>>
>> >> I see three solutions to integrate npm packages:
>> >> - Build npm packages from the npm project outside of OE and only fetch
>> >> the data.
>> >> - Fork the npm project repository and fix everything inside the fork.
>> >> Use the fork direct or create patches from the fork to build inside OE.
>> >> - Create recipes per project and incompatible version to fix everything
>> >> in OE and reduce redundancy.
>> >>
>> >> The last solution keeps everything in OE and benefit from the existing
>> >> OE functions like download proxy as well as license, CVE and version
>> >> check. But it increases the initial costs and makes only sense if there
>> >> is an interest in an meta-nodejs layer.
>> >
>> > The latter solution sounds like the only really viable option from an OE
>> > perspective since we do need the proxy/CVE/license handling, it is a
>> huge part
>> > of our value and without it, it isn't really OE.
>>
>> The problem are the many different packages. An Angular project could
>> have more than 1000 different project. Thereby some dependencies only
>> differ in the version or needed only for development like a development
>> server or a unit test framework.
>>
>> > Creating a meta-nodejs layer isn't an issue if there are people willing
>> to look
>> > after it.
>>
>> Is a layer with more more than 1000 recipes thinkable?
>>
>> Regards
>>    Stefan
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156646):
> https://lists.openembedded.org/g/openembedded-core/message/156646
> Mute This Topic: https://lists.openembedded.org/mt/86089523/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c291b305cd9ace06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&#39;devtool add&#39; of course. Test case is in meta=
/lib/oeqa/selftest/cases/devtool.py</div><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, 5 Oct 2021 at 15:10, Alexander Kanavin via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"=
mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div>I think the supposed workflow with the new npm.class wa=
s to use &#39;devtool create&#39; which would run some npm magic to to crea=
te a single recipe that has all of the npm-fetched dependencies inside SRC_=
URI. Have you tried that?</div><div><br></div><div>A layer with thousands o=
f recipes seems totally intractable.<br></div><div><br></div><div>Alex<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, 5 Oct 2021 at 14:48, Stefan Herbrechtsmeier &lt;<a href=3D"mai=
lto:stefan.herbrechtsmeier-oss@weidmueller.com" target=3D"_blank">stefan.he=
rbrechtsmeier-oss@weidmueller.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Richard,<br>
<br>
Am 05.10.2021 um 13:09 schrieb Richard Purdie:<br>
&gt; Thanks for bring this up, I&#39;ve been wondering on the status of our=
 npm support.<br>
<br>
Do you know any npm users?<br>
<br>
&gt; On Tue, 2021-10-05 at 12:04 +0200, Stefan Herbrechtsmeier wrote:<br>
&gt;&gt; I must improve the npm support for our use cases but need some<br>
&gt;&gt; fundamental decisions to proceed. I need to build express and angu=
lar<br>
&gt;&gt; applications from git repositories.<br>
&gt;&gt;<br>
&gt;&gt; I have the following changes in my pipeline until now:<br>
&gt;&gt; - Support npm packages with missing execute mode for directories<b=
r>
&gt;&gt; - Reduce command calls in npm run<br>
&gt;&gt; - Add support for local tarball and local link sources<br>
&gt;&gt; - Rework crunch license to recognize more variants<br>
&gt;&gt; - Move known license checksums to CSV file<br>
&gt;&gt; - Pass README as fallback to guess license if a license is missing=
<br>
&gt;&gt; - Add support to pass build arguments to npm install<br>
&gt;&gt; - Add support to run build scripts with native packages<br>
&gt;&gt; - Parallelize the populate of the npm cache<br>
&gt;&gt;<br>
&gt;&gt; The build (install) of npm packages leads to problems because of o=
ld<br>
&gt;&gt; versions in the dependency tree. For example, older versions of pa=
ckages<br>
&gt;&gt; are incompatible with the Node.js version and older versions of no=
de-gyp<br>
&gt;&gt; require Python 2.<br>
&gt; <br>
&gt; Hopefully over time the python2 issue should reduce and fade at least.=
 The<br>
&gt; node.js version is trickier.<br>
<br>
The current implementation works like an project with embedded external <br=
>
dependencies. I both cases I have to patch the embedded dependencies or <br=
>
replace them with external DEPENDS.<br>
<br>
&gt;&gt; I see three solutions to integrate npm packages:<br>
&gt;&gt; - Build npm packages from the npm project outside of OE and only f=
etch<br>
&gt;&gt; the data.<br>
&gt;&gt; - Fork the npm project repository and fix everything inside the fo=
rk.<br>
&gt;&gt; Use the fork direct or create patches from the fork to build insid=
e OE.<br>
&gt;&gt; - Create recipes per project and incompatible version to fix every=
thing<br>
&gt;&gt; in OE and reduce redundancy.<br>
&gt;&gt;<br>
&gt;&gt; The last solution keeps everything in OE and benefit from the exis=
ting<br>
&gt;&gt; OE functions like download proxy as well as license, CVE and versi=
on<br>
&gt;&gt; check. But it increases the initial costs and makes only sense if =
there<br>
&gt;&gt; is an interest in an meta-nodejs layer.<br>
&gt; <br>
&gt; The latter solution sounds like the only really viable option from an =
OE<br>
&gt; perspective since we do need the proxy/CVE/license handling, it is a h=
uge part<br>
&gt; of our value and without it, it isn&#39;t really OE.<br>
<br>
The problem are the many different packages. An Angular project could <br>
have more than 1000 different project. Thereby some dependencies only <br>
differ in the version or needed only for development like a development <br=
>
server or a unit test framework.<br>
<br>
&gt; Creating a meta-nodejs layer isn&#39;t an issue if there are people wi=
lling to look<br>
&gt; after it.<br>
<br>
Is a layer with more more than 1000 recipes thinkable?<br>
<br>
Regards<br>
=C2=A0 =C2=A0Stefan<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156646): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156646" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156646</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86089523/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86089523/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c291b305cd9ace06--

