Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.8804.1626360226969070842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jl9EtB8W;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id l26so8459185eda.10
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=05w9MGsshSFXaYmHEO7jCoBaM0xIHjuspk3L30B6f0E=;
        b=Jl9EtB8W9kyhMmRHGEoCXVaebJ9CDvW3ocfOC2amsCYz3rsQaz2c08s9S0/1dbybFZ
         u3BA3BMB8FlDVYmTzqXkuZ0vth+095fgWNO1G9I4uzQl6mHIpgFVNeYU3FbstAyG//NB
         w/LZD9VhAYsEytsvuuZU6nIEhTmiyxREOGgM05bcZpFiPWOHP7P+cyM38UhcSbDnxOa/
         TfrZuV0AdufZFMxcpWY4P3pk9JStTsuy6CJjNsNVDy4M0LGPIpkuv0pZYkRkL8YB88SL
         Zu7N0gbOT+U1wut4dBcNZYHkLflrsWjgIajmrLnTT9e7Kf1orl0vcWgfKEKUG5EzTiT9
         7iUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=05w9MGsshSFXaYmHEO7jCoBaM0xIHjuspk3L30B6f0E=;
        b=jN7y3mqA38dc87rxx03SE15PWgqKHp0A5bIw1LxFJgBAKfL5KK1NSYWyHOXEcunn2U
         wtO10KyS0P16ZGIuiacDOD/UHo/uI/SemIo2qpBpRCiJqljgs6ErJ31ZkjVxdW6ZaWwT
         HCKEXyQlueAK92OO0ioNu2vALT9BhX5VpOefZhygvpEtk7IF4TmviM0iIw9o999pGCqi
         +lP3JRYc3L6Mw2+5YlbLEOPn53Jg200j06JQx/Cq/OQq0D0B/Ke2IPSvZO0PPlswfCZO
         CNUUFhcN9Q2A+ityRVIfw4XBGV+FnqVDcPQaLu0WS+/wLUpZt9LZAJ+3f3ebY1ZxRkXe
         fMbg==
X-Gm-Message-State: AOAM5319Y42ZKZVkr3yuqpPjZnk8FOR+hhdcBi5xdgjF0t7q0liwylMB
	WtXE8sb65krWvzPD1sWQdPd4YohTsWXSZnkFehk=
X-Google-Smtp-Source: ABdhPJwT3UTCBRS3kow3MGO4+T6YY7DtXoI/KrrYw/PlcMhvBMDyk1G3l5OPHdxyvAJZKy9jDI/+00V/fL4QZPkcOWQ=
X-Received: by 2002:a05:6402:19a:: with SMTP id r26mr7450301edv.230.1626360225430;
 Thu, 15 Jul 2021 07:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <1626076608-17034-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1626076608-17034-1-git-send-email-wangmy@fujitsu.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 15 Jul 2021 16:43:34 +0200
Message-ID: <CA+chaQfWtGf7gsUCLXcTuB985YYHM=FQszdX1d2y4fcjjEepOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] python3-setuptools: upgrade 57.0.0 -> 57.1.0
To: wangmy <wangmy@fujitsu.com>, Leon Anavi <leon.anavi@konsulko.com>, 
	Derek Straka <derek@asterius.io>, Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000083807705c72a7f09"

--00000000000083807705c72a7f09
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 12, 2021 at 9:57 AM wangmy <wangmy@fujitsu.com> wrote:

> reproducibility.patch
> deleted since it's been merged upstream.
>
> v57.1.0
> -------
>
> Changes
> ^^^^^^^
> * #2692: Globs are now sorted in 'license_files' restoring reproducibility
> by eliminating variance from disk order.
> * #2714: Update to distutils at pypa/distutils@e2627b7.
> * #2715: Removed reliance on deprecated ssl.match_hostname by removing the
> ssl support. Now any index operations rely on the native SSL implementation.
>

FWIW: this change
breaks  meta-openembedded/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb:
do_install:

+ people who might be interested in python3-cassandra-driver.

| Installed
/jenkins/mjansa/build/ros/ros2-rolling-honister/tmp-glibc/work/core2-64-oe-linux/python3-cassandra-driver/3.25.0-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/cassandra_driver-3.25.0-py3.9-linux-x86_64.egg
| Processing dependencies for cassandra-driver==3.25.0
| Searching for geomet<0.3,>=0.1
| Reading https://pypi.org/simple/geomet/
| Download error on https://pypi.org/simple/geomet/: [SSL:
CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local
issuer certificate (_ssl.c:1129) -- Some packages may not be found!
| Couldn't find index page for 'geomet' (maybe misspelled?)
| Scanning index of all packages (this may take a while)
| Reading https://pypi.org/simple/
| Download error on https://pypi.org/simple/: [SSL:
CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local
issuer certificate (_ssl.c:1129) -- Some packages may not be found!
| No local packages or working download links found for geomet<0.3,>=0.1
| error: Could not find suitable distribution for
Requirement.parse('geomet<0.3,>=0.1')

--00000000000083807705c72a7f09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jul 12, 2021 at 9:57 AM wangmy &l=
t;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">reproducibility.patch<br>
deleted since it&#39;s been merged upstream.<br>
<br>
v57.1.0<br>
-------<br>
<br>
Changes<br>
^^^^^^^<br>
* #2692: Globs are now sorted in &#39;license_files&#39; restoring reproduc=
ibility by eliminating variance from disk order.<br>
* #2714: Update to distutils at pypa/distutils@e2627b7.<br>
* #2715: Removed reliance on deprecated ssl.match_hostname by removing the =
ssl support. Now any index operations rely on the native SSL implementation=
.<br></blockquote><div><br></div><div>FWIW: this change breaks=C2=A0=C2=A0m=
eta-openembedded/meta-python/recipes-devtools/python/python3-cassandra-driv=
er_3.25.0.bb:do_install:</div><div><br></div><div>+ people who might be int=
erested in python3-cassandra-driver.<br></div><div><br></div><div>| Install=
ed /jenkins/mjansa/build/ros/ros2-rolling-honister/tmp-glibc/work/core2-64-=
oe-linux/python3-cassandra-driver/3.25.0-r0/recipe-sysroot-native/usr/lib/p=
ython3.9/site-packages/cassandra_driver-3.25.0-py3.9-linux-x86_64.egg<br>| =
Processing dependencies for cassandra-driver=3D=3D3.25.0<br>| Searching for=
 geomet&lt;0.3,&gt;=3D0.1<br>| Reading <a href=3D"https://pypi.org/simple/g=
eomet/">https://pypi.org/simple/geomet/</a><br>| Download error on <a href=
=3D"https://pypi.org/simple/geomet/">https://pypi.org/simple/geomet/</a>: [=
SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get lo=
cal issuer certificate (_ssl.c:1129) -- Some packages may not be found!<br>=
| Couldn&#39;t find index page for &#39;geomet&#39; (maybe misspelled?)<br>=
| Scanning index of all packages (this may take a while)<br>| Reading <a hr=
ef=3D"https://pypi.org/simple/">https://pypi.org/simple/</a><br>| Download =
error on <a href=3D"https://pypi.org/simple/">https://pypi.org/simple/</a>:=
 [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get =
local issuer certificate (_ssl.c:1129) -- Some packages may not be found!<b=
r>| No local packages or working download links found for geomet&lt;0.3,&gt=
;=3D0.1<br>| error: Could not find suitable distribution for Requirement.pa=
rse(&#39;geomet&lt;0.3,&gt;=3D0.1&#39;)<br></div><div><br></div><div><br></=
div></div></div>

--00000000000083807705c72a7f09--
