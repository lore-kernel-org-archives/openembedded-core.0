Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E19D149DB
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:19:42 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.2324.1729880378738120758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=htwE7dNx;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7eb0448693eso173825a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729880378; x=1730485178; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G0b7/OAOVh4Vfbl4sIfi1uDbR5s7nnbuurBY2Q9l/sY=;
        b=htwE7dNxlau7p2P68cdpBpxms8h4oJBBt6D8LORnJsSWOwIO4nQGToZ6ECeG+jus3H
         66mjHUZ2SoNd7YatgVd2UgX5Mr90AlRkOs5rcpYseo0TuwMumBxHNEBl2aTZyOx8pHGu
         3s8tHVfhf4nQB+OE0qSsEf8eaMIXv8vgmV4n180fUMt4me7etQxZFQsaW8yd+gBr70Qa
         w+PVtODhlFlv6TU7lZf293LWZhzk5FnNX6IOOl56T27ZQQsXDTirNh7xgpUMhpUxHbXr
         grkQshOZQtIFIw1HU27kiFC41Le7xNeGSOeJ/m81SkOIkx7SXyS0tr+W292v3/XYwxew
         20IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880378; x=1730485178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0b7/OAOVh4Vfbl4sIfi1uDbR5s7nnbuurBY2Q9l/sY=;
        b=eP1lGCLEH6Dr0Dw8G7YD0MU3Xa6CsaHMEZD1Jk4LQ6WvgoeYAOqyTOI3b6uK7SgXNe
         jomG5uhg/dVnXX7p6w+txy4Q5tbzIC814SCwi6hpllWLn3zRfn1VNhu27d8Dthd6Q2zO
         hKRg8fX8sREjy674H18IckQspK/kPyStpZfgv0G8PhqFU94BQjVzbWYwckBsV4v/tTuM
         zGh+SK+e6wihyRKo2CMoFAFWu709XuWXmhjLR+SZcqUVVUGbV7TRuYytLWByFAGRTYOX
         iVegrgGSkY4YGPuXTGvHCz40QHqCyhdr9mFc30216+nEGKSJnp8t8zxt3/iw11GYVUT2
         7Oag==
X-Gm-Message-State: AOJu0YyTfEKyYgQsxcy2cxeSDxHF2Y29UU/CGN0YDao9ag0XxLlBHtKg
	v53v/o2iiPxgScpYNuWy9b6t+iAOkIac3X54vev+eIAADscNLBgRTg12n8jj1lgAwX1UXT3MqoL
	3PqHFYQuq8nRMIpuGZGNRUBvHwSE=
X-Google-Smtp-Source: AGHT+IFNFwEawZbF0cDfLuOW3+JP3x9Za1Q8mLOv+UgWKYFG3fK3h6VJx7KdzjwH7OLz/GHXo2Z13NrAcSdVl1jJg/M=
X-Received: by 2002:a05:6a21:6d9f:b0:1cf:2be2:8dd1 with SMTP id
 adf61e73a8af0-1d9a851e0c3mr78571637.10.1729880377907; Fri, 25 Oct 2024
 11:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241025161627.3352-1-sreejith.ravi087@gmail.com> <CANNYZj8+5LwPXrQ4eda4muAdOmpfvkg5oo0GXzCG+HJJh65vDQ@mail.gmail.com>
In-Reply-To: <CANNYZj8+5LwPXrQ4eda4muAdOmpfvkg5oo0GXzCG+HJJh65vDQ@mail.gmail.com>
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
Date: Fri, 25 Oct 2024 19:19:26 +0100
Message-ID: <CAFt4JuEdi+zFkN37vvvK-PNtqshncC_8dn44gU+FcKXpde-ynA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_manager : Add configuration option to
 select filterbydependencies
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006de28f0625512974"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206359

--0000000000006de28f0625512974
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 5:26=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Fri, 25 Oct 2024 at 18:17, Sreejith Ravi via lists.openembedded.org
> <sreejith.ravi087=3Dgmail.com@lists.openembedded.org> wrote:
> > Currently, filterbydependencies is always set with True, which results =
in
> > the creation of `oe-rootfs-repo`. If filterbydependencies is not set,
> > it creates `oe-rootfs-repo` as a symlink to the
> "DEPLOY_DIR_<IPK/RPM/DEB>"
> > directory. With this patch, users can configure this behavior according
> > to their use cases using the variable `DISABLE_FILTER_BY_DEPENDENCY`.
>
> You do need to explain why. We've had this before image-specific
> rootfs repositories were implemented, and it was causing issues when
> building images from deploy directories that have unrelated packages
> and/or other bitbake tasks writing into them.
>
> Alex
>

We aim to use released IPK files from a previous release build instead of
building from source. During package processing, we skip all build tasks
for the package and copy it to the deploy directory, adjusting the feeds
accordingly. With a customized opkg configuration, we can set the feeds
either from a remote server or the deploy directory. Since we are using the
released IPK files, there is no need to filter by dependencies, as this has
already been handled during the release of the IPK.

This patch provides an additional option to use the deploy directory as an
IPK repository. By default, this option is disabled but can be enabled if
needed.

Can you please share the details of the issues encountered when building
images from deploy directories?

Cheers
Sreejith

--0000000000006de28f0625512974
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 25, 2024 at 5:26=E2=80=AF=
PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kan=
avin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Fri, 25 Oct 2024 at 18:17, Sreejith Ravi via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a><br>
&lt;sreejith.ravi087=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; Currently, filterbydependencies is always set with True, which results=
 in<br>
&gt; the creation of `oe-rootfs-repo`. If filterbydependencies is not set,<=
br>
&gt; it creates `oe-rootfs-repo` as a symlink to the &quot;DEPLOY_DIR_&lt;I=
PK/RPM/DEB&gt;&quot;<br>
&gt; directory. With this patch, users can configure this behavior accordin=
g<br>
&gt; to their use cases using the variable `DISABLE_FILTER_BY_DEPENDENCY`.<=
br>
<br>
You do need to explain why. We&#39;ve had this before image-specific<br>
rootfs repositories were implemented, and it was causing issues when<br>
building images from deploy directories that have unrelated packages<br>
and/or other bitbake tasks writing into them.<br>
<br>
Alex<br></blockquote><div>=C2=A0</div>We aim to use released IPK files from=
 a previous release build instead of building from source. During package p=
rocessing, we skip all build tasks for the package and copy it to the deplo=
y directory, adjusting the feeds accordingly. With a customized opkg config=
uration, we can set the feeds either from a remote server or the deploy dir=
ectory. Since we are using the released IPK files, there is no need to filt=
er by dependencies, as this has already been handled during the release of =
the IPK.</div><div class=3D"gmail_quote"><br>This patch provides an additio=
nal option to use the deploy directory as an IPK repository. By default, th=
is option is disabled but can be enabled if needed.=C2=A0</div><div class=
=3D"gmail_quote"><br>Can you please share the details of the issues encount=
ered when building images from deploy directories?<br><div>=C2=A0</div><div=
>Cheers</div><div>Sreejith</div></div></div>

--0000000000006de28f0625512974--

