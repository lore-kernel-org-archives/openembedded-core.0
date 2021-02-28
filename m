Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web09.1987.1614539412871735031
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Us/OxS0N;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id b189so1596436vsd.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=POU9l/s0CDwLvXYo4az3HrfnVnqky2BOtMGVpYu4ABA=;
        b=Us/OxS0Nwbf78xx59ZyTv79kiMLc18vFrWJvq3hhw66bL5uLzzmSdH+zrL0z6jGDlc
         EHNvGBKJ88mRpfTU+8n2n++kBSiKtwAazOf22S8+nQdbnWMF61cl7bERDv0l0/721f1g
         Kbr094OcxnJ5LFd4eOUHwvaW648N8BrWpTPTvgMMFc07/Qts/7qaqLQ114YILJFRIJQx
         +NhO3zuEQ2w5w9bFj/qUHKqUH8xcJDwItklmtYmzQXbiG7ZefU6kv01wxmwwueYGgQ14
         Bgj76L+9rIf4oH1sAIe5sHUJHBmhB8JF5DQFXwASK7FNDJKDjOAkweZTqtay7x2x51lc
         g+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=POU9l/s0CDwLvXYo4az3HrfnVnqky2BOtMGVpYu4ABA=;
        b=lmq9Wgplm/y7V96GPab9sSNwn/KdX/3iKI6nw8MwmgBc2tWMo7EPeburu+opgevj14
         UncoY1hW941xtl1aacvhAjOukvTnhB+NCHh9lqldqi5prn09TAimbvsVYqVXTm0TJU2K
         8aKGm3YJV5R+V1gyUdsBcOFRd78sMtID+Lt/WTjvwYDRmpYyd17RGtP8InGG9kiUMk7M
         f1b54Uihy1Qv5d/pAmMkSIEnPcZJZy1iX1vWyKuL0tBOgk6x3xwHz7kfmfVMWsiAneSS
         qDcFYgcjeSS6S4DjkwixMIkOgvRDpJLDYMdphXXfAKOnaEUZboaOhBPLrE2FapCh9q2+
         wuiw==
X-Gm-Message-State: AOAM530Q1dVvzSypPyR5MT3fJywDK+X7nXwE1N6+Mu/5zhDU78WlvhJI
	lMmLSgEmZ9om7kofnhq14tC2FhtiCl7/GPgKTlKAf1Q/8O0=
X-Google-Smtp-Source: ABdhPJzp31pw2s3cbLaOba0B3TViZkStx5/rfuEvnGLN/06iXTMk0e1D7ipFpWWts1N06VK0ly/tgB+hA+8DvBxUw0c=
X-Received: by 2002:a67:f318:: with SMTP id p24mr6212843vsf.54.1614539412059;
 Sun, 28 Feb 2021 11:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-5-alex.kanavin@gmail.com> <c2f9b05f-15e7-42d6-a63b-fa51a876e98f@gmail.com>
In-Reply-To: <c2f9b05f-15e7-42d6-a63b-fa51a876e98f@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 28 Feb 2021 20:10:00 +0100
Message-ID: <CANNYZj8jfZGmbh+tq99D8fm5wSKH_hsWRyGoZV3a3TFsCN9gCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000021bad205bc6a4016"

--00000000000021bad205bc6a4016
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Feb 2021 at 19:40, Khem Raj <raj.khem@gmail.com> wrote:

> > -inherit autotools pkgconfig update-alternatives
> > +inherit autotools gettext pkgconfig update-alternatives
>

The new release supports gettext in a standard way, so the class adds a
dependency on gettext-native.

Alex

--00000000000021bad205bc6a4016
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 28 Feb 2021 at 19:40, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">&gt; -inherit autotools pkgconfig update-a=
lternatives<br>
&gt; +inherit autotools gettext pkgconfig update-alternatives<br></blockquo=
te><div><br></div><div>The new release supports gettext in a standard way, =
so the class adds a dependency on gettext-native.</div><div><br></div><div>=
Alex<br></div></div></div>

--00000000000021bad205bc6a4016--
