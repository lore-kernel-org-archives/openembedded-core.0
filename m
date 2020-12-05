Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web12.11624.1607211641297207583
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Dec 2020 15:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QU1ULMc3;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id n14so9669008iom.10
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Dec 2020 15:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Mr2UsCWpMAGJ52kZ1uW3B+4/Ss/mNN4lyxQolvAPfwU=;
        b=QU1ULMc3UszifJt5mkJlM/11VvDlVeMqpPZCQrBMfVbkOfKoVbjcF2sgHMJe7/91LL
         tFia53K8zz9/lUPz70L5YTxdObu7zN1WW5dH1HldBKkPwd+oXsWDPDdtEbb9OfjT/tDh
         aej7jyDwA+vK3uz7N3EXFV4xeUuLxeXBVFSX7M59sLz9mI/nqBXdpbeCwLrl0d3+Kn3a
         QsminV1BHXlOJ9+8K/l7txJ95zVfFwt0nUV6Azlj+6TtreCnFSaaGVTM7tPxdmnGxLMe
         rJxnjNJD+WHPMWpdL5ZrdkYG/ZOlId8R7pk/etqjicQFz1D51uQOUeCGO3Kv79uGiAcv
         rFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Mr2UsCWpMAGJ52kZ1uW3B+4/Ss/mNN4lyxQolvAPfwU=;
        b=tfkgjKBKJcA40xvB9LwUJNeSGd1IFcWi5HZJBBn3SfeitgVnixH2LoGfjJONMtKk8V
         tqbDih3M5WYoapXQDV101UmPKCnyTdSa15V4D2o+HdOO5IZtglAl1YLGkhjEk+jEOIp0
         uddDMHnTYvHRbv/MpJBEga2wuGyARNjpssboHTUHqPbFapzih8jIQ6i7KAdanRumI7DE
         CTCrXrZ2m2MKzE1Kv761bRrqnuPhEy3AAZsiIaidHZrLnHu6ztvOvmkIfdCvSDPPXCVr
         djtopc5fVmkI7BW9Dlz5czCUS7B7Ju2YAcnvaG3EmgEOEAbHGUUv1ymRQx7Z28RkC7Q3
         e08g==
X-Gm-Message-State: AOAM532g1+biFBPE6IZjWIQFL8yu8qOUESbUIV9WZY6hUAVhIWAKrMVG
	l6JTe4+un7eO+6uqQEZt9knZq1+ACWD3C28Jj1k=
X-Google-Smtp-Source: ABdhPJyeICZFt4DA6TnsWTsWpJU9277S40HPugJksj+iV6FRITvBo9wysrvOu4AR27S6GE7rwnWksCQbZjLxtorkeJs=
X-Received: by 2002:a5d:96c9:: with SMTP id r9mr12188313iol.45.1607211640499;
 Sat, 05 Dec 2020 15:40:40 -0800 (PST)
MIME-Version: 1.0
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sat, 5 Dec 2020 15:40:29 -0800
Message-ID: <CANx9H-DhYETCc5qAcneZkyBvPTAL7qg6M8+3n4RAjG331B6eTQ@mail.gmail.com>
Subject: Python packaging without setup.py (PEP-517)
To: yocto@lists.yoctoproject.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e931ca05b5c01e26"

--000000000000e931ca05b5c01e26
Content-Type: text/plain; charset="UTF-8"

Thanks to Konrad Weihmann, we have some communication occurring with the
Python pypa folks about an important change in Python packaging [1][2].
This change is defined in PEP 517 [3][4]. Essentially, setup.py files will
go away and wheels will be preferred over eggs. To make this more straight
forward for distros, the pypa folks have created pypa/build [5][6].
Currently, there is no installer for wheels other than pip, but this is
under active development [7].

I have begun a WIP branch to support this new packaging mechanism [8].
Folks in our OE/YP Python community have actually been wishing for a way to
install wheels for a while now... no promises on that working (installing
random wheels off the internet is not a design goal), but we will at least
be able to build wheels.

Cheers,

--TIm "moto-timo" Orling

[1] https://github.com/pypa/packaging/issues/369
[2] https://www.yoctoproject.org/irc/%23yocto.2020-12-05.log.html
[3] https://www.python.org/dev/peps/pep-0517/
[4] https://discuss.python.org/t/pep-517-workflow-for-distributions/5959
[5] https://pypa-build.readthedocs.io/en/latest/
[6] https://github.com/pypa/build
[7] https://github.com/pradyunsg/installer
[8]
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=timo/python-pep-517

--000000000000e931ca05b5c01e26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks to Konrad Weihmann, we have some communication occu=
rring=C2=A0with the Python pypa folks about an important change in Python p=
ackaging [1][2]. This change is defined in PEP 517 [3][4]. Essentially, set=
up.py files will go away and wheels will be preferred over eggs. To make th=
is more straight forward for distros, the pypa folks have created pypa/buil=
d [5][6]. Currently, there is no installer for wheels other than pip, but t=
his is under active development [7].<div><br></div><div>I have begun a WIP =
branch to support this new packaging mechanism [8]. Folks in our OE/YP Pyth=
on community have actually been wishing for a way to install wheels for a w=
hile now... no promises on that working (installing random wheels off the i=
nternet is not a design goal), but we will at least be able to build wheels=
.</div><div><br></div><div>Cheers,</div><div><br></div><div>--TIm &quot;mot=
o-timo&quot; Orling</div><div><br></div><div>[1]=C2=A0<a href=3D"https://gi=
thub.com/pypa/packaging/issues/369">https://github.com/pypa/packaging/issue=
s/369</a></div><div>[2]=C2=A0<a href=3D"https://www.yoctoproject.org/irc/%2=
3yocto.2020-12-05.log.html">https://www.yoctoproject.org/irc/%23yocto.2020-=
12-05.log.html</a></div><div>[3]=C2=A0<a href=3D"https://www.python.org/dev=
/peps/pep-0517/">https://www.python.org/dev/peps/pep-0517/</a></div><div>[4=
]=C2=A0<a href=3D"https://discuss.python.org/t/pep-517-workflow-for-distrib=
utions/5959">https://discuss.python.org/t/pep-517-workflow-for-distribution=
s/5959</a></div><div>[5]=C2=A0<a href=3D"https://pypa-build.readthedocs.io/=
en/latest/">https://pypa-build.readthedocs.io/en/latest/</a></div><div>[6]=
=C2=A0<a href=3D"https://github.com/pypa/build">https://github.com/pypa/bui=
ld</a></div><div>[7]=C2=A0<a href=3D"https://github.com/pradyunsg/installer=
">https://github.com/pradyunsg/installer</a></div><div>[8]=C2=A0<a href=3D"=
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dtimo/python=
-pep-517">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dt=
imo/python-pep-517</a></div></div>

--000000000000e931ca05b5c01e26--
