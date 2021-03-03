Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.6627.1614778886696412088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=THAX+V/I;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id ci14so23242147ejc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 05:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7fWLx9QdvZNyaloCTufxvqVgGcj4GZ92ZCXCvY37JkM=;
        b=THAX+V/IXYheo3NvIVEanR/1jm8HKcTI7yfLfR092bF8YkyM+CBhFP02IXVSXoh8Lk
         xu7VDuCpDJE64iJm9FxJBUkMhUm17QWp9/7gqz8/MMDfoFgiTCG7PF1s3+qOArRiVDfx
         SX6z2BK39GPd9nHiH1pe2XFbqLWjcPP6SEOE/OuxFHwItiFP3SNZq81YE+whLEbMofeD
         z8U+c8e1KUnDCxCE6wK1k9ooiQYC3MDqW1/iV8HUdKjPF3iL6K/4MY3beYPepILpOMf4
         wX7ehPW7lDddiIQny1yXYtCxwNSpKHwwfbSfjBa9S0FtbFOIzxhyYGloDKri0NkFdgkQ
         psRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7fWLx9QdvZNyaloCTufxvqVgGcj4GZ92ZCXCvY37JkM=;
        b=SLv06er8pINRhpn7XQ+wXG/y3KeHllYsp6jz0tTxw+FCzRiwwBrbvD3yl7PcmBWh62
         oKUjJkQeLPWleOSxisiIpA10LjLBuaXPFWE3+FECnLVIj7no1HYRKCvGpOuJQxt4mTPs
         QB+vhSomCFE8jYUr2jNXVSnUvC+4woXe1Z1BI0NDCA83bV5UEdTlPUDxFjtat3+4xikO
         JKauE3lnGqCYX8bv1AOs/gEoeV0PVHsEAhUGma5I4mweu7OdELuEV9xH9TYOQW5XTuzN
         ETuX2eEKP8+lUaT7xQWJzVcJRz8Bgmn49mKl8j7o45PctBE7f8eBDDXvTlVLrclm0i+l
         NbdA==
X-Gm-Message-State: AOAM5319qFGE6cH1oboD1vd1e57D7N0FkjjsbOnkwUhqCFY/NkI1gAoD
	s1HAEN7So6RovTCOiorI0efZAyT4LMexQ4CTuhc=
X-Google-Smtp-Source: ABdhPJy1/r4BUPKPM1VAc6/1xa+RuvuUA5WIV4MKRGXeOj2J2o9pnCRL60XwcrjWuJ6qDp4KgfSefXjF3tuaF/ggeSQ=
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr25904298ejc.408.1614778885174;
 Wed, 03 Mar 2021 05:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20210219175307.46218-1-jatedev@gmail.com> <20210219175307.46218-2-jatedev@gmail.com>
 <CANPvuRkEwbKHMDf7EzD9r8PwDR-akj8JJtc6D3-youOiYiU4Wg@mail.gmail.com>
 <CAPphmgayRkWXYqSmoCB-8LrTxfuSj+n+cVPX9F7HzpYe3QstCw@mail.gmail.com>
 <CANPvuRkSZxTOLM-gANOs_jrmkkMVZD83AJQMcJsWq5OCnhh1Lw@mail.gmail.com>
 <b06711bf332e943142cdda180915add2c78c6b69.camel@linuxfoundation.org> <CAPphmgZSqnYxV8K-jYZGvDxREAu5X--rMX7BODra6opYzg6e3g@mail.gmail.com>
In-Reply-To: <CAPphmgZSqnYxV8K-jYZGvDxREAu5X--rMX7BODra6opYzg6e3g@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Wed, 3 Mar 2021 13:41:13 +0000
Message-ID: <CANPvuRk30a7kfUoZEc+_hoXkS4TTzGRwu3V8496=bfc7FweQdg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iputils: Fix setcap/setuid of executables
To: Jate Sujjavanich <jatedev@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d77b3f05bca20151"

--000000000000d77b3f05bca20151
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jate,

Is that behavior that you explain that I am trying to said.

