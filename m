Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0CCC61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Mar 2023 12:49:04 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.5618.1679143741691289818
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Mar 2023 05:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OFpUMgfd;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: ernstp@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id bh20so5716935oib.9
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 05:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679143741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lbDal2T6z/FJmlCyIcpRtYkq8vOahmYegutN1q71WDk=;
        b=OFpUMgfdWCN1UM9D+n/9huV6O0zEibxoyPUSxOyO7ipZkC0QSkyH/f2EfRPvLVDPKG
         l3qytAWMaJgzLdLJ38c1K6A8+fItDH5S++14dlPxCCa/hgzHh9xfs2P+WiJmRuZjlkSz
         /eezrAyS0WC0UFzy6gA75YilYxKmoHGiQAUq6FyNq+fYXsq7UOdK3K4BLYkxemcijsdR
         Uq+YSpfMSv/VAiDSqQ0B2VnfUwfSG0r8IDF61pB1HoQQF7eindpFaAm1AmbX++6NqbXA
         KdBLOFyel0cU5wJDMpzRtfVL21Yv0MnKplP8ZWPjRqisZTu6KJstywB17s9su6MSeP+/
         gSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679143741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbDal2T6z/FJmlCyIcpRtYkq8vOahmYegutN1q71WDk=;
        b=SS9kbmEfR9Jfy1Ia9yNkS7T/6Nk2BefjLhw55+5RSENlv6MZ22mkdH79BNMnatk3C0
         d5pgbZuwbGT7PrgQpFtyEaSUobqDoVoiGi9c4/YcHk0EyiLJmehkyhALGXIALTbcA0yk
         FuXfLctQJzfi1aVobrOPzeE8ivFyoEC4Xfp+SXD660NGHujv/YzfRfn9eWGxNuR+SUJV
         Iw5/u3meXMfmlDj79Wmpttw2BwSBf8jyQrVDBoMkD4gBCN96Sozs86LxFs6vjedE/AfO
         oEJ+eu7XZlih5U0wtkJ8XDgIDnhTNWuuqMfWo7yTQl9DSy5dSGTqDOHkJLYI7X7YbL/9
         gnfA==
X-Gm-Message-State: AO0yUKXwSRaUPxS7Abot2Srl0DR5ACFpWF/N06qG0RKhUNB+bHIy1b8/
	U5Yutsh2vjNMyGYYDPq51FQQpidtQYvfbzLt1xo=
X-Google-Smtp-Source: AK7set+nbfQv/LbUtRVbXuNxHujtMySumggsS+kEhRUXNrH3gy6zISRUexkh69mNQzQb/+26H1d1yY/bHbf/2aOwbUA=
X-Received: by 2002:aca:2309:0:b0:384:2fd0:e1c8 with SMTP id
 e9-20020aca2309000000b003842fd0e1c8mr3793741oie.11.1679143740880; Sat, 18 Mar
 2023 05:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=4a=Xi3cEf9KM-iB3nsLPEEJGupxVJZrMQ7qP9c7aSb3bJQQ@mail.gmail.com>
 <DDD6EA4D-08CA-473B-B291-ECBB71686B92@arm.com> <1749EE1744C6F5F2.17255@lists.openembedded.org>
In-Reply-To: <1749EE1744C6F5F2.17255@lists.openembedded.org>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Sat, 18 Mar 2023 13:48:49 +0100
Message-ID: <CAD=4a=WMwU3aut0CGF=j6U0VizfrDYsE2+zURfHDEAEvDPFfcQ@mail.gmail.com>
Subject: Re: [OE-core] PEP 517 and PEP 621 support on Dunfell?
To: ernstp@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000033bd1705f72c1eb3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Mar 2023 12:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178788

--00000000000033bd1705f72c1eb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, I wasn't aware of https://git.yoctoproject.org/meta-lts-mixins/ .
Not sure how that would work exactly with commit access etc.

Anyway I made further updates to
https://github.com/ernstp/meta-setuptools-backport , looking pretty good
now IMHO.

//Ernst

