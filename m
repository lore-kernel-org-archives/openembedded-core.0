Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web12.9991.1628699563946234585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 09:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OABjWHOx;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id b7so1430600uav.11
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FdlraOgeghgphQqZUWhhRQnShyGZkOv1q3EQ9WqnoJs=;
        b=OABjWHOxQzcEsJVTT16X85VC1Pp9/bB9vcCN4AHc6fQjv+Y75qDT27hsLa+vO7DZXS
         SRpLT7QvOq81OE6qWh4QSoolI8mlO42CRn3mJwS9zhqADyKB1EXx8vtblpVINFUSVWR/
         uA3hqRfL9t7gRUW8FOS696mTJvC2d+bLQ5xzHHyG0AV9vBSs9VAmewbGlveA0EdhvfRl
         xSn41s8L5KnrAyQc15kWWkhz1X7bM+5qcHYTsywtiXJnM0TNK2k39lrkbmz8AkD6OfEp
         7zQ5rV43iSfhTQye7AE6VaSMQBP/k8geunh7ttsEPY9bzKFWMggp//CuBlNEcA69hnf9
         GJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FdlraOgeghgphQqZUWhhRQnShyGZkOv1q3EQ9WqnoJs=;
        b=lfVspMVKmGjW8BsyLouH03SH4mMSIy0s/7yWM2tjiUzFaodb86TM4iJ/bnGLoegdWO
         NTYiCWtikZh5Wml4C11jynq2tEfEqMsx9RGO+oM0GQux9HAPcr/drkwH07/zGwx+13iq
         oeHuoSdKlayBws9W1C3NYqP6K8iI4/HoHW6dR07MsCE+2bwjRO4dnPbBfVtIu9vyqpEK
         jr390jUGikIZP2+9LUhYAGgEPv791lRo96NVTzZ06GaKVN8Qk9NlWKB1qw+ZmXmpdITC
         OFKG4Rq7NGCbq3nWMukv+Y5UNQXAq2tcfNLigW8090MVGs1GlmGhNs6S4sWnhqX30gYG
         T/gA==
X-Gm-Message-State: AOAM530Q5l1eOgVl1U2pGWjCo5jfFBkb9RMJz5bIULwztm+ECnzqPCnX
	A1qv5BXCbtGDIg2PvJFDqfJ0dDSSEc/SCFYUvTY=
X-Google-Smtp-Source: ABdhPJw0VQBCD+3CyaCwWPGvKoiQOBzKkf/U67IHfaCDXvnVYO0e4NXzfxaj79piepjcv90Kh88AkFsq5j7vOQDcnVU=
X-Received: by 2002:ab0:60c9:: with SMTP id g9mr27183762uam.100.1628699563016;
 Wed, 11 Aug 2021 09:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210803051138.30790-1-qiang.zhang@windriver.com>
 <CAAnfSTtD=Vz-3SY0UYBh62en9Z_WMzWP7iRQPynmJPmCR+PiHQ@mail.gmail.com>
 <CANNYZj9y7qXt92w0hfkWJufJ=7i6m8ddDcNfNzOJCUw+Ci_a+Q@mail.gmail.com> <20210811161449.GA7254@mcrowe.com>
In-Reply-To: <20210811161449.GA7254@mcrowe.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 11 Aug 2021 18:32:31 +0200
Message-ID: <CANNYZj-am4poZ6hahsUw5R3He8hny5EP7CLXRQSLXRP2TCVR-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: use monotonic clock for condvar if possible
To: Mike Crowe <mac@mcrowe.com>
Cc: Ross Burton <ross@burtonini.com>, "Zhang, Qiang" <qiang.zhang@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e6465605c94b2a22"

--000000000000e6465605c94b2a22
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Aug 2021 at 18:14, Mike Crowe <mac@mcrowe.com> wrote:

> I agree regarding the lack of explanation. However, even if the problem is
> real (which it looks like it is based on
> https://bugs.python.org/issue41710)
> then it wouldn't be expected to cause test failures unless the system clock
> was being warped at inconvenient times during the tests.
>

So can we just patch python to use the right glibc function with the right
clock type, and send the patch upstream then? Much better than the
workaround that was merged.

Alex

--000000000000e6465605c94b2a22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 11 Aug 2021 at 18:14, Mike Crowe &lt;<a href=3D"mailto:mac@m=
crowe.com">mac@mcrowe.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">I agree regarding the lack of explanation. However=
, even if the problem is<br>
real (which it looks like it is based on <a href=3D"https://bugs.python.org=
/issue41710" rel=3D"noreferrer" target=3D"_blank">https://bugs.python.org/i=
ssue41710</a>)<br>
then it wouldn&#39;t be expected to cause test failures unless the system c=
lock<br>
was being warped at inconvenient times during the tests.<br>
</blockquote><div><br></div><div>So can we just patch python to use the rig=
ht glibc function with the right clock type, and send the patch upstream th=
en? Much better than the workaround that was merged.<br></div><div><br></di=
v><div>Alex<br></div></div></div>

--000000000000e6465605c94b2a22--
