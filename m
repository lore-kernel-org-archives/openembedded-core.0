Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.607.1614793657429036733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 09:47:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jsy2jdgR;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: jatedev@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id j12so16746123pfj.12
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 09:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S63SuBtn+foFLgrTbHK8AovDT3TZ3dCU0vVOYveDtRU=;
        b=Jsy2jdgRSUvWgozcqJ9sW/FmtUSDV3SbtZJZ4qIXxAjZ6j4LS52Q6ieNucN8InNtcF
         +U288P6zdVm26fFQ2LfymQtdVR6L6uW9LOChzs+acjCli5cAb9RzvwRwPoNWYHPlHfql
         WflyBUWNs5n+meXNHzlFBvcQpitLpGjUC/KGXqzuZyM0393eHK4h0AexoVNKd9kHGAPj
         YnQu5wCZ8fjY5wpfpfuptKFobB/Y5e2cDSK/IIMlcVz2wtorSCC8cZbvcYqmHaIu93y2
         aalXcsrjaW1pPL1zaRoH+tN/JDQ34k2JjD3WEqYiVufofIXLfHI1sz+I+ERecgHnepZ1
         WHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S63SuBtn+foFLgrTbHK8AovDT3TZ3dCU0vVOYveDtRU=;
        b=fAkt6Sus7HKbteIT8En+gRwClcPEokz32cwWg9QpJF2sGkpGKByKYy+SNQIHW2D4nf
         EADs5k2EiJFS2palMHg47ncyi9NP+ABUo6ZE5md+1Z7ATuFSvRPPzL4p7IWdDM4dtbzQ
         allDBiFvM+aYtGEpvqbFgPw6UUWwZlfiNrOWe3fh9Gbnonta6+/5NQNjJEQxPKSi8c4p
         aOjpNxC/o/oTFVnGbul+Z7EvN1DKEwufnCnfXCabBwfU9vYV042ffgT7kwdGL4rzRaPG
         S9pB40vRGZCIQWxeKFE4OCqBQZY/IdGJCEUw2AnGwOkpUxoZEgRKgxjUMycTJOlCqXsg
         F2Jw==
X-Gm-Message-State: AOAM530KaLiG2XUSMO6xz9YFkp8JGx1F1i9RgTWJRbL72tVVBOhWolQo
	hrTpIVXPAiRgYWIHluciuGPT3ai+CMLr2Nn843M=
X-Google-Smtp-Source: ABdhPJyHq6DNZpxTNLjvF/Ky12a1kSTkDv/MICMBfGAth7WwHW4yhHePytlIAvGgdqsWWyQnNAuapR2vQ+pkALKSOjQ=
X-Received: by 2002:a05:6a00:80e:b029:1b6:39dd:8b2a with SMTP id
 m14-20020a056a00080eb02901b639dd8b2amr4012378pfk.23.1614793656950; Wed, 03
 Mar 2021 09:47:36 -0800 (PST)
MIME-Version: 1.0
References: <20210219175307.46218-1-jatedev@gmail.com> <20210219175307.46218-2-jatedev@gmail.com>
 <CANPvuRkEwbKHMDf7EzD9r8PwDR-akj8JJtc6D3-youOiYiU4Wg@mail.gmail.com>
 <CAPphmgayRkWXYqSmoCB-8LrTxfuSj+n+cVPX9F7HzpYe3QstCw@mail.gmail.com>
 <CANPvuRkSZxTOLM-gANOs_jrmkkMVZD83AJQMcJsWq5OCnhh1Lw@mail.gmail.com>
 <b06711bf332e943142cdda180915add2c78c6b69.camel@linuxfoundation.org>
 <CAPphmgZSqnYxV8K-jYZGvDxREAu5X--rMX7BODra6opYzg6e3g@mail.gmail.com> <CANPvuRk30a7kfUoZEc+_hoXkS4TTzGRwu3V8496=bfc7FweQdg@mail.gmail.com>
In-Reply-To: <CANPvuRk30a7kfUoZEc+_hoXkS4TTzGRwu3V8496=bfc7FweQdg@mail.gmail.com>
From: "Jate Sujjavanich" <jatedev@gmail.com>
Date: Wed, 3 Mar 2021 12:47:25 -0500
Message-ID: <CAPphmgYU9uPtnbknkcSyuzvJiHQHDtZw5JqjWLUT+LFofKNehg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iputils: Fix setcap/setuid of executables
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004ee5cf05bca572b0"

--0000000000004ee5cf05bca572b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose,

Yes, I forgot to add a sentence saying that my testing confirmed what you
said. Your explanation was helpful in learning about this meson build.

- Jate

On Wed, Mar 3, 2021 at 8:41 AM Jose Quaresma <quaresma.jose@gmail.com>
wrote:

