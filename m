Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.19592.1621838136437207738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 23:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kEstcyZQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id t15so30586459edr.11
        for <openembedded-core@lists.openembedded.org>; Sun, 23 May 2021 23:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aCKgsM4+rbmYGZ1602NWs+nRWmAC4arTs03fvvCt/b0=;
        b=kEstcyZQMG39DQGADLYEnQn32NZjWckKDhXFKDdlMlVPYZCTpPqTHTmD43WhujI5Q4
         jrbs7Nol6dtAptjqDGgATljCc/NwmGKDBkEyXnqOR7/ttg0XASsQyPjeg7M/CqEeR3mq
         PvrrX7KItkaZOO6YmcaTNfqfcSTlYGtePGEfsl3ODHyCY2mr3tRLtEoJBPx+oZD1caPM
         Ys0JtlwITxybvURv+gPxkBdwRF7lajxpR8gR8eFlp1hZoiUVJmCemTdgEJvf5pT7xXZ4
         u9/N/OODNMBRlnSjjzYNFFPIWNuBxBc7SJE34JG7EXOPe8QNf2YlbKVE9RMUfaSe76I+
         bHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aCKgsM4+rbmYGZ1602NWs+nRWmAC4arTs03fvvCt/b0=;
        b=Fz56pSZskp9Dxs07MtoEfQHRt8Yc2/5vP+t2s5aT6d96XwtSrC/iqP2D7lk6rcyOFk
         qX/q+upQOeOTeZcYxhxT7a7Zcr3EBHgicZBaTF3GxPHea7xdkXXwUnfCnHTsRd0hXL86
         8cfPjo/84ocFWsoICmO2hFZbEZD51OzwImxTziyAbjpJFvmHJSKTcCuG1cvW/EpCeL+q
         E1WEQY+1ZMuSldVEaveUn6nHbNWiEalNlfE/7izWNtMoEmcczlBhSrlgFONxWWJdVztd
         XqpIU9VNCV9nJFvEXw59SROD/j6jXvgDCighs/7bs+GcZogvQ2Uu6QkUfKtjkBtg1m5G
         t+Mw==
X-Gm-Message-State: AOAM532c3Qxy7/rRRafbpkMobR8urxEhWKzFn6Y7x4upcyWqAkz5atv7
	X2jW8tfyCfJNLlZQw6D3UuzPpJt4WPfYQMJ+XxXCryV4L/4=
X-Google-Smtp-Source: ABdhPJyapuAtbbmpyYIiAVHdZNSLKFJNT6FEDZHjVAwlRzpJTtRQjCxCbrMxqWafBnMuQ1ru+h+JIOEd8ScpeOkxhYU=
X-Received: by 2002:a50:9558:: with SMTP id v24mr23967593eda.264.1621838135072;
 Sun, 23 May 2021 23:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210517090323.9968-1-Qi.Chen@windriver.com> <CANNYZj8zWA-aADeZenSLa=Y8UVPMyHyQ+GvLWtMCE4TT30h7Tw@mail.gmail.com>
In-Reply-To: <CANNYZj8zWA-aADeZenSLa=Y8UVPMyHyQ+GvLWtMCE4TT30h7Tw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 24 May 2021 08:35:24 +0200
Message-ID: <CA+chaQcapVMi4k2yWFppXMB_36EfVLXJxPBaK0Rswy44CZOu2Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rt-tests: update SRCREV
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Chen Qi <Qi.Chen@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ec999905c30d9d27"

--000000000000ec999905c30d9d27
Content-Type: text/plain; charset="UTF-8"

On Mon, May 17, 2021 at 11:12 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Maybe it's better to update to the tagged 1.10 commit?
> https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?h=unstable/devel/latest&id=32819581cc0509c9d58c33c3061f57abe0c40c88
>

that would be revert of
https://lists.openembedded.org/g/openembedded-core/message/151129

--000000000000ec999905c30d9d27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, May 17, 2021 at 11:12 AM Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Maybe it&#39;s better t=
o update to the tagged 1.10 commit? <a href=3D"https://git.kernel.org/pub/s=
cm/utils/rt-tests/rt-tests.git/commit/?h=3Dunstable/devel/latest&amp;id=3D3=
2819581cc0509c9d58c33c3061f57abe0c40c88" target=3D"_blank">https://git.kern=
el.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?h=3Dunstable/devel/lates=
t&amp;id=3D32819581cc0509c9d58c33c3061f57abe0c40c88</a></div></div></blockq=
uote><div><br></div><div>that would be revert of=C2=A0<a href=3D"https://li=
sts.openembedded.org/g/openembedded-core/message/151129">https://lists.open=
embedded.org/g/openembedded-core/message/151129</a>=C2=A0</div></div></div>

--000000000000ec999905c30d9d27--
