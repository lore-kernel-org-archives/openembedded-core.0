Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFA4C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 05:24:20 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.3737.1652765053514073039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 22:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D2GORy3t;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id v11so15931529pff.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 22:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=53D7noNTZMPAjs5H4McNu4ifYZA/PmUFUl2q72shu0c=;
        b=D2GORy3turkPeVgx58lOXJkaVZjpG0q4lKk9C/4GD9J3xTF5FpyPbIaO6rpOznCeYV
         wffsBmmh8A/UeofHcWoWsUf9GV/fz9+PvVXdN8OXD4PaQXIyU+Ldb15ifbG85hpVJVFc
         Ynjn8g5fNf2AlY4HfCYff75BWGet8EkV7PKnYmJeD+bNAczv0NWJH86cjGN2vDS3EEDn
         q4jZJDFlY112CNI0t0gY0qH6uNTjCTZUyE+ziAV0/xLjIINw9Nbl4aEvvSKbrK2STZbU
         Xow+JaGr0WBgdTgXZUWLs37M4UBJGGDiXH0TTmLGy/yK4ASZTTs0iX4g4k/S423P+hM9
         JUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=53D7noNTZMPAjs5H4McNu4ifYZA/PmUFUl2q72shu0c=;
        b=zGMesXz76JX6k5s3aF0JdGdcw7zZaNMASl/MDmdT8pjznQdQgZSv8N+H1xOziq5CVp
         ucG6GgP+TKzg3uYceFoy144Ot+/ge/9O0WhcPSxDNg646YUwTQw/cDe4Ugwaf7K8/po8
         sr/kFqfhM0hMFhBx0XRxUVFfnaA4iiPDB9LW1bSgJckTEB/N7bYewJ9eBcXXgp0aj+4M
         6KjZvvYXkmPS8wUvi7jDxkqXIuSIplqjtZ/NH1IA4xqlT1F9akd+v1xpfuXwObmPByqW
         +jCbRpmBUpb1vBle1+Fma0OdC7hhP1WYbCGOwPwTl2EHThNruUaLBVVMWR/aeAbBNe6C
         X8gA==
X-Gm-Message-State: AOAM5312E+RYaCCg5ayf9XpQXaZ+EyHVyMtlpilcazByohBxThQ8ns+0
	xH9B0uwmObbSjk+z5KqkjlKwSdjesBYmIHW52rk=
X-Google-Smtp-Source: 
 ABdhPJyGIlyxrSgqgll7BzfA736LUcNyPgfRoSl9DMy7OLqjuvm+KZMLPpyInhtEv4Ec2/HtLUenZDvdSHshnb+NkX4=
X-Received: by 2002:aa7:9557:0:b0:50d:b868:4798 with SMTP id
 w23-20020aa79557000000b0050db8684798mr20981563pfq.84.1652765052923; Mon, 16
 May 2022 22:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220516194502.29026-1-alex.kiernan@gmail.com>
In-Reply-To: <20220516194502.29026-1-alex.kiernan@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 17 May 2022 07:24:01 +0200
Message-ID: 
 <CAApg2=SN=ADRoum+uMAdRuAtW7xa5vGi4cidDdNGMBTF5eYLfw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] cve-check: Fix rootfs CVE generation
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Alex Kiernan <alexk@zuma.ai>
Content-Type: multipart/alternative; boundary="000000000000e070dc05df2e59c7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 05:24:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165706

--000000000000e070dc05df2e59c7
Content-Type: text/plain; charset="UTF-8"

On Mon, May 16, 2022 at 9:45 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:

> Building an image with INHERIT += "cve-check" fails with undefined
> variables and fails to pass d into pure python functions:
>
>
Thank you Alex for this fix. It fixes the case of a standard build. I will
be sending
a followup for a case of running text-only outputs.

Kind regards,
Marta

--000000000000e070dc05df2e59c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 16, 2022 at 9:45 PM Alex =
Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Building an image with INHERIT +=3D &quot;cve-check&quot; fails with undef=
ined<br>
variables and fails to pass d into pure python functions:<br>
<br></blockquote><div><br></div><div>Thank you Alex for this fix. It fixes =
the case of a standard build. I will be sending</div><div>a followup for a =
case of running text-only outputs.</div><div><br></div><div>Kind regards,</=
div><div>Marta<br></div></div></div>

--000000000000e070dc05df2e59c7--

