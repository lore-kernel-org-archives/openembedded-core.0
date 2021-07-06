Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web09.7227.1625583261486978658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lgN5/CBE;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id l17-20020a9d6a910000b029048a51f0bc3cso10039378otq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QYfs7WYUPBr2CxS6RQX7xk21j6fzZvYfwiqrUu6jne4=;
        b=lgN5/CBENxyL9QK1IDiqu0R+smacQhnWt4sEFEIUxd0g7lwu1FdcOp3YDFFU3Jr0K5
         IgqbW4nnFeMP8PaNO03xh1Ysh5BjhfG1QJTcfycTV6+ZMW0N8kajlqiGKwCD+P64NLbJ
         OJMqwe8J+89eqKrcbY6FHQgiRpfJKAjwsIVOaBG8ODJijN29UKZpfxDJg7ETzO7HcnWq
         f+82/gJo1V1gYrExiiUbLr+429PL11MD8eKr864zkf17PH9FO6PTCLLG86dO/vYCY0k6
         54Dc54/Ez4O2f01gtKoZ31M0zwH53Gs+Ktpi5j70KckAzKAxEZOSjL/tX5uRK+1Jmtum
         mEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QYfs7WYUPBr2CxS6RQX7xk21j6fzZvYfwiqrUu6jne4=;
        b=sOYJmecZPO9Y5itMP5PKC9CKtMn6hCmo/2yXZFFBFK4eIv1L3Ajj1YDzPjhKexh7tj
         WsBIVIsX2FmImAuv+is7mr6vv8ez2f2fTHY5ozMdQYlFRHWNke6E2I3xEvecccP4C67C
         5fQQP4RE85w1qjn8pgZZ35h+6JdpOB/+oq/JrzjZzAdfGHNb/VO59pOGc3zFCyGCO48y
         bkGB37xsvaiALGaTGXL9jYmPD0gmFUIikUGY++efpJtXPZnv/SCgNTX1crR7ZmgFKN5+
         lnCAgSO7zflSZ6Sy04Ewzr3BfcMPwObbsGaPwxr4d8N4iUbANXyMadE0iwCxFE6E6eyA
         B/tQ==
X-Gm-Message-State: AOAM5317OYSRIVfwFHf/VGKwX1dLbd0lNJtv/tC0pPinDoYdwqFK+Ch4
	VLKXQAeMKrF4bZ2HjxuMlFeQLH7/MEUGpiKxJJA=
X-Google-Smtp-Source: ABdhPJzIEjrfdrnvbIo29u3Jp/x/B78xOdGXLsYeYenECJ3OLcOWG16y9L6hGUsnU4zyNdbCeEdlFqWk0UChLICXkn0=
X-Received: by 2002:a9d:75c9:: with SMTP id c9mr15256181otl.154.1625583260837;
 Tue, 06 Jul 2021 07:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210623130637.3314755-1-frederic.martinsons@gmail.com>
 <20210623130637.3314755-2-frederic.martinsons@gmail.com> <CA+cAkeoV-ncBLKpcGm4MKeuqYjSXyKsCU4NWdNTmO51iUAaqZg@mail.gmail.com>
 <76618960f73199585debc705dfd09775472d38f8.camel@linuxfoundation.org> <168CA58BB55AA64E.608@lists.openembedded.org>
In-Reply-To: <168CA58BB55AA64E.608@lists.openembedded.org>
From: "Frederic Martinsons" <frederic.martinsons@gmail.com>
Date: Tue, 6 Jul 2021 16:54:07 +0200
Message-ID: <CA+cAkerg6zSoav0mDD8uiQFmdvBpJRxPm__VQQAUUkg20cD8Yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: manage external sources for debug source file packaging
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d0a9e605c6759870"

--000000000000d0a9e605c6759870
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello again,

Since my patches doesn't meet the requirements and considering that you
acknowledge the issue (please correct if I mistaken), should I open a bug?

Of course I'll give as many details as I can in this report.

Thanks.

Le lun. 28 juin 2021 =C3=A0 06:46, Frederic Martinsons via lists.openembed=
ded.org
<frederic.martinsons=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> Hello Richard,
>
> First, sorry for the commit message (I gave details in the first patch o=
n
> externalsrc.bbclass but not on this one). I agree with you that it seems=
 an
