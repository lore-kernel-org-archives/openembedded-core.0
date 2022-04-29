Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A540CC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 13:38:18 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.10201.1651239490107766936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 06:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SS7baZA2;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id x17so14072057lfa.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 06:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FLDWdt0FnIdS3HBa6Dd+JaIzPWhJ1sNHO9qr6P9HuJQ=;
        b=SS7baZA2oyB0k4XlSnUd9vq0pOTRj0gAk/hOCzP1nb3EK+Y11UTL5y2dmYiQ+s+/0H
         y7MtQO1h8ngrNndQyd5E32S1Hxv9mkG2BQ8LIYUcwP4MkIKc77WcIBns9U+B8YQcO9mv
         C7uliCvT/cIloctrxXGz5gatLewxP3r1d552UY/cWKJwrFYo/isLRVeeh2o+YoqFU3qR
         UJkkGKP2EJLNPnZiNHb/kX3abO9nLf3+i0SXjq7LqdXe16iZDsX5wVZmiLLoB9mjIz8T
         rvqvlf3NFNzUVYcEnFLMWwQOc+LiwkvdraH+cHbaaqgrYfeXYDKt5b03Qf2OiFXDrBU4
         7PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FLDWdt0FnIdS3HBa6Dd+JaIzPWhJ1sNHO9qr6P9HuJQ=;
        b=YHuIUtutZvbG3Cs/eCQ5Abr5N3gCmq1/uXlmX6ZTZKlmkMigz7+zb8GgerFhYaYD+u
         PJeygJF8GjV2B/VsUGM1P6bA5ibzs5eCoBAfGS2r18JkpjTUK6XuQhopDgsSBfESmnkj
         5MMi37eVbFlO1Ay1Ug+LbZqxryDwCTWfkLNxlnIvpxSLK4tnWd5+5gWGklonKCQMGIjv
         o56e1vu5i55bnQe7FJspAY+LwiWJC5Ifei6nBCXeIKDEzG/b0Cvi0WoJleHpL1xAEtfM
         OnfrYSRxUMNMW2inwZXBdDFHzaFmeqhUhYUrK3fDPgIQ/hw+StOwGKPp4uLrUWlXV2SA
         mmsg==
X-Gm-Message-State: AOAM530C0JAUEStKBZVsmznwTb3+axsFUJWo6Q5vBiMOUw28lTt7oFiF
	5R7IzT4N9+cMMqoddfWI1lU7fhlXZpI9VstDJOM=
X-Google-Smtp-Source: 
 ABdhPJxl5pMzFxtLZbo074R5IFWMscE79d8zJnLHUuRpt6FbQfi4LjEmg2ozGBnHD8/VCF7/HhCzpfIWU/oQGE6dLJM=
X-Received: by 2002:a05:6512:3341:b0:472:15b3:82fc with SMTP id
 y1-20020a056512334100b0047215b382fcmr13705416lfd.447.1651239487689; Fri, 29
 Apr 2022 06:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220419094616.433632-1-quaresma.jose@gmail.com>
 <37753e878c988098cc777b5ddeb178267a1ec9b3.camel@linuxfoundation.org>
 <16EA614949E42DAD.4798@lists.openembedded.org>
In-Reply-To: <16EA614949E42DAD.4798@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 29 Apr 2022 14:37:56 +0100
Message-ID: 
 <CANPvuRnY6N0BwD-=ttTyCwTNTwvXLzx=TR-9xJo2WnAvR_KoYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] sstate: add a LockedSet class to be used on
 the mirror thread pool
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001a570e05ddcb2702"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 13:38:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165014

--0000000000001a570e05ddcb2702
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia sexta, 29/04/2022 =C3=A0(=
s)
14:33:

>
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> quinta, 28/04/2022 =C3=A0(s) 13:30:
>
>> On Tue, 2022-04-19 at 10:46 +0100, Jose Quaresma wrote:
>> > The python set() is not thread safe and we use it on the ThreadedPool.
>> > With this LockedSet python class we can call the 'add' and 'remove'
>> > safely inside the ThreadedPool.
>> >
>> > This piece of code is taken from the stackoverflow
>> >
>> https://stackoverflow.com/questions/13610654/how-to-make-built-in-contai=
ners-sets-dicts-lists-thread-safe
>> >
>> > May be related with [YOCTO #14775] --
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775
>> >
>> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>>
>> For info,
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/5083
>> was a failure with master-next which included the changes in this
>> discussion. It
>> doesn't seem to address that issue :(
>>
>> Cheers,
>>
>> Richard
>>
>>
> Unfortunately this solution still doesn't solve the problem.
>
> I'm going to analyze the log to try to understand what's going on,
> however I leave here one of the tracebacks in case anyone can see an
> anomaly here.
>
> The mirror thread pool is considerably different in this patch series
> which may imply that the problem may be on the server side but it is stil=
l
> too early to draw conclusions.
>
> I still haven't had time to think about how to do a test for this case.
>
> Jose
>
> ERROR: SState: cannot test
> file://universal/f3/69/sstate:python3-wheel-native:x86_64-linux:0.37.1:r0=
:x86_64:8:f36956da8ee13cebb1fb6df615d0eb548a4bf637c50021c213d8c6f0973674bf_=
deploy_source_date_epoch.tar.zst:
> TimeoutError('timed out')
> Traceback (most recent call last):
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/meta/classes/ssta=
te.bbclass",
> line 1023, in checkstatus
> fetcher.checkstatus()
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fe=
tch2/__init__.py",
> line 1829, in checkstatus
> ret =3D m.try_mirrors(self, ud, self.d, mirrors, True)
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fe=
tch2/__init__.py",
> line 1602, in try_mirrors
> return bool(try_mirrors(fetch, d, urldata, mirrors, check))
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fe=
tch2/__init__.py",
> line 1128, in try_mirrors
> ret =3D try_mirror_url(fetch, origud, uds[index], ld, check)
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fe=
tch2/__init__.py",
> line 1023, in try_mirror_url
> found =3D ud.method.checkstatus(fetch, ud, ld)
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fe=
tch2/wget.py",
> line 361, in checkstatus
> with opener.open(r, timeout=3D30) as response:
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pok=
ysdk-linux/usr/lib/python3.10/urllib/request.py",
> line 519, in open
> response =3D self._open(req, data)
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pok=
ysdk-linux/usr/lib/python3.10/urllib/request.py",
> line 536, in _open
> result =3D self._call_chain(self.handle_open, protocol, protocol +
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pok=
ysdk-linux/usr/lib/python3.10/urllib/request.py",
> line 496, in _call_chain
> result =3D func(*args)
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fe=
tch2/wget.py",
> line 166, in http_open
> return self.do_open(HTTPConnectionCache, req)
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fe=
tch2/wget.py",
> line 236, in do_open
> r =3D h.getresponse()
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pok=
ysdk-linux/usr/lib/python3.10/http/client.py",
> line 1374, in getresponse
> response.begin()
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pok=
ysdk-linux/usr/lib/python3.10/http/client.py",
> line 318, in begin
> version, status, reason =3D self._read_status()
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pok=
ysdk-linux/usr/lib/python3.10/http/client.py",
> line 279, in _read_status
> line =3D str(self.fp.readline(_MAXLINE + 1), "iso-8859-1")
> File
> "/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-=
poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pok=
ysdk-linux/usr/lib/python3.10/socket.py",
> line 705, in readinto
> return self._sock.recv_into(b)
> TimeoutError: timed out
>
>
Latest tracebacks are messed up so here is a copy of it:


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


> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165013):
> https://lists.openembedded.org/g/openembedded-core/message/165013
> Mute This Topic: https://lists.openembedded.org/mt/90558156/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001a570e05ddcb2702
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; escreveu no dia sexta, 29/04/2022 =C3=A0(s) 14:33:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; esc=
reveu no dia quinta, 28/04/2022 =C3=A0(s) 13:30:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, 2022-04-19 at 10:46 +0100, Jose Qu=
aresma wrote:<br>
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
font-size:13px;white-space:pre-wrap;background-color:rgb(0,0,0)"><span styl=
e=3D"box-sizing:border-box"><span style=3D"box-sizing:border-box">ERROR: SS=
tate: cannot test file://universal/f3/69/sstate:python3-wheel-native:x86_64=
-linux:0.37.1:r0:x86_64:8:f36956da8ee13cebb1fb6df615d0eb548a4bf637c50021c21=
3d8c6f0973674bf_deploy_source_date_epoch.tar.zst: TimeoutError(&#39;timed o=
ut&#39;)</span></span></div><div style=3D"box-sizing:border-box;height:18px=
;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New=
&quot;,monospace;font-size:13px;white-space:pre-wrap;background-color:rgb(0=
,0,0)"><span style=3D"box-sizing:border-box"><span style=3D"box-sizing:bord=
er-box">Traceback (most recent call last):</span></span></div><div style=3D=
"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo=
,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-spa=
ce:pre-wrap;background-color:rgb(0,0,0)"><span style=3D"box-sizing:border-b=
ox"><span style=3D"box-sizing:border-box">  File &quot;/home/pokybuild/yoct=
o-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux/core-image-s=
ato/1.0-r0/testsdkext/layers/build/meta/classes/sstate.bbclass&quot;, line =
1023, in checkstatus</span></span></div><div style=3D"box-sizing:border-box=
;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot=
;Courier New&quot;,monospace;font-size:13px;white-space:pre-wrap;background=
-color:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><span style=3D"box=
-sizing:border-box">    fetcher.checkstatus()</span></span></div><div style=
=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-family:Me=
nlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-=
space:pre-wrap;background-color:rgb(0,0,0)"><span style=3D"box-sizing:borde=
r-box"><span style=3D"box-sizing:border-box">  File &quot;/home/pokybuild/y=
octo-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux/core-imag=
e-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetch2/__init__.py&quo=
t;, line 1829, in checkstatus</span></span></div><div style=3D"box-sizing:b=
order-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Conso=
las,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre-wrap;b=
ackground-color:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><span sty=
le=3D"box-sizing:border-box">    ret =3D m.try_mirrors(self, ud, self.d, mi=
rrors, True)</span></span></div><div style=3D"box-sizing:border-box;height:=
18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier=
 New&quot;,monospace;font-size:13px;white-space:pre-wrap;background-color:r=
gb(0,0,0)"><span style=3D"box-sizing:border-box"><span style=3D"box-sizing:=
border-box">  File &quot;/home/pokybuild/yocto-worker/qemumips64/build/buil=
d/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/layers/b=
uild/bitbake/lib/bb/fetch2/__init__.py&quot;, line 1602, in try_mirrors</sp=
an></span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(1=
99,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monos=
pace;font-size:13px;white-space:pre-wrap;background-color:rgb(0,0,0)"><span=
 style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-box">    =
return bool(try_mirrors(fetch, d, urldata, mirrors, check))</span></span></=
div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);=
font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-si=
ze:13px;white-space:pre-wrap;background-color:rgb(0,0,0)"><span style=3D"bo=
x-sizing:border-box"><span style=3D"box-sizing:border-box">  File &quot;/ho=
me/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-poky-l=
inux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetch2/_=
_init__.py&quot;, line 1128, in try_mirrors</span></span></div><div style=
=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-family:Me=
nlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-=
space:pre-wrap;background-color:rgb(0,0,0)"><span style=3D"box-sizing:borde=
r-box"><span style=3D"box-sizing:border-box">    ret =3D try_mirror_url(fet=
ch, origud, uds[index], ld, check)</span></span></div><div style=3D"box-siz=
ing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,=
Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre-w=
rap;background-color:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><spa=
n style=3D"box-sizing:border-box">  File &quot;/home/pokybuild/yocto-worker=
/qemumips64/build/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-=
r0/testsdkext/layers/build/bitbake/lib/bb/fetch2/__init__.py&quot;, line 10=
23, in try_mirror_url</span></span></div><div style=3D"box-sizing:border-bo=
x;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quo=
t;Courier New&quot;,monospace;font-size:13px;white-space:pre-wrap;backgroun=
d-color:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><span style=3D"bo=
x-sizing:border-box">    found =3D ud.method.checkstatus(fetch, ud, ld)</sp=
an></span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(1=
99,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monos=
pace;font-size:13px;white-space:pre-wrap;background-color:rgb(0,0,0)"><span=
 style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-box">  Fi=
le &quot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemum=
ips64-poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib=
/bb/fetch2/wget.py&quot;, line 361, in checkstatus</span></span></div><div =
style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-fami=
ly:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;w=
hite-space:pre-wrap;background-color:rgb(0,0,0)"><span style=3D"box-sizing:=
border-box"><span style=3D"box-sizing:border-box">    with opener.open(r, t=
imeout=3D30) as response:</span></span></div><div style=3D"box-sizing:borde=
r-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,=
&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre-wrap;backg=
round-color:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><span style=
=3D"box-sizing:border-box">  File &quot;/home/pokybuild/yocto-worker/qemumi=
ps64/build/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/test=
sdkext/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.10/urllib/r=
equest.py&quot;, line 519, in open</span></span></div><div style=3D"box-siz=
ing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,=
Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre-w=
rap;background-color:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><spa=
n style=3D"box-sizing:border-box">    response =3D self._open(req, data)</s=
pan></span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(=
199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,mono=
space;font-size:13px;white-space:pre-wrap;background-color:rgb(0,0,0)"><spa=
n style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-box">  F=
ile &quot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemu=
mips64-poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/python3.10/urllib/request.py&quot;, line 536, in =
_open</span></span></div><div style=3D"box-sizing:border-box;height:18px;co=
lor:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&qu=
ot;,monospace;font-size:13px;white-space:pre-wrap;background-color:rgb(0,0,=
0)"><span style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-=
box">    result =3D self._call_chain(self.handle_open, protocol, protocol +=
</span></span></div><div style=3D"box-sizing:border-box;height:18px;color:r=
gb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,m=
onospace;font-size:13px;white-space:pre-wrap;background-color:rgb(0,0,0)"><=
span style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-box">=
  File &quot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/q=
emumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/=
x86_64-pokysdk-linux/usr/lib/python3.10/urllib/request.py&quot;, line 496, =
in _call_chain</span></span></div><div style=3D"box-sizing:border-box;heigh=
t:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Couri=
er New&quot;,monospace;font-size:13px;white-space:pre-wrap;background-color=
:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><span style=3D"box-sizin=
g:border-box">    result =3D func(*args)</span></span></div><div style=3D"b=
ox-sizing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,M=
onaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-space=
:pre-wrap;background-color:rgb(0,0,0)"><span style=3D"box-sizing:border-box=
"><span style=3D"box-sizing:border-box">  File &quot;/home/pokybuild/yocto-=
worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux/core-image-sat=
o/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetch2/wget.py&quot;, line =
166, in http_open</span></span></div><div style=3D"box-sizing:border-box;he=
ight:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Co=
urier New&quot;,monospace;font-size:13px;white-space:pre-wrap;background-co=
lor:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><span style=3D"box-si=
zing:border-box">    return self.do_open(HTTPConnectionCache, req)</span></=
span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,19=
9,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;=
font-size:13px;white-space:pre-wrap;background-color:rgb(0,0,0)"><span styl=
e=3D"box-sizing:border-box"><span style=3D"box-sizing:border-box">  File &q=
uot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64=
-poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/f=
etch2/wget.py&quot;, line 236, in do_open</span></span></div><div style=3D"=
box-sizing:border-box;height:18px;color:rgb(199,199,199);font-family:Menlo,=
Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;white-spac=
e:pre-wrap;background-color:rgb(0,0,0)"><span style=3D"box-sizing:border-bo=
x"><span style=3D"box-sizing:border-box">    r =3D h.getresponse()</span></=
span></div><div style=3D"box-sizing:border-box;height:18px;color:rgb(199,19=
9,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;=
font-size:13px;white-space:pre-wrap;background-color:rgb(0,0,0)"><span styl=
e=3D"box-sizing:border-box"><span style=3D"box-sizing:border-box">  File &q=
uot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64=
-poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-po=
kysdk-linux/usr/lib/python3.10/http/client.py&quot;, line 1374, in getrespo=
nse</span></span></div><div style=3D"box-sizing:border-box;height:18px;colo=
r:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quot=
;,monospace;font-size:13px;white-space:pre-wrap;background-color:rgb(0,0,0)=
"><span style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-bo=
x">    response.begin()</span></span></div><div style=3D"box-sizing:border-=
box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&q=
uot;Courier New&quot;,monospace;font-size:13px;white-space:pre-wrap;backgro=
und-color:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><span style=3D"=
box-sizing:border-box">  File &quot;/home/pokybuild/yocto-worker/qemumips64=
/build/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdke=
xt/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.10/http/client.=
py&quot;, line 318, in begin</span></span></div><div style=3D"box-sizing:bo=
rder-box;height:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consol=
as,&quot;Courier New&quot;,monospace;font-size:13px;white-space:pre-wrap;ba=
ckground-color:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><span styl=
e=3D"box-sizing:border-box">    version, status, reason =3D self._read_stat=
us()</span></span></div><div style=3D"box-sizing:border-box;height:18px;col=
or:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courier New&quo=
t;,monospace;font-size:13px;white-space:pre-wrap;background-color:rgb(0,0,0=
)"><span style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-b=
ox">  File &quot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/wo=
rk/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysro=
ots/x86_64-pokysdk-linux/usr/lib/python3.10/http/client.py&quot;, line 279,=
 in _read_status</span></span></div><div style=3D"box-sizing:border-box;hei=
ght:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Cou=
rier New&quot;,monospace;font-size:13px;white-space:pre-wrap;background-col=
or:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><span style=3D"box-siz=
ing:border-box">    line =3D str(self.fp.readline(_MAXLINE + 1), &quot;iso-=
8859-1&quot;)</span></span></div><div style=3D"box-sizing:border-box;height=
:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Courie=
r New&quot;,monospace;font-size:13px;white-space:pre-wrap;background-color:=
rgb(0,0,0)"><span style=3D"box-sizing:border-box"><span style=3D"box-sizing=
:border-box">  File &quot;/home/pokybuild/yocto-worker/qemumips64/build/bui=
ld/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/buildto=
ols/sysroots/x86_64-pokysdk-linux/usr/lib/python3.10/socket.py&quot;, line =
705, in readinto</span></span></div><div style=3D"box-sizing:border-box;hei=
ght:18px;color:rgb(199,199,199);font-family:Menlo,Monaco,Consolas,&quot;Cou=
rier New&quot;,monospace;font-size:13px;white-space:pre-wrap;background-col=
or:rgb(0,0,0)"><span style=3D"box-sizing:border-box"><span style=3D"box-siz=
ing:border-box">    return self._sock.recv_into(b)</span></span></div><div =
style=3D"box-sizing:border-box;height:18px;color:rgb(199,199,199);font-fami=
ly:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:13px;w=
hite-space:pre-wrap;background-color:rgb(0,0,0)"><span style=3D"box-sizing:=
border-box"><span style=3D"box-sizing:border-box">TimeoutError: timed out</=
span></span></div></div><div><br></div></div></div></div></blockquote><div>=
<br></div><div>Latest tracebacks are messed up so here is a copy of it:<br>=
</div><div><br></div><div><br></div>ERROR: SState: cannot test file://unive=
rsal/f3/69/sstate:python3-wheel-native:x86_64-linux:0.37.1:r0:x86_64:8:f369=
56da8ee13cebb1fb6df615d0eb548a4bf637c50021c213d8c6f0973674bf_deploy_source_=
date_epoch.tar.zst: TimeoutError(&#39;timed out&#39;)<br>Traceback (most re=
cent call last):<br>=C2=A0 File &quot;/home/pokybuild/yocto-worker/qemumips=
64/build/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsd=
kext/layers/build/meta/classes/sstate.bbclass&quot;, line 1023, in checksta=
tus<br>=C2=A0 =C2=A0 fetcher.checkstatus()<br>=C2=A0 File &quot;/home/pokyb=
uild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux/cor=
e-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetch2/__init__.=
py&quot;, line 1829, in checkstatus<br>=C2=A0 =C2=A0 ret =3D m.try_mirrors(=
self, ud, self.d, mirrors, True)<br>=C2=A0 File &quot;/home/pokybuild/yocto=
-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux/core-image-sa=
to/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetch2/__init__.py&quot;, =
line 1602, in try_mirrors<br>=C2=A0 =C2=A0 return bool(try_mirrors(fetch, d=
, urldata, mirrors, check))<br>=C2=A0 File &quot;/home/pokybuild/yocto-work=
er/qemumips64/build/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.=
0-r0/testsdkext/layers/build/bitbake/lib/bb/fetch2/__init__.py&quot;, line =
1128, in try_mirrors<br>=C2=A0 =C2=A0 ret =3D try_mirror_url(fetch, origud,=
 uds[index], ld, check)<br>=C2=A0 File &quot;/home/pokybuild/yocto-worker/q=
emumips64/build/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0=
/testsdkext/layers/build/bitbake/lib/bb/fetch2/__init__.py&quot;, line 1023=
, in try_mirror_url<br>=C2=A0 =C2=A0 found =3D ud.method.checkstatus(fetch,=
 ud, ld)<br>=C2=A0 File &quot;/home/pokybuild/yocto-worker/qemumips64/build=
/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/lay=
ers/build/bitbake/lib/bb/fetch2/wget.py&quot;, line 361, in checkstatus<br>=
=C2=A0 =C2=A0 with opener.open(r, timeout=3D30) as response:<br>=C2=A0 File=
 &quot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumip=
s64-poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64=
-pokysdk-linux/usr/lib/python3.10/urllib/request.py&quot;, line 519, in ope=
n<br>=C2=A0 =C2=A0 response =3D self._open(req, data)<br>=C2=A0 File &quot;=
/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-pok=
y-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokysd=
k-linux/usr/lib/python3.10/urllib/request.py&quot;, line 536, in _open<br>=
=C2=A0 =C2=A0 result =3D self._call_chain(self.handle_open, protocol, proto=
col +<br>=C2=A0 File &quot;/home/pokybuild/yocto-worker/qemumips64/build/bu=
ild/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/buildt=
ools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.10/urllib/request.py&quo=
t;, line 496, in _call_chain<br>=C2=A0 =C2=A0 result =3D func(*args)<br>=C2=
=A0 File &quot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work=
/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/layers/build/bitba=
ke/lib/bb/fetch2/wget.py&quot;, line 166, in http_open<br>=C2=A0 =C2=A0 ret=
urn self.do_open(HTTPConnectionCache, req)<br>=C2=A0 File &quot;/home/pokyb=
uild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux/cor=
e-image-sato/1.0-r0/testsdkext/layers/build/bitbake/lib/bb/fetch2/wget.py&q=
uot;, line 236, in do_open<br>=C2=A0 =C2=A0 r =3D h.getresponse()<br>=C2=A0=
 File &quot;/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qe=
mumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x=
86_64-pokysdk-linux/usr/lib/python3.10/http/client.py&quot;, line 1374, in =
getresponse<br>=C2=A0 =C2=A0 response.begin()<br>=C2=A0 File &quot;/home/po=
kybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux/=
core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokysdk-linux/=
usr/lib/python3.10/http/client.py&quot;, line 318, in begin<br>=C2=A0 =C2=
=A0 version, status, reason =3D self._read_status()<br>=C2=A0 File &quot;/h=
ome/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-poky-=
linux/core-image-sato/1.0-r0/testsdkext/buildtools/sysroots/x86_64-pokysdk-=
linux/usr/lib/python3.10/http/client.py&quot;, line 279, in _read_status<br=
>=C2=A0 =C2=A0 line =3D str(self.fp.readline(_MAXLINE + 1), &quot;iso-8859-=
1&quot;)<br>=C2=A0 File &quot;/home/pokybuild/yocto-worker/qemumips64/build=
/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testsdkext/bui=
ldtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.10/socket.py&quot;, l=
ine 705, in readinto<br>=C2=A0 =C2=A0 return self._sock.recv_into(b)<br>Tim=
eoutError: timed out<br><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div><div><div></div>-- <br><div dir=3D"lt=
r"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></d=
iv></div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165013): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165013" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165013</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90558156/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90558156/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000001a570e05ddcb2702--

