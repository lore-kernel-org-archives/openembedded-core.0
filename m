Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825BCC54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 13:03:36 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.49149.1748869415748408930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 06:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CdJPbPBN;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: rwmacleod@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso4174986a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748869415; x=1749474215; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nJfjL7qQ5R7yzpIcDW0rY7TC87JsOvEtgeK5f3ILfOU=;
        b=CdJPbPBNphbfJHZzbxUpnZNIT8qrSVL4d2+g4XE7vb2N41PuTwmFSsk5MGUA3JR8X4
         hUJqz1jFATN07GRLwtbjt3makUAiblog5X0zTsFwl8y4Q/DJm6l3wsVcx9xFePxcj2gG
         x+9/UAYg4eFfHtF5ZSgGW340Hmy/AwdSM3IPjhVNyH0WoE8Huhr6XQX0RBZ+3qdDF6jV
         gF/M7sJK2SMQxXRiq/XajzQmy72rxWYQlMXV/dFl68W/Z9GlcDHMZNFsLwc6xxxgnTrc
         sN7ldlMN810R0Z/p9QFihw9xXsglr9KXvlQzc75A7uhn1sIQgoeZ2j3WeTXwGN9z+MeQ
         r1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869415; x=1749474215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJfjL7qQ5R7yzpIcDW0rY7TC87JsOvEtgeK5f3ILfOU=;
        b=c1Q/bgGaPC1YYp216N1gNY8YR5bglILbiPX7bXKBwfLG9Wa47laF2clBCiSVPTD7Io
         MFz7MOWFWsDjw6M5I1lFyuRj9rDjwUUPtw7L/fLGCaWTxEDMCFyqjdVX1f8g4nZL0s4u
         bOEetMzSZ4iNFMxt3oOknjnbP6U6AjESsd+46x+VboAasMvsuc9rVN9fwYuuEuzyyde0
         42SPDwp8Qwkuz8nws6vdvG+rrr3Be/g8istjCXMeGdaXAGspfAnXBLe++03TA93LhFLB
         2tFH94eBrKhbUaoDRsCYr+zW6BbKAKm+AAKEX7x3kSea0y9SLpE2K9IIU4ra5bPzBoLX
         yawA==
X-Forwarded-Encrypted: i=1; AJvYcCUmm9ZXRR9B1flOQB97AFS5yxh2rOoFrjA9c5hmjW4JNjMmMvDaomVggr9t5OUZqEGwxZErJ8Cq7fmi7LWORAUvEg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQGscctcfCBBoNgGhak8Q4BgajUxSEoevB3Nr29MIwxV7KFmym
	T5oykVf1Iqu0V1ClZ0UTcwv4GP5Co4xdwtqmg/Lbz5oRT/akfbdqzfyUZLqzCirsU71JkqRncLW
	ylCZOSzcDhe9VDazPjGeCqEuJfjm2VsY=
X-Gm-Gg: ASbGncslHPx/ZRp5U7ViZUIFv6fVU//an/OjnnEFmk+UDnct8a0I99szZ03morZG3xR
	h0JJ+gCu+htruZNCYOeNHzahiCz9fDy14ATzU/rVM55+rPE1Jq2etemW7s8+n9NsyWCf4RuxccU
	ZCBzdfjyZUNpmZ3G7fzK5KAzklkyffVDoOyg==
X-Google-Smtp-Source: AGHT+IE+CM3uU7VUo1CnNTf7ffEpcBjad7yr6DiR6amctkxusEKz7tt+NYA2MtAbLu+XrxRaEh6q7zdPKgBOHTiKq1k=
X-Received: by 2002:a17:90b:3945:b0:2ff:6167:e92d with SMTP id
 98e67ed59e1d1-31250452db1mr15106419a91.32.1748869414142; Mon, 02 Jun 2025
 06:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
 <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com> <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
 <7571c07b-2225-4449-8169-08b044208072@gmail.com> <afaa4102-c876-437a-871d-f6f90697d5f4@windriver.com>
 <CANNYZj-Pa_jhraEz7qAHoDXLxfg-7ztH4UhdRPXirw6biZGWEA@mail.gmail.com> <36532bcc-c9dd-430a-a932-ec81e9270f19@windriver.com>
In-Reply-To: <36532bcc-c9dd-430a-a932-ec81e9270f19@windriver.com>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Mon, 2 Jun 2025 09:03:23 -0400
X-Gm-Features: AX0GCFu6UjshxTh3LUC1TJM_fvyWcFB1_1d7fnhHBTGTxRsSjpWPaOVs_eJeyyA
Message-ID: <CAK6=ix4WrPGEbsfRwEsZz56BJP61OnkjqO8xvcB9BYoNJ2A6RQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: "Shinde, Yash" <Yash.Shinde@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000003045fc0636966462"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 13:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217718

