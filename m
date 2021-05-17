Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web10.17527.1621252020136549047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 04:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J42kqyCb;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 184so775140vkz.13
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YLkGbpGemAZf3WTlXKzRAPYwVIuMD5wNPkWuGQz8vM4=;
        b=J42kqyCb314L7sigdCv98ov4AZHBUbXSWOjL0fx+AsXPJRi2dm0UF3vrWZnOE6gNPK
         qIzqkks+jqglzimtOHvTT3RpGBVYvk1ZNV/rq2o6eRtQHIJe+/l9RJS4AQVFT1LHLNv1
         EM2MfM3fElc3EjxciyvavO6ycycFw0o4ix53m3/jAWF29yI+EmxwBgJwTsTHIjlGNbCG
         UV7g67sjYPrCEj4Di10D0c+mJXeoKb7cL6O42/Mp7PR77z8s97z//AOBOZG+9amBev4d
         MLygi4lRT5vceEwEK0JnPlQSAn9CLobOc/ADIMt9gSoErAbiZLuj3J9/3eUFRQjD87t/
         Gh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YLkGbpGemAZf3WTlXKzRAPYwVIuMD5wNPkWuGQz8vM4=;
        b=irWpx76yl83/V3KIWRa0v7QJErzrKVeJTRaMfzBl6QrVLYpCpUVTmeR3g009PJ6Lnf
         zcZu+2EBD2YFn26uvTFKxgfHyvtltBos4J53OOdHODS/xuBvFpxDFRDu0irQDG7l89eR
         1h4a6dHjqZgbDcFqXy1Z8m8x5Hpp/OVSrJMG2ujFR9HqHe/uDAE/T3Pbp+DdhtMvd2ej
         us6SSO3cH2onazhHzHIPIvFW6J+beK+DjrpEWMHfv5/dWi2sgFMf9kXIhKOTnYDFBCbU
         MljBERjzOfvDOtZPfIy+VVs5vobq6um5zI0kd79vOnusUK/elqKhufclswjeTYW2WLAg
         IzHQ==
X-Gm-Message-State: AOAM533NdbPSRxTcr3egArkLSSLAiBgYfMiBpzoAX8oVmycACd2nCbj3
	SVLn+SGjyQgIOr9I6cvLDvV+1SoPZzqlZQji+7s=
X-Google-Smtp-Source: ABdhPJyW7JJSItc+WzCCby329oH3ClJj9o1BLHoi3DSE6wHub4cSSX06oSJrNViSqpSGYz4E8clKYI/6Vs3NcOD/r04=
X-Received: by 2002:a1f:9d46:: with SMTP id g67mr45931001vke.10.1621252019322;
 Mon, 17 May 2021 04:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-6-vinay.m.engg@gmail.com>
 <CANNYZj8jNE92Ct9541GmLzmmNwgrJ2UOEC4=jQstwyi12PBMpw@mail.gmail.com> <CANUMPcWJiKAKbw=UHkPd=T3TzTt4fmNwTya6hMZRbewUXdL2wQ@mail.gmail.com>
In-Reply-To: <CANUMPcWJiKAKbw=UHkPd=T3TzTt4fmNwTya6hMZRbewUXdL2wQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 17 May 2021 13:46:48 +0200
Message-ID: <CANNYZj9C0DRCtsMjfr7DDTBqzSJpHSY+FGYx7-Sn2i5kdqNCUw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="000000000000b4013805c28526c5"

--000000000000b4013805c28526c5
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 May 2021 at 13:34, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> "remote-test-server" on qemu-image with a tap interface throws an error.
> The emulators for rust testing are with tcp port forwarding so used
> slirp method with added rust port.


I'm not sure I understand - what kind of error? In both cases the server
starts listening on a port, so in slirp scenario the address is
127.0.0.1:12345 (prone to breakage if something else on the build host took
that port btw, including another instance of the same test), in tap it
would be 192.168.7.2:12345. For the client you simply supply that via
TEST_DEVICE_ADDR. No?

Alex

--000000000000b4013805c28526c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 17 May 2021 at 13:34, Vinay Kumar &lt;<a href=3D"mailto:vina=
y.m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&quot;remote-te=
st-server&quot; on qemu-image with a tap interface throws an error.<br>
The emulators for rust testing are with tcp port forwarding so used<br>
slirp method with added rust port.</blockquote><div><br></div>I&#39;m not s=
ure I understand - what kind of error? In both cases the server starts list=
ening on a port, so in slirp scenario the address is <a href=3D"http://127.=
0.0.1:12345" target=3D"_blank">127.0.0.1:12345</a> (prone to breakage if so=
mething else on the build host took that port btw, including another instan=
ce of the same test), in tap it would be <a href=3D"http://192.168.7.2:1234=
5" target=3D"_blank">192.168.7.2:12345</a>. For the client you simply suppl=
y that via TEST_DEVICE_ADDR. No?</div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">Alex<br></div></div>

--000000000000b4013805c28526c5--
