Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.658.1592849538082352285
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WkZCavN9;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id p7so1081734qvl.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vW5kuTyHBfzDMryl4gDbbsteGWj+pJ6styXJwrRdiw8=;
        b=WkZCavN92q496clA1OPeyZIs0FbsSV4nmDMsAfuCRyKY5HMCDBAVshSS7lCKSTzSyF
         fpFxLpgjO2XySQVD75bN22E6PySV1q4V7z8LTFC8XmS4UUWgzNy6o8/geyvcSY66YDcs
         2CPwOw52C3ZBaJm/bebEhvdO4/PtQoj6YNlKjzRQj3Pxoa6rt1wN38qlfswucV4ZQ9bP
         HHRQb1cO3/yB4G9s4hk2pilA1motc7UE5HA7AsLoeHYv97M9X1g3ZOP8MlK1v+Nxfyi8
         x9r3n1Dm3ZFYXjk2XNdPm708FN2ccMv4VeJTojkCoo05ST/qvtkjnCjFMmGH/RzYF0/4
         DdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vW5kuTyHBfzDMryl4gDbbsteGWj+pJ6styXJwrRdiw8=;
        b=CC2mk8dmFac2BJOD/xU5J+sOykJiHdMVxskGA7gmZNzSJ5uX+XSSchGGvBpbSo3jt+
         KcRm13aOPLxVyz2paC9QaXfBHWULpI9LOUJ2U+RJu0gopW3HaIboJGO4ce2rHvw+NROt
         W/CnKHwSpBqJjyScHGXH7xoAeob68Xn2nV9QzgaL0eihUYLjEpqKiQ8FrP8XiZ3l2BRS
         WJczlspm+8mMgq67ob0CG0MF4BmmzuyeXcPT0oAI1snZt1oGTgRvm1JrRZAdr71Cbs8E
         94jWOFLAfioeIvzfoA9Xzbhxm9wgWADwws/dhjccIc8Zr7aUATcZTw5OyNp/pb4Cx076
         lOoA==
X-Gm-Message-State: AOAM533qmTy9hMwof98kTZQ1xRGykO28DtnRtQ9fZhDpjT851kYUMvD6
	4lkjG9/f2CeyH4O7s+3FWdsCkw7JO/Zwea2SEIImaXD5
X-Google-Smtp-Source: ABdhPJyS41EZTlhAAz2yNeiw6oYj9Hh+ysDVc5wSRIQcbrvK9fcBfekzw4MAaQr+40++SIC7KdZdrchyUlVNU7loLTI=
X-Received: by 2002:ad4:482c:: with SMTP id h12mr2930944qvy.146.1592849537072;
 Mon, 22 Jun 2020 11:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <HwH9.1592848739113991729.4KYH@lists.openembedded.org>
In-Reply-To: <HwH9.1592848739113991729.4KYH@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 22 Jun 2020 11:12:06 -0700
Message-ID: <CAMKF1srh_irBczqSkJo8jcqFc6aLWJZp1zEChz=0F8djZ=ecYA@mail.gmail.com>
Subject: Re: [OE-core] package bzip2-ptest requires /usr/bin/sh, but no providers found in RDEPENDS_bzip2-ptest
To: Rahul Kumar <rahulk@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d682d405a8b02efb"

--000000000000d682d405a8b02efb
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 22, 2020 at 10:59 AM Rahul Kumar <rahulk@mvista.com> wrote:

> Hi community members,
>
> I am working on Yocto Newcommer Bug 13444 - Add test suite for bzip2
> Patch link
> https://patchwork.openembedded.org/patch/173009/
>
> but upstream build, reported below error .
> step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue:
> /usr/lib/bzip2/ptest/bzip2-tests/.git/hooks/update.sample contained in
> package bzip2-ptest requires /usr/bin/sh, but no providers found in
> RDEPENDS_bzip2-ptest? [file-rdeps]
>

Create a patch to update.sample where it asks for /bin/sh instead


step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal errors.
> Please consider fixing them.
>
> I am already using below line to my patch.
> RDEPENDS_${PN}-ptest += "make bash perl"
>
> can anyone please help me on this.
>
>
> 
>

--000000000000d682d405a8b02efb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jun 22, 2020 at 10:59 AM Rahul Kumar &lt;<a href=
=3D"mailto:rahulk@mvista.com">rahulk@mvista.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div>
<div>Hi community members,</div>
<div><br>I am working on Yocto Newcommer Bug 13444 - Add test suite for bz=
ip2</div>
<div>Patch link</div>
<div><a href=3D"https://patchwork.openembedded.org/patch/173009/" target=
=3D"_blank">https://patchwork.openembedded.org/patch/173009/</a></div>
<div>=C2=A0</div>
<div>but upstream build, reported below error .</div>
<div>step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA Issue: /usr/lib/bzip2=
/ptest/bzip2-tests/.git/hooks/update.sample contained in package bzip2-ptes=
t requires /usr/bin/sh, but no providers found in RDEPENDS_bzip2-ptest? [fi=
le-rdeps]</div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Create a patch to update.sample where it asks for /bin/sh instead=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div><div></div>
<div>step1b: ERROR: bzip2-1.0.8-r0 do_package_qa: QA run found fatal error=
s. Please consider fixing them.</div>
<div>=C2=A0</div>
<div>I am already using below line to my patch.=C2=A0</div>
<div>RDEPENDS_${PN}-ptest +=3D &quot;make bash perl&quot;</div>
<div>=C2=A0</div>
<div>can anyone please help me on this.</div>
</div>
<div>
<div>=C2=A0</div>
<div>=C2=A0</div>
</div>
<br>
</blockquote></div></div>

--000000000000d682d405a8b02efb--
