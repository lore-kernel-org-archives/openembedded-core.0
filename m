Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.3071.1630534795894619718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 15:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pQqsAxpx;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id u3so2481576ejz.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 15:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=xKCl2zY1kuSThswHulFdnylQ3pZ2b6es5NZEY6FYxa0=;
        b=pQqsAxpxHPgn5vrMKcv78ghFtdcnJ7ekXc8gJTdWk+cFJvGZDVdVHwMDY8Ha6v4eoh
         agU+zYYfnPoKmUT3fA4uWavEYI8sHxT+Ois7eNiX4rHNyD4oQALBxjvENWqO62GqULgG
         2OoOyGmtYiQkPXf7QaYk+iKZ5RamRTu1YcL+wx+ec06LNX0t7VpZ49KJwr2Hc+jNJvdk
         JWutWLiVR7PZYgm3knt36ONOnc3o/xCCINQzA0ILpzqaBQ+ylmRjhjrWmyIKh4L/Q6Ak
         pnGtGnIOI/NrH3wlrmR1x7i91qtAhWHQOxjF0+UwJ+U8lUG2iGehuOdLPuLupjvZDbjN
         BrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=xKCl2zY1kuSThswHulFdnylQ3pZ2b6es5NZEY6FYxa0=;
        b=FrcLd1YFsR0BE5yNEbQv2IHn4ZYQ1sm20rypsFIrN2SejmWXdOMUiTTDY0fIFTQJgO
         Z+ie14qzyaZb9AXBNKw0C2UcYoAy+nVF1bcgHLDgbW+gMxDDsL+n2sA/FFoZdJlKnPew
         q0FidLnh0DPPV3PvMQudeBn6G8Q1A+W7rVFb52bw+e91IzdaGCgrmbH3WKAhJ6s/ghmd
         DUjVwT3UfZ42JhmPuLDWpB6XlnZAu7UeEFtUw/+sTZe+CaoFVhmUsJnvho3B3lNYub0C
         rJDdKz1SEJSDt2zcvN9GbziStRe4LHXfkoX2edjdYdH11ba4bHZ5zmp7XC8Ho0YaOoBS
         0Sig==
X-Gm-Message-State: AOAM5306uYXXDCynZDitd8odQXj0A3PFIo+1D6rA9vc0V2cvXeAAgobj
	iWnwcwsc8737/RD41XKnVjbb+GbJVLIFnwFvsSr8DAavKT+M0A==
X-Google-Smtp-Source: ABdhPJyJjmk9/9uHSdnobad65QYZQQIGeMcUypiSAFiuHgmilxy9jPeED6h5MFCim1M8kgq6ZPOPR8B9+jUAJXCk0So=
X-Received: by 2002:a17:906:56cc:: with SMTP id an12mr99975ejc.456.1630534793948;
 Wed, 01 Sep 2021 15:19:53 -0700 (PDT)
MIME-Version: 1.0
From: "Christopher Larson" <kergoth@gmail.com>
Date: Wed, 1 Sep 2021 15:19:43 -0700
Message-ID: <CABcZANmpKqEvz+yzjp9mLRhgLo8bU=JiSJhTjFhKR-wMhS0WeQ@mail.gmail.com>
Subject: [dunfell backport request] layer.conf: fix syntax error in PATH setting
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <sakoman@gmail.com>, "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Content-Type: multipart/alternative; boundary="0000000000002ff2a805caf67712"

--0000000000002ff2a805caf67712
Content-Type: text/plain; charset="UTF-8"

Hey Steve,

I'd like to request that this commit be cherry-picked to dunfell:

2e753a12cf layer.conf: fix syntax error in PATH setting <Matt Madison>

This issue is generating syntax warnings/errors from python which can be
concerning to customers.

Thanks!
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000002ff2a805caf67712
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Steve,<div><br></div><div>I&#39;d like to request that=
 this commit be cherry-picked to dunfell:</div><div><br></div><div><span st=
yle=3D"color:rgb(23,43,77);font-family:-apple-system,BlinkMacSystemFont,&qu=
ot;Segoe UI&quot;,Roboto,Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Droid Sa=
ns&quot;,&quot;Helvetica Neue&quot;,sans-serif;font-size:14px">2e753a12cf l=
ayer.conf: fix syntax error in PATH setting &lt;Matt Madison&gt;</span><br =
clear=3D"all"><div><br></div><div>This issue is generating syntax warnings/=
errors from python which can be concerning to customers.</div><div><br></di=
v><div>Thanks!</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christ=
opher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded=
, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div>=
</div></div></div>

--0000000000002ff2a805caf67712--