Den m=C3=A5n 6 mars 2023 kl 21:22 skrev Ernst Sj=C3=B6strand via
lists.openembedded.org <ernstp=3Dgmail.com@lists.openembedded.org>:

> Oh I didn't see your reply, Gmail threw it in the spam folder.
>
> I made a prototype here if anyone's interested:
> https://github.com/ernstp/meta-setuptools-backport
>
> //E
>
> Den tis 28 feb. 2023 kl 17:14 skrev Ross Burton <Ross.Burton@arm.com>:
>
>> On 28 Feb 2023, at 15:00, Ernst Sj=C3=B6strand via lists.openembedded.or=
g
>> <ernstp=3Dgmail.com@lists.openembedded.org> wrote:
>> > more and more Python projects are removing their setup.py and setup.cf=
g
>> and switching to pyproject.toml. That unfortunately means you can't inst=
all
>> those packages on Yocto Dunfell.
>> >
>> > Would it be reasonable to backport support for this to Dunfell? I see
>> that the changes done for this support was actually kindof big, and as
>> usual updating setuptools will probably cause some old package version t=
o
>> fail to install instead.
>>
>> The changes were kind of big, and I do worry that they=E2=80=99d break s=
tuff that
>> is expected to work.
>>
>> A =E2=80=9Cmixin=E2=80=9D layer which just contains the new classes and =
recipes would be
>> a much better approach for Dunfell.
>>
>> Ross
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178084):
> https://lists.openembedded.org/g/openembedded-core/message/178084
> Mute This Topic: https://lists.openembedded.org/mt/97291680/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000033bd1705f72c1eb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Ah, I wasn&#39;t aware of <a href=3D"https://git.yoctop=
roject.org/meta-lts-mixins/" rel=3D"noreferrer" target=3D"_blank">https://g=
it.yoctoproject.org/meta-lts-<span class=3D"gmail-il">mixins</span>/</a> .<=
/div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans=
-serif">Not sure how that would work exactly with commit access etc.</div><=
div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif=
"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,helveti=
ca,sans-serif">Anyway I made further updates to <a href=3D"https://github.c=
om/ernstp/meta-setuptools-backport">https://github.com/ernstp/meta-setuptoo=
ls-backport</a> , looking pretty good now IMHO.</div><div class=3D"gmail_de=
fault" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">//Erns=
t<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">Den m=C3=A5n 6 mars 2023 kl 21:22 skrev Ernst Sj=C3=B6strand via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;e=
rnstp=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists=
.openembedded.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,helvetica,sans-serif">Oh I didn&#39;t see your reply, Gmail threw =
it in the spam folder.</div><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif">I made a prototype here if anyo=
ne&#39;s interested: <a href=3D"https://github.com/ernstp/meta-setuptools-b=
ackport" target=3D"_blank">https://github.com/ernstp/meta-setuptools-backpo=
rt</a></div><div class=3D"gmail_default" style=3D"font-family:arial,helveti=
ca,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:=
arial,helvetica,sans-serif">//E<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Den tis 28 feb. 2023 kl 17:14 skre=
v Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=3D"_blank">=
Ross.Burton@arm.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 28 Feb 2023, at 15:00, Ernst Sj=C3=B6strand via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> &lt;ernstp=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:=
<br>
&gt; more and more Python projects are removing their setup.py and setup.cf=
g and switching to pyproject.toml. That unfortunately means you can&#39;t i=
nstall those packages on Yocto Dunfell.<br>
&gt; <br>
&gt; Would it be reasonable to backport support for this to Dunfell? I see =
that the changes done for this support was actually kindof big, and as usua=
l updating setuptools will probably cause some old package version to fail =
to install instead.<br>
<br>
The changes were kind of big, and I do worry that they=E2=80=99d break stuf=
f that is expected to work.<br>
<br>
A =E2=80=9Cmixin=E2=80=9D layer which just contains the new classes and rec=
ipes would be a much better approach for Dunfell.<br>
<br>
Ross</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178084): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178084" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178084</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97291680/4947=
266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97291680/4947266</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000033bd1705f72c1eb3--

