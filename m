Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA80C04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 07:34:17 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web08.21304.1661412848017735581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 00:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CfoVjAXV;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id x10so18595197ljq.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 00:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=39r4LotGBrbxzSviGE547YZ/+ug6r9OV/3ggink2mF8=;
        b=CfoVjAXVjssBoXW9zFmKNNLRQ0diOA+Ol6alGtht3xpg2NvqHH3aw65ZOoxv2hHZMe
         5CP66mJzFXLRpzAUBV3n2mTSQzo8LM3eJouEklCO3u6hvylhKhX8YWELj0bsbKI08Ijx
         0Amw/zZcsTtvNni3Pa2GCJNqYk9q8P9RjUGM95XHfdkfsD1C4N+dKOJjvJfOof4ynsEF
         WRrjTnAIrPiZuXyHrz1n+6YKixOBSJntYhS8A48mUM0o50m1U5GvCPc8ACA24xevLFYh
         w/tSyTD/Q9J0rldoumvKS6I9bwbblFb/sUO+ZJVO+Fy4eeBrUiE4oQFo4simYcPydSqQ
         B89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=39r4LotGBrbxzSviGE547YZ/+ug6r9OV/3ggink2mF8=;
        b=fPQNoPXIYG4GQtWMlmJ7PYEsDfFguVggI28mxWDqS4ylEKHUsbBjLqeYeV+yOm5swz
         9Uph06lSbPVhbZooTOxexvwwEWReQ8kb5BXX2PtiJzp+a0up9n/JyOfzXsHim/bn+tfz
         1q/ykLZswMEfLSIDCq8vHA+y9ixeoODdcCPjGLCg0/P/ITNMcrmzOvuUFRT1WFMTvZ0R
         /DoOGsTveEerPxctmKc8OWn68K/juuRMp8IBaOb2pu+ETDscgnMzpnnZPVWiasGtDFNX
         vhjXRaEDvQq/FarFLiHEiwgtVdz60UiGAWqOAzaHMIKWpykZEnIBTmmH/8p368Po8Jr8
         ddiQ==
X-Gm-Message-State: ACgBeo3VjwJfpi2tS1jGz9wCIMYnJCCCwo/ULvRwHwo4co8YOzav1yq2
	P7FPehLtad/wz0tiu68eP0OzHtqAMeQO6GMt+lk=
X-Google-Smtp-Source: 
 AA6agR6PEjvvIeDRNgkS/t0PqyeSDgtpi5XCs8J18cHNkO7UQEhwMO3LaG4P4OLMHQbUGqpzNLhCJWatSUZF+zCtQwI=
X-Received: by 2002:a2e:92ce:0:b0:261:e39e:2c1d with SMTP id
 k14-20020a2e92ce000000b00261e39e2c1dmr666839ljh.273.1661412846132; Thu, 25
 Aug 2022 00:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220825072507.6568-1-ghassanebb@gmail.com>
In-Reply-To: <20220825072507.6568-1-ghassanebb@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 25 Aug 2022 09:33:54 +0200
Message-ID: 
 <CAApg2=T-BqLnaJgjBuxnfemPvfkQyWmF=r1XHz1vHa2qFKoQwQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] [PATCH] sqlite: Increase the size of loop
 variables in the printf() implementation to avoid harmless compiler warnings.
To: ghassaneben <ghassanebb@gmail.com>, Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Cc: ghassaneben <ghassaneb.aattar@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000084e3e805e70bd22a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 07:34:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169837

--00000000000084e3e805e70bd22a
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 25, 2022 at 9:25 AM ghassaneben <ghassanebb@gmail.com> wrote:

> From: ghassaneben <ghassaneb.aattar@huawei.com>
>
> Increase the size of loop variables in the printf() implementation to
> avoid integer overflow on multi-gigabyte string arguments. CVE-2022-35737.
> This bug fix refers to: CVE-2022-35737 and it's a backport of a fix added
> in sqlite 3.39.2 (2022-07-21).
> Original commit: https://www.sqlite.org/src/info/aab790a16e1bdff7.
>
>
Steve,
I'm adding it to your watch list. This is a CVE fix contrary to the
"harmless warnings" one of the commit messages is telling us.

Kind regards,
Marta

--00000000000084e3e805e70bd22a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 25, 2022 at 9:25 AM ghass=
aneben &lt;<a href=3D"mailto:ghassanebb@gmail.com">ghassanebb@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From=
: ghassaneben &lt;<a href=3D"mailto:ghassaneb.aattar@huawei.com" target=3D"=
_blank">ghassaneb.aattar@huawei.com</a>&gt;<br>
<br>
Increase the size of loop variables in the printf() implementation to avoid=
 integer overflow on multi-gigabyte string arguments. CVE-2022-35737. This =
bug fix refers to: CVE-2022-35737 and it&#39;s a backport of a fix added in=
 sqlite 3.39.2 (2022-07-21).<br>
Original commit: <a href=3D"https://www.sqlite.org/src/info/aab790a16e1bdff=
7" rel=3D"noreferrer" target=3D"_blank">https://www.sqlite.org/src/info/aab=
790a16e1bdff7</a>.<br>
<br></blockquote><div><br></div><div>Steve,</div><div>I&#39;m adding it to =
your watch list. This is a CVE fix contrary to the &quot;harmless warnings&=
quot; one of the commit messages is telling us.</div><div><br></div><div>Ki=
nd regards,</div><div>Marta<br></div></div></div>

--00000000000084e3e805e70bd22a--

