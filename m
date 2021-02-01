Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.34953.1612190423090899396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 06:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=glbU2lK4;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id d2so19148955edz.3;
        Mon, 01 Feb 2021 06:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9uKamehu42UmUf8YmBKE180IJABkNJbyH8L3QNnn2qw=;
        b=glbU2lK4fLKQMUGTsHQsgZQMnatOZH9JplQNhvyMmmHWXSb5GHIyZnmBjx4FE/2Zl/
         VgzGbq6TLBrrJPrFL1hr/I5ykUgkxTR3zDP94BFHNqKlQ9HGEsJj69xUtd59Piz1JMw4
         1RM4A3R4rNoNAL1YYzfU6DW9sCBfbFXWWuaDp7dJG62jcp3ZtiRa0ow6VMAACsuo3dgU
         eMfdpyaxLT+U3xtNoeXCdXajB3lkrfFcIobbVMSjaZFCmF9sy4OIR31lvgd5vS01SqrT
         yH4KyO4nLYVwDtus2LQbWXt3UnpEicv30HNQk/nAk6rVF1peirvEwOkwTfGQwjgmHT8t
         vBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9uKamehu42UmUf8YmBKE180IJABkNJbyH8L3QNnn2qw=;
        b=BTS9l12Nw5q7i3zD7XvEuUOHJmspmJ3KODXUMIY4Ef+iPVH99vVA/g6KZ6vND4MPHV
         nVnFzSKil63dOEuLF8M9+NDPZLWcQvxt9isAz8EBgCUKIGOCvMVb/E+Y2f7SkiYxTcM0
         pz+ym1DwgwzTDY7zDIr0h7cCZPqCJUc5Bs2C827MMDxjG42OqS4wzyb4HVgV5I8YPAz+
         notLTGfwZRB0XyR/HL0P6j87aWfSaZVqbSOIpHyrN1bwHwhqH0Bo7syni82DVdp5AWpJ
         +6U20ZesYPar5+tvNbVDXJMpKCdc5J51mTddr51U6CZQ7N0O2amzy4sak49h+2gsjVyq
         y6Dg==
X-Gm-Message-State: AOAM531F3GHgUx8MnxJU2G0/gqRXiFU1qAvNDdsq/T22wzzc4D5PT1Zn
	c4XZQS1sQmkKeXeUJizUbduxG0kIJvHrKPxTDUc=
X-Google-Smtp-Source: ABdhPJwhfpvTRtNqdzkbPcHlbDV/m2XW+YOBXgy2XJVj5F/RfL2cL9wKea8f4O2RkXPWoeqHecbGRdpo8Xnt9MbUYsw=
X-Received: by 2002:a05:6402:5207:: with SMTP id s7mr10206471edd.311.1612190421387;
 Mon, 01 Feb 2021 06:40:21 -0800 (PST)
MIME-Version: 1.0
References: <CANx9H-DFtcdnZwDqHEPg4t5ySyJe++KS8hO9QDFX5r31KLz3Ww@mail.gmail.com>
 <16406E32EA0586FD.712@lists.yoctoproject.org>
In-Reply-To: <16406E32EA0586FD.712@lists.yoctoproject.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 1 Feb 2021 15:40:10 +0100
Message-ID: <CA+chaQeJnDzgusQvqEWkkNwkoDxR1fMhrb0kM3932D71yWTMRw@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Let me tell you how I really feel. Zero filter. If you need meta-python2, you need to become a maintainer. Immediately. Period.
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>, 
	Anibal Limon <anibal.limon@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000608e3a05ba475501"

--000000000000608e3a05ba475501
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 22, 2020 at 11:37 PM Martin Jansa via lists.yoctoproject.org
<Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:

