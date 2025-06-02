Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE5BC54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 17:10:17 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.847.1748884211214702266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 10:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OtCIQ0Y1;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70e767ce72eso46288397b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 10:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748884210; x=1749489010; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6+TL3YNPzqy9qMlrVor8yHDSwZc0t0GdBCbm2GZA2E=;
        b=OtCIQ0Y1comTYJEiJPXRrfEcgVVwT0p33R3cWMUE/uFgZsbB+fP7AkO1jpeN4nqhVu
         qtGGo0vOdPshf/e46/Q6QqqefL8IEXICe6z8I6c5M9itmrZgKOcJkeY44uCQYX9dCIck
         Fbwy+FFFf+roQoXSEJtrp/rjq52YLwtRPiwDOu7KymX65UzAQd/EnLT48H1aC9s4uwp9
         SNdlZJZgxkUgKTdm/WB7UpgsZsHqslH+lUuc0FjiUxQQgvZrq89L1x/2UNEnYPnjrnU/
         emsQne0WaLI0XtRKwAfw6gHN7z5leQa3MSPfw/Vsj1GWdsp5OPRx4IBMU8h5eZFSsCEC
         KnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748884210; x=1749489010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6+TL3YNPzqy9qMlrVor8yHDSwZc0t0GdBCbm2GZA2E=;
        b=guCIZy+u+a82Wf0cNnv+A9fdax4AjPDj4OQan8vXmXmqRIu1zUo6J3OCkwpe8Ycsuk
         2xvGZP7ZyRBO9PCdurNx2aGftoiEbsDE6XEg/+YAnzwpO2k4es5/BnD7UDRUMFdnxSoE
         40+9+Osrmh9j4Cpb8+/+/nhUtyd3L5eBTjPeW3R1Mopdy7QUhix8lorIYzpyZoq0n3/H
         rZSOa2atgAX4kk7gtTF/EsZX12U7HNjykhmLK8gB1BYLvDZdYsylBxp2O3ZqLo5U1cc6
         9HPLLijbL/yK27OpNhszQt3eOWFP8fThTdfv4/DRuXlK2NDagaTglFmJ7oWYjm6SFDmL
         NrIA==
X-Forwarded-Encrypted: i=1; AJvYcCVLvgrNR7PwGrXlf0kcPdW4ClnGuRqsGveyvObAMWWqtYCVXRqmMfuA83oGZws6Lpnctjjm2iiJKxjlWNymfP3MqA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzAqfjnALfhIIHvmT6DUOT/SRKQENJ/xshPPVyAQvmhlh5aOPm
	Zq+EPfGD/7QUyy8ogJWtwYDHGAZCJCB1kqhAlXp8wmLSY2KrtjRLsc8fdNxXsmsLAicygRl2Q51
	rHqwei6ejAJMhywG+k06+Hk5Qe8zwI/s=
X-Gm-Gg: ASbGncsWbqPyzmHE4ZnvN3grnwOztQ562d2nnSjyssCq4i/SPieWasdWBNZuepLYFBF
	R8qkYmW8wWpmDbaOJs7DM6t7oU3xvCenoLGECx7p3pg+qU1NOT8JureIHQBMhC1pfYqcxvFq+ad
	7uUphY1v+rwp99t4oGCTCqmhfSZauRWlQ=
X-Google-Smtp-Source: AGHT+IGPJOToVeyuBrW18gs/HX4RShCUauFOcwfltSVElVE0z4dAVxgM5YI4yKG5SSoSDgpbCfOO9CDtEhnPU+b6zpA=
X-Received: by 2002:a05:690c:f10:b0:70e:a1e:d9f8 with SMTP id
 00721157ae682-71057cf3df4mr185953097b3.22.1748884210122; Mon, 02 Jun 2025
 10:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
 <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com> <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
 <7571c07b-2225-4449-8169-08b044208072@gmail.com> <afaa4102-c876-437a-871d-f6f90697d5f4@windriver.com>
 <CANNYZj-Pa_jhraEz7qAHoDXLxfg-7ztH4UhdRPXirw6biZGWEA@mail.gmail.com>
 <36532bcc-c9dd-430a-a932-ec81e9270f19@windriver.com> <CAK6=ix4WrPGEbsfRwEsZz56BJP61OnkjqO8xvcB9BYoNJ2A6RQ@mail.gmail.com>
In-Reply-To: <CAK6=ix4WrPGEbsfRwEsZz56BJP61OnkjqO8xvcB9BYoNJ2A6RQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jun 2025 10:09:43 -0700
X-Gm-Features: AX0GCFvBobDaf4GlKOOgyPNtTsRuAmfy3_0sr3JKu2HRkTWouUVyqwyj7dFf05c
Message-ID: <CAMKF1spgaYyyYOs633Lr_0EMq=vmixOXLDa4Q2ivb9PJy0BY8A@mail.gmail.com>
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Randy MacLeod <rwmacleod@gmail.com>
Cc: "Shinde, Yash" <Yash.Shinde@windriver.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000001908a7063699d6a5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 17:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217723

--0000000000001908a7063699d6a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 6:03=E2=80=AFAM Randy MacLeod <rwmacleod@gmail.com> =
wrote:

