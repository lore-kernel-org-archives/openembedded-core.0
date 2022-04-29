Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05CBC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 13:33:08 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.9957.1651239180018823524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 06:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TsSQtNdX;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id bq30so14097586lfb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 06:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4VKXsGMrlE93yGoBghtjaKhKDDS/Rcwzc6fCSOrWcDA=;
        b=TsSQtNdXafyACzM0aAm05NI6SwjG5jI2w1n1K82W8dBccYaqjnvqvIhJgnnKW+CLX2
         r/6MJhU0fqfxHrmj6AoKDGa4tjMEcvibItue39gbJEFaOAe5xH8/+Aor/ZHex2f1BRCi
         tEtu72k0uWB0zhO9D70FTQLTa4tvxA6c66ze+Nr/5+MZqmeLEnZQ2J8DT3p+Rez6U/1L
         RzEhWzPC0VF9rrBT1isDgd60IjoLTpzE8y4xzPPdXk8jjXh764g7rYVoLpqUIzl/TaBZ
         7d1WOjC8991Ol49blegbQGgEWClko461IPBgt2qQjxuOIoFhpB9yC1eoWO7QAFfXSXuQ
         SaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4VKXsGMrlE93yGoBghtjaKhKDDS/Rcwzc6fCSOrWcDA=;
        b=MR9DJROhffUnTdxe5NYw74LoEiRv3keUk9HfNFA6oHb6KcOP7w0I2chufeWOAaolHZ
         T5uhvCxQSLpBFKCcTuSf3AwRuz6v/9MdY8FowHBNHQLRI3La1/WpdBuM2tqv0pRTjuBG
         PeHmJC2/DXKyUHvEowspP5i0e4e4T0PHFwTzEPUcZoXzJoITax25t6FuncOkBSUzxzV0
         Fwhe9h4235CCMWnyKYfLDqM2P8fNzyANnI6s0xJXNI+TNiNqDL1saqiFnux68wmiwK8y
         k+p6VAoJHpsxV1a7BKo74kDQNUYRA/EC2qtqZZz2RrZx6rfMj0ulM3z36fLA0BU/r119
         dG5w==
X-Gm-Message-State: AOAM533BAHCOQ/tI9FibQRudPyzWNaIpYv8KpgMk9PcSk+VAoVbzdAJq
	vTdYT5H1mzyyBMZVCrRInCnA5FjpKADfohyn9QU=
X-Google-Smtp-Source: 
 ABdhPJz/7bo0lny0yQcB6i0z/tNaXeS1Rh7H0ziH4fMLikjtbG9/+xEb9hODXGlqkBqkhOKCB3/znG9RiuzWgy6WOoQ=
X-Received: by 2002:a05:6512:3341:b0:472:15b3:82fc with SMTP id
 y1-20020a056512334100b0047215b382fcmr13690576lfd.447.1651239177585; Fri, 29
 Apr 2022 06:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220419094616.433632-1-quaresma.jose@gmail.com>
 <37753e878c988098cc777b5ddeb178267a1ec9b3.camel@linuxfoundation.org>
In-Reply-To: 
 <37753e878c988098cc777b5ddeb178267a1ec9b3.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 29 Apr 2022 14:32:45 +0100
Message-ID: 
 <CANPvuRkFM5TF+t2cUaGxa7MK4EYB-K4CmrKxrLx9R+wwJHwicg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] sstate: add a LockedSet class to be used on
 the mirror thread pool
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009e8ac805ddcb1498"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 13:33:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165013

--0000000000009e8ac805ddcb1498
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
28/04/2022 =C3=A0(s) 13:30:

