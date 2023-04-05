Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337F0C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 18:43:30 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.139079.1680720207279753054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 11:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QdjnaaYK;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id h11so40935703lfu.8
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 11:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680720205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rJj1hdRL8xm0rJblLujtXzr6LrcvvGVrVOLQvLPLgvs=;
        b=QdjnaaYKB0rr/bYqntYnnKzK91Vyo78Ha193LVM9AD6732lfzieV5YTyWDUccpi96C
         fKzJ4HLTx9V83BoRd4omhMb0LuD+5XFXxcOl2ENUpYWN1ZwBKikCm2jLhbadSFnrRCFE
         Xou8+gdZzNowzdJpkLRpaa2YASRQJG3NVuTnz/6yy9rsAv51WsSu2bZqnvuWfrozpDtj
         xYL10C8/gBLN+m9LfWHaamE4pFkrGGLFWpNu9zwKmdWqgYwnHCc6HKM/wQqpS67Ibzmz
         yWlM2fNEryCqHRKqfk+nEdDe/4varrfWgaBSYSvnYsmBtMkO/754PLEIWt72/3W4MZBb
         IoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680720205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJj1hdRL8xm0rJblLujtXzr6LrcvvGVrVOLQvLPLgvs=;
        b=gDaYel7v5zHNlUSQfIDw35rtMXuloRI0ZOQWJZ35wL5UKz9qEz/7GkbESK79iVA0w3
         mtZ305Rhxiy+sxd/XTY/Xk8EwrjIrTmmpfJzW2596PSE8f7lixVYCDJ+6LxkcX4bfvUc
         CsvV5j9i4TJ5BPaSEUrX3G9xOU0iladltZ58BuixthFdZ8Z0KsyfSo2jo0BqyJAAPCQw
         1IpZ6DE4F2Y+Y7bM3pAS8XDmM7OwHj+igr2oxodSd2Zw7pfFc/z/kE4qoyYGzx9YKyc+
         SLXtKkjKODOAOoAOx8dsB3v1pOi80TacYN7sZODW3oCfCcQ8To0EhjRAuy6+WgjylzeH
         Nbgw==
X-Gm-Message-State: AAQBX9fbbWQGumambMIdFZdB917o6trftHJPGrCUoKuX6y/1FbcmgM4I
	jtNsbNffIJd9bii8V5VKkOmxED5K5fQftdQVX8o=
X-Google-Smtp-Source: AKy350aUdny56io7Crmq+ZTyrbxLS+zhi4gaJNd1zWJ3u9cZIObVIzFchLJBfTdR8NGZ3a0yy366uZveK88kaqzPcVA=
X-Received: by 2002:ac2:4911:0:b0:4eb:f3d:94b3 with SMTP id
 n17-20020ac24911000000b004eb0f3d94b3mr2249462lfi.6.1680720205090; Wed, 05 Apr
 2023 11:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230329100257.1612928-1-rybczynska@gmail.com> <CAOSpxdYdF8K7bWcc_DCjEt26-ExdYHMSZt1RJgyRoqj0Zm4TTg@mail.gmail.com>
In-Reply-To: <CAOSpxdYdF8K7bWcc_DCjEt26-ExdYHMSZt1RJgyRoqj0Zm4TTg@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 5 Apr 2023 20:43:07 +0200
Message-ID: <CAApg2=RANaJm6ZHR1END-rf+pn5yhxfmuVHd+VbKvz=hFQi2PA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: new CVE database fetcher
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: multipart/alternative; boundary="000000000000ca945105f89b2ab3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 18:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179746

--000000000000ca945105f89b2ab3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 5, 2023 at 5:55=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:

> Hi Marta,
>
> Is this safe to backport to the stable branches, or should I let it
> "age" in master for a while?
>
>
Hi Steve,
I vote to let it age for a little moment. In the meantime I'm trying to
figure out when exactly NVD will turn off the old database.

Kind regards,
Marta

--000000000000ca945105f89b2ab3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 5, 2023 at 5:55=E2=80=AFP=
M Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i Marta,<br>
<br>
Is this safe to backport to the stable branches, or should I let it<br>
&quot;age&quot; in master for a while?<br>
<br></blockquote><div><br></div><div>Hi Steve,</div><div>I vote to let it a=
ge for a little moment. In the meantime I&#39;m trying to figure out when e=
xactly NVD will turn off the old database.</div><div><br></div><div>Kind re=
gards,</div><div>Marta<br></div></div></div>

--000000000000ca945105f89b2ab3--

