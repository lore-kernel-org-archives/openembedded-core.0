Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web12.4877.1594413079885468124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 13:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rimkGmiE;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id u133so3669811vsc.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 13:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ry8Hr0HLGeftR/f7QREAJfn7P5qbVfcYnRF7rDXIo7g=;
        b=rimkGmiEDsl30xT8Qlr1co6zpXqMdf0xtQDGmkijqqoS/15ZbRL3RRDnyOxQm9uEFY
         agUuRasNapl50YkuzCeRtBJ1Ryc+n60NTpwt45Y7Q1wE7J9Fu8kfsYDqyV+1cZ8yaSlY
         D2gZd9ymu43vK7XD0g9hPPOCdB+YDfpaYhCGLm1cLzfMvrbGVDcL8nSazw65AIjZmfzT
         qy0tQRBcPtNBThNe04xnDvQPJDKaPqWrHaHRB7/LqVcetCRvggxxaQvyzI8X9LyLhmyM
         VzBm1ELT5rdaRQEw58sdDjewJjMSUmItZn04h+Azguql5J1lJ+RCkxWwoeVvLWSvGEa8
         qCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ry8Hr0HLGeftR/f7QREAJfn7P5qbVfcYnRF7rDXIo7g=;
        b=miZfRCcBJNCX8iybqTei2LP8sLx9qo5pbaYAlN1iHWsA5+WlP0JjJZSUqIdASn64gL
         fLTKS76cEL+1IK6OkmVSXP6BMjMBGhl9QZPP29Me3UNeQp6ZSyTznxD4wsJtTbIqRwBR
         QOvv3rehFtLdppQ9j38AG0Ry662f9VUsrbhzn80hCYW/5fZkNX6qdfyyQV7QM2Ye7vub
         Z/4+/dC8CLEU7WuvdJPt4jfNn0JNFpzFS9UklsZuC520Rx/5yAuGUXFhoTj2o5e/LNOS
         L0fKod80LbqQ8aAQc8s/VWmD5xtS2KhxbLQswLR0rOBOndvz+Fn/f3b+Wx8tN5y3tgwi
         OVZw==
X-Gm-Message-State: AOAM531X0/2Rl+ZrhJdX302kb2MSlJFToZXwNTcAgL4SISDBHyYHUGWn
	Oj+WUn0shNTwftSXd85gKJlnteQUR9AycuH6El0=
X-Google-Smtp-Source: ABdhPJx/wg/6plSW+8fb+TWvQq45b6DyRAJEs6u27WgjEkd3zW9e1BkMxS78LmWd4gK+CvB72lyA3MxT57Mt13GLom8=
X-Received: by 2002:a67:330e:: with SMTP id z14mr44545529vsz.94.1594413079083;
 Fri, 10 Jul 2020 13:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200710174813.1963559-1-takondra@cisco.com> <39c5bc9fcf056d93a42833d113521f524f063d33.camel@linuxfoundation.org>
 <3a687673e39fd52a6314e5e0036b0f55a3498c39.camel@cisco.com> <95953e8828dc1c46448d6c880228cf0b3b91c5e8.camel@linuxfoundation.org>
In-Reply-To: <95953e8828dc1c46448d6c880228cf0b3b91c5e8.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 10 Jul 2020 22:31:07 +0200
Message-ID: <CANNYZj8jA+14e_he7guz4ArvAs-C=-c++kLHKhzq043ZtZEiJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: access host pkg-config via HOSTTOOLS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Taras Kondratiuk (takondra)" <takondra@cisco.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"cristian.iorga@intel.com" <cristian.iorga@intel.com>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Content-Type: multipart/alternative; boundary="00000000000034401805aa1c3976"

--00000000000034401805aa1c3976
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2020 at 21:11, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Another is that if its using nativesdk-pkgconfig from buildtools, does
> this break the reason we have this code in the first place (to allow
> qemu to use the host GL for virtgl)? Presumably that is not in
> buildtools...
>

I think fall-through to host pkg-config was there to allow usage of host
libsdl? I think you wanted to keep that in as an example of how to do such
a thing, when I previously proposed removal of it.

Alex

--00000000000034401805aa1c3976
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 10 Jul 2020 at 21:11, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
Another is that if its using nativesdk-pkgconfig from buildtools, does<br>
this break the reason we have this code in the first place (to allow<br>
qemu to use the host GL for virtgl)? Presumably that is not in<br>
buildtools...<br></blockquote><div><br></div><div>I think fall-through to h=
ost pkg-config was there to allow usage of host libsdl? I think you wanted =
to keep that in as an example of how to do such a thing, when I previously =
proposed removal of it. <br></div><div><br></div><div>Alex<br></div></div><=
/div>

--00000000000034401805aa1c3976--
