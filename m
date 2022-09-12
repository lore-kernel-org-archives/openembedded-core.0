Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E06FC6FA83
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 18:56:09 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.2555.1663008965960388647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 11:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bEBepMvX;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id i26so16352750lfp.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NVrVRya/aaplYnckzDFftc0s3zOUPLBFXrWt1vITU9Y=;
        b=bEBepMvX1i7v9zeT3/3Km9Dj8mE1hcmiM77bCDFSUKFqkyLhoKOuODZ1w9PiotSBG5
         PeBKMlGdDvQcguUYgmfMbG77RmZaNcXY3UgTr5hSB9P+frZo/1iCb9W7tzrkRO1OHfnm
         OdqXsoU+N2NV/jernOdqeYMRnBB5l6fxihmoIF6HDpMniEARQI8v/QrR5rp2iZmyor4m
         jUQVskiwuVN6QQs5FKrjhdnuCYoBQAKRuePMRzEUHHIu7FqZR//xgwofqWVfeQz4M9GI
         8lCvZIbLG1IFQgp/jFe0hCJTLtw+Mbej8oh+/LNcPXO15bwtKDRuyXz09XqTathzYlC8
         VpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NVrVRya/aaplYnckzDFftc0s3zOUPLBFXrWt1vITU9Y=;
        b=B01HHnMRoV6J60LvuFVMjdx24ywyuaEhoWckQ3SCeXgPPGnTDFQdZQkkY7rM4omhie
         ntje6lwpj6tSERjxrn8mpDpJ+HwCPbcl8OuMZcRBnA3khGLxDNm8MGCpuTvLG2Lr20mR
         1AMTCTIdNjHtqCftyWakAjAl65sz8tpkAaiJqvgeHk8RqDsc8ftmIC+XZqkDkn6Hqitz
         iEYRQlnB75+WwDJc6R/hZyXA9oghsbsigXgqtxqK2omY3+LmK4mkvVwuGbV4NFTO/leh
         n5FKvGByht7OB2Ans9nnuh9HxKZjLgLMQrC3qUfJuf5trxkvFsQ4kyGqCrkiCX9emI46
         aJqQ==
X-Gm-Message-State: ACgBeo3xeqQyLnM/WOH328cVFd674opc1UeVv4qTj+gEZi3AstkfX0EZ
	dIetDdHJXMXDArHHlIyHQ47kQJ3xlkY4jQdeQng=
X-Google-Smtp-Source: 
 AA6agR4jS8OsRZmceE8WbuOPIWUh9F7qFBb1Ud2hbg1cjYjsDx70ZSA2fhfO4WWNj3myBC0dhQPxKZq7VASQdU0U2bU=
X-Received: by 2002:ac2:5d2c:0:b0:493:221:f011 with SMTP id
 i12-20020ac25d2c000000b004930221f011mr8945008lfb.349.1663008963874; Mon, 12
 Sep 2022 11:56:03 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdY3j8DAsOQGhG9w1BJi+2ao4sO_KLvbkxX70fwbq8BfzQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdY3j8DAsOQGhG9w1BJi+2ao4sO_KLvbkxX70fwbq8BfzQ@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 12 Sep 2022 20:55:51 +0200
Message-ID: 
 <CAApg2=RssQ94dKngx=5ph_QbyZsWnqS7LRJ9rg67Q6b6bZbMWw@mail.gmail.com>
Subject: Re: [OE-core] CVE raffle: collision avoidance
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008cd55c05e87f7249"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 18:56:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170540

--0000000000008cd55c05e87f7249
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Sept 2022, 17:55 Steve Sakoman, <steve@sakoman.com> wrote:

> Reply to this thread noting which CVE you plan to work on.  Please
> don't claim one unless you really intend to follow through!
>
> Hello Steve,
What about sending the list of pending CVEs (from the existing
dunfell/kirkstone/master lists) for easier tracking?

Kind regards,
Marta

--0000000000008cd55c05e87f7249
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"auto"><div><br><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 12=
 Sept 2022, 17:55 Steve Sakoman, &lt;<a href=3D"mailto:steve@sakoman.com" t=
arget=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Reply to this thread noting which CVE you=
 plan to work on.=C2=A0 Please<br>
don&#39;t claim one unless you really intend to follow through!<br>
<br></blockquote><div>Hello Steve,</div><div>What about sending the list of=
 pending CVEs (from the existing dunfell/kirkstone/master lists) for easier=
 tracking?</div><div><br></div><div>Kind regards,</div><div>Marta <br></div=
></div></div></div>
</div>

--0000000000008cd55c05e87f7249--