Jate Sujjavanich <jatedev@gmail.com> escreveu no dia quarta, 24/02/2021
=C3=A0(s) 17:19:

> I tested removing the cross-compile detection patch and removing libcap
> from PACKAGECONFIG. The build does find setcap on the build machine.
>
> log.do_configure:
> CONFIGURATION
> Capatiblity (with libcap): false
> ...
> Program /usr/sbin/setcap found: YES (/usr/sbin/setcap)
>
> However, meson did pass perm_type =3D setuid to setcap-setuid.sh.
>
> log.do_install
> [1/2]
> /workdir/poky/build/tmp/work/core2-64-poky-linux/iputils/s20200821-r0/rec=
i
> pe-sysroot-native/usr/bin/meson install --no-rebuild
> setcap-setuid.sh: changing
> '/workdir/poky/build/tmp/work/core2-64-poky-linux/ipu
> tils/s20200821-r0/image//bin/ping' to be setuid root executable
> ownership of
> '/workdir/poky/build/tmp/work/core2-64-poky-linux/iputils/s20200821-r0/im=
age//bin/ping'
> retained as root
>
> The conditional code in meson.build does fall back to setuid mode based o=
n
> the presence of libcap stored in cap_dep.found(). So I think you are righ=
t,
> Jose.
> if cap_dep.found() and setcap.found()
>         perm_type =3D 'caps'
>         setcap_path =3D setcap.path()
> else
>         perm_type =3D 'setuid'
>         setcap_path =3D '/dev/null'
> endif
>
> And setcap-setuid.sh uses a simple chown and chmod. I *think* these are
> universal in posix and that we don't have to worry about host contaminati=
on.
>         setuid)
>                 _log "changing '$exec_path' to be setuid root executable"
>                 chown -v root "$exec_path"
>                 chmod -v u+s "$exec_path"
>
> - Jate
>
>
> On Mon, Feb 22, 2021 at 3:26 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Mon, 2021-02-22 at 17:39 +0000, Jose Quaresma wrote:
>> > Hi,
>> >
>> > Jate Sujjavanich <jatedev@gmail.com> escreveu no dia segunda,
>> 22/02/2021 =C3=A0(s) 15:58:
>> > > If libcap is disabled in PACKAGECONFIG, then arguments two and three
>> mean
>> > > find_program find could setcap on the build machine. This would mean
>> it is
>> > >  not strictly determined by the recipe and it's determined by the
>> > > configuration of the build machine instead.
>> > >
>> >
>> > In this case the meson will not use the setcap from the build machine
>> because
>> > the libcap not found on the target sysroot. The libcap is a dependenci=
e
>> when
>> > PACKAGECONFIG+=3D"libcap" and in this case the meson it will fallback =
to
>> use
>> > setuid.
>> >
>> https://github.com/iputils/iputils/blob/f0c64bbb2b1563647bfeeed8d82bc4d2=
d2312d8a/meson.build#L221
>>
>> Whilst it may not use libcap, I seem to remember issues with the output
>> still not being deterministic since there was something in the out which
>> indicated the presence of setcap (or not).
>>
>> Cheers,
>>
>> Richard
>>
>>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d77b3f05bca20151
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jate,</div><div><br></div><div>Is that behavior th=
at you explain that I am trying to said.<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jate Sujjavanich &lt;<a h=
ref=3D"mailto:jatedev@gmail.com">jatedev@gmail.com</a>&gt; escreveu no dia =
quarta, 24/02/2021 =C3=A0(s) 17:19:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div>I tested removing the cross-compi=
le detection patch and removing libcap from PACKAGECONFIG. The build does f=
ind setcap on the build machine.<br></div><div><br></div><div>log.do_config=
ure:<br></div><div style=3D"margin-left:40px"><span style=3D"font-family:mo=
nospace">CONFIGURATION</span></div><div style=3D"margin-left:40px"><span st=
yle=3D"font-family:monospace">Capatiblity (with libcap): false</span></div>=
<div style=3D"margin-left:40px"><span style=3D"font-family:monospace">...<b=
r></span></div><div style=3D"margin-left:40px"><span style=3D"font-family:m=
onospace">Program /usr/sbin/setcap found: YES (/usr/sbin/setcap)</span></di=
v><div><br></div><div>However, meson did pass perm_type =3D setuid to setca=
p-setuid.sh.<br></div><div><br></div><div>log.do_install</div><div style=3D=
"margin-left:40px"><span style=3D"font-family:monospace">[1/2] /workdir/pok=
y/build/tmp/work/core2-64-poky-linux/iputils/s20200821-r0/reci<br>pe-sysroo=
t-native/usr/bin/meson install --no-rebuild<br>setcap-setuid.sh: changing &=
#39;/workdir/poky/build/tmp/work/core2-64-poky-linux/ipu<br>tils/s20200821-=
r0/image//bin/ping&#39; to be setuid root executable<br>ownership of &#39;/=
workdir/poky/build/tmp/work/core2-64-poky-linux/iputils/s20200821-r0/image/=
/bin/ping&#39; retained as root</span></div><span style=3D"font-family:mono=
space"></span><div><br></div><div>The conditional code in meson.build does =
fall back to setuid mode based on the presence of libcap stored in cap_dep.=
found(). So I think you are right, Jose.<br></div><div style=3D"margin-left=
:40px"><span style=3D"font-family:monospace">if cap_dep.found() and setcap.=
found()<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 perm_type =3D &#39;caps&#39;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 setcap_path =3D setcap.path()<br>else<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 perm_type =3D &#39;setuid&#39;<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 setcap_path =3D &#39;/dev/null&#39;<br>endif</span></div><span styl=
e=3D"font-family:monospace"></span><div><br></div><div>And setcap-setuid.sh=
 uses a simple chown and chmod. I *think* these are universal in posix and =
