Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A98BC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 17:21:58 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web11.94789.1638379317513583747
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 09:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aUIFD5QL;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id w23so50545971uao.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 09:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PcnQZfeoEiU2xfnW6MbIK90xZzAqndxrEVoYpLPDcj4=;
        b=aUIFD5QLT+8xtyU5Y9UCKuOJ82EmgMPSj4M2YxsWtBRNEcaMArNktu5MxJuZ5GJ855
         n0IIA9sX+rQA5lWmW0ldYufJpND+u7OBKg6Tv7CDYGsvdkQPOk6t7sIXq7thL3MSFG/l
         +GcZ9SST1DXQ0IC96cZhjZsHl3qBaDQ6fvKAMAfoj9BXIB6xoj4fIznxlVNr3KOhL5SY
         A5M22CUVe7/iS6gz6bdlz9NycHp66mYGzF8H1TXyvp+vSac9E7YcP6lPhDJODIWFooIR
         nmg9TV4BeXOGXJXbdrmvmGuEEYXQ6drMuHUk2aI6148RO9ijQDsk8TQCk7I8AhFbe8EP
         IO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PcnQZfeoEiU2xfnW6MbIK90xZzAqndxrEVoYpLPDcj4=;
        b=VSsAuwFQNxxyxXZIa734BYKk/sKo+TpmgHMroMS8ctsNZJf9bnJSVd575PaNLznL76
         rOS4t+wphprdvxnrysTOwtXBYPqoqs1BQ2LQra7XINQxnGRXGHMAC0jza3m4Xto5DthP
         93sJqpwn301cbCIqNxGA/1sOYC9n+FMmrA+wBypncMZNwjHmbgvwxJ1FVEiYRfr1WHRs
         MvlZCjFgLJH4aV+L1P35IbdSrDT+hyx7m2LTsVJw00SPT6zEZO1yyQPIIXidaPX78BwX
         7u30vSXgwEnd+PO1BYgx+tuhzzPGTwtv9kz83w/NIABBJjkGSjOeX1itoHbC47zIUGiI
         XBcw==
X-Gm-Message-State: AOAM533Vs0HWZR4lfVyXr2YbsHIEAtrVxq5MzoFoO+VOu5gDKeRust7L
	9LekMgJe4wp/f3gfVSfuawngsGU18QRsYwVLheI=
X-Google-Smtp-Source: 
 ABdhPJzAbApktAeWOF1PtvnQKuXYZkDMA7zg9MaDKWGeTp++KY30507ifbac1IOMclALuMfFvfPMyvDLlExoGneUPJg=
X-Received: by 2002:a67:7105:: with SMTP id m5mr8940807vsc.81.1638379316482;
 Wed, 01 Dec 2021 09:21:56 -0800 (PST)
MIME-Version: 1.0
References: <YaemRcD22hUhkQrq@mcrowe.com>
In-Reply-To: <YaemRcD22hUhkQrq@mcrowe.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Dec 2021 18:21:44 +0100
Message-ID: 
 <CANNYZj-7YLRwgbCDusZv98B0RSkzVbKPZWJm6r=akEXysLGT0g@mail.gmail.com>
Subject: Re: [OE-core] Correct way to set DRIDRIVERS and GALLIUMDRIVERS from
 mesa bbappend
To: Mike Crowe <mac@mcrowe.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002a96a605d218e9f0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 17:21:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159053

--0000000000002a96a605d218e9f0
Content-Type: text/plain; charset="UTF-8"

I think you do need to modify oe-core unfortunately, like is done for other
drivers:

PACKAGECONFIG[etnaviv] = ""
GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',
',etnaviv', '', d)}"

Alex

On Wed, 1 Dec 2021 at 17:44, Mike Crowe via lists.openembedded.org <mac=
mcrowe.com@lists.openembedded.org> wrote:

