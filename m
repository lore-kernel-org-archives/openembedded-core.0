Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F781C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 20:32:01 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.39153.1702585919314298516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 12:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HYHnYASZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35da85e543eso32038515ab.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 12:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702585918; x=1703190718; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEmEUdp1Jc3SI7jfcTihUjZ3rGqEQLuaEaxng+uvAEI=;
        b=HYHnYASZFg/xnUbvYcdu6DZuAIUgXKpVcfDLKchVpWAkn4w1h5PhuapnM/4jcqdPM0
         I9/hStRKFEOU1qqSVcvyoCv9MAPJN3mpfsIEu8TU4dGPQf0Pau/SKMkDm9qFD99YJclE
         L+6fHBvqka3KoebSLKooCZIHisZ3/svGiC+FQTN95KWPyJ2+V+MM5pTnga6o1FHlzpfe
         IODXTe27gkC/xuvbxNGMbW/CFaNnZJ5/B+b0vROSaeSOAkkQdq3ym2Ryhm4I/gz948GN
         wSW0dZm6w0NBqzYaW0UPpjoueVMoJIPHBmQH5Ndv7atYhWNwIuqWGiv1YbDFbuWAd36g
         o3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702585918; x=1703190718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEmEUdp1Jc3SI7jfcTihUjZ3rGqEQLuaEaxng+uvAEI=;
        b=pRY9pVDXDSWBqo+xmVjVdPmcSqgOXQjU3dQHdml+79eH6qaeUjNqkcPc0kV19S54TN
         hFnnNQAeTsDVgaQB6D9r7uv2b6dKWXqCpRzH9VYlH+uL6+QoA/zgMmtuQJdfEdDBeOHI
         IYtcd18R/Wp9JXK2EhSh9EBeD4JnCoIESNUxERM/elk8nS52mOegfvAjoAYvg+fddC7g
         eMfgw9ETWSCqNop/VmJpeXJ94omJWPo7Tgz0/BlqussI81PgVKLdnF/WbUJD0gOe6SZ5
         aPkYXqK2+Qdcldmlek4vgI3GaNgnwQ/kghrnTrnXs6oiACEOl+UtaPQj0MiCCczXj/Ah
         ctFA==
X-Gm-Message-State: AOJu0YxqgkcPE/spfd0JY82dIxcVNMYwh+sPk6/CqWv9hfyJm5iTdNxb
	h1YcN2Zj1Qc+3R7980rnUaFQN3tue20gQccZFyA=
X-Google-Smtp-Source: AGHT+IFl34QwbwIDsFK0PSWoF4Y/zIDb7ZDJKJmDFa8xf2WSBbhhY0OmYZnAK42Xh+VOxXV6lOiQOrzf3kJbEYhIuVg=
X-Received: by 2002:a92:ca0a:0:b0:35f:684d:7287 with SMTP id
 j10-20020a92ca0a000000b0035f684d7287mr6158946ils.13.1702585918449; Thu, 14
 Dec 2023 12:31:58 -0800 (PST)
MIME-Version: 1.0
References: <CALT56yM414xkWEHMf1+uXo5dwJKN2MSnnuL5Ltwu+0pYRxspfw@mail.gmail.com>
In-Reply-To: <CALT56yM414xkWEHMf1+uXo5dwJKN2MSnnuL5Ltwu+0pYRxspfw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Dec 2023 15:31:46 -0500
Message-ID: <CADkTA4PXw7rwVZs-Ye2nGdy0PYtZebyfMeXSPdGRyF3LaPmhFw@mail.gmail.com>
Subject: Re: [OE-core] linux-yocto 6.6
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 20:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192404

To avoid burning everyone out even more (plus Scarthgap m1 is going to
build shortly), I'm not sending the new reference kernel updates until
January.

Even just the send of them and any AB runs will steal time and be a
distraction over the week between Christmas and New Year.

If you want to use them locally, you can find the queue that has been
under test for a bit on my poky-contrib branch "zedd/kernel"

Bruce

On Tue, Dec 12, 2023 at 5:28=E2=80=AFAM Dmitry Baryshkov <dbaryshkov@gmail.=
com> wrote:
>
> Hello,
>
> Granted that 6.5 is declared EOL, is there any timeline for the
> linux-yocto 6.6 recipe?
>
> --
> With best wishes
> Dmitry
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192190): https://lists.openembedded.org/g/openembedde=
d-core/message/192190
> Mute This Topic: https://lists.openembedded.org/mt/103127485/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