> On Tue, 2022-04-19 at 10:46 +0100, Jose Quaresma wrote:
> > The python set() is not thread safe and we use it on the ThreadedPool.
> > With this LockedSet python class we can call the 'add' and 'remove'
> > safely inside the ThreadedPool.
> >
> > This piece of code is taken from the stackoverflow
> >
> https://stackoverflow.com/questions/13610654/how-to-make-built-in-contain=
ers-sets-dicts-lists-thread-safe
> >
> > May be related with [YOCTO #14775] --
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>
> For info,
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/5083
> was a failure with master-next which included the changes in this
> discussion. It
> doesn't seem to address that issue :(
>
> Cheers,
>
> Richard
>
>
Unfortunately this solution still doesn't solve the problem.

I'm going to analyze the log to try to understand what's going on,
however I leave here one of the tracebacks in case anyone can see an
anomaly here.

The mirror thread pool is considerably different in this patch series
which may imply that the problem may be on the server side but it is still
too early to draw conclusions.

I still haven't had time to think about how to do a test for this case.

Jose

ERROR: SState: cannot test
file://universal/f3/69/sstate:python3-wheel-native:x86_64-linux:0.37.1:r0:x=
86_64:8:f36956da8ee13cebb1fb6df615d0eb548a4bf637c50021c213d8c6f0973674bf_de=
ploy_source_date_epoch.tar.zst:
TimeoutError('timed out')
Traceback (most recent call last):
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/meta/classes/sstate=
.bbclass",
line 1023, in checkstatus
fetcher.checkstatus()
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetc=
h2/__init__.py",
line 1829, in checkstatus
ret =3D m.try_mirrors(self, ud, self.d, mirrors, True)
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetc=
h2/__init__.py",
line 1602, in try_mirrors
return bool(try_mirrors(fetch, d, urldata, mirrors, check))
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetc=
h2/__init__.py",
line 1128, in try_mirrors
ret =3D try_mirror_url(fetch, origud, uds[index], ld, check)
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetc=
h2/__init__.py",
line 1023, in try_mirror_url
found =3D ud.method.checkstatus(fetch, ud, ld)
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetc=
h2/wget.py",
line 361, in checkstatus
with opener.open(r, timeout=3D30) as response:
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokys=
dk-linux/usr/lib/python3.10/urllib/request.py",
line 519, in open
response =3D self._open(req, data)
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokys=
dk-linux/usr/lib/python3.10/urllib/request.py",
line 536, in _open
result =3D self._call_chain(self.handle_open, protocol, protocol +
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokys=
dk-linux/usr/lib/python3.10/urllib/request.py",
line 496, in _call_chain
result =3D func(*args)
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetc=
h2/wget.py",
line 166, in http_open
return self.do_open(HTTPConnectionCache, req)
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetc=
h2/wget.py",
line 236, in do_open
r =3D h.getresponse()
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokys=
dk-linux/usr/lib/python3.10/http/client.py",
line 1374, in getresponse
response.begin()
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokys=
dk-linux/usr/lib/python3.10/http/client.py",
line 318, in begin
version, status, reason =3D self._read_status()
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokys=
dk-linux/usr/lib/python3.10/http/client.py",
line 279, in _read_status
line =3D str(self.fp.readline(_MAXLINE + 1), "iso-8859-1")
File
"/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-po=
ky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokys=
dk-linux/usr/lib/python3.10/socket.py",
line 705, in readinto
return self._sock.recv_into(b)
TimeoutError: timed out

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009e8ac805ddcb1498
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quinta, 28/04/2022 =C3=A0(s) 13:30:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Tue, 2022-04-19 at 10:46 +0100, =
Jose Quaresma wrote:<br>
&gt; The python set() is not thread safe and we use it on the ThreadedPool.=
<br>
&gt; With this LockedSet python class we can call the &#39;add&#39; and &#3=
9;remove&#39;<br>
&gt; safely inside the ThreadedPool.<br>
&gt; <br>
&gt; This piece of code is taken from the stackoverflow<br>
&gt; <a href=3D"https://stackoverflow.com/questions/13610654/how-to-make-bu=
ilt-in-containers-sets-dicts-lists-thread-safe" rel=3D"noreferrer" target=
=3D"_blank">https://stackoverflow.com/questions/13610654/how-to-make-built-=
in-containers-sets-dicts-lists-thread-safe</a><br>
&gt; <br>
&gt; May be related with [YOCTO #14775] -- <a href=3D"https://bugzilla.yoct=
oproject.org/show_bug.cgi?id=3D14775" rel=3D"noreferrer" target=3D"_blank">=
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775</a><br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
<br>
For info, <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/74/builds/5083" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/74/builds/5083</a><br>
was a failure with master-next which included the changes in this discussio=
n. It<br>
doesn&#39;t seem to address that issue :(<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><div><br></div><div>Unfortunately this solution still do=
esn&#39;t solve the problem.<br></div><div><br></div><div><div>I&#39;m goin=
g to analyze the log to try to understand what&#39;s going on,</div><div>ho=
wever I leave here one of the tracebacks in case anyone can see an anomaly =
here.</div><div><br></div><div>The mirror thread pool is considerably diffe=
rent in this patch series</div><div>which may imply that the problem may be=
 on the server side but it is still too early to draw conclusions.<br></div=
><div><br></div><div>I still haven&#39;t had time to think about how to do =
a test for this case.<br></div><div><br></div><div>Jose</div><div><div><br>=
</div><div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,19=
9,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;=
font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"=
gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"=
><span class=3D"gmail-" style=3D"box-sizing:border-box">ERROR: SState: cann=
ot test file://universal/f3/69/sstate:python3-wheel-native:x86_64-linux:0.3=
7.1:r0:x86_64:8:f36956da8ee13cebb1fb6df615d0eb548a4bf637c50021c213d8c6f0973=
674bf_deploy_source_date_epoch.tar.zst: TimeoutError(&#39;timed out&#39;)</=
span></span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb=
(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,mon=
ospace;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span cl=
ass=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:bord=
er-box"><span class=3D"gmail-" style=3D"box-sizing:border-box">Traceback (m=
ost recent call last):</span></span></div><div style=3D"box-sizing:border-b=
ox;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&qu=
ot;Courier New&quot;,monospace;font-size:13px;white-space:pre;background-co=
lor:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" =
style=3D"box-sizing:border-box"><span class=3D"gmail-" style=3D"box-sizing:=
border-box">  File &quot;/home/pokybuild/yocto-worker/qemumips64/build/buil=
d/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/layers/b=
uild/meta/classes/sstate.bbclass&quot;, line 1023, in checkstatus</span></s=
pan></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199=
,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;f=
ont-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"g=
mail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box">=
<span class=3D"gmail-" style=3D"box-sizing:border-box">    fetcher.checksta=
tus()</span></span></div><div style=3D"box-sizing:border-box;height:18px;co=
lor:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&qu=
ot;,monospace;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><=
span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizi=
ng:border-box"><span class=3D"gmail-" style=3D"box-sizing:border-box">  Fil=
e &quot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumi=
ps64-poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/=
bb/fetch2/__init__.py&quot;, line 1829, in checkstatus</span></span></div><=
div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-=
family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13=
px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wra=
p gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=
=3D"gmail-" style=3D"box-sizing:border-box">    ret =3D m.try_mirrors(self,=
 ud, self.d, mirrors, True)</span></span></div><div style=3D"box-sizing:bor=
der-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consola=
s,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre;backgrou=
nd-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-bind=
ing" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=3D"box-si=
zing:border-box">  File &quot;/home/pokybuild/yocto-worker/qemumips64/build=
/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/lay=
ers/build/bitbake/lib/bb/fetch2/__init__.py&quot;, line 1602, in try_mirror=
s</span></span></div><div style=3D"box-sizing:border-box;height:18px;color:=
rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,=
monospace;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span=
 class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:b=
order-box"><span class=3D"gmail-" style=3D"box-sizing:border-box">    retur=
n bool(try_mirrors(fetch, d, urldata, mirrors, check))</span></span></div><=
div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-=
family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13=
px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wra=
p gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=
=3D"gmail-" style=3D"box-sizing:border-box">  File &quot;/home/pokybuild/yo=
cto-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux/core-image=
-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetch2/__init__.py&quot=
;, line 1128, in try_mirrors</span></span></div><div style=3D"box-sizing:bo=
rder-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consol=
as,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre;backgro=
und-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-bin=
ding" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=3D"box-s=
izing:border-box">    ret =3D try_mirror_url(fetch, origud, uds[index], ld,=
 check)</span></span></div><div style=3D"box-sizing:border-box;height:18px;=
color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&=
quot;,monospace;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"=
><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-si=
zing:border-box"><span class=3D"gmail-" style=3D"box-sizing:border-box">  F=
ile &quot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemu=
mips64-poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/li=
b/bb/fetch2/__init__.py&quot;, line 1023, in try_mirror_url</span></span></=
div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);=
font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-si=
ze:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-n=
o-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span =
class=3D"gmail-" style=3D"box-sizing:border-box">    found =3D ud.method.ch=
eckstatus(fetch, ud, ld)</span></span></div><div style=3D"box-sizing:border=
-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&=
quot;Courier New&quot;,monospace;font-size:13px;white-space:pre;background-=
color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding=
" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=3D"box-sizin=
g:border-box">  File &quot;/home/pokybuild/yocto-worker/qemumips64/build/bu=
ild/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/layers=
/build/bitbake/lib/bb/fetch2/wget.py&quot;, line 361, in checkstatus</span>=
</span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,=
199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospac=
e;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=
=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-=
box"><span class=3D"gmail-" style=3D"box-sizing:border-box">    with opener=
.open(r, timeout=3D30) as response:</span></span></div><div style=3D"box-si=
zing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco=
,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre;=
background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail=
-ng-binding" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=
=3D"box-sizing:border-box">  File &quot;/home/pokybuild/yocto-worker/qemumi=
ps64/build/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/test=
sdkext/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.10/urllib/r=
equest.py&quot;, line 519, in open</span></span></div><div style=3D"box-siz=
ing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,=
Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre;b=
ackground-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-=
ng-binding" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=3D=
"box-sizing:border-box">    response =3D self._open(req, data)</span></span=
></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,19=
9);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font=
-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmai=
l-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><sp=
an class=3D"gmail-" style=3D"box-sizing:border-box">  File &quot;/home/poky=
build/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux/co=
re-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokysdk-linux/us=
r/lib/python3.10/urllib/request.py&quot;, line 536, in _open</span></span><=
/div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199)=
;font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-s=
ize:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-=
no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span=
 class=3D"gmail-" style=3D"box-sizing:border-box">    result =3D self._call=