> I'm building for a specific chip and therefore don't wish to waste time and
> electricity building and disk space on the target installing unwanted mesa
> drivers. However, mesa.inc contains:
>
>  GALLIUMDRIVERS = "swrast"
>  GALLIUMDRIVERS:x86-x32 = ""
>  GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
>  GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
>
> and mesa_21.3.0.bb contains:
>
>  DRIDRIVERS ??= ""
>  DRIDRIVERS:append:x86:class-target = ",r100,r200,nouveau,i965"
>  DRIDRIVERS:append:x86-64:class-target = ",r100,r200,nouveau,i965"
>
> I'm unable to find a way to override these values. Using (for example):
>
>  DRIDRIVERS:forcevariable = ""
>  GALLIUMDRIVERS:forcevariable = "swrast"
>
> doesn't work because the append still happens after the forcevariable
> override takes effect. :(
>
> Is there a way that I can override GALLIUMDRIVERS and DRIDRIVERS with my
> own values for x86 and x86-64 without modifying oe-core itself?
>
> If not, should the oe-core recipe being using something like:
>
>  GALLIUMDRIVERS_DEFAULT = "swrast"
>  GALLIUMDRIVERS_DEFAULT:x86-x32 = ""
>  GALLIUMDRIVERS_DEFAULT:append:x86:class-target = ",i915,iris,crocus"
>  GALLIUMDRIVERS_DEFAULT:append:x86-64:class-target = ",i915,iris,crocus"
>  GALLIUMDRIVERS ?= "${GALLIUMDRIVERS_DEFAULT}"
>
> and similar for DRIDRIVERS to support this?
>
> Thanks.
>
> Mike.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159048):
> https://lists.openembedded.org/g/openembedded-core/message/159048
> Mute This Topic: https://lists.openembedded.org/mt/87432435/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002a96a605d218e9f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think you do need to modify oe-core unfortunately, =
like is done for other drivers:</div><div><br></div><div>PACKAGECONFIG[etna=
viv] =3D &quot;&quot;<br></div><div>GALLIUMDRIVERS:append =3D&quot;${@bb.ut=
ils.contains(&#39;PACKAGECONFIG&#39;, &#39;etnaviv&#39;, &#39;,etnaviv&#39;=
, &#39;&#39;, d)}&quot;</div><div><br></div><div>Alex<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1 De=
c 2021 at 17:44, Mike Crowe via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;mac=3D<a href=3D"mailto:mcrowe.com@lists.open=
embedded.org">mcrowe.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m building for a speci=
fic chip and therefore don&#39;t wish to waste time and<br>
electricity building and disk space on the target installing unwanted mesa<=
br>
drivers. However, mesa.inc contains:<br>
<br>
=C2=A0GALLIUMDRIVERS =3D &quot;swrast&quot;<br>
=C2=A0GALLIUMDRIVERS:x86-x32 =3D &quot;&quot;<br>
=C2=A0GALLIUMDRIVERS:append:x86:class-target =3D &quot;,i915,iris,crocus&qu=
ot;<br>
=C2=A0GALLIUMDRIVERS:append:x86-64:class-target =3D &quot;,i915,iris,crocus=
&quot;<br>
<br>
and <a href=3D"http://mesa_21.3.0.bb" rel=3D"noreferrer" target=3D"_blank">=
mesa_21.3.0.bb</a> contains:<br>
<br>
=C2=A0DRIDRIVERS ??=3D &quot;&quot;<br>
=C2=A0DRIDRIVERS:append:x86:class-target =3D &quot;,r100,r200,nouveau,i965&=
quot;<br>
=C2=A0DRIDRIVERS:append:x86-64:class-target =3D &quot;,r100,r200,nouveau,i9=
65&quot;<br>
<br>
I&#39;m unable to find a way to override these values. Using (for example):=
<br>
<br>
=C2=A0DRIDRIVERS:forcevariable =3D &quot;&quot;<br>
=C2=A0GALLIUMDRIVERS:forcevariable =3D &quot;swrast&quot;<br>
<br>
doesn&#39;t work because the append still happens after the forcevariable<b=
r>
override takes effect. :(<br>
<br>
Is there a way that I can override GALLIUMDRIVERS and DRIDRIVERS with my<br=
>
own values for x86 and x86-64 without modifying oe-core itself?<br>
<br>
If not, should the oe-core recipe being using something like:<br>
<br>
=C2=A0GALLIUMDRIVERS_DEFAULT =3D &quot;swrast&quot;<br>
=C2=A0GALLIUMDRIVERS_DEFAULT:x86-x32 =3D &quot;&quot;<br>
=C2=A0GALLIUMDRIVERS_DEFAULT:append:x86:class-target =3D &quot;,i915,iris,c=
rocus&quot;<br>
=C2=A0GALLIUMDRIVERS_DEFAULT:append:x86-64:class-target =3D &quot;,i915,iri=
s,crocus&quot;<br>
=C2=A0GALLIUMDRIVERS ?=3D &quot;${GALLIUMDRIVERS_DEFAULT}&quot;<br>
<br>
and similar for DRIDRIVERS to support this?<br>
<br>
Thanks.<br>
<br>
Mike.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159048): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159048" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159048</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87432435/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87432435/1686489</a><br>
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

--0000000000002a96a605d218e9f0--

