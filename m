Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web08.4178.1622104335098546910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 01:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=daAidPwK;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id x2so2137209vss.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CKiSuvFo9Yx6XUgK4GtKLPjIO/pCIMs6CKwl8G1FK5U=;
        b=daAidPwKIc/X2pgBm+nQVcgl3C8++YOt7i1suI/p1paN2iLdCRJj1g9cFJAjgUeiqE
         1o5ge7HDfjuss0JHDeZbt1V10a5oRcSnXIQzU4tVGh9we/b7SGa2xFu6Uc/xV8S4U+cw
         2n1cDR5bFlNO5eEqmTDDz6hR4vCZMiIZagtgJcdkoFDVsMJS+T0tQad/gXydePhlIs3q
         V/H0xH12mbA0uN397NrGlj8N+M1Xbk/m2/x9TCpnAaZSWteonbQvTcp/TZZF3ywcpYki
         cgjrSQ+W6iOtHEmS8qoA+5n8rsGxPo07/kvaGJLuWqZJ9YJdCVWYfxvsU6WJGePqun/3
         Geog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CKiSuvFo9Yx6XUgK4GtKLPjIO/pCIMs6CKwl8G1FK5U=;
        b=jWP6wWBv/GQBskxfUsl1YYBkO+bBC2VwgOe3MFqjuz4oFGBay9NWVWZvucPPlfLTWO
         +3RxulqM9dDFN9x7odzpdf3N50lopU5736MxJAnmOLEqPFiC7SkN7q6Sio8AgTSq3vF3
         wtCxqpd7vGyUfwLL7bbCaW/FPQx2XIZX8x+49lBrcFbWWKcJWoM0yDvIb92+9809h0LB
         zLCY68Uiv05TGpkcmxg7WaD1OR/8euCWfvGnS5qLWVIa+4THbQIIxg0FTl+FC/lfss3+
         xr9dKEg3sEdRnuzZ+R4jOkTDO0NVq/WgYjgPpTgWV989AFsevxcGHe/PmgsWNBiPzcok
         XIuA==
X-Gm-Message-State: AOAM533fPS7lKYrFZaagLBXglvTnnLblxZog1zOyd7J2G15AkIRu4ncm
	nmBZRD4BwJI8BALp5oYYsqj7k8VcgT7PLli/ds8=
X-Google-Smtp-Source: ABdhPJwr6FlNJAkzm8rD0hRydDU3ru4xwHW9nSz5IWBC+JKvjmuK89sHn43z1OYyRQp6Dlaa+cAnjhKLam/0G9hO0J4=
X-Received: by 2002:a67:1502:: with SMTP id 2mr1418055vsv.54.1622104334278;
 Thu, 27 May 2021 01:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com> <20210527081100.1213973-4-vinay.m.engg@gmail.com>
In-Reply-To: <20210527081100.1213973-4-vinay.m.engg@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 27 May 2021 10:32:02 +0200
Message-ID: <CANNYZj9u-zG3TDf7JqtpTopRUGgSV4gHpyHDG8Sp1zQCq0ERVw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="000000000000a2241505c34b98a0"

--000000000000a2241505c34b98a0
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 May 2021 at 10:11, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> +                       cmd = cmd + " cd %s;  python3
> src/bootstrap/bootstrap.py test %s --target %s > summary.txt 2>&1;" %
> (builddir, testargs, targetsys)
> +                       # To kill remote-test-server executing through
> background ssh
> +                       killcommand = "kill -9 \$(ps | grep
> remote-test-server |  grep -v \"grep\" | awk '{print \$1}')"
> +                       cmd = cmd + "ssh %s root@%s \"%s\";" % (sshargs,
> qemu.ip, killcommand)
> +                       result = runCmd(cmd)
> +                       self.assertEqual(0, result.status, 'oe-selftest
> returned a non 0 status:%s' % result.output)


What does result.output contains if the test fails? Since both stdout and
stderr are redirected to a file, there might be nothing at all there?

I'd suggest you actually print all of summary.txt in case of failure (yes
it's over a megabyte, that is fine), and also point out where the file can
be found for further inspection.

Alex

--000000000000a2241505c34b98a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 27 May 2021 at 10:11, Vinay Kumar &lt;<a href=3D"mailto:vina=
y.m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D cmd + &quot; cd=
 %s;=C2=A0 python3 src/bootstrap/bootstrap.py test %s --target %s &gt; summ=
ary.txt 2&gt;&amp;1;&quot; % (builddir, testargs, targetsys)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# To kill remote-test-server executing through background ssh<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0killcommand =3D &quot;kill -9 \$(ps | grep remote-test-server |=
=C2=A0 grep -v \&quot;grep\&quot; | awk &#39;{print \$1}&#39;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cmd =3D cmd + &quot;ssh %s root@%s \&quot;%s\&quot;;&quot; % (ssh=
args, qemu.ip, killcommand)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0result =3D runCmd(cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0self.assertEqual(0, result.status, &#39;oe-selftest returned a no=
n 0 status:%s&#39; % result.output)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</blockquote><div><br></=
div><div>What does result.output contains if the test fails? Since both std=
out and stderr are redirected to a file, there might be nothing at all ther=
e?</div><div><br></div><div>I&#39;d suggest you actually print all of summa=
ry.txt in case of failure (yes it&#39;s over a megabyte, that is fine), and=
 also point out where the file can be found for further inspection.</div><d=
iv><br></div><div>Alex<br></div></div></div>

--000000000000a2241505c34b98a0--
