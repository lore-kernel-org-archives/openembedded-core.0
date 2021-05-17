Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.17624.1621251676028435407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 04:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V1+K8Xhs;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id j13so2942981vsf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pFdghsqpHtwOTf58mtIJ243NPGnQLs7I+pRfErIm71Y=;
        b=V1+K8XhsIJgLP+x086oafLki7FGYxKdxnWoQRn7jT0CsxF/wN3hKpJXRGAbLT8DUQy
         9z3t+Lx6slMBgbucGcmD4FhDM2pqAmqx5Xj60MofiUS+DET1P7Oy7cw5Ix7RY0G9O+wF
         P3OWDMX2pmle1EEwubUucIq0delkSLp4QklXGJ5qD2FozhVGInFUdVVNao/mryUipp6g
         Ck/gNtOZq1rQKBULZWK5yy0O0ztIY+IV6KgzJksSq1yw5j1AAyKOUef3H4ZAGNUSltvE
         f/br1YdKYUnKhx8SbRq4btYx1tNquLY23rI5CuEsFE4tDPnvah6KSFwv0GLEtbBJe16L
         JjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pFdghsqpHtwOTf58mtIJ243NPGnQLs7I+pRfErIm71Y=;
        b=Biv/U+vXfObK34IVe5p+m0DDCPC6ZHN8IZZ8yqto4CoKKvxbY8jexCSsi1BcLRHrY3
         uOIUYtYoLzVOSlA6Dd6GAIre3kmwo0l5AbEB9plAP/oFNf3gGc0imQHHQYZ5bI2lPEMb
         CMJceoVXZJeiZ2RRvaXsTEFRsAb+J6hVvBAsJzkl3kjDPFi7ab5Ta15NWpglg70GP4w1
         Nggp1SGtLV7JCi3TXPHswI37QieYDGSunROt9JUF2xp66enceo4hgq4+4gpu8I/AgV8r
         NkeZJEPXCcPQybwFyBVeZfVwPvRBdTeD9diJPOlLteVqLfxHW6yB/PyT+5YFocgMZOQX
         TSRg==
X-Gm-Message-State: AOAM531F2JI18NQSJIjizTFbiEf3E0klt6M0n9kfM8B5vtteksa+o2rY
	oaAxEfmCFxgthb69/Ckd9c5sJ7erx/cm+aHqoBc=
X-Google-Smtp-Source: ABdhPJwVezm8LW0o2RfQ5rJBTE0fMqgGDYKCwfgtDVsBvRVCdQ4RLXMzR93wNbtR6dau3BPDm/MW36T3Of7irqvvDP4=
X-Received: by 2002:a67:d715:: with SMTP id p21mr42199157vsj.31.1621251675185;
 Mon, 17 May 2021 04:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <CANNYZj-96kqjY=jRUoWQMzgwYtaCakx2guw5QnVFfW45HzQxtQ@mail.gmail.com>
 <CANUMPcUV7+TQzFN+5svgHD_BVJy_0tZXN+P_8or1bhQVNgqNtw@mail.gmail.com>
In-Reply-To: <CANUMPcUV7+TQzFN+5svgHD_BVJy_0tZXN+P_8or1bhQVNgqNtw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 17 May 2021 13:41:03 +0200
Message-ID: <CANNYZj9u5XxFv6TbgSvTTfrUHZNGXFbeMS7G+cJNFqrepCfrdQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] rust-testsuite.inc : Rust cross testing.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="00000000000030e51705c2851284"

--00000000000030e51705c2851284
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 May 2021 at 13:20, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Hi Alex,
>
> >> +    scp -P 2222 -o StrictHostKeyChecking=no
> build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server
> root@127.0.0.1:~/
> >> +    ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1
> "~/remote-test-server -v remote"
>
> I tried copy_to() and run from sshcontrol.py on qemuimage successfully.
> Howerver, I could not figure out the relative path for
> "remote-test-server" from rust.py .
>

With get_bb_var() you can. Grep for examples in
meta/lib/oeqa/selftest/cases.

Alex

--00000000000030e51705c2851284
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 17 May 2021 at 13:20, Vinay Kumar &lt;<a href=3D"mailto:vina=
y.m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi Alex,<br>
<br>
&gt;&gt; +=C2=A0 =C2=A0 scp -P 2222 -o StrictHostKeyChecking=3Dno build/${S=
NAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/<br=
>
&gt;&gt; +=C2=A0 =C2=A0 ssh -p 2222 -o StrictHostKeyChecking=3Dno -f <a hre=
f=3D"mailto:root@127.0.0.1" target=3D"_blank">root@127.0.0.1</a> &quot;~/re=
mote-test-server -v remote&quot;<br>
<br>
I tried copy_to() and run from sshcontrol.py on qemuimage successfully.<br>
Howerver, I could not figure out the relative path for<br>
&quot;remote-test-server&quot; from rust.py .<br></blockquote><div><br></di=
v><div>With get_bb_var() you can. Grep for examples in meta/lib/oeqa/selfte=
st/cases.</div><div><br></div><div>Alex<br></div></div></div>

--00000000000030e51705c2851284--