> hack but I don't know to make package;bbclass find the sources correctly=
.
> The "culprit" is the following command (
> https://github.com/openembedded/openembedded-core/blob/master/meta/class=
es/package.bbclass#L591)
> and especially the last part of it:
>
> processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s'
>> 2>/dev/null)"
>
>
> this command explicitely goes into *workparentdir *and wait for the
> sources to be in it thanks to the input list that was calculated as the
> output of dwarfsrcfiles earlier call (with *localsrc_prefix *remove from
> them).
>
> Have you an idea (or even a lead that I can explore) on how make things
> correct here ?
>
> On Mon, 28 Jun 2021 at 00:00, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Wed, 2021-06-23 at 15:09 +0200, Frederic Martinsons wrote:
>> > Hello, I would like to add a link to a yocto mail where I expose my
>> problematic that led
>> > to this patch series:
>> >
>> https://lists.yoctoproject.org/g/yocto/topic/83622035?p=3D,,,20,0,0,0::=
recentpostdate%2Fsticky,,,20,2,0,83622035
>> >
>> > After further research, I think these patch can be simplified by
>> modified only
>> > WORKDIR variable to be os.path.dirname(EXTERNALSRC) but I fear of
>> consequence
>> > to have WORKDIR outside of TMPDIR so I didn't take this path.
>>
>> Changing WORKDIR would no doubt solve your immediate problem but would
>> create
>> a ton of others :(.
>>
>> The issue is that the class wants to re-declare S but some of our code
>> makes
>> assumptions about the location of WORKDIR with regard to S (and B). The=
re
>> is more inside WORKDIR than just S and EXTERNALSRC does really correspo=
nd
>> to S,
>> not WORKDIR...
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>=20
>
>

--000000000000d0a9e605c6759870
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello again,<div dir=3D"auto"><br></div><div dir=3D"auto"=
>Since my patches doesn&#39;t meet the requirements and considering that yo=
u acknowledge the issue (please correct if I mistaken), should I open a bug=
?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Of course I&#39;ll giv=
e as many details as I can in this report.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Thanks.=C2=A0</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le lun. 28 juin 2021 =C3=A0 06:46, Fr=
ederic Martinsons via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@lists=
.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=
=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hello Richar=
d,<div><br></div><div>First, sorry for the commit message (I gave details i=
n the first patch on externalsrc.bbclass but not on this one). I agree with=
 you that it seems an hack but I don&#39;t know to make package;bbclass fin=
d the sources correctly.</div><div>The &quot;culprit&quot; is the following=
 command (<a href=3D"https://github.com/openembedded/openembedded-core/blob=
/master/meta/classes/package.bbclass#L591" target=3D"_blank" rel=3D"norefer=
rer">https://github.com/openembedded/openembedded-core/blob/master/meta/cla=
sses/package.bbclass#L591</a>) and especially the last part of it:</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=
=3D"color:rgb(36,41,46);font-family:ui-monospace,SFMono-Regular,&quot;SF M=
ono&quot;,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12=
px;white-space:pre-wrap"> </span>processdebugsrc<span style=3D"color:rgb(36=
,41,46);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Consola=
s,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-space:pr=
e-wrap"> +=3D &quot;(cd &#39;%s&#39; ; cpio -pd0mlL --no-preserve-owner &#3=
9;%s%s&#39; 2&gt;/dev/null)&quot;</span></blockquote><div><br></div><div>th=
is command explicitely=C2=A0goes into <b>workparentdir=C2=A0</b>and wait fo=
r the sources to be in it thanks to the input list that was calculated as t=
he output of dwarfsrcfiles=C2=A0earlier call (with <b>localsrc_prefix </b>r=
emove from them).</div><div><br></div><div>Have you an idea (or even a lead=
 that I can explore) on how make things correct here ?</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 28 Jun =
2021 at 00:00, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfound=
ation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Wed, 2021-06-23 at 15:09 +0200, Frederic Martinsons wrote:<b=
r>
&gt; Hello, I would like to add a link to a yocto mail where I expose my p=
roblematic that led=C2=A0<br>
&gt; to this patch series:=C2=A0 <br>
&gt; <a href=3D"https://lists.yoctoproject.org/g/yocto/topic/83622035?p=3D=
,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,83622035" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/topic/8=
3622035?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,83622035</a><br>
&gt; <br>
&gt; After further research, I think these patch can be simplified by modi=
fied only=C2=A0<br>
&gt; WORKDIR variable to be os.path.dirname(EXTERNALSRC) but I fear of con=
sequence=C2=A0<br>
&gt; to have WORKDIR outside of TMPDIR so I didn&#39;t take this path.<br>
<br>
Changing WORKDIR would no doubt solve your immediate problem but would cre=
ate<br>
a ton of others :(.<br>
<br>
The issue is that the class wants to re-declare S but some of our code mak=
es<br>
assumptions about the location of WORKDIR with regard to S (and B). There<=
br>
is more inside WORKDIR than just S and EXTERNALSRC does really correspond =
to S,<br>
not WORKDIR...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000d0a9e605c6759870--
