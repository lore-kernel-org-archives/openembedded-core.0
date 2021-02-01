Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web12.28776.1612149525837879774
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 19:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y0Ch1Shl;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: dorindabassey@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id e133so5032604iof.8
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 19:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=1eBn0XAYBRboDGXaVv3q2/ObNzIm31FXBx5CUsfMbls=;
        b=Y0Ch1ShlKI7H45HdFKTp75ykD6lKDrthwbRTos8SMalC48KMRWZPRdQ7eHoIcezbuf
         N8phWNI2apm6oT9FlgZSD95ZWBVInAkO1QHrxUsnJAG2xsRmBKcY4efNkv6ksuPxTcPk
         QlpfpRZ71s1+jV5iGAFS67+oP0I5d/Urw2qBjE16MnyTOqfivaiIZ6YiqOftULZvITXS
         Rv41G61W8bcEjZHYv6OvvdCOHmTf5ff5nLxBhyWNfLdY15ZatVOsZnkw+JYdPvFy9Qe2
         x/c/05BDWaIXTbQyjIN6JBP1GEx/axSTFw13iBIrNFdMLAUzKMeErAqLsrYVdYesjJka
         LYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=1eBn0XAYBRboDGXaVv3q2/ObNzIm31FXBx5CUsfMbls=;
        b=Q4WX6pQUER122RPLgfVQJelXBl1w0Fl07ovDIfAM7D7fTysHqmFvt3RiWjqcUv7HGl
         bN/H03YRH617YTHnCjgVMw+C/Z8ZNRbt1/EdGc66W5wBNtVUCP/R6au+gSYgnlPArOqc
         sQbTkyJj+hy4j7oxgvAe+jawaqxI8rjgOMkaV/rSmsTn7E7hOjL0SDA7BsFfgtCDNf4I
         3aXf1IAy03UgsexTizRrTi11y9rDIlZ/2+PnKrbTJelsYUw92/uPyliIF+K3XrYvzH3Y
         gFE+ShxzMgFOjGIAx1JLKLQdG81Bs0ePIM5SmxqoggoK/ICbZ72f2nLg8beFxYNUPyxw
         9qAg==
X-Gm-Message-State: AOAM531iAvjFRqDtUN5gsN/7aDBLw/VNopHQN8BncHftQlvImgihsn57
	PPXUflRDSZsbQtWZrIH4kOuOXfFjChyl1Ve6xVI=
X-Google-Smtp-Source: ABdhPJxaK8oltaACc6+o4JEcvDB4o2PBarfDylFq+ila5aZCIhf7Zyuc2Cq6iIszHioVk8g7MQ9ptVShIQNMlcryP0s=
X-Received: by 2002:a5e:c101:: with SMTP id v1mr332080iol.108.1612149525160;
 Sun, 31 Jan 2021 19:18:45 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a92:ce09:0:0:0:0:0 with HTTP; Sun, 31 Jan 2021 19:18:44
 -0800 (PST)
Received: by 2002:a92:ce09:0:0:0:0:0 with HTTP; Sun, 31 Jan 2021 19:18:44
 -0800 (PST)
In-Reply-To: <1559e89a094f9f6eaa3bfa9b01f6126a36e1d0d3.camel@linuxfoundation.org>
References: <20210131192649.30005-1-dorindabassey@gmail.com> <1559e89a094f9f6eaa3bfa9b01f6126a36e1d0d3.camel@linuxfoundation.org>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Sun, 31 Jan 2021 22:18:44 -0500
Message-ID: <CAJSnhztQDZ+H5naTZ9Xj_52h9TuHH=K9xmcuTjzJF8jY0X2hNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] sanity.bbclass: check if PSEUDO_IGNORE_PATHS and paths under pseudo control overlap
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c5a4e005ba3dcf6d"

--000000000000c5a4e005ba3dcf6d
Content-Type: text/plain; charset="UTF-8"

I agree.
Thanks for the helpful hints here, will be more thorough in future patches
:)

Thanks,
Dorinda

On Jan 31, 2021 22:50, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