that we don&#39;t have to worry about host contamination.<br></div><div sty=
le=3D"margin-left:40px"><span style=3D"font-family:monospace">=C2=A0 =C2=A0=
 =C2=A0=C2=A0=C2=A0 setuid)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 _log &quot;changing &#39;$exec_path&#39; to be setuid root ex=
ecutable&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
hown -v root &quot;$exec_path&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 chmod -v u+s &quot;$exec_path&quot;</span></div><span =
style=3D"font-family:monospace"></span><div><br></div><div>- Jate <br></div=
><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 22, 2021 at 3:26 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Mon, 2021-02-22 at 17:39 +0000, Jose Quaresma wr=
ote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com" target=3D"_b=
lank">jatedev@gmail.com</a>&gt; escreveu no dia segunda, 22/02/2021 =C3=A0(=
s) 15:58:<br>
&gt; &gt; If libcap is disabled in PACKAGECONFIG, then arguments two and th=
ree mean=C2=A0<br>
&gt; &gt; find_program find could setcap on the build machine. This would m=
ean it is<br>
&gt; &gt;=C2=A0 not strictly determined by the recipe and it&#39;s determin=
ed by the=C2=A0<br>
&gt; &gt; configuration of the build machine instead.<br>
&gt; &gt; <br>
&gt; <br>
&gt; In this case the meson will not use the setcap from the build machine =
because=C2=A0<br>
&gt; the libcap not found on the target sysroot. The libcap is a dependenci=
e when=C2=A0<br>
&gt; PACKAGECONFIG+=3D&quot;libcap&quot; and in this case the meson it will=
 fallback to use<br>
&gt; setuid.<br>
&gt; <a href=3D"https://github.com/iputils/iputils/blob/f0c64bbb2b1563647bf=
eeed8d82bc4d2d2312d8a/meson.build#L221" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/iputils/iputils/blob/f0c64bbb2b1563647bfeeed8d82bc4d2d=
2312d8a/meson.build#L221</a><br>
<br>
Whilst it may not use libcap, I seem to remember issues with the output=C2=
=A0<br>
still not being deterministic since there was something in the out which=C2=
=A0<br>
indicated the presence of setcap (or not).<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</=
div></div></div>

--000000000000d77b3f05bca20151--
