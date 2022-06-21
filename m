Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E072DC43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 07:33:52 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web12.40635.1655796825837405501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 00:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bn1yCskx;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id d19so14390482lji.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 00:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2fZ7bR2DKsZyFyQz292a+Sd1MUAz4Cx0wfBTPDuYde0=;
        b=Bn1yCskxBRk+IaXT1pTmc+BigLS+EgH8SudEuO4q7HHAaXRyKFENase+UwGlblgg+P
         vwgyBTSwUcNadwhvWfreC9/lXc0kYII130XOQo3DMvfsUnIY9v4uGlQXVmPHVcU95zH/
         X+oHjsrt4Nvda5GUts4F3AQquPjYZarc57/LJXVHxG2pJDB7OFCrL8J2TYZeNWpU3fC0
         34OPi0O6GH4vBmPRRGd31J++5ZFVb8CbtAYixWMJGzlsEdUx580fEADH6Eylda/0kDcO
         +iziCjrvuNdhEAuvjEZD1xySi6mCD+94jUiY+uHu67QnVq61YQ91bC4HmN9aIIPUCJed
         XHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2fZ7bR2DKsZyFyQz292a+Sd1MUAz4Cx0wfBTPDuYde0=;
        b=mbuScCDB7g66P1znGhzU4/M9jfE8UA7vRw1rfRMIUgn3sM1mZN/QG5qcEWK5SUdMt4
         eku7fjqm4phLKfju27+C+shg6YUQCdq+qSDSyb5V5jK55I1b6lzwEBdTkTukfKc/YHCa
         6IbJMreLgK0nlZfglrBXZmKi1v26qCb1chgbXg9O0h2FgXAPG10ED/wtogHRncOT+ooa
         XL5oWEfTZv8/0LKbCptaIc1qIm7ULok16juFeajLqJsOUUH1kgEw7zQqeedUNipOaAT9
         BCRBLtSu6HCX/GmMQtWBmWeylTH46rOUCGWdt1wcX0nQU0Q6ONGEFRoBGIwua5aniaIO
         0dQQ==
X-Gm-Message-State: AJIora9DM90qot4wT62tSPKYlBA9rzQCpRlbo2T3bbKZ3DZRgfwN+iYx
	4QTabWZ0sw0z/qxdLy+gybmctdytUGKNL+73LXg=
X-Google-Smtp-Source: 
 AGRyM1tKHY+x/nclAUDeGOYw3Fh1rVL3/Gkvo/HlpmN6Cd969Se240oUpbwUK8LLxqVx6OMtBwuB0E60T57NLeBkTUo=
X-Received: by 2002:a2e:7c07:0:b0:25a:73a0:4373 with SMTP id
 x7-20020a2e7c07000000b0025a73a04373mr2728684ljc.409.1655796823714; Tue, 21
 Jun 2022 00:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220615132011.2432008-1-rybczynska@gmail.com>
 <CAOSpxdaSNfEy+ny18Y5vbeaZzYjdsc8P77HGzMRNbqLNBDxkBw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdaSNfEy+ny18Y5vbeaZzYjdsc8P77HGzMRNbqLNBDxkBw@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 21 Jun 2022 09:33:31 +0200
Message-ID: 
 <CAApg2=QQfWXw3-YtRVbUcd3Dh1f58Ftxm=ih0tUe7k_PuDtb2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] cve-check: add support for Ignored CVEs
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000007f6e9105e1f03d44"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 07:33:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167132

--0000000000007f6e9105e1f03d44
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 7:31 PM Steve Sakoman <steve@sakoman.com> wrote:

> Hi Marta,
>
> Do you plan to submit a similar series for dunfell? It would be good
> to keep the LTS and master branches in sync for CVE checking.
>
>
> Yes, it will be coming shortly.

Kind regards,
Marta

--0000000000007f6e9105e1f03d44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 20, 2022 at 7:31 PM Steve=
 Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Marta=
,<br>
<br>
Do you plan to submit a similar series for dunfell? It would be good<br>
to keep the LTS and master branches in sync for CVE checking.<br>
<br><br></blockquote><div>Yes, it will be coming shortly.</div><div><br></d=
iv><div>Kind regards,</div><div>Marta<br></div></div></div>

--0000000000007f6e9105e1f03d44--