> There were only a few changes needed between dunfell and gatesgarth to
> keep it building and I feel guilty for sending half of them - and pinging
> you on FB :).
>
> I don't have interest in python2, but it's still used by quite a few
> components included in other layers are care about (e.g. qtwebengine in
> meta-qt5, chromium in meta-browser -
> https://bugs.chromium.org/p/chromium/issues/detail?id=942720 is still
> quite far from finished) and at LGE we maintain meta-ros
> https://github.com/ros/meta-ros which contains support for ROS 1 Melodic
> which is usually used with python2 and support ends May 2023 (together with
> Ubuntu Bionic it's usually used with: http://wiki.ros.org/Distributions -
> just today I've separated meta-ros-python2 layer with python2 recipes which
> disappeared from oe-core in warrior and were never re-introduced in
> meta-python2 (like nose and numpy).
>
> If you're looking for someone just keeping it buildable, then you can sign
> me up. If it gets more annoying to maintain in future we can also split it
> for pythonnative.bbclass and python recipe itself - to keep just the bare
> minimum of recipes which are actively being used without all the other junk.
>
> Cheers,
>

Hi,

can I get the write access to meta-python2 as mentioned above?

I have 2 fixes to make it parse able with latest oe-core:
https://lists.openembedded.org/g/openembedded-devel/message/89201
https://lists.openembedded.org/g/openembedded-devel/message/89200

to fix issues discussed in:
https://github.com/openembedded/openembedded-core/commit/fd6a007efa7cb45101a66f294af81d9d33bb3fab#commitcomment-46565284
https://lists.openembedded.org/g/openembedded-core/message/147477
https://lists.openembedded.org/g/openembedded-core/message/147514

Cheers,

--000000000000608e3a05ba475501
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Oct 22, 2020 at 11:37 PM Martin J=
ansa via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</=
a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">g=
mail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
There were only a few changes needed between dunfell and gatesgarth to keep=
 it building and I feel guilty for sending half of them - and pinging you o=
n FB :).<div><br></div><div>I don&#39;t have interest in python2, but it&#3=
9;s still used by quite a few components included in other layers are care =
about (e.g. qtwebengine in meta-qt5, chromium in meta-browser -=C2=A0<a hre=
f=3D"https://bugs.chromium.org/p/chromium/issues/detail?id=3D942720" target=
=3D"_blank">https://bugs.chromium.org/p/chromium/issues/detail?id=3D942720<=
/a> is still quite far from finished) and at LGE we maintain meta-ros=C2=A0=
<a href=3D"https://github.com/ros/meta-ros" target=3D"_blank">https://githu=
b.com/ros/meta-ros</a> which contains support for ROS 1 Melodic which is us=
ually used with python2 and support ends May 2023 (together with Ubuntu Bio=
nic it&#39;s usually used with: <a href=3D"http://wiki.ros.org/Distribution=
s" target=3D"_blank">http://wiki.ros.org/Distributions</a> - just today I&#=
39;ve separated meta-ros-python2 layer with python2 recipes which disappear=
ed from oe-core in warrior and were never re-introduced in meta-python2 (li=
ke nose and numpy).</div><div><br></div><div>If you&#39;re looking for some=
one just keeping it buildable, then you can sign me up. If it gets more ann=
oying to maintain in future we can also split it for pythonnative.bbclass a=
nd python recipe itself - to keep just the bare minimum of recipes which ar=
e actively being used without all the other junk.</div><div><br></div><div>=
Cheers,</div></div></blockquote><div><br></div><div>Hi,</div><div><br></div=
><div>can I get the write access to meta-python2 as mentioned above?</div><=
div><br></div><div>I have 2 fixes to make it parse able with latest oe-core=
:</div><div><a href=3D"https://lists.openembedded.org/g/openembedded-devel/=
message/89201">https://lists.openembedded.org/g/openembedded-devel/message/=
89201</a><br></div><div><a href=3D"https://lists.openembedded.org/g/openemb=
edded-devel/message/89200">https://lists.openembedded.org/g/openembedded-de=
vel/message/89200</a><br></div><div><br></div><div>to fix issues discussed =
in:</div><div><a href=3D"https://github.com/openembedded/openembedded-core/=
commit/fd6a007efa7cb45101a66f294af81d9d33bb3fab#commitcomment-46565284">htt=
ps://github.com/openembedded/openembedded-core/commit/fd6a007efa7cb45101a66=
f294af81d9d33bb3fab#commitcomment-46565284</a><br></div><div><a href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/message/147477">https://lis=
ts.openembedded.org/g/openembedded-core/message/147477</a><br></div><div><a=
 href=3D"https://lists.openembedded.org/g/openembedded-core/message/147514"=
>https://lists.openembedded.org/g/openembedded-core/message/147514</a><br><=
/div><div><br></div><div>Cheers,</div></div></div>

--000000000000608e3a05ba475501--
