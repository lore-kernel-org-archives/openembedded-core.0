Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F022DC43334
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 20:34:25 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.10317.1658608463964266322
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 13:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qmVX+HPs;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: petr.vorel@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 72so7114614pge.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OQuMyA92WBn3HNqWsvnWZ+UULewH/hH8K4SiMOIKxes=;
        b=qmVX+HPsbm6se6stcU5q7bgGDImxWr4N/fhQefuGYNU/OjLLK/hZ50txZXew0X0m/R
         VpfA7JdL0FtnmHCMOimTm/7Cm1LektZY0r4Ldif4wdBi+fX2SQGugvC++Y5xy6oTSbtJ
         mPCMZZm6NFztxvQxQmzoH/H0qkq3z/0wtHHCmZYc5BOzEnew0i/KcCWXrN3mOtZRh/yX
         wL9ITIzaBY6AznF9Eo8hbOWYf1Fq8JwKY5LsLPnHSBQD+TuJUa+7Bm2jztP1cFLwvb5G
         SkUYzGybPSzNPD9QFgYB/nxtmOPbHf6mwCi2WiTl7Lt0aIqwDH4XzEhSraxJ4QEz3cHj
         OPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OQuMyA92WBn3HNqWsvnWZ+UULewH/hH8K4SiMOIKxes=;
        b=FXpHQYRryTVKrvjsYRAZharOCDmIjqav4p3qxG0Qua3syDOibBxmgVWIzpwJ1Hom+n
         d/x31aR4thZe7et56wewJfKdrqwXD+WOUE+ATMnrCq4L76uJJspvfW7DI1QWgAichCHe
         T4qY7XyvN8+3GFIZ951UWB/XqWVEBSEdUf2lhM+s2h03/9dyYO8biIBmv+ewLKgBGjVP
         i0pRrcbqJjedz3aczExaIbCU8qFFO4yu/CVcm+b5+MVNakaqOPKr0KyFrpQY+yWkDZTD
         VeNz2hlZj2lNXufHl3hqjhRY4e01/2UodCXxUo+c38qk/SuDZFgIE3rvZEn8kXPevKgV
         vdDQ==
X-Gm-Message-State: AJIora9ZpJYiZyul70UpQhs9m/JWlnUYE1v5bQgxG19LBgRoszWOVCox
	yU0omz+0l0mmFeKZuT76VK94WAtWoVpjwhHJ1LA=
X-Google-Smtp-Source: 
 AGRyM1vYw44r+biNNvuaZ+oum4gzSvcmRZoWMov+VZe/cVvucHNxMVg09qGVhHNsnv6QavPVDny24bjp5l6uO79yS8I=
X-Received: by 2002:a05:6a00:114f:b0:528:2c7a:634c with SMTP id
 b15-20020a056a00114f00b005282c7a634cmr5899345pfm.41.1658608463218; Sat, 23
 Jul 2022 13:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220723132409.61635-1-pevik@seznam.cz>
 <CAMKF1soaJ_4v0WDQj+wGvnr8-QDOYHwsGXQUBdU7osHpEVwFUA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soaJ_4v0WDQj+wGvnr8-QDOYHwsGXQUBdU7osHpEVwFUA@mail.gmail.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 23 Jul 2022 22:34:11 +0200
Message-ID: 
 <CAB1t1Cx1uf4XdDwtjBYps0gpXfB=sdC7CRuh8p_bGWpfy6UDHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Add post release runtime fixes
To: Khem Raj <raj.khem@gmail.com>
Cc: Petr Vorel <pevik@seznam.cz>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000458b1405e47ee042"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 20:34:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168445

--000000000000458b1405e47ee042
Content-Type: text/plain; charset="UTF-8"

Hi Khem, all,


> >  6 files changed, 466 insertions(+)
> >  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
> >  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
> >  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
> >  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
> >  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch
> >  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch
>
> These patches don't seem to be added to SRC_URI as I don't see the
> recipe changes in this patch.
>
Thanks (forget to amend) => I've sent v2.


> we use a commit in SRCREV, I wonder if it makes sense to just bump that
>
Although I used to advocate against backporting many runtime fixes, now I
slightly prefer to use releases than random git snapshot unless number of
patches is reasonable. But sure, if others want we can use latest master
(usually the best LTP).

Kind regards,
Petr

--000000000000458b1405e47ee042
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>Hi Khem, all,</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 6 files changed, 466 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-memcg-func=
tional-Fix-usage-of-PAGESIZE-from-memcg_li.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-mountns0-1=
-3-wait-for-umount-completed-in-thread_b.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-net_stress=
-Fix-usage-of-variables-from-tst_net.sh.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-netstress-=
Restore-runtime-to-5m.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-nfs05_make=
_tree-Restore-5-min-timeout.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-m=
igrate_pages03-restore-runtime-to-5m.patch<br>
<br>
These patches don&#39;t seem to be added to SRC_URI as I don&#39;t see the<=
br>
recipe changes in this patch.<br></blockquote><div>Thanks (forget to amend)=
 =3D&gt; I&#39;ve sent v2.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
we use a commit in SRCREV, I wonder if it makes sense to just bump that<br>=
</blockquote><div>Although I used to advocate against backporting many runt=
ime fixes, now I slightly prefer to use releases than random git snapshot u=
nless number of patches is reasonable. But sure, if others want we can use =
latest master (usually the best LTP).</div><div><br></div><div>Kind regards=
,</div><div>Petr</div></div></div>

--000000000000458b1405e47ee042--