_chain(self.handle_open, protocol, protocol +</span></span></div><div style=
=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-family:Me=
nlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-=
space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-l=
og_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=3D"gmail=
-" style=3D"box-sizing:border-box">  File &quot;/home/pokybuild/yocto-worke=
r/qemumips64/build/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0=
-r0/testsdkext/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.10/=
urllib/request.py&quot;, line 496, in _call_chain</span></span></div><div s=
tyle=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-famil=
y:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;wh=
ite-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gma=
il-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=3D"g=
mail-" style=3D"box-sizing:border-box">    result =3D func(*args)</span></s=
pan></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199=
,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;f=
ont-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"g=
mail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box">=
<span class=3D"gmail-" style=3D"box-sizing:border-box">  File &quot;/home/p=
okybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux=
/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetch2/wget.=
py&quot;, line 166, in http_open</span></span></div><div style=3D"box-sizin=
g:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Co=
nsolas,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre;bac=
kground-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng=
-binding" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=3D"b=
ox-sizing:border-box">    return self.do_open(HTTPConnectionCache, req)</sp=
an></span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(1=
99,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monos=
pace;font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span clas=
s=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border=
-box"><span class=3D"gmail-" style=3D"box-sizing:border-box">  File &quot;/=
home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-poky=
-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetch2=
/wget.py&quot;, line 236, in do_open</span></span></div><div style=3D"box-s=
izing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monac=
o,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre=
;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmai=
l-ng-binding" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=
=3D"box-sizing:border-box">    r =3D h.getresponse()</span></span></div><di=
v style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-fa=
mily:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px=
;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap =
gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span class=
=3D"gmail-" style=3D"box-sizing:border-box">  File &quot;/home/pokybuild/yo=
cto-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux/core-image=
-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/py=
thon3.10/http/client.py&quot;, line 1374, in getresponse</span></span></div=
><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);fon=
t-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:=
13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail-no-w=
rap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><span cla=
ss=3D"gmail-" style=3D"box-sizing:border-box">    response.begin()</span></=
span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,19=
9,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;=
font-size:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"=
gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"=
><span class=3D"gmail-" style=3D"box-sizing:border-box">  File &quot;/home/=
pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linu=
x/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokysdk-linu=
x/usr/lib/python3.10/http/client.py&quot;, line 318, in begin</span></span>=
</div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199=
);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-=
size:13px;white-space:pre;background-color:rgb(0,0,0)"><span class=3D"gmail=
-no-wrap gmail-log_o gmail-ng-binding" style=3D"box-sizing:border-box"><spa=
n class=3D"gmail-" style=3D"box-sizing:border-box">    version, status, rea=
son =3D self._read_status()</span></span></div><div style=3D"box-sizing:bor=
der-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consola=
s,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre;backgrou=
nd-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-bind=
ing" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=3D"box-si=
zing:border-box">  File &quot;/home/pokybuild/yocto-worker/qemumips64/build=
/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/bui=
ldtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.10/http/client.py&quo=
t;, line 279, in _read_status</span></span></div><div style=3D"box-sizing:b=
order-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Conso=
las,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre;backgr=
ound-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-bi=
nding" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=3D"box-=
sizing:border-box">    line =3D str(self.fp.readline(_MAXLINE + 1), &quot;i=
so-8859-1&quot;)</span></span></div><div style=3D"box-sizing:border-box;hei=
ght:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Cou=
rier New&quot;,monospace;font-size:13px;white-space:pre;background-color:rg=
b(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=
=3D"box-sizing:border-box"><span class=3D"gmail-" style=3D"box-sizing:borde=
r-box">  File &quot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp=
/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sy=
sroots/x86_64-pokysdk-linux/usr/lib/python3.10/socket.py&quot;, line 705, i=
n readinto</span></span></div><div style=3D"box-sizing:border-box;height:18=
px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier N=
ew&quot;,monospace;font-size:13px;white-space:pre;background-color:rgb(0,0,=
0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" style=3D"box=
-sizing:border-box"><span class=3D"gmail-" style=3D"box-sizing:border-box">=
    return self._sock.recv_into(b)</span></span></div><div style=3D"box-siz=
ing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,=
Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre;b=
ackground-color:rgb(0,0,0)"><span class=3D"gmail-no-wrap gmail-log_o gmail-=
ng-binding" style=3D"box-sizing:border-box"><span class=3D"gmail-" style=3D=
"box-sizing:border-box">TimeoutError: timed out</span></span></div></div><d=
iv><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></div></div>=
</div>

--0000000000009e8ac805ddcb1498--

