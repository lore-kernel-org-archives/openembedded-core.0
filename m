Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.45400.1597678096059838901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=yTcxMlun;
 spf=softfail (domain: sidebranch.com, ip: 209.85.222.176, mailfrom: leon@sidebranch.com)
Received: by mail-qk1-f176.google.com with SMTP id 77so15298185qkm.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=Eh+27H3PMFpxT1H9VP9n8IlyGn1QZuIg6TQOP07PByQ=;
        b=yTcxMluna3I2gftvYNi9xymmJ9kr743EGMQJ+nUOlcM3TQ+NxfKpMNYkQXHAyk4Iz7
         GxJmRCu3T/DV/cOmpwyXrJ/NL+YS9AP0zFuijeMtcrdfY+9/IZuM2J5PopD2AA647lh9
         /EOR8Pacp64VHdvSpyWPyoDLCTQPei1NpspXez5MR2ObTa2Dxed4BDrpOE1H5cJXZrki
         R3manIpfm+dEKHykM7PDtccnIKFZggrEsZSg+65oXSFMA7E6z8Vpjn9Yc47BMzcuhmGs
         pS28Tr/rsnU9ylvJUv5FKCwF+DYm8qxp0PGJNPN5sCisUaWCVYm/9PefZvPVxc9/c/6x
         2JJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Eh+27H3PMFpxT1H9VP9n8IlyGn1QZuIg6TQOP07PByQ=;
        b=JDpQA9IzIxdUGRpi+nyBsdeKOekPndq1LivOlbcq1gNcgiAMkxRAoY4y3TmQfMv9+G
         tnK1Sld3eKC+3jLNl5oQxiVI55rz20sZ5ijxjz0XPKc9e2zltFtHCZg5IadxrCh1NMIC
         qcZLxy2O5DrtHhKgeZ/1hMgmWDjewQJHPjNeB9xOT/6p6AOxS1WRSnuXRpeouR0bQRcQ
         Pz4sn2RcMElC7jj5Zy++4OrW0lVP7pvGKtWAugnuNxegPgNYNjJb6dg+px6mzKNtkCdg
         5XHObMFwJtC5iz7ameIiRSXNC2ztv3ZAV676jXklfzjIrTPF8f0Thpqeet+mlY5EbTWA
         aXCg==
X-Gm-Message-State: AOAM533v7y9ZbUjzx/KJOv5Q2L+bI8SHIRPBAds76nKFR4TMLmF6N4w/
	971BSgAOyAEursnc6f+OTLcKUClXjik5UO+FbSCP4K2ohfKESw==
X-Google-Smtp-Source: ABdhPJyGQxdyukczLnM2IHe+glum3qY9impEkDaegt1J0QcNFjr7/oQKYpqzLmQiYOgGm0zWpFH9tZq0qpKpCRz9Yt8=
X-Received: by 2002:a05:620a:12bb:: with SMTP id x27mr13976010qki.202.1597678094390;
 Mon, 17 Aug 2020 08:28:14 -0700 (PDT)
MIME-Version: 1.0
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Mon, 17 Aug 2020 17:28:03 +0200
Message-ID: <CAMjhiJgk4EOk0ifuNxJvc_jozYVRJF5-FBXn=SctzahWq1xBog@mail.gmail.com>
Subject: -mmusl missing in SDK / CMake MUSL toolchain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000482efb05ad146bec"

--000000000000482efb05ad146bec
Content-Type: text/plain; charset="UTF-8"

Hello all,

Compared with a BitBake/CMake built of a C application, the SDK/CMake
approach lacks the "-mmusl" flag. The resulting binaries of the SDK do not
load on the target (wrong runtime linker/loader).

Minimal test case here (dunfell), just run make will show PASS / FAIL for
BitBake and SDK approach:

https://github.com/likewise/oe-musl-sdk-cmake

Has something to do with TARGET_CC_ARCH not propagating, investigation
further...


Regards,

Leon.
-- 
-- 
Leon Woestenberg
leon@sidebranch.com
T: +31 40 711 42 76
M: +31 6 472 30 372

