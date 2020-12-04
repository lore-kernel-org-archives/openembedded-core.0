Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web09.265.1607118560904172986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 13:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ottXdtvl;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id x4so2349543uac.11
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 13:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K/OMNAD0bgLWPb/sNVoYz64VHrCzHl308G0o83zhhOA=;
        b=ottXdtvlW+Q75lWkRJst83vH2vC9mmlSDi6nAJ7A8HBYjwL2PG3FRgFiCk0F8au8ba
         dkW2w0OiGu6k0pRwg0XOKGmzBZhzrM2jJS5EpzhCTXj993lYlq+vLI6+DlwvWGJzME6W
         chzyE82gHlwUWxrryQqrk9vdGB/venE2jtXb7XAhc7JfL9Di2ih6Dx42Ojflv50VfelQ
         k++WPTNvp9gVjXPL3RXll8tCkj197LDz1+g3r4GfoDyHNXCKaNonDr+DeFQxzRR4elt9
         5YCIfQeXQMldsVw2ZlWzHqt3F/KBq43YRNC2vx5mXmBIX1Tz4SCtoCvOlHqO0f3ETi32
         VuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K/OMNAD0bgLWPb/sNVoYz64VHrCzHl308G0o83zhhOA=;
        b=jGkr4AuPeXeuAla6sKaopXgiUy/WggvKu0QVCbOa+MnPTwFBlhMLi6HfoCm2eXZFjw
         EgEdwkqw9+uZWiqi6/KcGqVWJltTFVYLo4SjI2lDvxYJw2Fc+TgRwQ7Z+0kPIUTKz+sa
         AO6H8mr3MlVrZ1tCFchX1Slcy2dO84WcqvZspk5gCEFR3k8SRoXRQfcTJ/w+XBFcNGCb
         yShtFsloz53LHCCHCYomP20TGjpwe8PsCYrtgwOkMOG+OddQc8BXb3zfn5Q59f71/jwz
         Sx/6z1bZAJ7Ucvgt873m0J9ERA/O1R/CtlBxWK8G13YBkJ/3B5G8pYSaFkJdfwIrJYFQ
         QVkQ==
X-Gm-Message-State: AOAM533bFX2DzVi2NhECy/DZN/kzPz1IJwFcicMSUj52YanvuMMr8wdF
	Qh+fkt9nyFpPJm//vDsb183v+TbYMs7GLiMyIdU=
X-Google-Smtp-Source: ABdhPJzA1YEkD0Mju2hpGXNYK/fZJuIgCOrCowggZ8Yv41v+p9TOu+H2tMwaSCZSL++tFPcql1juMFNZ+ER6t0WoCOQ=
X-Received: by 2002:ab0:5859:: with SMTP id p25mr6031175uac.100.1607118560041;
 Fri, 04 Dec 2020 13:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20201204200737.7072-1-alex.kanavin@gmail.com> <20201204200737.7072-23-alex.kanavin@gmail.com>
 <1310333798.6725.1607114389130.JavaMail.zimbra@efficios.com>
 <CANNYZj92PzV-5DXm1RGqz2eh4hcFVWtJ11XeACKTrk0GCY4Hag@mail.gmail.com> <1014226017.7050.1607116909042.JavaMail.zimbra@efficios.com>
In-Reply-To: <1014226017.7050.1607116909042.JavaMail.zimbra@efficios.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 4 Dec 2020 22:49:08 +0100
Message-ID: <CANNYZj8T1Xf+Rkc62z7=j7W=OiLc6rJ8pdt+9rahmdRb6Ewd=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/23] ptest-packagelists.inc: exclude lttng-tools-ptest
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e221ac05b5aa72ab"

--000000000000e221ac05b5aa72ab
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Dec 2020 at 22:21, Jonathan Rajotte-Julien <
jonathan.rajotte-julien@efficios.com> wrote:

> > And this is the bug I had filed upstream:
> > [ https://bugs.lttng.org/issues/1217 |
> https://bugs.lttng.org/issues/1217 ]
>
> Thanks for the link. Any link or doc that would allow me to easily setup a
> similar build (conf file, ram size etc.).
>
> Is core-image-sato-sdk-ptest a good image to reproduce this?
>

Yes, the steps to reproduce are the same as in the already filed bug, but
you need to build the latest poky master.
You can also drop the patch that does the test disabling to see if the
previous issues are still there.

Alex

--000000000000e221ac05b5aa72ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 4 Dec 2020 at 22:21, Jonathan Raj=
otte-Julien &lt;<a href=3D"mailto:jonathan.rajotte-julien@efficios.com">jon=
athan.rajotte-julien@efficios.com</a>&gt; wrote:<br></div><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; And this i=
s the bug I had filed upstream:<br>
&gt; [ <a href=3D"https://bugs.lttng.org/issues/1217" rel=3D"noreferrer" ta=
rget=3D"_blank">https://bugs.lttng.org/issues/1217</a> | <a href=3D"https:/=
/bugs.lttng.org/issues/1217" rel=3D"noreferrer" target=3D"_blank">https://b=
ugs.lttng.org/issues/1217</a> ]<br>
<br>
Thanks for the link. Any link or doc that would allow me to easily setup a =
similar build (conf file, ram size etc.).<br>
<br>
Is core-image-sato-sdk-ptest a good image to reproduce this?<br></blockquot=
e><div><br></div><div>Yes, the steps to reproduce are the same as in the al=
ready filed bug, but you need to build the latest poky master. <br></div><d=
iv>You can also drop the patch that does the test disabling to see if the p=
revious issues are still there.<br></div><div><br></div><div>Alex<br></div>=
</div></div>

--000000000000e221ac05b5aa72ab--