> Hi Jate,
>
> Is that behavior that you explain that I am trying to said.
>
> Jate Sujjavanich <jatedev@gmail.com> escreveu no dia quarta, 24/02/2021
> =C3=A0(s) 17:19:
>
>> I tested removing the cross-compile detection patch and removing libcap
>> from PACKAGECONFIG. The build does find setcap on the build machine.
>>
>> log.do_configure:
>> CONFIGURATION
>> Capatiblity (with libcap): false
>> ...
>> Program /usr/sbin/setcap found: YES (/usr/sbin/setcap)
>>
>> However, meson did pass perm_type =3D setuid to setcap-setuid.sh.
>>
>> log.do_install
>> [1/2]
>> /workdir/poky/build/tmp/work/core2-64-poky-linux/iputils/s20200821-r0/re=
ci
>> pe-sysroot-native/usr/bin/meson install --no-rebuild
>> setcap-setuid.sh: changing
>> '/workdir/poky/build/tmp/work/core2-64-poky-linux/ipu
>> tils/s20200821-r0/image//bin/ping' to be setuid root executable
>> ownership of
>> '/workdir/poky/build/tmp/work/core2-64-poky-linux/iputils/s20200821-r0/i=
mage//bin/ping'
>> retained as root
>>
>> The conditional code in meson.build does fall back to setuid mode based
>> on the presence of libcap stored in cap_dep.found(). So I think you are
>> right, Jose.
>> if cap_dep.found() and setcap.found()
>>         perm_type =3D 'caps'
>>         setcap_path =3D setcap.path()
>> else
>>         perm_type =3D 'setuid'
>>         setcap_path =3D '/dev/null'
>> endif
>>
>> And setcap-setuid.sh uses a simple chown and chmod. I *think* these are
>> universal in posix and that we don't have to worry about host contaminat=
ion.
>>         setuid)
>>                 _log "changing '$exec_path' to be setuid root executable=
"
>>                 chown -v root "$exec_path"
>>                 chmod -v u+s "$exec_path"
>>
>> - Jate
>>
>>
>> On Mon, Feb 22, 2021 at 3:26 PM Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>>
>>> On Mon, 2021-02-22 at 17:39 +0000, Jose Quaresma wrote:
>>> > Hi,
>>> >
>>> > Jate Sujjavanich <jatedev@gmail.com> escreveu no dia segunda,
>>> 22/02/2021 =C3=A0(s) 15:58:
>>> > > If libcap is disabled in PACKAGECONFIG, then arguments two and thre=
e
>>> mean
>>> > > find_program find could setcap on the build machine. This would mea=
n
>>> it is
>>> > >  not strictly determined by the recipe and it's determined by the
>>> > > configuration of the build machine instead.
>>> > >
>>> >
>>> > In this case the meson will not use the setcap from the build machine
>>> because
>>> > the libcap not found on the target sysroot. The libcap is a
>>> dependencie when
>>> > PACKAGECONFIG+=3D"libcap" and in this case the meson it will fallback=
 to
>>> use
>>> > setuid.
>>> >
>>> https://github.com/iputils/iputils/blob/f0c64bbb2b1563647bfeeed8d82bc4d=
2d2312d8a/meson.build#L221
>>>
>>> Whilst it may not use libcap, I seem to remember issues with the output
>>> still not being deterministic since there was something in the out whic=
h
>>> indicated the presence of setcap (or not).
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>

--0000000000004ee5cf05bca572b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Jose,</div><div><br></div><div>Yes, I forgot to add a=
 sentence saying that my testing confirmed what you said. Your explanation =
was helpful in learning about this meson build.</div><div><br></div><div>- =
Jate<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 3, 2021 at 8:41 AM Jose Quaresma &lt;<a href=3D=
"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv>Hi Jate,</div><div><br></div><div>Is that behavior that you explain that=
 I am trying to said.<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Jate Sujjavanich &lt;<a href=3D"mailto:jated=
ev@gmail.com" target=3D"_blank">jatedev@gmail.com</a>&gt; escreveu no dia q=
uarta, 24/02/2021 =C3=A0(s) 17:19:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div>I tested removing the cross-compil=
e detection patch and removing libcap from PACKAGECONFIG. The build does fi=
nd setcap on the build machine.<br></div><div><br></div><div>log.do_configu=
re:<br></div><div style=3D"margin-left:40px"><span style=3D"font-family:mon=
ospace">CONFIGURATION</span></div><div style=3D"margin-left:40px"><span sty=
le=3D"font-family:monospace">Capatiblity (with libcap): false</span></div><=
div style=3D"margin-left:40px"><span style=3D"font-family:monospace">...<br=
></span></div><div style=3D"margin-left:40px"><span style=3D"font-family:mo=
nospace">Program /usr/sbin/setcap found: YES (/usr/sbin/setcap)</span></div=
><div><br></div><div>However, meson did pass perm_type =3D setuid to setcap=
-setuid.sh.<br></div><div><br></div><div>log.do_install</div><div style=3D"=
margin-left:40px"><span style=3D"font-family:monospace">[1/2] /workdir/poky=
/build/tmp/work/core2-64-poky-linux/iputils/s20200821-r0/reci<br>pe-sysroot=
-native/usr/bin/meson install --no-rebuild<br>setcap-setuid.sh: changing &#=
39;/workdir/poky/build/tmp/work/core2-64-poky-linux/ipu<br>tils/s20200821-r=
0/image//bin/ping&#39; to be setuid root executable<br>ownership of &#39;/w=
orkdir/poky/build/tmp/work/core2-64-poky-linux/iputils/s20200821-r0/image//=
bin/ping&#39; retained as root</span></div><span style=3D"font-family:monos=
pace"></span><div><br></div><div>The conditional code in meson.build does f=
all back to setuid mode based on the presence of libcap stored in cap_dep.f=
ound(). So I think you are right, Jose.<br></div><div style=3D"margin-left:=
40px"><span style=3D"font-family:monospace">if cap_dep.found() and setcap.f=
ound()<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 perm_type =3D &#39;caps&#39;<br>=C2=
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>
</blockquote></div>

--0000000000004ee5cf05bca572b0--
