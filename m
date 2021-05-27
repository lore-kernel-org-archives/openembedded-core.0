Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web12.5770.1622117011867463111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 05:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ky070vOg;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id f1so39303uaj.10
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 05:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LWTjI6hh/zUEYPKXMVw9st2wzJslTsRq27Q7+Visy2I=;
        b=Ky070vOg+qkb2NHQDgKC+DAmGtLFsPXlxeOgm0JH+OHqJUekyB7JHuOUPyHZBBUWu7
         8n8NPHCUKmX6rWF+DUF1MBLw7zzY7grLXCHjt3LMgcyqTKB/74h0gm2A0SjFGJNuYTmG
         lTTpIzwIktlchpaZTg6ush6CnvRRvIeH21ocRuqUXDLYR6jLPcAlpqhBaD5lyUlEeb3w
         STpQB0fHC+RTddAFyVXqmLmWAEgNq4IrPWarf/Pu/xY52gossww6ydNW617TEvZUhAxv
         A1ecrLAw+2adP18UBt+VCxuq/K+Wu2bfbDqXIvvx6o22uExCvOoxVvdI7YkjBJyEumDD
         sVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LWTjI6hh/zUEYPKXMVw9st2wzJslTsRq27Q7+Visy2I=;
        b=AuNEgV7XGqYZShU3yyodjXYFsWrJkNbNxbyE1TxwUWzb6wePOPpyxeaTM1BcP/l0it
         O2inW7OOyGAFKR1ai24XDE1hE/xqq1sVP5yO0A/Q8j/X3XJP0W4i/juhryeWeu/rqdle
         OzGy5RLKEfHtC/TGslsNjFJ7SuDdyJhem6afMTqgbpBSiIl7pwI/nii0VxAqwMb22zpq
         Bdo/BgmHO6mNS+EdGFgt6ehXZVjjE0HfXorhJIxEbc482NST67AQOkxTqTkiQ2S6ItPs
         DIu1BJO0cN0jVEveybZYb7110HYJfQZYPTKx38JHoLwc1O6YThMMZ6mSIA64PiKyXWLQ
         nbCQ==
X-Gm-Message-State: AOAM531PlbJ1WUiKYV6IeMTX2yK761ku972FU5UEKNY64zIITxycljjT
	uQYCFThU1z7laVxO08+ktVzMjnwLymT8The/WmQ=
X-Google-Smtp-Source: ABdhPJzVXCn9wFzkeBrfdIAJuu2M7iaBKpJXQssWfewtWXiYlS1pd/0l7F2FA4AlRwbrm2ovV0MjEATHAUqRJsNXg/M=
X-Received: by 2002:a1f:1d4a:: with SMTP id d71mr1596786vkd.0.1622117011081;
 Thu, 27 May 2021 05:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com> <20210527081100.1213973-4-vinay.m.engg@gmail.com>
In-Reply-To: <20210527081100.1213973-4-vinay.m.engg@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 27 May 2021 14:03:19 +0200
Message-ID: <CANNYZj8wK=MCOQzGrnZf4AyJS_-0NXV9WXXhXef0psouhamJxQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="0000000000003acfe005c34e8c3f"

--0000000000003acfe005c34e8c3f
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 May 2021 at 10:11, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> +                       # To kill remote-test-server executing through
> background ssh
> +                       killcommand = "kill -9 \$(ps | grep
> remote-test-server |  grep -v \"grep\" | awk '{print \$1}')"
> +                       cmd = cmd + "ssh %s root@%s \"%s\";" % (sshargs,
> qemu.ip, killcommand)
>

I don't think you actually need to kill the remote test server. As qemu
will be stopped anyway, and with it, all the processes that run inside qemu.

Also, it's better to use cmd only to execute the tests. Starting the server
is better done through SSHControl.run(), and copying the binary via
SSHControl.copy_to() - see examples in selfttest's imagefeatures.py or
runtime_test.py.

Alex

--0000000000003acfe005c34e8c3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 27 May 2021 at 10:11, Vinay Kumar &lt;<a href=3D"mailto:vina=
y.m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# To kill remote-test-s=
erver executing through background ssh<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0killcommand =3D &quot;kill -9 \$(ps | grep remote-test-server |=
=C2=A0 grep -v \&quot;grep\&quot; | awk &#39;{print \$1}&#39;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cmd =3D cmd + &quot;ssh %s root@%s \&quot;%s\&quot;;&quot; % (ssh=
args, qemu.ip, killcommand)<br></blockquote><div><br></div><div>I don&#39;t=
 think you actually need to kill the remote test server. As qemu will be st=
opped anyway, and with it, all the processes that run inside qemu.</div><di=
v><br></div><div>Also, it&#39;s better to use cmd only to execute the tests=
. Starting the server is better done through SSHControl.run(), and copying =
the binary via SSHControl.copy_to() - see examples in selfttest&#39;s image=
features.py or runtime_test.py.</div><div><br></div><div>Alex<br></div><div=
>=C2=A0</div></div></div>

--0000000000003acfe005c34e8c3f--
