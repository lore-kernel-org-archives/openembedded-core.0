Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CC5C001DF
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 23:02:33 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.42016.1697756549229480551
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 16:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RfkfAARE;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1dd5b98d9aeso147413fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 16:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697756548; x=1698361348; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=095ghJgvY7mkMuZ+BLr94TTGSvISCrFTk9k3Nmbkxzg=;
        b=RfkfAAREbiUF3jQPzwyc7R7Upr60F/ncz3OwKAKWUYLIxSGgTvvbKZaJnYxx9Da/QQ
         pGTuy/UTfvOi/mWPPx4STyXdgpS+yYqIoQVA3NM90vJ9xWEX4JsdBEB+r5ZghinJScjz
         6JbyLIYNQUwuUMiB1HS+r7riUtj7HAK6Gwx/qZBAFoZM6VyrLlRf4n0os8dmfIjwmjFO
         SUjuCDG54Ct0lXL3ydT4TcSPnS4M1W3w3w0UP1vzD6aaUqS510DWWrzdKY62oBKP22La
         bCtsq48amRiLkVQ03SjCxfRgZF2G1Hb7VYIMqgyvDkqokzTd9RsU2DZyRMqPddaZkUW+
         GvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697756548; x=1698361348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=095ghJgvY7mkMuZ+BLr94TTGSvISCrFTk9k3Nmbkxzg=;
        b=CJjXES5KSMtHUnrFH/j4a7Wo2B7Uzk36Q2g2MWbTurZETVjNoga3+0JRadBfH7oxBZ
         3ph0bOtjnBHJ67Vo7+SlTu7uDvcBvrT2CXOSQF6piKlHCPCikwzGEbJVY7ASda/WiB5Y
         TZGoIOOA0clxwMRRjsucmZ3CC0ka/rNoue/lUrudCcLNB6pIVPC98gEULDiKqbnKrzOE
         d+slYYkzOwuqRnOAl/23mVX6oRPN+myaDVN4FlyWDtBrRrcTnaY/u7qBrUcphkniVQgO
         NOHvXQ+xj6jw0CCZlt33+bZBK+mD3LoeSF3CuXNlwCYxfy324tz4Gzeiw+SNRnVEQega
         qthA==
X-Gm-Message-State: AOJu0YzWXFzNTROG7RNyji9wGJI1vZRUsKvGMLUr+/PxdMq6WSDEeDI9
	JBrFoLsvKfmteSKG/lauufpC6yAKYvmWg9hN/Ys=
X-Google-Smtp-Source: AGHT+IH3ConlBUJTR8LKzG8i+9p/vyR6jssYZ5MnxFxM3oiPvgEyRabWJ35u96MCPeehJVaJCjjAFaUUebY4ahxEONA=
X-Received: by 2002:a05:6870:2253:b0:1e9:b4c3:546d with SMTP id
 j19-20020a056870225300b001e9b4c3546dmr97298oaf.10.1697756548158; Thu, 19 Oct
 2023 16:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soFcxfbe04ptQ48oKrcMYtS9UMoauqX3KbN2VF98seuMw@mail.gmail.com>
 <19195.1697717816202918718@lists.openembedded.org>
In-Reply-To: <19195.1697717816202918718@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Oct 2023 16:02:17 -0700
Message-ID: <CAMKF1sq4pvaaSFUTpMUCsiSu8rVar3uYsuzW8v9RrH+PqaTJcw@mail.gmail.com>
Subject: Re: [OE-core] [mickledore] glibc: stable 2.37 branch updates.
To: Sanjana.Venkatesh@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f7da86060819bff9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 23:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189488

--000000000000f7da86060819bff9
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 19, 2023 at 5:16 AM Sanjana.Venkatesh via lists.openembedded.org
<Sanjana.Venkatesh=windriver.com@lists.openembedded.org> wrote:

> Hi Khem,
>
> We tried increasing the memory and no regression failures were found.
>
>

Thanks for following up

Steve

We can cherry pick this for mickledore I think now

Here is the test results:
>
> Regression testing is done and below are the test results.
> Before glibc update
> Summary of test results:
> PASS:4727
> FAIL:240
> XPASS:4
> XFAIL:16
> UNSUPPORTED:220
>
> After glibc update
> Summary of test results:
> PASS:4733
> FAIL:235
> XPASS:4
> XFAIL:16
> UNSUPPORTED:221
>
> These are the newly added test cases
> PASS: io/tst-fcntl-lock-lfs
> UNSUPPORTED: nss/mtrace-tst-nss-gai-hv2-canonname
>
> These are the tests which were failing before and passed after increasing
> the memory:
> PASS: nptl/tst-thread-affinity-pthread
> PASS: nptl/tst-thread-affinity-pthread2
> PASS: nptl/tst-thread-affinity-sched
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189449):
> https://lists.openembedded.org/g/openembedded-core/message/189449
> Mute This Topic: https://lists.openembedded.org/mt/101774187/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f7da86060819bff9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 19, 2023 at 5:16 AM Sanjana.Venkatesh via <a hr=
ef=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;Sanjana=
.Venkatesh=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windri=
ver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div>Hi Khem,</div>
<div>=C2=A0</div>
<div>We tried increasing the memory and no regression failures were found.<=
/div>
<div>=C2=A0</div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Thanks for following up</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Steve=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">We can cher=
ry pick this for mickledore I think now=C2=A0</div><div dir=3D"auto"><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"></div>
<div>Here is the test results:</div>
<div>=C2=A0</div>
<div>Regression testing is done and below are the test results.</div>
<div>Before glibc update=C2=A0</div>
<div>Summary of test results:</div>
<div>PASS:4727</div>
<div>FAIL:240</div>
<div>XPASS:4</div>
<div>XFAIL:16</div>
<div>UNSUPPORTED:220=C2=A0</div>
<div>=C2=A0</div>
<div>After glibc update</div>
<div>Summary of test results:</div>
<div>PASS:4733</div>
<div>FAIL:235</div>
<div>XPASS:4</div>
<div>XFAIL:16</div>
<div>UNSUPPORTED:221</div>
<div>=C2=A0</div>
<div>These are the newly added test cases</div>
<div>PASS: io/tst-fcntl-lock-lfs</div>
<div>UNSUPPORTED: nss/mtrace-tst-nss-gai-hv2-canonname</div>
<div>=C2=A0</div>
<div>These are the tests which were failing before and passed after increas=
ing the memory:</div>
<div>PASS: nptl/tst-thread-affinity-pthread=C2=A0</div>
<div>PASS: nptl/tst-thread-affinity-pthread2</div>
<div>PASS: nptl/tst-thread-affinity-sched</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189449): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189449" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189449</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101774187/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101774187/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f7da86060819bff9--