--0000000000003045fc0636966462
Content-Type: text/plain; charset="UTF-8"

Hi Yash,


On Mon, Jun 2, 2025, 07:15 Yash Shinde via lists.openembedded.org
<Yash.Shinde=windriver.com@lists.openembedded.org> wrote:

>
> On 30-05-2025 18:45, Alexander Kanavin wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 30 May 2025 at 14:42, Yash Shinde <Yash.Shinde@windriver.com> <Yash.Shinde@windriver.com> wrote:
>
>
> As Khem mentioned, setting lld = false in config.toml doesn't build LLD.
> Furthermore, using "use-lld = false" ensures that LLD is not used as the
> default linker,
> causing the build to fall back to the system's default linker. This
> restores the earlier behavior.
> Also, the package QA error for rust-lld is not seen with this.
>
> What about build times though? Are they back to what they were?
>
>
> The build time differences on my machine are as follows:
> rust version
> rust upstream builds
> rust-native (yocto build)
> rust target (yocto build)
> v1.85.1
> 10 mins
> 20 mins
> 33 mins
> v1.86.0
> 22 mins (with "lld" and "use-lld" set to "false")
> 30 mins (with default settings i.e lld = true)
>
> 31 mins (with "lld" and
> "use-lld" set to "false") 43 mins (with "lld" and
> "use-lld" set to "false")
>
> Note: The machine being used is a shared resource and fairly busy. Build
> times may differ due to other user's builds.
>
>
> The FS usage is as follows:
> Rust version
> rust upstream builds
> Yocto rust builds
> (build/tmp/work/core2-64-poky-linux/rust/1.86.0/rustc-1.86.0-src/build)
> v1.85.1
> 4.6 G
> 6.3 G
> v1.86.0
> 15 G
> 8.8 G
>
> The latest rust v1.86.0 upgrade changes are available at:
> https://git.yoctoproject.org/poky-contrib/log/?h=harish/rust_1.86.0_v2
>

> Regards,
> Yash
>

Hi Yash


That's good progress. We'll need to think about what, it anything, we're
missing by not building rust-lld. We should run some tests to compare the
link times but that can likely wait until after we get the update merged.


Remaining concerns:



1. Significant increase in FS usage, compile time. Have you looked into why
there's still such a significant increase?

2.  * Enable INHIBIT_PACKAGE_DEBUG_SPLIT/STRIP to fix QA stripping errors.
Fixes: ERROR: rust-1.86.0-r0 do_package: QA Issue: File
'/usr/lib/rustlib/x86_64-poky-linux-gnu/bin/wasm-component-ld' from rust
was already stripped, this will prevent future debugging!
[already-stripped]


Do we use this component? Is it new? Why is it produced without debug
symbols?


I'll take a more careful look at the commit code changes once we have
answers to these questions.

Thanks for your hard work.
Almost done this upgrade hopefully.

Randy

Alex
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217714):
> https://lists.openembedded.org/g/openembedded-core/message/217714
> Mute This Topic: https://lists.openembedded.org/mt/113268009/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003045fc0636966462
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi Yash,</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><br></div><div class=3D"gmail_quote gmail_quote_contai=
ner" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 2, 2025=
, 07:15 Yash Shinde via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;Yash.Shinde=3D<a href=3D"mailto:windriver.com@lists.o=
penembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 30-05-2025 18:45, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Fri, 30 May 2025 at 14:42, Yash Shinde <a href=3D"mailto:Yash.Shinde@win=
driver.com" target=3D"_blank" rel=3D"noreferrer">&lt;Yash.Shinde@windriver.=
com&gt;</a> wrote:

</pre>
      <blockquote type=3D"cite">
        <pre>As Khem mentioned, setting lld =3D false in config.toml doesn&=
#39;t build LLD.
Furthermore, using &quot;use-lld =3D false&quot; ensures that LLD is not us=
ed as the
default linker,
causing the build to fall back to the system&#39;s default linker. This
restores the earlier behavior.
Also, the package QA error for rust-lld is not seen with this.
</pre>
      </blockquote>
      <pre>What about build times though? Are they back to what they were?

</pre>
    </blockquote>
    <p>The build time differences on my machine are as follows:<br>
    </p>
    <table cellpadding=3D"2" cellspacing=3D"2" border=3D"1" width=3D"877" h=
