Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web12.17365.1621248991834338812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fnWGnR8s;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id t6so2849299vsp.13
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=onF9x5ixe6Xp3ARKU0k6vtIjG0K8caR7/87CLyzqp6I=;
        b=fnWGnR8s6NbGM9g7dmyoC7obAriHEFZwTZ3krA59VEx2PpcJptidBBZCy/xx/U55Hv
         jM2Go7qekBrGGynNZ4YGiV46+jOetuszbJYemZNHieBqVG78RFYZU4o5vR+c9h2/TWyW
         EM3VJaT7satrXb0iThojIEkd+RWRgCZIr8Evn9jbWpn6yU8Dcyr0dwvk0hTMZZ/Tzup1
         13CdV7vbwOpEavdHEYj5xpg5w3eqT6wIEuz9xTK9t/+rDAekDmEe0H+w+0K+3VCRLL3o
         Gtpf9jovrHnIUWAgUgnneoaW973wy0dOwu1M0E2dgVmD0S1aijrkBMPqKoHp307BUEFv
         p9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=onF9x5ixe6Xp3ARKU0k6vtIjG0K8caR7/87CLyzqp6I=;
        b=GssxNOUvCr62MRfKesUGFWc5qYWTKYnVQNIOw6sOhEXQur4Z4hmZKMDQF0QuCAk1Ok
         LZOork9b6U2QGs8QCp3OdpJ53l+mrr0dIP4dme8Dyev8Uoq2uJq9196aHVbsfqh4Ke/n
         B3u9oiH0pSD3kFB4RGvGhvu5rkc1hfEHksGAm3y/RQiHqclmqEY6F99+Chs/kbE/Ocre
         xhvtI6PIBKkLKzxFh5UvVVJZPyhnXcv028z8HKHJvauIRslndZxfM54dh+/bFoA2/QBw
         d7FkpPIEeWmsgxt9ShzGuytB/dQSiAht+Ns7AhE597JGGJ2KJZqSiHLjeqkei8SHGa9G
         Qg5Q==
X-Gm-Message-State: AOAM531FN7B857q8t+dFlLggO12ueQBki1yKndf0luPVsca8lKVQVHgX
	BcZSeRH+jpCGwXZtD3XXK5XKhT2zWPKOACp2HxM=
X-Google-Smtp-Source: ABdhPJyEhyU4PJmhLHBSGjuG195/P6qelFUwWW4W5jffw2VMQIBqfBPNWXTlBb3Lv6wBugUa8QsEsAh51T9497lzZAI=
X-Received: by 2002:a67:c401:: with SMTP id c1mr49795938vsk.51.1621248990998;
 Mon, 17 May 2021 03:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <20210517103528.24434-4-vinay.m.engg@gmail.com>
In-Reply-To: <20210517103528.24434-4-vinay.m.engg@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 17 May 2021 12:56:19 +0200
Message-ID: <CANNYZj9qwrKK14OcJPG=ayd_D1=1TFJuzZAYjzke4Ce=UZtDLg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] runqemu: Add hostfwd for rust testing.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="0000000000003372b405c284729c"

--0000000000003372b405c284729c
Content-Type: text/plain; charset="UTF-8"

This is better to set via QB_SLIRP_OPT, rather than hardcode a special case
directly into the script.

Alex

On Mon, 17 May 2021 at 12:35, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Set hostfwd for rust 12345 -> 12345. This port is used for
> "remote-test-server" and "remote-test-client" communication
> while executing on qemutarget remotely.
>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  scripts/runqemu | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index dd92a64553..9569dbe72f 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1056,7 +1056,8 @@ class BaseConfig(object):
>          self.kernel_cmdline_script += netconf
>          # Port mapping
>          hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
> -        qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" %
> (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
> +        rustport = "hostfwd=tcp::12345-:12345"
> +        qb_slirp_opt_default = "-netdev user,id=net0%s,%s,tftp=%s" %
> (hostfwd, rustport, self.get('DEPLOY_DIR_IMAGE'))
>          qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
>          # Figure out the port
>          ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
> --
> 2.17.1
>
>

--0000000000003372b405c284729c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is better to set via QB_SLIRP_OPT, rather than h=
ardcode a special case directly into the script.<br></div><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, 17 May 2021 at 12:35, Vinay Kumar &lt;<a href=3D"m=
ailto:vinay.m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Set hostfwd for rust 12=
345 -&gt; 12345. This port is used for<br>
&quot;remote-test-server&quot; and &quot;remote-test-client&quot; communica=
tion<br>
while executing on qemutarget remotely.<br>
<br>
Signed-off-by: Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.com" ta=
rget=3D"_blank">vinay.m.engg@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index dd92a64553..9569dbe72f 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -1056,7 +1056,8 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel_cmdline_script +=3D netconf<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Port mapping<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hostfwd =3D &quot;,hostfwd=3Dtcp::2222-:2=
2,hostfwd=3Dtcp::2323-:23&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qb_slirp_opt_default =3D &quot;-netdev user,id=
=3Dnet0%s,tftp=3D%s&quot; % (hostfwd, self.get(&#39;DEPLOY_DIR_IMAGE&#39;))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rustport =3D &quot;hostfwd=3Dtcp::12345-:12345=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qb_slirp_opt_default =3D &quot;-netdev user,id=
=3Dnet0%s,%s,tftp=3D%s&quot; % (hostfwd, rustport, self.get(&#39;DEPLOY_DIR=
_IMAGE&#39;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qb_slirp_opt =3D self.get(&#39;QB_SLIRP_O=
PT&#39;) or qb_slirp_opt_default<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Figure out the port<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ports =3D re.findall(&#39;hostfwd=3D[^-]*=
:([0-9]+)-[^,-]*&#39;, qb_slirp_opt)<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--0000000000003372b405c284729c--
