Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web12.34266.1612787125947360421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 04:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ITIRFgo7;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id z3so4743151vsn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 04:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vEy6Xq6H+BbyWnrpmTfoCE7irvwife5P4DCF2+gPhaw=;
        b=ITIRFgo7dFyXyr2Xzq5nXDOzSnIzk8vai6+Qz7nF052PXvEACHfRZ9Cgd5GCGMffRM
         ErmEWVbyXmq0/1h9x5aY2Q4O9OnggJJ3o2uFLF5dLEn5yRo1DXMDJb1mBRKfROPargu/
         fjGfahxNtjSdQqzfcZZOpOK6SqNH9aOHI198aRMfJfHY1rOH1SdaS1qNHWR+WpMuA2sq
         7QbUi8GRiYi0srnVnX9s7eB6ckpHLA+rfmY97Ru1Pwh3lHaGtWMyXkw2ROE0MZyJ0ss8
         Eq+ZE/wnnodhndfCzCuuQhqXUN0MSmzYKRpUjot3gvq9lelXBT8nbZkMiJENW1fL90C3
         u7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vEy6Xq6H+BbyWnrpmTfoCE7irvwife5P4DCF2+gPhaw=;
        b=k1oV5wYvw439tEiTLHm63Ath/75KABqUcs2Y7xB3fMLAwhunoOA59jDyVhU91WxK6n
         RLNeF8SZeBqLezhRwc9tO1PNj/mn6m9QwX3ZPTfwH+m1TFHUZ2qh3kZLgwkytQwl0pL6
         F+KwwxAnqBGLZP+Oa2tsBurT9b7W9VWCTF/cX9UhwReuhU8W1rbXapg5qGk6HLSzBjHC
         ll8B1bR1ZWGvv1u1cAQnSQ6sby2lOUR5Il1MTwXmWjEEy2kCj1SPGsOA3OvlpJ4wWVoa
         Mr0SWzKcaEJolv2Wt3we4+fbNbxlISf603mPjWXg7rvXFV0BGeaoua9DvJx6wIsehLvg
         6DBw==
X-Gm-Message-State: AOAM530gPpnGrAKc4vr/n1qzrqW98hwtjZuDAZomLhMynDY7BcBOHyKw
	xQlvQT73Rz9zMrirk9qRCwAw8k1yn63XLwUX6NQ=
X-Google-Smtp-Source: ABdhPJyhGBC01thIwiDCyaGJGa1Z4v9qHMTlxe8ywNuNNWTPESiikhMzkHuCIOpKqg81BhYnqnW6mY+xM5oVlHAj+kc=
X-Received: by 2002:a67:c599:: with SMTP id h25mr10005260vsk.31.1612787125180;
 Mon, 08 Feb 2021 04:25:25 -0800 (PST)
MIME-Version: 1.0
References: <1612785421-42876-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1612785421-42876-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 8 Feb 2021 13:25:13 +0100
Message-ID: <CANNYZj__mzG41r1rKGMVunEuJqSgxfspMNG7-b-Mb-b=c2huoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] libdrm: upgrade 2.4.103 -> 2.4.104
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b1db0f05bad24373"

--000000000000b1db0f05bad24373
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Feb 2021 at 12:57, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> +
> +That's what upstream docutils installs by default.
> +Signed-off-by: Heiko Becker's avatarHeiko Becker <heirecka@exherbo.org>
>

Please add Upstream-Status to the patch according to guidelines, I guess
it's a backport?
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status

Alex

--000000000000b1db0f05bad24373
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 8 Feb 2021 at 12:57, Wang Mingyu &lt;<a href=3D"mailto:wangm=
y@cn.fujitsu.com">wangmy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">+<br>
+That&#39;s what upstream docutils installs by default.<br>
+Signed-off-by: Heiko Becker&#39;s avatarHeiko Becker &lt;<a href=3D"mailto=
:heirecka@exherbo.org" target=3D"_blank">heirecka@exherbo.org</a>&gt;<br></=
blockquote><div><br></div><div>Please add Upstream-Status to the patch acco=
rding to guidelines, I guess it&#39;s a backport? <br></div><div><a href=3D=
"https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_He=
ader_Recommendations:_Upstream-Status">https://www.openembedded.org/wiki/Co=
mmit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status=
</a></div><div><br></div><div>Alex<br></div></div></div>

--000000000000b1db0f05bad24373--