eight=3D"151">
      <tbody>
        <tr>
          <td valign=3D"top">rust version<br>
          </td>
          <td valign=3D"top">rust upstream builds<br>
          </td>
          <td valign=3D"top">rust-native (yocto build)<br>
          </td>
          <td valign=3D"top">rust target (yocto build)<br>
          </td>
        </tr>
        <tr>
          <td valign=3D"top">v1.85.1<br>
          </td>
          <td valign=3D"top">10 mins<br>
          </td>
          <td valign=3D"top">20 mins<br>
          </td>
          <td valign=3D"top">33 mins<br>
          </td>
        </tr>
        <tr>
          <td valign=3D"top">v1.86.0 <br>
          </td>
          <td valign=3D"top">22 mins (with &quot;lld&quot; and &quot;use-ll=
d&quot; set to
            &quot;false&quot;)<br>
            30 mins (with default settings i.e lld =3D true)<br>
            <br>
          </td>
          <td valign=3D"top">31 mins (with &quot;lld&quot; and<br>
            &quot;use-lld&quot; set to &quot;false&quot;)</td>
          <td valign=3D"top">43 mins (with &quot;lld&quot; and<br>
            &quot;use-lld&quot; set to &quot;false&quot;)</td>
        </tr>
      </tbody>
    </table>
    <p>Note: The machine being used is a shared resource and fairly
      busy. Build times may differ due to other user&#39;s builds.<br>
      <br>
      <br>
      The FS usage is as follows:<br>
    </p>
    <table cellpadding=3D"2" cellspacing=3D"2" border=3D"1" width=3D"955" h=
eight=3D"91">
      <tbody>
        <tr>
          <td valign=3D"top">Rust version<br>
          </td>
          <td valign=3D"top">rust upstream builds<br>
          </td>
          <td valign=3D"top">Yocto rust builds
            (build/tmp/work/core2-64-poky-linux/rust/1.86.0/rustc-1.86.0-sr=
c/build)<br>
          </td>
        </tr>
        <tr>
          <td valign=3D"top">v1.85.1<br>
          </td>
          <td valign=3D"top">4.6 G<br>
          </td>
          <td valign=3D"top">6.3 G<br>
          </td>
        </tr>
        <tr>
          <td valign=3D"top">v1.86.0<br>
          </td>
          <td valign=3D"top">15 G<br>
          </td>
          <td valign=3D"top">8.8 G<br>
          </td>
        </tr>
      </tbody>
    </table>
    <p>The latest rust v1.86.0 upgrade changes are available at:<br>
<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dharish/rust_1=
.86.0_v2" target=3D"_blank" rel=3D"noreferrer">https://git.yoctoproject.org=
/poky-contrib/log/?h=3Dharish/rust_1.86.0_v2</a><br></p></div></blockquote>=
</div><div class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div><p><br>
      Regards,<br>
      Yash<br></p></div></blockquote></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><p>Hi Yash=C2=A0</p><p><br></p><p>That&#39;s good progress. W=
e&#39;ll need to think about what, it anything, we&#39;re missing by not bu=
ilding rust-lld. We should run some tests to compare the link times but tha=
t can likely wait until after we get the update merged.=C2=A0</p><p><br></p=
><p>Remaining concerns: </p><p>=C2=A0</p><p>1. Significant increase in FS u=
sage, compile time. Have you looked into why there&#39;s still such a signi=
ficant increase?</p><p>2.=C2=A0=C2=A0* Enable INHIBIT_PACKAGE_DEBUG_SPLIT/S=
TRIP to fix QA stripping errors. Fixes: ERROR: rust-1.86.0-r0 do_package: Q=
A Issue: File &#39;/usr/lib/rustlib/x86_64-poky-linux-gnu/bin/wasm-componen=
t-ld&#39; from rust was already stripped, this will prevent future debuggin=
g! [already-stripped]=C2=A0</p><p><br></p><p>Do we use this component? Is i=
t new? Why is it produced without debug symbols?=C2=A0</p><p><br></p><p>I&#=
39;ll take a more careful look at the commit code changes once we have answ=
ers to these questions.</p></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Thanks for your hard work.=C2=A0</div><div dir=3D"auto">Almost done thi=
s upgrade hopefully.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ran=
dy</div><div dir=3D"auto"><br></div><div class=3D"gmail_quote gmail_quote_c=
ontainer" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><p>
    </p>
    <blockquote type=3D"cite">
      <pre>Alex
</pre>
    </blockquote>
    <pre cols=3D"72"></pre>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#217714): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/217714" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/217714</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113268009/953=
399" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/113268009/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003045fc0636966462--

