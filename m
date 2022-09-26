Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC47CC07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 11:21:56 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.27054.1664191312393280772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 04:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bGLHy/By;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id r7so9728777wrm.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 04:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=aEV7K3gm2S/XJ2wp+ZeAHOhxJJW0GtE6t5odxVmCm8Y=;
        b=bGLHy/By4MsO/+zeoiI0r5piyKnbRIqAACY1MkjXDEJRrq2G66tn3puvdU4npmHry9
         IJvuSvoLbwsDlOPyHtNTfyGjUbh+ndS6FzwXFVw1NsAe0+uYuoy54tM44KFsc2+nZU0e
         jNJ85p1DHGOxi9Sx7p3suFNM5gpPwl7VHYZ6QMDocZkEjpAE+DTXYTYQgwihHt16bhZD
         nkKQlhVih47RMdMILdrXk53a4ceeS3K9Tsr40ZcQXEhrLNQfOmKIDPMXp2Gpy0i1Z077
         OdoR178y/l1UlFP65p2xAPeMXhHTLBk6nhU5Ppcw1xM0xs+l1NXMgKMtPZ5VAd2T2W1q
         TQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=aEV7K3gm2S/XJ2wp+ZeAHOhxJJW0GtE6t5odxVmCm8Y=;
        b=3lIbGjhHe8c1YkCGmmDEzcmzUjPiTx3kEseeDCcISiA5VzjomKIA2AnmvDgPxrLhuD
         0N9314cl5BU8Y6yIqdq/Q9JrpoiSTuNt8YQhIISLdnP6i0ul+mjsJGo4uos4tAFyOYqj
         qb3OlDvbClFwPYsYTEfdMqMk83JZjHE0SzJZ+iY16gXm7MkLxluhKZ9R7M54d5lQmqTT
         SeK/Gv/PKxc8tF6mMx/mI2W0+8Ec1GU0GQ9uexG1YtxgSF1a0BAaeA5NAqBdfqAwq14d
         2WakAqz/B8P36JG/HupAMBrtFwyA7cQ8QLS/Dl4FsIxY4r7061U+KFEK750e19/8cg/F
         FpAQ==
X-Gm-Message-State: ACrzQf2gV8cAtr2HXq+eVKlXzG4XvfzkzHywjq5xsbI1OkWRnTL6lBrw
	kQcIRngGdBTjXYuY++tKNItUdzSMj1F+lA3nVy0=
X-Google-Smtp-Source: 
 AMsMyM6yGmRirCJFxXnFPd7bnGIdnedGKQFMT1RTwAXpAdtfSUdj+P3/36D0liaEAQYtYy+4/ENMOqF4g1pjKwvVI3g=
X-Received: by 2002:a5d:678a:0:b0:22a:c9d9:443d with SMTP id
 v10-20020a5d678a000000b0022ac9d9443dmr12523471wru.129.1664191310773; Mon, 26
 Sep 2022 04:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220926090604.23397-1-andriy.danylovskyy@streamunlimited.com>
 <15447.1664183632584990375@lists.openembedded.org>
In-Reply-To: <15447.1664183632584990375@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Sep 2022 13:21:38 +0200
Message-ID: 
 <CA+chaQdhDrwCWHe3B=MQw+Zp4RTxd9AF1QLdORp_kVaAAvPj2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/patch: move QUILT_PC for patching
 consistency
To: Andriy Danylovskyy <andriy.danylovskyy@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eac16705e992bb3d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 11:21:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171061

--000000000000eac16705e992bb3d
Content-Type: text/plain; charset="UTF-8"

> I am aware of the "force-unpack + patch" scenario, discussed in
https://lists.yoctoproject.org/g/yocto/topic/89948013#56602, and this
patch, sadly, doesn't fix that.

Wasn't this scenario fixed by: c9d36882044b1c633d8611a77df54cd68c9bee25 ?

It was for me.

On Mon, Sep 26, 2022 at 11:13 AM Andriy Danylovskyy <
andriy.danylovskyy@streamunlimited.com> wrote:

> I am aware of the "force-unpack + patch" scenario, discussed in
> https://lists.yoctoproject.org/g/yocto/topic/89948013#56602,
> and this patch, sadly, doesn't fix that.
> But it does fix another face of it, which IMO is even worse than a failing
> build - a false positive, where updates to a source are ignored,
> and the package is "successfully" built from the previous version.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171055):
> https://lists.openembedded.org/g/openembedded-core/message/171055
> Mute This Topic: https://lists.openembedded.org/mt/93922956/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000eac16705e992bb3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt; I am aware of the &quot;force-unpack + patch&quo=
t; scenario, discussed in=C2=A0<a href=3D"https://lists.yoctoproject.org/g/=
yocto/topic/89948013#56602" rel=3D"noopener" target=3D"_blank">https://list=
s.yoctoproject.org/g/yocto/topic/89948013#56602</a>, and this patch, sadly,=
 doesn&#39;t fix that.</div><div><br></div><div>Wasn&#39;t this scenario fi=
xed by: c9d36882044b1c633d8611a77df54cd68c9bee25 ?</div><div><br></div><div=
>It was for me.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Sep 26, 2022 at 11:13 AM Andriy Danylovskyy &l=
t;<a href=3D"mailto:andriy.danylovskyy@streamunlimited.com">andriy.danylovs=
kyy@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div>I am aware of the &quot;force-unpack + patch&qu=
ot; scenario, discussed in <a href=3D"https://lists.yoctoproject.org/g/yoct=
o/topic/89948013#56602" rel=3D"noopener" target=3D"_blank">https://lists.yo=
ctoproject.org/g/yocto/topic/89948013#56602</a>,</div>
<div>and this patch, sadly, doesn&#39;t fix that.<br>But it does fix anothe=
r face of it, which IMO is even worse than a failing build - a false positi=
ve, where updates to a source are ignored,<br>and the package is &quot;succ=
essfully&quot; built from the previous version.</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171055): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171055" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171055</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93922956/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93922956/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000eac16705e992bb3d--

