Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web12.7033.1593769454537241580
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PpT0WXis;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id e15so16808416vsc.7
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 02:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nJ2eLTMTP/SAr74SsVTcsdEaeRxGOi39gfqJgjIt/t0=;
        b=PpT0WXisHlOa41tTaLfFLLUEl2W0/RvAXGR2vEIiPEPREkerTt2tgniv7gqay3uAJ9
         ZWYr1ZmnT20hyrgHAU2TQvQH040AFmolt1YFg/664AqB797GXQy8oVQ4HN1jESX61Dyy
         Nk6t+UOjLEFuANRuuzl/SAhtpS8t1QA+Hwlq3rmLFwOGomlgdnN3r/l8B91bnpVQC33R
         0PdoUvO2kaAw73CQnZd5R02gHwRv3WcUDuReWHQd94CPZd2OFc0xh4/dhBijQQkYYzRp
         7Hzzt43p7ZbxNYvJhYKzLaWp4q9mci3KEXOSQuNWONB8uuvH/kuRWswKPGxqfbWxGMVc
         X7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nJ2eLTMTP/SAr74SsVTcsdEaeRxGOi39gfqJgjIt/t0=;
        b=Lw/K6WJNTt0qi7cPhXsVutq3uQ1l6DpkMp0eqlRWUBzbVmz3t9pNiyywCIFbw+SCYQ
         XrKZHMbis8CA5EOemUB1b332hR87PNE9s1o+ho22dqIMWD9YR0iJFcvVvGH+pyCVoqAX
         oDyFAhUT051Cm00ovNhFWWwZVbfzzeFOjkN7rg9BeDZ/TKExLS1EfirZc4DaEetOXpZm
         n26Qq9UCOCk/7SvdBJSPWrAMAWn6iaaGaBFTXdHfm2O7q+S1m+XSWBFEuw6mFpd2Sljy
         NkTMcCsFEEtQ9bjr2UG+2Bnu4v2N6PRhWEzSZzQcgRH9glV9ee58TtgxRKOBC1/Lolr9
         k/qw==
X-Gm-Message-State: AOAM531IVdQG9nUkkSzGo3NadweeViz8frD4y+HWDIWf0Q+vPkDuuvqM
	deDH0Mdwmq+YBwaDGLO5nCAXaP7NvB2dviIjpJ4=
X-Google-Smtp-Source: ABdhPJwvi2K06RRbfadPqsnjraz3A1ODpz0mfpHU2WEIJMTWCdqcpq2NciM+Q3ER01abdNHFYbu1xUS2a5A7XW8Qx4c=
X-Received: by 2002:a67:330e:: with SMTP id z14mr18583288vsz.94.1593769453685;
 Fri, 03 Jul 2020 02:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200703084216.17911-1-andrej.valek@siemens.com> <20200703084216.17911-2-andrej.valek@siemens.com>
In-Reply-To: <20200703084216.17911-2-andrej.valek@siemens.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 3 Jul 2020 11:44:02 +0200
Message-ID: <CANNYZj_vzJ0OBmZYH7A_emhodo-K9cAS=FhmQ1rrq17AUgbQ1g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] dropbear: update to 2020.80
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002414a905a9865edf"

--0000000000002414a905a9865edf
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Jul 2020 at 10:43, Andrej Valek <andrej.valek@siemens.com> wrote:

> -SRC_URI[sha256sum] =
> "084f00546b1610a3422a0773e2c04cbe1a220d984209e033b548b49f379cc441"
> +SRC_URI[md5sum] = "63527580ca47706b70046f87bb9d14fe"
> +SRC_URI[sha256sum] =
> "d927941b91f2da150b2033f1a88b6a47999bf0afb1493a73e9216cffdb5d7949"
>

No need to reintroduce md5sum. How was it added? Both devtool upgrade and
bitbake no longer suggest it.

Alex

--0000000000002414a905a9865edf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 3 Jul 2020 at 10:43, Andrej Valek=
 &lt;<a href=3D"mailto:andrej.valek@siemens.com">andrej.valek@siemens.com</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">-SRC_URI[sha256sum] =3D &quot;084f00546b1610a3422a=
0773e2c04cbe1a220d984209e033b548b49f379cc441&quot;<br>+SRC_URI[md5sum] =3D =
&quot;63527580ca47706b70046f87bb9d14fe&quot;<br>
+SRC_URI[sha256sum] =3D &quot;d927941b91f2da150b2033f1a88b6a47999bf0afb1493=
a73e9216cffdb5d7949&quot;<br></blockquote><div><br></div><div>No need to re=
introduce md5sum. How was it added? Both devtool upgrade and bitbake no lon=
ger suggest it.<br></div><div><br></div><div>Alex<br></div></div></div>

--0000000000002414a905a9865edf--
