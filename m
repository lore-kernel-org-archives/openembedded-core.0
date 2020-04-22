Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.1601.1587537591034152368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 23:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W6GqzqUt;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id u12so548979uau.10
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ekEVEUIWTesxxMX6uDX+N9ktLLVcP2l/aD27sI4IqHA=;
        b=W6GqzqUt+d/1rnlZcYhSwuEL5eG1ewyz7/rq1nc2wSzAccEtw0zheJaHnnSuQ1atHI
         jrSnO6n8lg3OPoGeJFqKlqzaavc9TQSP18+yq8aTVB80n3b3f94RS9/gJSPLK6bUMK7r
         OF7pJhdQWz9Vn940Sjgm/lpjNPTAoQOlem+ls/v3yAv8RgAYgTGhOyHdwZiUgVyFz54g
         /Hr8Rq4ACLiSC/AiMeCXkOQHrXhfbswH7dr1C+/vjzOUxzG8qmWnciFVF/GjzEGiIvqJ
         wuqbYySB5aeMmBBqD+QCSJ15eQ8ImXmGx1edJqBbM7X6ih5nImt8iKTlXxQUYVYGFHYu
         3FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ekEVEUIWTesxxMX6uDX+N9ktLLVcP2l/aD27sI4IqHA=;
        b=lSnwmQXaNc2UgIVz+J675xEc7mVuXvL1+88F0BRbgBt2f57JXX1tzYF+v9nBrtm2yw
         b0hExcAhgjAK47691wMR0beDQ3aPxPRPqJIgmJW7b2T7GN6uofWEmQBu7TyGQ5tISuP1
         7WcF01bpevngIRSKCfBfR2YC3ovvq7/ZFC2LKo4YoTdNx06D8B3DSgzHSqBh+Np5O/Qi
         DfkVVXzTs9mttZnwzdFQOE0I0d8/20ksoHKLlaBR7saa5KTiOBlkzCBiOZ+ixTsKr2UQ
         eKlVd+Pu8wT/wM5lh6R3oIOb5TksavGq5ptqZwurAQn5LKjZdc8hY+yB0LWfGqkeTdo4
         VXyQ==
X-Gm-Message-State: AGi0Pubg1Ty1jqfjM7CfECtbK9I055oe9m1XpVnTbvF48Tun9FnPzqWy
	26NMAQCjSpbh1lfa1P/pb1vflWJ5+Mfq5bjr3vU=
X-Google-Smtp-Source: APiQypI+0cXWjrCajNeXxsrKMxVVgxlfSK45PNI4uxpP6yV2iv0jyUu7AjQZP/tseLrW0PwFv7xm2nuAHtZOHpxmEwQ=
X-Received: by 2002:a67:fc8d:: with SMTP id x13mr18902279vsp.83.1587537590099;
 Tue, 21 Apr 2020 23:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200421210933.36772-1-geissonator@gmail.com>
In-Reply-To: <20200421210933.36772-1-geissonator@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 22 Apr 2020 08:39:38 +0200
Message-ID: <CANNYZj_bzJxcAMq_zhYb6rKOjZWdSnH98cPnB+PhMGvNC75PwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] boost: revert 1.72.0 regression
To: Andrew Geissler <geissonator@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000020239a05a3db66cb"

--00000000000020239a05a3db66cb
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2020 at 23:09, Andrew Geissler <geissonator@gmail.com> wrote:

> Upstream-Status: Backport [
> https://github.com/boostorg/coroutine/commit/9c73b2f7c1759a9508ba8780b38dc15f07f1a447
> ]
>

This and the S-o-b need to be in the patch file itself :)

Alex

--00000000000020239a05a3db66cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 21 Apr 2020 at 23:09, Andrew Geis=
sler &lt;<a href=3D"mailto:geissonator@gmail.com">geissonator@gmail.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Upstream-Status: Backport [<a href=3D"https://github=
.com/boostorg/coroutine/commit/9c73b2f7c1759a9508ba8780b38dc15f07f1a447" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/boostorg/coroutine/co=
mmit/9c73b2f7c1759a9508ba8780b38dc15f07f1a447</a>]<br></blockquote><div><br=
></div><div>This and the S-o-b need to be in the patch file itself :)</div>=
<div><br></div><div>Alex<br></div></div></div>

--00000000000020239a05a3db66cb--
