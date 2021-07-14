Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web11.7197.1626271479337276843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 07:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XxlQ7OIw;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id h9so500159vkp.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5pqlsrEvaCbfChHbmUzdGUBYcXUVXA3gD1NsCUsGZCg=;
        b=XxlQ7OIwJWDKCEfzVQi/ZBl7CX2QNN0mEh2ubn2C84DMZL/JUaIjwmbb16v1/BvoWO
         hRYpDARKebAvmvaV5i0I112xqQzHo43wLfkYtfnXKFz0sdznAYTrbFfae9nM0DHgVZWL
         4xx37EKs1ACnnyAvAMX+r4ihpgfrnAaMO7SLGzEWZMlE9PGwPi2pODYmoqOGoOf31F8+
         YE4gIeDSucA2Cxel1NtYTIUbs6lxBIa4FQR9CpXV4kGrPlMM6gSQ1FRSvOGCLbwj+SsN
         jXYn0b4MMfXeI0o/bsJHzZV4V3c32D62sFEMp3AK9Ziu3ZEUxpIe10i06gWP0BjF07J2
         K1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5pqlsrEvaCbfChHbmUzdGUBYcXUVXA3gD1NsCUsGZCg=;
        b=ODIT7sj5kakGU0RDMedd7sqoEjt8YbbqIfcZZleSHRpMmiSLYYeI6f2TSbh3/MTPcz
         +7LSzb4WErJShdwjvhqWZaSVJNBX52wIeoYZHY7dxh9Cv+uR1NjELp6ZrlLUY+8YuE0a
         lfnkwKLNPTtd346W+ejPE8bv+fhmwIh7UWG773FzvGDT63wH6toFb5S5t8sTr1R/MKfW
         9C5OEicyJ1FTJzHF9ec/swzz/n145CcqSb104UdMxpWgRmNModcRa0coClanzPj9SNJj
         4hwPiruJT1cL/5bPJiQUPNUR2ctWToNyfsjvGSmZNmimGH0L335yoyjmVHlFAZmGQ+3W
         +LCA==
X-Gm-Message-State: AOAM533gsD3MdtZDzvOxLbETdxFpwuqzX/lKO48rmGLv45flFMaNFLbf
	awKUX+OLGOosKoanag8y77bjHs8t83ulGudOwCg=
X-Google-Smtp-Source: ABdhPJztRD2c9slkcoZlH8Xrdcz+mibxWkaZV8DSpx6TXdGoqY1VW3sxTYY2puoLKhlQaiWq1HiIZlEcfdwRJuYlGn8=
X-Received: by 2002:a1f:9303:: with SMTP id v3mr12055206vkd.16.1626271478517;
 Wed, 14 Jul 2021 07:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
 <20210714122606.605142-2-alex.kanavin@gmail.com> <CADkTA4N09rGXOSwev-C4oEihwWsvwqtCpY=XHNShF_xUUzkWZA@mail.gmail.com>
In-Reply-To: <CADkTA4N09rGXOSwev-C4oEihwWsvwqtCpY=XHNShF_xUUzkWZA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 14 Jul 2021 16:04:27 +0200
Message-ID: <CANNYZj9wDZfHK5mrn-UsgZcHHOF8+Xv8UXRUX1r+Mkcvr9+xMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/21] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c912e205c715d583"

--000000000000c912e205c715d583
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jul 2021 at 16:02, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
> I'd prefer that libcheaders stays explicitly set.
>
> Bumping libc-headers is something we do carefully, and should not be a
> common devtool
> operation, and is not something that we want automated at all. Having
> that extra variable
> to set is a good thing for the headers, it helps reenforce that you
> really should know what
> you are doing.
>

Right, I'll respin the patch once more.

Alex

--000000000000c912e205c715d583
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 14 Jul 2021 at 16:02, Bruce Ashfield &lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><br>
I&#39;d prefer that libcheaders stays explicitly set.<br>
<br>
Bumping libc-headers is something we do carefully, and should not be a<br>
common devtool<br>
operation, and is not something that we want automated at all. Having<br>
that extra variable<br>
to set is a good thing for the headers, it helps reenforce that you<br>
really should know what<br>
you are doing.<br></blockquote><div><br></div><div>Right, I&#39;ll respin t=
he patch once more.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000c912e205c715d583--