> Hi Yash,
>
>
> On Mon, Jun 2, 2025, 07:15 Yash Shinde via lists.openembedded.org
> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
>>
>> On 30-05-2025 18:45, Alexander Kanavin wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Fri, 30 May 2025 at 14:42, Yash Shinde <Yash.Shinde@windriver.com> <Y=
ash.Shinde@windriver.com> wrote:
>>
>>
>> As Khem mentioned, setting lld =3D false in config.toml doesn't build LL=
D.
>> Furthermore, using "use-lld =3D false" ensures that LLD is not used as t=
he
>> default linker,
>> causing the build to fall back to the system's default linker. This
>> restores the earlier behavior.
>> Also, the package QA error for rust-lld is not seen with this.
>>
>> What about build times though? Are they back to what they were?
>>
>>
>> The build time differences on my machine are as follows:
>> rust version
>> rust upstream builds
>> rust-native (yocto build)
>> rust target (yocto build)
>> v1.85.1
>> 10 mins
>> 20 mins
>> 33 mins
>> v1.86.0
>> 22 mins (with "lld" and "use-lld" set to "false")
>> 30 mins (with default settings i.e lld =3D true)
>>
>> 31 mins (with "lld" and
>> "use-lld" set to "false") 43 mins (with "lld" and
>> "use-lld" set to "false")
>>
>> Note: The machine being used is a shared resource and fairly busy. Build
>> times may differ due to other user's builds.
>>
>>
>> The FS usage is as follows:
>> Rust version
>> rust upstream builds
>> Yocto rust builds
>> (build/tmp/work/core2-64-poky-linux/rust/1.86.0/rustc-1.86.0-src/build)
>> v1.85.1
>> 4.6 G
>> 6.3 G
>> v1.86.0
>> 15 G
>> 8.8 G
>>
>> The latest rust v1.86.0 upgrade changes are available at:
>> https://git.yoctoproject.org/poky-contrib/log/?h=3Dharish/rust_1.86.0_v2
>>
>
>> Regards,
>> Yash
>>
>
> Hi Yash
>
>
> That's good progress. We'll need to think about what, it anything, we're
> missing by not building rust-lld. We should run some tests to compare the
> link times but that can likely wait until after we get the update merged.
>
>
> Though the internet has some information on lld improvements having this
in OE context will be valuable.
I also think disabling lld is going to give us some reprieve. As more
targets in rust seem to use it by default we need to consider that we do
not start disabling defaults and wear off from upstream.


> Remaining concerns:
>
>
>
> 1. Significant increase in FS usage, compile time. Have you looked into
> why there's still such a significant increase?
>
> 2.  * Enable INHIBIT_PACKAGE_DEBUG_SPLIT/STRIP to fix QA stripping errors=
.
> Fixes: ERROR: rust-1.86.0-r0 do_package: QA Issue: File
> '/usr/lib/rustlib/x86_64-poky-linux-gnu/bin/wasm-component-ld' from rust
> was already stripped, this will prevent future debugging!
> [already-stripped]
>
>
> Do we use this component? Is it new? Why is it produced without debug
> symbols?
>
>
> I'll take a more careful look at the commit code changes once we have
> answers to these questions.
>
> Thanks for your hard work.
> Almost done this upgrade hopefully.
>
> Randy
>
> Alex
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#217714):
>> https://lists.openembedded.org/g/openembedded-core/message/217714
>> Mute This Topic: https://lists.openembedded.org/mt/113268009/953399
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> rwmacleod@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000001908a7063699d6a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 2, =
2025 at 6:03=E2=80=AFAM Randy MacLeod &lt;<a href=3D"mailto:rwmacleod@gmail=
.com">rwmacleod@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto">Hi Yash,</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div class=3D"gmail=
_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 2, 2=
025, 07:15 Yash Shinde via <a href=3D"http://lists.openembedded.org" target=
=3D"_blank">lists.openembedded.org</a> &lt;Yash.Shinde=3D<a href=3D"mailto:=
windriver.com@lists.openembedded.org" target=3D"_blank">windriver.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><u></u>

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
driver.com" rel=3D"noreferrer" target=3D"_blank">&lt;Yash.Shinde@windriver.=
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
.86.0_v2" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org=
/poky-contrib/log/?h=3Dharish/rust_1.86.0_v2</a><br></p></div></blockquote>=
</div><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div><p><br>
      Regards,<br>
      Yash<br></p></div></blockquote></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><p>Hi Yash=C2=A0</p><p><br></p><p>That&#39;s good progress. W=
e&#39;ll need to think about what, it anything, we&#39;re missing by not bu=
ilding rust-lld. We should run some tests to compare the link times but tha=
t can likely wait until after we get the update merged.=C2=A0</p><p><br></p=
></div></div></blockquote><div>Though the internet has some information on =
lld improvements having this in OE context will be valuable.</div><div>I al=
so think disabling lld is going to give us some reprieve. As more targets i=
n rust seem to use it by default we need to consider that we do not start d=
isabling defaults and wear off from upstream.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"au=
to"><p></p><p>Remaining concerns: </p><p>=C2=A0</p><p>1. Significant increa=
se in FS usage, compile time. Have you looked into why there&#39;s still su=
ch a significant increase?</p><p>2.=C2=A0=C2=A0* Enable INHIBIT_PACKAGE_DEB=
UG_SPLIT/STRIP to fix QA stripping errors. Fixes: ERROR: rust-1.86.0-r0 do_=
package: QA Issue: File &#39;/usr/lib/rustlib/x86_64-poky-linux-gnu/bin/was=
m-component-ld&#39; from rust was already stripped, this will prevent futur=
e debugging! [already-stripped]=C2=A0</p><p><br></p><p>Do we use this compo=
nent? Is it new? Why is it produced without debug symbols?=C2=A0</p><p><br>=
</p><p>I&#39;ll take a more careful look at the commit code changes once we=
 have answers to these questions.</p></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Thanks for your hard work.=C2=A0</div><div dir=3D"auto">Almos=
t done this upgrade hopefully.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Randy</div><div dir=3D"auto"><br></div><div class=3D"gmail_quote" di=
r=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><p>
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
.org" rel=3D"noreferrer" target=3D"_blank">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" rel=3D"noreferrer" target=3D"_blank">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000001908a7063699d6a5--