Sidebranch Embedded Systems
Eindhoven, The Netherlands
http://www.sidebranch.com

--000000000000482efb05ad146bec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div style=3D"font-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);co=
lor:rgb(49,49,49)" dir=3D"auto">Hello all,</div><div style=3D"word-spacing:=
1px;border-color:rgb(49,49,49);color:rgb(49,49,49)" dir=3D"auto"><br></div>=
<div style=3D"font-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);co=
lor:rgb(49,49,49)" dir=3D"auto">Compared with a BitBake/CMake built of a C =
application, the SDK/CMake approach lacks the &quot;-mmusl&quot; flag. The =
resulting binaries of the SDK do not load on the target (wrong runtime link=
er/loader).</div><div style=3D"word-spacing:1px;border-color:rgb(49,49,49);=
color:rgb(49,49,49)" dir=3D"auto"><br></div><div style=3D"font-size:1rem;wo=
rd-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)" dir=3D"auto"=
>Minimal test case here (dunfell), just run make will show PASS / FAIL for =
BitBake and SDK approach:</div><div style=3D"word-spacing:1px;border-color:=
rgb(49,49,49);color:rgb(49,49,49)" dir=3D"auto"><br></div><div style=3D"wor=
d-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)" dir=3D"auto">=
<a href=3D"https://github.com/likewise/oe-musl-sdk-cmake" target=3D"_blank"=
 style=3D"font-size:1rem;border-color:rgb(66,133,244)">https://github.com/l=
ikewise/oe-<span class=3D"term-highlighted" style=3D"background-color:rgba(=
253,214,99,0.24)">musl</span>-sdk-cmake</a>=C2=A0</div><div style=3D"word-s=
pacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)" dir=3D"auto"><br=
></div><div style=3D"word-spacing:1px;border-color:rgb(49,49,49);color:rgb(=
49,49,49)" dir=3D"auto">Has something to do with TARGET_CC_ARCH not propaga=
ting, investigation further...</div><div style=3D"word-spacing:1px;border-c=
olor:rgb(49,49,49);color:rgb(49,49,49)" dir=3D"auto"><br></div><div style=
=3D"word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)" dir=3D=
"auto"><br></div><div style=3D"font-size:1rem;word-spacing:1px;border-color=
:rgb(49,49,49);color:rgb(49,49,49)" dir=3D"auto">Regards,</div><div style=
=3D"word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)" dir=3D=
"auto"><br></div><div style=3D"font-size:1rem;word-spacing:1px;border-color=
:rgb(49,49,49);color:rgb(49,49,49)" dir=3D"auto">Leon.</div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"color:rgb(0,0,0)"><span sty=
le=3D"font-family:-webkit-standard;font-size:medium">--=C2=A0</span><br><sp=
an style=3D"font-family:-webkit-standard;font-size:medium">Leon Woestenberg=
</span><br><span style=3D"font-family:-webkit-standard;font-size:medium"><a=
 href=3D"mailto:leon@sidebranch.com" target=3D"_blank">leon@sidebranch.com<=
/a></span><br><span style=3D"font-family:-webkit-standard;font-size:medium"=
>T: +31 40 711 42 76</span><br><span style=3D"font-family:-webkit-standard;=
font-size:medium">M: +31 6 472 30 372</span><div style=3D"font-family:Helve=
tica"><img src=3D"http://www.sidebranch.eu/en/images/sidebranch-logo.png" w=
idth=3D"96" height=3D"53"><br></div><span style=3D"font-family:-webkit-stan=
dard;font-size:medium">Sidebranch</span><font face=3D"Helvetica">=C2=A0</fo=
nt><span style=3D"font-family:-webkit-standard;font-size:medium">Embedded S=
ystems</span><br><span style=3D"font-family:-webkit-standard;font-size:medi=
um">Eindhoven, The Netherlands</span><br><span style=3D"font-family:-webkit=
-standard;font-size:medium"><a href=3D"http://www.sidebranch.com" target=3D=
"_blank">http://www.sidebranch.com</a></span><div style=3D"font-family:Helv=
etica"><br></div></div></div></div></div></div>

--000000000000482efb05ad146bec--
