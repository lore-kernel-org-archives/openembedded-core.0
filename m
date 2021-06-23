Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web10.4815.1624437282100264170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 01:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U0seF+se;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id k189so336887vkb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 01:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ykxei2ZDxJA8mhJ1Zw7qIwz9jkjiZZRDcDOm0ctBzC8=;
        b=U0seF+seMriGXIUFv/tsIC9RBE+zu2ERHAWzqOw+8WAabvD5Gm6hieCbf0R1mq2FUH
         ZwuZsghtAIN0kObmdoQYHPunBBVMuOXzp4fKit+jz9xw+DV9uk5/0ier0Aw031j508i3
         VmXZto0jwH9GKOFbpubAReMMJaLPlxDTv1bF2nQbSP020eOonTcwI93Ddt7Pq5Y+TyDJ
         nFOhupTvMJTkmeZUikxpLTr9YtwkplzAxQqs8+OobV3Dn0HeMDuM7ntDoWYLf1zXy8Nc
         Yuem+Xj+drWZWebBDf8e9NT8N1mgiLyUDDq700Y6sEhT8Yq6CkiRvm9hZTzx5ZE8cAEh
         jKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ykxei2ZDxJA8mhJ1Zw7qIwz9jkjiZZRDcDOm0ctBzC8=;
        b=eoqcU/+4MN2NQo8s2u0dOPRn4GOyWZbquzHxiR4Y79KjShstkzLL6R/+MrcvMM98J8
         rVFKmQ7tvuApQDe4me7/DTfTZC+pNW/j+A6B4LDs0nuynvb+PImxPYcUshrEdjgGY7hE
         zKlA5PF5X/mPGTZ+s0hcMG7yfQzZGo/VBtTXz+em0do1O5MQEidSLRbDCcdCxfgTnIjC
         qehem52LtEz7PqfUX6eVP6uOTtf65SV+CTd6bwazFqBmWqh+FvWJjJmtM6913fsbb0T2
         tU00rXCML9OsThXnW84q1V7a3gwh9ipr6ThcpwKckvka0qKewVYidO+etneSi4jYb7S0
         JwCw==
X-Gm-Message-State: AOAM533Y3wl39ry1Z8Cp17IDDuWw+pft8HKRPcJPB3SMs3zckKSXRg6Z
	/fTQNL0L5qfl4WZc1fLqRlGw7RjZ4lEhGsJLHyQ=
X-Google-Smtp-Source: ABdhPJzS5FQ7BolCK/Xk0AeaHOPy/7MipZUcLA6dVeuvdgio4z/VrDfm4Qu3Whzvtuah19eAltLzVqlSGSfyykwyPDs=
X-Received: by 2002:a1f:960a:: with SMTP id y10mr14206853vkd.8.1624437281223;
 Wed, 23 Jun 2021 01:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210622192723.2041345-1-alex.kanavin@gmail.com> <3324.1624431667479717516@lists.openembedded.org>
In-Reply-To: <3324.1624431667479717516@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 23 Jun 2021 10:34:29 +0200
Message-ID: <CANNYZj_wbfFtDL+8HSAJzqvrmx+y0ofbmmrve91qBd8PfO9WFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pypi: set SRC_URI with =, not with +=
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001b772105c56ac7f6"

--0000000000001b772105c56ac7f6
Content-Type: text/plain; charset="UTF-8"

Right, I sent an updated patch.

Alex

On Wed, 23 Jun 2021 at 09:01, Konrad Weihmann <kweihmann@outlook.com> wrote:

> That doesn't look completely right to me.
>
> You're absolutely right about devtool expecting the tarball in as the 1st
> item, but this patch here breaks existing recipes like
>
> SRC_URI += "file://some.patch"
>
> inherit pypi
>
> as the patch will now be dropped.
>
>
>
> I would suggest to go for SRC_URI_prepend = "${PYPI_SRC_URI} " which fixes
> the issue *and* doesn't break exisiting setups
>
> 
>
>

--0000000000001b772105c56ac7f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, I sent an updated patch.</div><div><br></div><=
div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, 23 Jun 2021 at 09:01, Konrad Weihmann &lt;<a href=
=
=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><p>That doesn&#39;t=
 look completely right to me.<br><br>You&#39;re absolutely right about devt=
ool expecting the tarball in as the 1st item, but this patch here breaks ex=
isting recipes like<br><br>SRC_URI +=3D &quot;file://some.patch&quot;<br><b=
r>inherit pypi<br><br>as the patch will now be dropped.</p>
<p>=C2=A0</p>
<p>I would suggest to go for SRC_URI_prepend =3D &quot;${PYPI_SRC_URI} &qu=
ot; which fixes the issue *and* doesn&#39;t break exisiting setups</p>
<br>
<br>
<br>
</blockquote></div>

--0000000000001b772105c56ac7f6--