On Sun, 2021-01-31 at 14:26 -0500, Dorinda wrote:
>
> +    # Check if PSEUDO_IGNORE_PATHS and and paths under pseudo control
overlap
> +    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS',
expand=True).split(",")
> +    pseudo_control_dir = "${D},${PKGD},${PKGDEST},${
IMAGEROOTFS},${SDK_OUTPUT}"
> +    pseudocontroldir = d.getVar('pseudo_control_dir',
expand=True).split(",")

I'm not sure that would actually work without a setVar as
pseudo_control_dir isn't a variable.

What you probably want is:

pseudocontroldir = d.expand(pseudo_control_dir, expand=True).split(",")


How did you test this? Did you try setting S = "${WORKDIR}/pack" in a
recipe to ensure it correctly detects the issue?


> +    for i in pseudoignorepaths:
> +        for j in pseudocontroldir:
> +            if i and j:
> +                if j.startswith(i):
> +                    status.addresult("a path included in
PSEUDO_IGNORE_PATHS " + str(i) + " and the path " + str(j) + " are
overlapping each other, please set this path " + str(j) + " to point to a
different directory. \n")

How about improving this to:

'''
A path in PSEUDO_IGNORE_PATHS " + str(i) + " and the path " + str(j) +
" overlap and this will break pseudo permission and ownership tracking.
Please set the path " + str(j) + " to a different directory which does
not overlap with pseudo controlled directories.
'''

Cheers,

Richard

--000000000000c5a4e005ba3dcf6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I agree.<div dir=3D"auto">Thanks for the helpful hints he=
re, will be more thorough in future patches :)<div dir=3D"auto"><br></div><=
div dir=3D"auto">Thanks,</div><div dir=3D"auto">Dorinda<br><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Jan 31, 2021 22:50, &quot;Rich=
ard Purdie&quot; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br type=3D"attribution"><=
blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div class=3D"quoted-text">On Sun, 2021-01-31 at 14=
:26 -0500, Dorinda wrote:<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 # Check if PSEUDO_IGNORE_PATHS and and paths under pseu=
do control overlap<br>
&gt; +=C2=A0 =C2=A0 pseudoignorepaths =3D d.getVar(&#39;PSEUDO_IGNORE_PATHS=
&#39;<wbr>, expand=3DTrue).split(&quot;,&quot;)<br>
&gt; +=C2=A0 =C2=A0 pseudo_control_dir =3D &quot;${D},${PKGD},${PKGDEST},${=
<wbr>IMAGEROOTFS},${SDK_OUTPUT}&quot;<br>
&gt; +=C2=A0 =C2=A0 pseudocontroldir =3D d.getVar(&#39;pseudo_control_dir&#=
39;, expand=3DTrue).split(&quot;,&quot;)<br>
<br>
</div>I&#39;m not sure that would actually work without a setVar as<br>
pseudo_control_dir isn&#39;t a variable.<br>
<br>
What you probably want is:<br>
<br>
pseudocontroldir =3D d.expand(pseudo_control_dir, expand=3DTrue).split(&quo=
t;,&quot;)<br>
<br>
<br>
How did you test this? Did you try setting S =3D &quot;${WORKDIR}/pack&quot=
; in a<br>
recipe to ensure it correctly detects the issue?<br>
<div class=3D"quoted-text"><br>
<br>
&gt; +=C2=A0 =C2=A0 for i in pseudoignorepaths:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for j in pseudocontroldir:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i and j:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if j.startswi=
th(i):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 status.addresult(&quot;a path included in PSEUDO_IGNORE_PATHS &quot; + str=
(i) + &quot; and the path &quot; + str(j) + &quot; are overlapping each oth=
er, please set this path &quot; + str(j) + &quot; to point to a different d=
irectory. \n&quot;)<br>
<br>
</div>How about improving this to:<br>
<br>
&#39;&#39;&#39;<br>
A path in PSEUDO_IGNORE_PATHS &quot; + str(i) + &quot; and the path &quot; =
+ str(j) +<br>
&quot; overlap and this will break pseudo permission and ownership tracking=
.<br>
Please set the path &quot; + str(j) + &quot; to a different directory which=
 does<br>
not overlap with pseudo controlled directories. <br>
&#39;&#39;&#39;<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br></div></div></div></div>

--000000000000c5a4e005ba3dcf6d--
