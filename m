Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web10.3162.1594804542081678696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 02:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DlZVGcQX;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id n4so378866uae.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wg9Rb03ywJN3RbLMickCDJymyJEdlf5X46niHTIUAjQ=;
        b=DlZVGcQXptKw+4dH6zvVyvo2ejR4Rig6KuI/xMhTl/pVRNNi1/ssav6bqn/Xp5q7Ch
         rTGeKMGJdthgpfBxx/zCVriC419jBfrf2FhydXrduUOzzCr6rBNMEPo3GrboBpPQM1ch
         H1KE5ImH1BP2SXRtf0AEG36OrTq551mu6xvqzIsgn5WkOrrtvxnYegUBwkUz0kPwnrSb
         9IxukWb3Z+HrAqkcOx0+ELY+ekc6ocKTYvAXxdhr1tGfaRLQAnewRpJQPjJjeY4GxIth
         4GP14sBRPTcXGntnknE2Qxa3K9oCNBMb3Sepfe5lOlXVU1RA/ADnmYnAJakfy1JpijFV
         7Vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wg9Rb03ywJN3RbLMickCDJymyJEdlf5X46niHTIUAjQ=;
        b=cEWmWibbdxGG7Z9kpeXSmBTXae0gu7NYQ1sMXn0v2ghMwxYDqcmBKgKbFpGFfKzf7r
         hvIKU7f7JR+1GgG+9VO6rlT1SIlUar0JBzYYJz18eFaY4KyNPWcAxBwek7JknX4FYvwM
         bNPnWcIJhL5JmGMU+06EeMNpdcwPDMtUNW7unm8vwltCTURqYXvif3zKxuiwNunJOPd7
         dntyZhMfO1PIdEIi25u4sCpB4mqIBQkiqKPCDT4AHRUhAyPDmF+YM8H9W/7RfAZzclwS
         5VYE7JJx5ej3jk9A8Jjm4PtBpp+5ArqMuejg2DMkX4hCYsCJVGD7xNT74DAJlcpf4D55
         TxRA==
X-Gm-Message-State: AOAM533LIKemn4fI2BgmVCeXMlIiWly1AiX/YR7ODJTks2ZNYCzLK4Xp
	1o9un1Qz3dFi2Lap3x6rX60rFb4Y5v/qaWDxKLo=
X-Google-Smtp-Source: ABdhPJy5Wb7Cfu+xoj5DQEGqxKCkTHh7vzWpMsaU3mTLro2c2Y7XmjBIvbXMoKihYOXX+Tpt1Rw5FOJBsQnEDcDYeJk=
X-Received: by 2002:ab0:2eab:: with SMTP id y11mr6119012uay.22.1594804541253;
 Wed, 15 Jul 2020 02:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <fb3b732ab791369a2287a3b89e0d125c78f228ca.camel@cisco.com> <20200712213551.2206605-1-takondra@cisco.com>
In-Reply-To: <20200712213551.2206605-1-takondra@cisco.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 15 Jul 2020 11:15:29 +0200
Message-ID: <CANNYZj8QBo7X5qoq3yse8rO3qh47_zTWkm6hkRUng2hHmj+c_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: use host pkg-config only when host provides sdl
To: "Taras Kondratiuk (takondra)" <takondra@cisco.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002aeb2605aa775e33"

--0000000000002aeb2605aa775e33
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 Jul 2020 at 23:35, Taras Kondratiuk via lists.openembedded.org
<takondra=cisco.com@lists.openembedded.org> wrote:

> For example if xkbcommon is present on host, but not in
> buildtools-tarball:
> |
> build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/qemu-4.1.0/qemu-keymap.c:16:10:
> fatal error: xkbcommon/xkbcommon.h: No such file or directory
> |    16 | #include <xkbcommon/xkbcommon.h>
> |       |          ^~~~~~~~~~~~~~~~~~~~~~~
> | compilation terminated.
> | make: ***
> [build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/qemu-4.1.0/rules.mak:69:
> qemu-keymap.o] Error 1
>

Qemu's xkbcommon support is disabled by default via PACKAGECONFIG:
PACKAGECONFIG[xkbcommon] =
"--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"

So why is it then re-enabled? Can you take a closer look at what happens at
configure step? The way I read it, it should skip the whole pkg-config
thing.
(please check on latest master poky)

Alex

--0000000000002aeb2605aa775e33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 12 Jul 2020 at 23:35, Taras Kondr=
atiuk via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;takondra=3D<a href=3D"mailto:cisco.com@lists.openembedded.org">cisc=
o.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">For example if xkbco=
mmon is present on host, but not in<br>
buildtools-tarball:<br>
| build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/qemu-4.1.0/qemu-k=
eymap.c:16:10: fatal error: xkbcommon/xkbcommon.h: No such file or director=
y<br>
|=C2=A0 =C2=A0 16 | #include &lt;xkbcommon/xkbcommon.h&gt;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~=
~~~~~~~~~~~~<br>
| compilation terminated.<br>
| make: *** [build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/qemu-4=
.1.0/rules.mak:69: qemu-keymap.o] Error 1<br></blockquote><div><br></div><d=
iv>Qemu&#39;s xkbcommon support is disabled by default via PACKAGECONFIG:</=
div><div>PACKAGECONFIG[xkbcommon] =3D &quot;--enable-xkbcommon,--disable-xk=
bcommon,libxkbcommon&quot;</div><div><br></div><div>So why is it then re-en=
abled? Can you take a closer look at what happens at configure step? The wa=
y I read it, it should skip the whole pkg-config thing.</div><div>(please c=
heck on latest master poky)<br></div><div><br></div><div>Alex<br></div><div=
>=C2=A0</div></div></div>

--0000000000002aeb2605aa775e33--
