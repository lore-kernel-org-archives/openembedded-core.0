Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.9485.1620835973554035205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 09:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IirgQkPi;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id j13so12249351vsf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kFMnW08eIwtvsO+bpvaXXexrQqiCSOeA/ey6SNZed7Q=;
        b=IirgQkPikO9Y+H96bKV1aqbn+k8PTGnKjG8r5dq+PNsxwolDxwilkH5syXPXCS8oFx
         7EqeWNNR747KxQGoSG301m0vZQLosuhVYe1BMWJfqnDYhnR4EYl50UlOpWGl0y/fHCI7
         Sb56ACmHJIJZL93w7lk4QGZWHcIenYOtUEpfAsENnc1hEaLfQpo3l6jRdXpnT14PhPKd
         rkltO2JefwaSgdPo1963MFH+YSVFgr2GOzpGo7X7FKk/kwL8jfRVLkDOXG60V+L46n3l
         GV8093Gv/92PwUhbqIdeXRS2Rb5+3pXpKUsR67EGv4mXM1N9cZ1C3d+qxoKgcmKULp/h
         KODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kFMnW08eIwtvsO+bpvaXXexrQqiCSOeA/ey6SNZed7Q=;
        b=a0i95vCEFqUb+UJ5hp+D/A5gKsUWp9OV+jrMt9oBfBbS7RncKXJxpa3dwW8Muz1B/i
         nNnCYueuZjdv5abL/NAYNCdXA/XTD8+gf+137UlDyg+pOA3lfX+rzX8BrKrryM5dC1C9
         XzxUZL2IcR16you+yFsCIV1mFBSDyKIRKqPc1wNGh02JbYsYxUy78hPkNxLw8iAn/ft1
         0pEvV1x5ZmYufvxsYz45zCTw4y8hkuM0NI8dCS6ZI/+w5ELGRPyy7BQsOnNKu8mx446S
         whftebDtcbYXs0mcmOpL5mrKvS+RwSSVNVy+x3EoWFer/HxbUh2/4oBqPFZIBwyfzPhG
         RIiw==
X-Gm-Message-State: AOAM5308kjwuEqpaPMVVEkSD1loeF5DWd57jq6rIh4PDJ0RexmvjvGyd
	bLEFDTxL7WEULZvi3q905BWU1UMdjkAVOV+eCTI=
X-Google-Smtp-Source: ABdhPJxH/326VquD+hJnSuRAczp0TE9ysBo9NFGsNzFrBDvv2KIaHknXBE3174Rd8AbrqdwmiYlVYzXtACBypTzi+/s=
X-Received: by 2002:a67:2fc8:: with SMTP id v191mr32187489vsv.54.1620835972701;
 Wed, 12 May 2021 09:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210512124221.61985-1-Martin.Jansa@gmail.com>
 <CANNYZj-wzHbziSLMPVh40qpnHntcRyqxpTa+g+p9JtqSeZv42g@mail.gmail.com>
 <20210512133630.aqqp7ocfbz4wgh2e@jama> <CANNYZj-kAt77FZVPQBAkUA=TNp0KjzgUjHKufwRDzOwxzzpU+g@mail.gmail.com>
 <20210512144211.jqtbdkjq4rffeenp@jama>
In-Reply-To: <20210512144211.jqtbdkjq4rffeenp@jama>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 12 May 2021 18:12:41 +0200
Message-ID: <CANNYZj_6BHR-xb4jgWcdtP_i3J+xHhfzPgfPCacLWEKAtV3kQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: backport DWARF-5 support
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006460e405c2244883"

--0000000000006460e405c2244883
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 May 2021 at 16:42, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, May 12, 2021 at 04:34:45PM +0200, Alexander Kanavin wrote:
> > Your patch is titled "binutils: backport dwarf-5 support"
>
> Which is all this patch is doing.
>
> > and the message
> > talks about dwarf-5 in general across the gnu toolchain.
>
> Which is the explanation why we need this backport since the gcc was
> upgraded
> to gcc-11 in master.
>

The patch does not add dwarf-5 support to all of binutils, it adds dwarf-5
support specifically to gold, and that's what the message and title should
say.

Alex

--0000000000006460e405c2244883
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 12 May 2021 at 16:42, Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Wed, May 12, 2021 at 04:34:45=
PM +0200, Alexander Kanavin wrote:<br>
&gt; Your patch is titled &quot;binutils: backport dwarf-5 support&quot;<br=
>
<br>
Which is all this patch is doing.<br>
<br>
&gt; and the message<br>
&gt; talks about dwarf-5 in general across the gnu toolchain.<br>
<br>
Which is the explanation why we need this backport since the gcc was upgrad=
ed<br>
to gcc-11 in master.<br></blockquote><div><br></div><div>The patch does not=
 add dwarf-5 support to all of binutils, it adds dwarf-5 support specifical=
ly to gold, and that&#39;s what the message and title should say.</div><div=
><br></div><div>Alex<br></div></div></div>

--0000000000006460e405c2244883--
