Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CCEC433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 19:17:32 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.1385.1633461451986716356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 12:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BjJmGVNs;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id i8so37258uae.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 12:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mgp0ESJ8rqCMqcj4zK+LQlh72rPVyVh537mQlC30bn4=;
        b=BjJmGVNsn++jplhNwQID1I7mqRRFCf3UteuWjcVtv4/GOgf3R/imXXRCm3U6uoi7de
         vKi3JynJKmWV9IRO72kW/occ0ldiiJCecuJjWud/1euQW++njWO+w8Rh1VaPElAg0mBb
         IH1EgaArqrimLybhR1hgGZ9mQRsEuNQ9h3v9l4XmvsS7kvx0rnp/MRDxOraM5ICRNFxP
         eZ6QrYIoYX1EEVod56PdOU8/GEHRmfWnQAh1m6vrWcDrnN4NykLNeFG5mV6koS+EBv+z
         hJ1RD36m9ZALCpgeXyO8hFQW6sfi3OPY1CuE1DD66Z02xYoSSwei2yNVOkzcUEVBmnVO
         9g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mgp0ESJ8rqCMqcj4zK+LQlh72rPVyVh537mQlC30bn4=;
        b=OrvEd9jWteubgAfe3gXalxc2ano3FzPLZ7exA1CNmAHi6+s5uDRgoDYBI1Htgmx5yX
         1W6cTqNOlK5t3WUg5jhCI+mQ12xn+OdXzLUj1ExtotdCvXT9OMAeRqfQYNfH5LPH6NBb
         65S8GrA7MOwQBiGautMb6On1vnw/KcN56EpZdWMxn31Z8/2b7gGGaOkc/FBFDywP/pUf
         yabDRrBrUYHKuca/wGxGX9R7R2VzK5Mr6FX6XmOZgzBxMRggKnZcqx/XWoaAXbjg16Wr
         dYkagXeFyZHFXUeK+TjGzu10euSSU1GI4EalPfGMqjXPIwLdMTrzIhIm2Q51KQFCqhPq
         8DiQ==
X-Gm-Message-State: AOAM531/t8vj5pT3rsd7/T//mUGR/v3xuYTw2WSaPDyy5d7kj5to/KKO
	wg0Nq/JaSrj7tTGFaKnNm5SbX2sGrK2rtnIfs/s=
X-Google-Smtp-Source: 
 ABdhPJxg8z8H8G2FxW3Obgjb7YslSig8n8uk58iO9FQLuJcAMGEqLeqWFRkoFk1iNV8qIxWMuKOgF/JIwQIWiMarGNU=
X-Received: by 2002:ab0:6556:: with SMTP id x22mr12885376uap.71.1633461451165;
 Tue, 05 Oct 2021 12:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
 <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
In-Reply-To: <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Oct 2021 21:17:19 +0200
Message-ID: 
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008d141205cd9fe14c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 19:17:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156656

--0000000000008d141205cd9fe14c
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Oct 2021 at 19:44, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

>
> > A layer with thousands of recipes seems totally intractable.
>
> What is your concern? The high number of dependencies or to handle it
> via OE?
>

Generating recipes with a tool means the tool will be custom and
non-standard, and chances of anyone outside of your company
understanding, using and contributing to it are rather small. There's also
the problem of needing multiple versions of the same thing for different
consumer items, which oe doesn't easily support. The link Robert provided
already exposes some of the pain points with that approach.

I tend to think the best way forward (or least painful at least) is to
gradually improve what there already is, which is the npm class
and devtool, and send patches to various upstream njs projects when they're
using outdated dependencies or otherwise need changing.

Alex

--0000000000008d141205cd9fe14c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 5 Oct 2021 at 19:44, Stefan Herbrechtsmeier &lt;<a href=3D"m=
ailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-os=
s@weidmueller.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><br>
&gt; A layer with thousands of recipes seems totally intractable.<br>
<br>
What is your concern? The high number of dependencies or to handle it <br>
via OE?<br></blockquote><div><br></div><div>Generating recipes with a tool =
means the tool will be custom and non-standard, and chances of anyone outsi=
de of your company</div><div>understanding, using and contributing to it ar=
e rather small. There&#39;s also the problem of needing multiple versions o=
f the same thing for different <br></div><div>consumer items, which oe does=
n&#39;t easily support. The link Robert provided already exposes some of th=
e pain points with that approach.<br></div><div><br></div><div>I tend to th=
ink the best way forward (or least painful at least) is to gradually improv=
e what there already is, which is the npm class</div><div>and devtool, and =
send patches to various upstream njs projects when they&#39;re using outdat=
ed dependencies or otherwise need changing.</div><div><br></div><div>Alex<b=
r></div><br></div></div>

--0000000000008d141205cd9fe14c--

