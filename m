Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F61C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:58:22 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.3830.1699901898707059802
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eeZ43XBE;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1e9a757e04eso2978868fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 10:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699901898; x=1700506698; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7u6qJFvu+R62akxWbuRmq5hrzwCkNzQAVsu/SZudhc=;
        b=eeZ43XBEPnN/IwqUMwxUGEaUde8mwCe2D58370tB5lwsuUSQJai21Nz/Z1HM3m+Ci7
         r9pJCua/q3vV/Q+ODNSnpcjFSSQ5d221JKXuxeChvEKrhaWK8L0ChnHcY1MMywWDuYO1
         Jq31lgmyuidN7/GbNqHCraExN1k1cQrM4i6xdvJVcUYs93VBAvOHfjf8aBzK6kgBayse
         83+AvW53sd1cXZNGSxw9RBWXqpHctNUlMdw4LAhew7pCy8gonEMDlE6juqkBn8PMrJwj
         jd2aKUuBiriYm0XeNfLuWdzsoNnvEbBQJqzOzSCWMYID36XuKJ5wYtKG/UMXC6i2j96p
         5tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699901898; x=1700506698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7u6qJFvu+R62akxWbuRmq5hrzwCkNzQAVsu/SZudhc=;
        b=gvSM1Lp+oVgxgGh1a7YdS34pqBlqKj9Xi2fn/c1mKlG1IY1wq5SYwM025cSzcJDvZa
         r9MciuvPf3R+9PJdVLrYzoVG4jiN8wmjB7qGEZz0V4JUzXjbf+bx6e2FaX1wc6hkPkF9
         4ZCxsJHKUdUSy0SaEyOzHGMBA5Yfs4n1ZlloZwuQTbrQBoafLMpMrri4xP3697R0id1o
         6DmF/+SQfv6st/DQyA6Hshszg5hBeY8lp47PgIR5ZqPCcbBb7lzpEZxfTIM4h5/cbaW+
         g6wR0YJSNy3kBljWkti4lz8d//WEzuPHTCSCyF+5rUyz8lmdyAUM6dvnIuRwCl5xMwzs
         cBvw==
X-Gm-Message-State: AOJu0Yzx86j0vutHZv4k4wdc1ppW7K7G/zNbbXewYpFQALzjqojxdrkZ
	afS9Y4ggiojDpDJ9AYjrUBgZMPMiw+SBVxvTPo0=
X-Google-Smtp-Source: AGHT+IEFtIiKBiBu7TWKRnQdihvQdiW4bvz6wsKvhwuLOf6djVEb4QHDqdrpXNPqL0xmwtaX31yKCjqm5ZI17+seJzM=
X-Received: by 2002:a05:6870:be8d:b0:1ef:9668:b532 with SMTP id
 nx13-20020a056870be8d00b001ef9668b532mr253483oab.0.1699901897934; Mon, 13 Nov
 2023 10:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20231112111736.36F751069F8@builder.sakoman.com> <9D1D1B81-57FE-46DF-A761-A97F979A31BA@arm.com>
In-Reply-To: <9D1D1B81-57FE-46DF-A761-A97F979A31BA@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Nov 2023 10:57:52 -0800
Message-ID: <CAMKF1spnrRJWkeE0oLiSkv=8LCAG+R3E8_3BRw9r6OfmKjF2Rg@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 12 Nov 2023
 01:00:01 AM HST
To: Ross Burton <ross.burton@arm.com>
Cc: "yocto-security@lists.yoctoproject.org" <yocto-security@lists.yoctoproject.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 18:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190484

On Mon, Nov 13, 2023 at 5:55=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> On 12 Nov 2023, at 11:17, Steve Sakoman via lists.openembedded.org <steve=
=3Dsakoman.com@lists.openembedded.org> wrote:
> > New this week: 8 CVEs
>
> Such fun!
>
> I did some research and have included my notes below.  Do we have any vol=
unteers for the avahi patchbomb?

I think we should bump avahi to use master branch like many other distros

>
> > CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-3397 *
>
> NIST link to a =E2=80=9Cpatch=E2=80=9D which was prompted rejected.  I do=
n=E2=80=99t believe we enable JFS so we could likely exclude this.
>
> > CVE-2023-38469 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-38469 *
>
> Issue lathiat/avahi#455, fixed with lathiat/avahi PR#500 a337a1.
>
> > CVE-2023-38470 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-38470 *
>
> Issue lathiat/avahi#454, fixed with lathiat/avahi - 94cb64.
>
> > CVE-2023-38471 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-38471 *
>
> Issue lathiat/avahi#453 fixed with lathiat/avahi PR#494 d486bc.
>
> > CVE-2023-38472 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-38472 *
>
> Issue lathiat/avahi#452 fixed with lathiat/avahi PR#490 d886dc.
>
> > CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-38473 *
>
> Issue lathiat/avahi#451 fixed with lathiat/avahi PR#486 5edc17.
>
> > CVE-2023-46246 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-46246 *
>
> Fix in vim/vim - 9198c1.
>
> > CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-46407 *
>
> Fix in FFmpeg/FFmpeg - bf8143. This is part of the 6.1 release so upgradi=
ng ffmpeg will make that go away.
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190469): https://lists.openembedded.org/g/openembedde=
d-core/message/190469
> Mute This Topic: https://lists.openembedded.org/mt/102540446/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

