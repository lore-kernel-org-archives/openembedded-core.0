Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web09.273.1621701287452614764
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 May 2021 09:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lX8jgjlH;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id n131so4220932vke.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 May 2021 09:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7wt3NDBziKEcOYnGZt4B1z11yjncq+bUfmsSebCrkjg=;
        b=lX8jgjlHQ/CbmH17Guatg/WrjKo/PlGkfK7Y1gX+2bK4uNwh+FDo0i3R+Vyt2GZDrJ
         3YnH8t4+T7BOUZF8XhUSn29ADBWRnVk7fcXGdBVbpsfHxRcf3yAHdf3dHSuZYuD/ziVy
         SmIT8UMok+hqZLws9f2lvjs/lta7fUSUpmODwUHwDMtRaUzrcY/8VFfEzfvQIpSdrSrg
         6x157CqXJCIUXXV9Pt/P4J3svqV68WpND4x6lwQkSsVHgS1oPDGTMt0Ow8w/XM1uR/VB
         0cqI2ixP6RKdaO733XqUyqJqk/zOH4uEdCzdDHlXY1uudt8LH49jZSBYhl4R/RBEOTXw
         0eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7wt3NDBziKEcOYnGZt4B1z11yjncq+bUfmsSebCrkjg=;
        b=kt20kf7XacNka7A3voQoeHypXS88mzdetDSLydOma+of1AAXnyn7ZkcqGUknf7affF
         nMfzsR4yBrCeV7crinwKpCjyKZuN8k3BV/jmkD6f3iVf/Yrua3JW3dhQYJEzYISqhTcA
         zQFrG5l7ECMu1hxD5/lIG4cBIDxa0rGEeqLPB6WcH2ntdqp2BhQGBvCt9iMT5F9WmOs3
         E6aZCoi4NQVW2Swo0EkC0eU7sYFTFX65wqUReJfjGzMBs0SU0+VGTrk2j0tMU+ZveZdt
         liSq7f6psOm1fHAdcVqZpayOIgnC99nTPBm0s0GvonCGVRGahebmGGajCmnue8OKxH2s
         UfLA==
X-Gm-Message-State: AOAM5328O7BcikKG38jRrqCExpEB/aXxBQtH+zfNcN5CdSyNJe6Dr9hl
	4OvjtTosYGbe2IMSyTWh/4e1Lp0V/ZjoulVHf8w=
X-Google-Smtp-Source: ABdhPJyw/mfz49dTQX3WnaKwD3tqdRwMYV6vG4kfWYC5g1crCu8Sy9x9GZIbikJlMZSwXHJ5vevyPh7vVYnLCz50deY=
X-Received: by 2002:a1f:1d4a:: with SMTP id d71mr15969250vkd.0.1621701286586;
 Sat, 22 May 2021 09:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-yODhEEFErtUxBeiw3O1YvEfV-hGOOW_uPNvo6x8mNYQ@mail.gmail.com>
 <20210521132914.140884-1-vinay.m.engg@gmail.com> <20210521132914.140884-4-vinay.m.engg@gmail.com>
In-Reply-To: <20210521132914.140884-4-vinay.m.engg@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 22 May 2021 18:34:35 +0200
Message-ID: <CANNYZj-v-hcO19SSkYgYKSeOBj7f1u4zvSRkfcx5UAm=ndye_A@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="0000000000001e6cb205c2edc1da"

--0000000000001e6cb205c2edc1da
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 May 2021 at 15:29, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> +                       # Set TEST_DEVICE_ADDR to image ip
> +                       cmd  = "export TEST_DEVICE_ADDR=%s:12345;" %
> qemu.ip
> +                       runCmd(cmd)
> +
> +                        # Test execution
> +                       bitbake("{} -c check".format(recipe))
> +                       # Stop ssh background execution
> +                       t_thread.stop()
>
>
TEST_DEVICE_ADDR set this way will not propagate into the task environment.
The task itself consists only of:

do_check () {

    rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" >
summary.txt 2> /dev/null
}

so you can simply move that directly into selftest:

runCmd("export TEST_DEVICE_ADDR=%s:12345 rust_runx test --no-fail-fast
--bless --target "%s"" %(....))

Alex

--0000000000001e6cb205c2edc1da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 21 May 2021 at 15:29, Vinay Kumar &lt;<a href=3D"mailto:vina=
y.m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Set TEST_DEVICE_ADDR =
to image ip<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cmd=C2=A0 =3D &quot;export TEST_DEVICE_ADDR=3D%s:12345;&quot; % q=
emu.ip<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0runCmd(cmd)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # Test execution<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bitbake(&quot;{} -c check&quot;.format(recipe))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# Stop ssh background execution<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0t_thread.stop()<br><br></blockquote><div><br></div><div>TEST_DEVI=
CE_ADDR set this way will not propagate into the task environment. The task=
 itself consists only of:</div><div><br></div><div>do_check () {<br><br>
=C2=A0 =C2=A0 rust_runx test --no-fail-fast --bless --target &quot;${TARGET=
_SYS}&quot; &gt; summary.txt 2&gt; /dev/null<br>
}</div><div><br></div><div>so you can simply move that directly into selfte=
st:</div><div><br></div><div>runCmd(&quot;export TEST_DEVICE_ADDR=3D%s:1234=
5 rust_runx test --no-fail-fast --bless --target &quot;%s&quot;&quot; %(...=
.))</div><div><br></div><div>Alex<br></div><div>=C2=A0</div></div></div>

--0000000000001e6cb205c2edc1da--
