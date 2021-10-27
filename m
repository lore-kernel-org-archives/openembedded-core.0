Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B77C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 21:21:57 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.2673.1635369716060489356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 14:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=guH0lVjv;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id h14so3073773qtb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 14:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vi/beyMJ0/gq4vudEMCPIZ17dPjVVlrnGcYuduTwX3g=;
        b=guH0lVjvPvPCofjJ+kXc9yArgA9u59cq6+Wf4M/Bii59ulP+EOYQ3+6k1YhB2Wk0iW
         f5SjRHZM8XkxqFnlbTZLlE074mIV5fBCUClUCEO48akdtFKU3qrJ+dXWkvonASs4tYpl
         lUZfSfdoMXvvnpE0X6RYoAUiFm4T1aI3B5QEbzeEnnXcBrHGKauX62KWDfZYm0KyIW+6
         AXrT8iviFiDfvo4s10knf4Kj6QrhBfE18hPsIIOKhas3PNZT+P9OZc3jDPTJ49aOLoPt
         1jH1cDl3G4gAKT37qUxUrRkoSY34DXd83BTUAlY1XHs0eBbEbu8uQhiQSixk5tJrEXcF
         DcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vi/beyMJ0/gq4vudEMCPIZ17dPjVVlrnGcYuduTwX3g=;
        b=YcYISUFy4MEIey6jvGtQ0MRZYd+MyNU1nEUtsC4RIAYsgiaeHj38F9Usi3XbfoaO3t
         4QtLSHVTs4aBelhmCxL7pgwug1p810nBaUPWKW0zurfxiVHjT5f4LeaHKq5Jpv9x2UB4
         JC1DNIyeYYXaJ0M8SQ6nn8Qov82qD88mNl6jrVRXfpZINRbHRupqy2A9q0ytLBHL5mV+
         Zf0ObnI9e5OdKUO/rnPYRh/liI5+U/T+/5zRurh50uN9KxNfMibfe+BbvXTmLwlUsB5p
         7aA6oCmdI8VBFzJBygRDXCACZKd9TgF0qMaYeI7OX+KG7gpgUGZaMM6yHEhDKUHqPHEh
         9yaQ==
X-Gm-Message-State: AOAM533CcbxGKAmf97XUfgqgMZfbPYSXvR6Atq8hD60eAFwVX0OmxPFQ
	UPMFttkcOUtfRgodOGTrDm/vUiLXwTAtBDePPfWw9U1M
X-Google-Smtp-Source: 
 ABdhPJzo00L2hNCP2tD17g17f5rgIgwggVI/SCu/jm1aSj6pVw8pPitaUKTaET0/igfEhxLxNa0edKY7bmIrwSZwutw=
X-Received: by 2002:a05:622a:1788:: with SMTP id
 s8mr293058qtk.116.1635369715116;
 Wed, 27 Oct 2021 14:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211027210338.3320083-1-open.source@oleksandr-kravchuk.com>
 <CAMKF1spyTN8SHPdw+OyF5qoOKZfyMmg2zzPOzWBRt2tTJNbZUg@mail.gmail.com>
 <bca08ee4-f424-5eb8-9d1d-5bd22e7971d6@oleksandr-kravchuk.com>
 <CAMKF1sqUNt=aRYX6Wiq1RNPvGYa1CqQJv-S7fH5=iyuutzt+4Q@mail.gmail.com>
 <c5e7c54d-b08f-908c-f60c-d5b54ad66ec4@oleksandr-kravchuk.com>
In-Reply-To: <c5e7c54d-b08f-908c-f60c-d5b54ad66ec4@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Oct 2021 14:21:44 -0700
Message-ID: 
 <CAMKF1sp9QuttCDrpG3sB9m7mMnm_7jhJaJe2eugxT8EqXAEKHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcvt: add recipe
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f2312805cf5c2edb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 21:21:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157574

