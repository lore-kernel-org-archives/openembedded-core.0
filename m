Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web12.6244.1591777523829432741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 01:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K2B3TWOR;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id u15so361368vkk.6
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 01:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hxxN/I/RK5Qt5WUnCQplWNm1VhESfbQHvV+CG1bvg+Q=;
        b=K2B3TWORmq3nDQ1R5KwR0/22vGT8Fs7t+FcCzA8GSqHzte1VT1HNUY+JS6NjnlS145
         oIWawyzmLpwLNPrqpEpOtRdsRNfu8O6uxf4fQLrKXa3jgN4Wi2y5s5k1IF6QClW7mff1
         5l7RUkmqTUfzfoGUXI8HRcbSZh0rBkklJYSqIgFDePaBggdwvbOvFWyT53YH6rvuseCt
         IfvC2OWOPyXye7I/4PrwNkcBouwud7YTUknfXGcc3B9DNLsJYgGZE6H/QDakaETNzdnd
         ijmAnYX0wrDEaYa2dT4Va6jtjGBSnYYAlYS+JNNOMWrKMpZKHZ9rlMwxOqWnFbJ8hc8n
         fKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hxxN/I/RK5Qt5WUnCQplWNm1VhESfbQHvV+CG1bvg+Q=;
        b=nhdjW7OPwAJYCObKZnhpe410KB83etXYKtlcj9oGiuXf0FA1BHx9ivWWbeoe6DAB1x
         8cGExIQHFuNqEcnvpskKeAJHFD4KK8S/+P1IO3gYn24oKWz331FpWHmiph198D6xOa6T
         IhPSUJ2C1/b8uIR2KD49yAB3IHwJ18Vcsm/PbSYioVsczFJAY/Dw7HZO/QjMQDbQQnaG
         1eWW5J5XwLkyqFrhGPI1bzMa8zdOFgG9N3KVe/RCD6ZLOBFmnocKiiP42gLki3Q4VNn9
         xoRB6WxB3A9rugWirC97dCPxWpszp6UraNuj7FmRFRa80VqB3XPL61Nt8rUysQAdEc3W
         /OVA==
X-Gm-Message-State: AOAM530ceIcjtlnBnR2Y7nTT5FqkJ6e2hZmBJ3L1XHu+q/2sB/ru60oM
	UMhETsUltmdqolwFgq6I2YSgowCNvQ2ZX5Fnl9I=
X-Google-Smtp-Source: ABdhPJwmigdyjYl8QbTV5q7jKsHTqsCo9kf9xngK0OyAMRTtYMU/eCM6RN77rWFWDhjO3DqZaAG2CULv8MUlkv9yT6s=
X-Received: by 2002:a1f:4192:: with SMTP id o140mr1289590vka.49.1591777523001;
 Wed, 10 Jun 2020 01:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200609071549.350578-1-mingli.yu@windriver.com>
 <CANNYZj9AZ7HS2ufOhWbEpDknD87Bp84nQNVe1kGBFdBffRP_tg@mail.gmail.com>
 <20200609215055.GV17660@denix.org> <f2a20c42-f0b6-4387-b877-90344f90a627@windriver.com>
In-Reply-To: <f2a20c42-f0b6-4387-b877-90344f90a627@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 10 Jun 2020 10:25:11 +0200
Message-ID: <CANNYZj_YwkQeLNW1VHAhOJXkgyXDW6XcfyM-N4zcrRdp3fJZ7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] virglrenderer: correct REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Denys Dmytriyenko <denis@denix.org>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d1edb105a7b695ca"

--000000000000d1edb105a7b695ca
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jun 2020 at 04:10, Yu, Mingli <mingli.yu@windriver.com> wrote:

> Hi Alex and Denys,
>
> On 6/10/20 5:50 AM, Denys Dmytriyenko wrote:
> > +1
> >
> > The commit message should explain "why" and not "what", as "what" can be
> > easily understood from the code itself.
>
> In fact, the DISTRO_FEATURES setting shouldn't affect native build.
>
> Initially this patch is used to fix below error when opengl not defined
> in DISTRO_FEATURES in my build environment.
> $ bitbake virglrenderer-native
> virglrenderer-native was skipped: missing required distro feature
> 'opengl' (not in DISTRO_FEATURES)
>

This is not an error, but expected behavior. virglrenderer-native only
works when opengl is in DISTRO_FEATURES and should be skipped otherwise.

Alex

--000000000000d1edb105a7b695ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 10 Jun 2020 at 04:10, Yu, Mingli =
&lt;<a href=3D"mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi Alex and Denys,<br>
<br>
On 6/10/20 5:50 AM, Denys Dmytriyenko wrote:<br>
&gt; +1<br>
&gt; <br>
&gt; The commit message should explain &quot;why&quot; and not &quot;what&q=
uot;, as &quot;what&quot; can be<br>
&gt; easily understood from the code itself.<br>
<br>
In fact, the DISTRO_FEATURES setting shouldn&#39;t affect native build.<br>
<br>
Initially this patch is used to fix below error when opengl not defined <br=
>
in DISTRO_FEATURES in my build environment.<br>
$ bitbake virglrenderer-native<br>
virglrenderer-native was skipped: missing required distro feature <br>
&#39;opengl&#39; (not in DISTRO_FEATURES)<br></blockquote><div><br></div><d=
iv>This is not an error, but expected behavior. virglrenderer-native only w=
orks when opengl is in DISTRO_FEATURES and should be skipped otherwise.</di=
v><div><br></div><div>Alex<br></div></div></div>

--000000000000d1edb105a7b695ca--
