Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABCDC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 17:49:30 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web09.281.1665596969854455153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 10:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aCKaMHRg;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id m81so19894316oia.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 10:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HRguZ8XrCOVseavbThDce09TaB9cXALSuYqwnCNaVqQ=;
        b=aCKaMHRgkvApqeaZmr7kAkTsDCXYSavUJ/JSt3KDJ1gVvhsQkFOeHXH7+ixyN7ZfBa
         3rlOQHpRcX4VCEJkGFUWWaXA2EMbJCF6r9uo64Npssexuc5AEsfJOAzZlapgNSks1V7v
         8r6QQtF7fnCN299jMEehX3tBWfquwgW3cDWUbRL86KX5WfsVfMjXJxmTM/HLkAGJjyKZ
         kiOU+aR+CmVjZ8xcUU+Bj1HDOt01ryfaiC1k6B5kZCAajmWHYsbRJd6dZmjdLEruN5fI
         aggwDUP7Q/+cFkFpDOTjINDngP9QbJAjQqWyZj0//bXIadAwYQIWtXMIfmag7x7yLcHs
         oBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRguZ8XrCOVseavbThDce09TaB9cXALSuYqwnCNaVqQ=;
        b=7llZfwgd+K2+nQ2YqQKqxaK5AsFYzIbe2SFy+5P1owbc0G0xE8Iwy756z9oZSrWDv0
         NbJgqFvJiidR9K8w+v1kJjXhdLnkK2r+k0kVV4WHY3AFlbPPgcMdhhBdA+Bkr2JN0qJP
         6YGzE+u69l2gRHBQDzP4D2f/Gre+FIoaiRmBktlHn3N1ilkfMabVifv+nfXg6o2GiuOu
         6O7Nk57Dzci1CJhsCygBJ8eiUmKmpnRqTdsxOt93M+s2W49s3hcFHrb6QCuHLkFEwraV
         SPoBO9cEIXjHrxTd1AnBCvhZi9GmShqvrwUut7imLEpjfmIHyMcUtOeDv2Qf1n6c6Ou9
         12RQ==
X-Gm-Message-State: ACrzQf3FXtCOpIeX9dN1/w7khZT+X47f3K5Um4uYvTDUokAUJicX9gC7
	QDZ2xILktGJDtpjZu8LY2WRLCl6j7F2RM5t1/O8=
X-Google-Smtp-Source: AMsMyM43+i6fvt1sfHGk2QVMzuHNY3u1hL+HD9D9jfBfhlC3ev90XIdrny/Fb5uH9/sXLcQfSDa/e3cAoEKr1fKPN84=
X-Received: by 2002:a05:6808:1910:b0:354:c2b:67e4 with SMTP id
 bf16-20020a056808191000b003540c2b67e4mr2732043oib.55.1665596969013; Wed, 12
 Oct 2022 10:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221012071813.778-1-alex.kiernan@gmail.com> <7C7AB85E-C822-4DCC-B462-AD314119EAE4@arm.com>
In-Reply-To: <7C7AB85E-C822-4DCC-B462-AD314119EAE4@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2022 10:49:18 -0700
Message-ID: <CAMKF1sp5LyBJ4y1p1o65fLayefN2SKWHi6fDwLfaWvoS-gYH3g@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2 1/3] kernel: classes: Extract savedefconfig to
 a class
To: Ross Burton <ross.burton@arm.com>
Cc: "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ad54ea05eada0327"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 17:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171673

--000000000000ad54ea05eada0327
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 9:36 AM Ross Burton <ross.burton@arm.com> wrote:

> On 12 Oct 2022, at 08:18, Alex Kiernan via lists.openembedded.org
> <alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Move savedefconfig task to a class so we can reuse it in other recipes
> > which support it.
>
> There are three users of cml1 in oe-core: kernel, uboot, and busybox.
> Does busybox support savedefconfig?
>
> I=E2=80=99m thinking to avoid tiny classes we can just add this to cml1.b=
bclass
> and make it print a decent error message if it doesn=E2=80=99t work.
>

I agree I think it should be there for all kconfig users and they can strub
it in recipe if needed

>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171669):
> https://lists.openembedded.org/g/openembedded-core/message/171669
> Mute This Topic: https://lists.openembedded.org/mt/94276340/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ad54ea05eada0327
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 12, 2022 at 9:36 AM Ross Burton &lt;<a href=3D"=
mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 12 Oct 2022, at 08:18, Alex Kiernan via <a h=
ref=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">=
lists.openembedded.org</a> &lt;alex.kiernan=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</=
a>&gt; wrote:<br>
&gt; <br>
&gt; Move savedefconfig task to a class so we can reuse it in other recipes=
<br>
&gt; which support it.<br>
<br>
There are three users of cml1 in oe-core: kernel, uboot, and busybox.=C2=A0=
 Does busybox support savedefconfig?<br>
<br>
I=E2=80=99m thinking to avoid tiny classes we can just add this to cml1.bbc=
lass and make it print a decent error message if it doesn=E2=80=99t work.<b=
r>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I agree I think =
it should be there for all kconfig users and they can strub it in recipe if=
 needed=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171669): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171669" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171669</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94276340/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94276340/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ad54ea05eada0327--

