Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DD9C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 14:24:52 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.10183.1678803890967088241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 07:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b6TF3G/b;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id bp27so9972845lfb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678803889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6oT/bpck9trSjRXaSO8pEeBcc2LZt1uIjvDqJLIVBg=;
        b=b6TF3G/bH8pu+Oq6HYIfbj6YyIzew5y0KU2nRSDtlOgGgXT4Yh8e1XqAAhWsTUiypx
         4C5tB6757b3AhMPW2/3AYnQsVgWdZx10VGTvoB94j9ro/hczECwBWH3kvJs+clmPVKxV
         l0MS1SDFbdrb8r/G1JCsmWthaNq4wRsiisqDKM45gHwY1rJSRaP0Vfa6NHWdpYLRM3uk
         8SXJYPFrcR9bwwF4kFX+5YoSZP5daJ1Ix7dLHgWIn7fXg2klSJb0wQUc0LBaaCiz2l4M
         HquIy3EiQcrsvQ7OswN7kEX7z3CdIW0mOpZ+TXX23+OcHXV/GjSNeeSLoYn3DTG7UGI3
         uBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678803889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6oT/bpck9trSjRXaSO8pEeBcc2LZt1uIjvDqJLIVBg=;
        b=wO6upCyXXxCbNqPBQB6wbkdd0ET3gZJs/qMsq+D9KpIAN2uWGGSztCmXA9KCV8Ry8T
         315jmNXKsn4a2ixCXc2Zpehs/lxMbTnIK1tKeX/tXXqcYVgGRQz3rBF/SCIOp/jlwn0K
         k151FfnETWHgPmxHS4gGoT1Jo0vUxuPwSWjuz5SYcAA+p1yJAox7+H6rqlTv3s5sP6nI
         9Lvieda9Q8RUx8te4emPNKvCkzql6SeqqjXraPsd02o56rZDuS7jqiZ1vfIhWHFhWK3q
         t2FXyvDKKVjD7nId9+9zg05mqY+PDT/lKplh2xHw3WCnFShdeVh1AasFNoOAP5g8cUqr
         T2lg==
X-Gm-Message-State: AO0yUKXcK6rNUsUDhQ9AyB/Dsb29nTkZhFZZ+h0G1Ttbyi5g/lREPaXn
	fpxhT13ydB0VLTA7Li8DNYyL2bihRoAm9Qg3Njo=
X-Google-Smtp-Source: AK7set/GlrPg84F8GiD/T7O8rpa3d0v56wJCvJlRSprj1EmQSeMEivFvibqSY4KZ5MYDB4A9Mqkbm5hWloGLfX1TR2g=
X-Received: by 2002:ac2:5deb:0:b0:4db:3ab2:896e with SMTP id
 z11-20020ac25deb000000b004db3ab2896emr817142lfq.6.1678803889004; Tue, 14 Mar
 2023 07:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230224161643.1596895-1-rybczynska@gmail.com> <1746CF3A756BF744.29542@lists.openembedded.org>
In-Reply-To: <1746CF3A756BF744.29542@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 14 Mar 2023 15:24:37 +0100
Message-ID: <CAApg2=Rky1AVv98bUZoG5axPV3j7Z5-nFjDXcjY_b_0GqqSBiQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC]] cve-update-nvd2-native: new CVE database fetcher
To: rybczynska@gmail.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: multipart/alternative; boundary="00000000000073a37305f6dcfd4b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 14:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178492

--00000000000073a37305f6dcfd4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 5:22=E2=80=AFPM Marta Rybczynska via lists.openembe=
dded.org
<rybczynska=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Fri, Feb 24, 2023 at 5:16 PM Marta Rybczynska <rybczynska@gmail.com>
> wrote:
>
>> Add new fetcher for the NVD database using the 2.0 API [1].
>> The implementation changes as little as possible, keeping the current
>> database format (but using a different database file for the transition
>> period), with a notable exception of not using the META table.
>>
>> Minor changes that could be visible:
>> - the database starts in 1999 instead of 2002
>> - the complete fetch is longer (30 minutes typically)
>>
>>
> Tests VERY MUCH welcome, I have found some bugs today still.
>
> Docs (with a mandatory note according to the terms of use) will come with
> v2.
>
> For the swap between v1 and v2 I'm not sure what will be the best solutio=
n:
> - a configuration option allows to migrate when the user decides to do so
> - ... but does not protect the day they disconnect the feed
>
> What do you think?
>
>
Still interested in your opinions on this. Currently I'm investigating some
differences between
both fetchers.

Kind regards,
Marta

--00000000000073a37305f6dcfd4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 24, 2023 at 5:22=E2=80=AF=
PM Marta Rybczynska via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Feb 24, 2023 at 5:16 PM Marta Rybczynska &lt;<a href=3D"mail=
to:rybczynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add new fetc=
her for the NVD database using the 2.0 API [1].<br>
The implementation changes as little as possible, keeping the current<br>
database format (but using a different database file for the transition<br>
period), with a notable exception of not using the META table.<br>
<br>
Minor changes that could be visible:<br>
- the database starts in 1999 instead of 2002<br>
- the complete fetch is longer (30 minutes typically)<br>
<br></blockquote><div><br></div><div>Tests VERY MUCH welcome, I have found =
some bugs today still.</div><div><br></div><div>Docs (with a mandatory note=
 according to the terms of use) will come with v2.<br></div><div><br></div>=
<div>For the swap between v1 and v2 I&#39;m not sure what will be the best =
solution:</div><div>- a configuration option allows to migrate when the use=
r decides to do so</div><div>- ... but does not protect the day they discon=
nect the feed</div><div></div><div></div><div><br></div><div>What do you th=
ink?</div><br></div></div></blockquote><div><br></div><div>Still interested=
 in your opinions on this. Currently I&#39;m investigating some differences=
 between</div><div>both fetchers.</div><div><br></div><div>Kind regards,</d=
iv><div>Marta <br></div></div></div>

--00000000000073a37305f6dcfd4b--