--000000000000f2312805cf5c2edb
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 2:18 PM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> On 27/10/2021 23:15, Khem Raj wrote:
>
>
>
> On Wed, Oct 27, 2021 at 2:12 PM Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com> wrote:
>
>> On 27/10/2021 23:09, Khem Raj wrote:
>>
>>
>>
>> On Wed, Oct 27, 2021 at 2:03 PM Oleksandr Kravchuk <
>> open.source@oleksandr-kravchuk.com> wrote:
>>
>>> This library is a dependancy of xserver-xorg 21.1.0.
>>>
>>
>> I wonder if we need this to be in core layer though
>>
>> Could you please clarify why it shouldn't if the package that needs is
>> part of the core layer?
>>
>
> I read the dependency in reverse however the next question is that is this
> new dependency or else how did we manage up until this point?
>
> I am sorry if I was not clear enough. This is a dependency of the v21.1.0
> that was released a couple of hours ago. I have started working on
> upgrading xserver-xorg, but since I'm not sure I will have enough patience
> and expertise to finish it, I thought I would at least help with this small
> part.
>

Ok thanks for adding the context, it clarifies it so I guess we can queue
it along with xorg update whenever we do that


>
>>
>>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>>> ---
>>>  .../xorg-lib/libxcvt_0.1.1.bb                 | 19 +++++++++++++++++++
>>>  1 file changed, 19 insertions(+)
>>>  create mode 100644 meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>>>
>>> diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>>> b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>>> new file mode 100644
>>> index 0000000000..628ccfb647
>>> --- /dev/null
>>> +++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>>> @@ -0,0 +1,19 @@
>>> +SUMMARY = "Library providing a standalone version of the X server \
>>> +implementation of the VESA CVT standard timing modelines generator"
>>> +HOMEPAGE = "https://gitlab.freedesktop.org/xorg/lib/libxcvt"
>>> +BUGTRACKER = "https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/issues"
>>> +LICENSE = "MIT"
>>> +LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"
>>> +SECTION = "x11/libs"
>>> +
>>> +SRC_URI = "git://
>>> gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https"
>>> +SRCREV = "6fe840b9295cfdc41bd734586c5b8756f6af6f9b"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +inherit meson
>>> +
>>> +FILES:${PN} = " \
>>> +    ${libdir}/libxcvt.so.0* \
>>> +    ${bindir}/cvt \
>>> +"
>>> --
>>> 2.25.1
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#157569):
>>> https://lists.openembedded.org/g/openembedded-core/message/157569
>>> Mute This Topic: https://lists.openembedded.org/mt/86638516/1997914
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> raj.khem@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>>>

--000000000000f2312805cf5c2edb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 27, 2021 at 2:18 PM Oleksandr Kravchuk &lt;<a h=
ref=3D"mailto:open.source@oleksandr-kravchuk.com">open.source@oleksandr-kra=
vchuk.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div>
    <div>On 27/10/2021 23:15, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27, 2021 at 2:1=
2
            PM Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksan=
dr-kravchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&g=
t;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
            <div>
              <div>On 27/10/2021 23:09, Khem Raj wrote:<br>
              </div>
              <blockquote type=3D"cite">
                <div><br>
                </div>
                <div><br>
                  <div class=3D"gmail_quote">
                    <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27,
                      2021 at 2:03 PM Oleksandr Kravchuk &lt;<a href=3D"mai=
lto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.source@oleks=
andr-kravchuk.com</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">This
                      library is a dependancy of xserver-xorg 21.1.0.<br>
                    </blockquote>
                    <div dir=3D"auto"><br>
                    </div>
                    <div dir=3D"auto">I wonder if we need this to be in
                      core layer though</div>
                  </div>
                </div>
              </blockquote>
              Could you please clarify why it shouldn&#39;t if the package
              that needs is part of the core layer?</div>
          </blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">I read the dependency in reverse however the
            next question is that is this new dependency or else how did
            we manage up until=C2=A0this point? <br>
          </div>
        </div>
      </div>
    </blockquote>
    I am sorry if I was not clear enough. This is a dependency of the
    v21.1.0 that was released a couple of hours ago. I have started
    working on upgrading xserver-xorg, but since I&#39;m not sure I will
    have enough patience and expertise to finish it, I thought I would
    at least help with this small part.</div></blockquote><div dir=3D"auto"=
><br></div><div dir=3D"auto">Ok thanks for adding the context, it clarifies=
 it so I guess we can queue it along with xorg update whenever we do that=
=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 dir=3D"auto"></div><div><br>
    <blockquote type=3D"cite">
      <div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
            <div dir=3D"auto"> </div>
            <div>
              <blockquote type=3D"cite">
                <div>
                  <div class=3D"gmail_quote">
                    <div dir=3D"auto"><br>
                    </div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
                      Signed-off-by: Oleksandr Kravchuk &lt;<a href=3D"mail=
to:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.source@oleksa=
ndr-kravchuk.com</a>&gt;<br>
                      ---<br>
                      =C2=A0.../xorg-lib/<a href=3D"http://libxcvt_0.1.1.bb=
" rel=3D"noreferrer" target=3D"_blank">libxcvt_0.1.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0
                      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++++=
++++++++++++<br>
                      =C2=A01 file changed, 19 insertions(+)<br>
                      =C2=A0create mode 100644
                      meta/recipes-graphics/xorg-lib/<a href=3D"http://libx=
cvt_0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">libxcvt_0.1.1.bb</a><br>
                      <br>
                      diff --git a/meta/recipes-graphics/xorg-lib/<a href=
=3D"http://libxcvt_0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">libxcvt_0=
.1.1.bb</a>
                      b/meta/recipes-graphics/xorg-lib/<a href=3D"http://li=
bxcvt_0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">libxcvt_0.1.1.bb</a><b=
r>
                      new file mode 100644<br>
                      index 0000000000..628ccfb647<br>
                      --- /dev/null<br>
                      +++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http:=
//libxcvt_0.1.1.bb" rel=3D"noreferrer" target=3D"_blank">libxcvt_0.1.1.bb</=
a><br>
                      @@ -0,0 +1,19 @@<br>
                      +SUMMARY =3D &quot;Library providing a standalone ver=
sion
                      of the X server \<br>
                      +implementation of the VESA CVT standard timing
                      modelines generator&quot;<br>
                      +HOMEPAGE =3D &quot;<a href=3D"https://gitlab.freedes=
ktop.org/xorg/lib/libxcvt" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.freedesktop.org/xorg/lib/libxcvt</a>&quot;<br>
                      +BUGTRACKER =3D &quot;<a href=3D"https://gitlab.freed=
esktop.org/xorg/lib/libxcvt/-/issues" rel=3D"noreferrer" target=3D"_blank">=
https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/issues</a>&quot;<br>
                      +LICENSE =3D &quot;MIT&quot;<br>
                      +LIC_FILES_CHKSUM =3D <a>&quot;file://COPYING;md5=3D1=
29947a06984d6faa6f9a9788fa2a03f&quot;</a><br>
                      +SECTION =3D &quot;x11/libs&quot;<br>
                      +<br>
                      +SRC_URI =3D &quot;<a>git://</a><a href=3D"http://git=
lab.freedesktop.org/xorg/lib/libxcvt.git;protocol=3Dhttps" rel=3D"noreferre=
r" target=3D"_blank">gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=
=3Dhttps</a>&quot;<br>
                      +SRCREV =3D
                      &quot;6fe840b9295cfdc41bd734586c5b8756f6af6f9b&quot;<=
br>
                      +<br>
                      +S =3D &quot;${WORKDIR}/git&quot;<br>
                      +<br>
                      +inherit meson<br>
                      +<br>
                      +FILES:${PN} =3D &quot; \<br>
                      +=C2=A0 =C2=A0 ${libdir}/libxcvt.so.0* \<br>
                      +=C2=A0 =C2=A0 ${bindir}/cvt \<br>
                      +&quot;<br>
                      -- <br>
                      2.25.1<br>
                      <br>
                      <br>
                      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                      Links: You receive all messages sent to this
                      group.<br>
                      View/Reply Online (#157569): <a href=3D"https://lists=
.openembedded.org/g/openembedded-core/message/157569" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/=
157569</a><br>
                      Mute This Topic: <a href=3D"https://lists.openembedde=
d.org/mt/86638516/1997914" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/mt/86638516/1997914</a><br>
                      Group Owner: <a href=3D"mailto:openembedded-core%2Bow=
ner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lists=
.openembedded.org</a><br>
                      Unsubscribe: <a href=3D"https://lists.openembedded.or=
g/g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-core/unsub</a>
                      [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bla=
nk">raj.khem@gmail.com</a>]<br>
                      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                      <br>
                    </blockquote>
                  </div>
                </div>
              </blockquote>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </div>
</blockquote></div></div>

--000000000000f2312805cf5c2edb--

