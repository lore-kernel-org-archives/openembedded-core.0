Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web10.41638.1622449211412417273
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 01:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VbCx2Lsa;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id z19so1036397vsj.6
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 01:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RUR/PUQO4HhAKyPAG38KcTcwIJUDAXK+q0trov6kbN8=;
        b=VbCx2Lsajq7dpSPzHzgZLrJfMVUYnVudgMgJo3/m0+x6QMfSrd/RqkmWgURd1Dle5D
         vm2Uw1N9a3xsNQ6e9hMrDltwGkIwQcdWr8ZMThLw6qpmLZbs7pF+Z5PlbW1L2U9HK/yy
         M/yXV0TG/JHWzHoc3jbyZMZfG+pq5xxfs8NoZZac0v54J6kfmEuMm+QiLeYgMWwNtrvE
         1v2KIG08XCSCjb1Dm0ZfwvBOrddJcddQnrk1v24KgYmuBpPICaJtH30GFQ/ySWTIfgNK
         5ubtMKHM/aJBveCJATH3xBUcwADvjouWsgU+K0dIkpt0xD8qfhaUvvx9FV/mz4q0DHO2
         a4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RUR/PUQO4HhAKyPAG38KcTcwIJUDAXK+q0trov6kbN8=;
        b=YwaWSXS3yJENufOc9AN6gh9G5qdRQBBUY3rB6Alr9WKVJ3/HKh0URAtU6cJraPvDZ+
         Ql9lXLF0vutSaZsRLiq13USxfm+vabf/WxX2JHFK7eBQnHCC5kqqHQlThC97pF9AVVNV
         NuBTlOr328Sw5NOZ7z6ixiQFIoml6Hwbg/tV7gsyXRee6x7GpXISs9mKjPGLfUAbCzFK
         yDeSItkAcnXikgsmhBgPWf/i6lZa0hvANSnUmKLKFkZeAdpTCJprg6FF3b8KF7tqImqV
         aXlZ3zyNdwz/IOsFvU6fD2v+gcZv1e5yds3E4jtq2rGfK9JMpbURNUK85izloNtItr/P
         nI/A==
X-Gm-Message-State: AOAM531Mn4id+uocQNGRh3I7++AIPtv/Go+nKUjskTLOiROPxEc5tyS2
	RO1pwGgHQn3Cj6XqLfFbqo4OYySb/c/mj+Wr7Sw=
X-Google-Smtp-Source: ABdhPJwXVdQ1ageIYBR9uc+tSAkfjIddnS5qd4GdbKWqS+kcfcyolKIBju1+odIXVZdyUgAL6zvc3n/mQamPiGqzDFo=
X-Received: by 2002:a67:1502:: with SMTP id 2mr13002069vsv.54.1622449210540;
 Mon, 31 May 2021 01:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210528082955.6819-1-changqing.li@windriver.com>
 <CANNYZj8YVuo0sCcQDrsFNgf-Dc199pOVr0G6-jfAg7i0tY1Arg@mail.gmail.com> <31706f21-a2e0-0014-02d1-466554a4fd80@windriver.com>
In-Reply-To: <31706f21-a2e0-0014-02d1-466554a4fd80@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 31 May 2021 10:19:59 +0200
Message-ID: <CANNYZj_Yu_ZNHSf1obe=caaXDSnXuJSC2Sstgn-s1SjVyzdvBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bash: fix non-fatal error in log.do_configure
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dc445305c39be4df"

--000000000000dc445305c39be4df
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 May 2021 at 03:29, Changqing Li <changqing.li@windriver.com>
wrote:

> This does look like something that should be properly fixed upstream, can
> you rather make a patch that fixes the issue at the source please?
>
> Upstream uses m4/gettext.m4 included in it's source tree,  which is lower
> version.  so don't have this issue. Maybe they will correct this problem
> when they update
>
> m4 files in their source tree.
>
> we have this issue since we use gettext.m4 in our sysroot, which has
> higher version gettext, in higher version, no-libtool is removed.
>

So is it possible to send a patch upstream that updates gettext.m4?

Alex

--000000000000dc445305c39be4df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 31 May 2021 at 03:29, Changqing Li &lt;<a href=3D"mailto:cha=
ngqing.li@windriver.com">changqing.li@windriver.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">

 =20
  <div>This does look like something that should be properly
              fixed upstream, can you rather make a patch that fixes the
              issue at the source please?<blockquote type=3D"cite"><div><di=
v dir=3D"ltr"><div class=3D"gmail_quote">
          </div>
        </div>
      </div>
    </blockquote>
    <p>Upstream uses m4/gettext.m4 included in it&#39;s source tree,=C2=A0 =
which
      is lower version.=C2=A0 so don&#39;t have this issue. Maybe they will
      correct this problem when they update <br>
    </p>
    <p>m4 files in their source tree.<br>
    </p>
    <p>we have this issue since we use gettext.m4 in our sysroot, which
      has higher version gettext, in higher version, no-libtool is
      removed.<br></p></div></blockquote><div><br></div><div>So is it possi=
ble to send a patch upstream that updates gettext.m4?</div><div><br></div><=
div>Alex<br></div></div></div>

--000000000000dc445305c39be4df--
