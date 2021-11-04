Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F8AC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:31:23 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.2526.1636054281261240415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UFjVsVUY;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id y26so14048540lfa.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hpAKD2r15KuuorLUlWpg+jxkkajz9UElSewoolxl9Os=;
        b=UFjVsVUYnbZTcuLNfrz7BZNiEo9O43QXymsutWe1krgtyR/mqAfN8MqhNW7ZQbBIBd
         +S2FfGaB0b8csJe3CaCpzCWTHktd7CbEnyv1P8clzNwB69eTySadqqGYzn1A2mzxWz1s
         iIrOh4S3/nNfctVWqv6KRs5SMEzfLUpwy+DgOFXL1mmy/jIz8fZ9JfWlx9g4EPFvbm3P
         gJywo1PMR1ERfNMYsK3rRQtw0LsX8rwv2iET9OuOF3VOS/jCldiFQbJRQyxoLs86Y8RS
         ipgnm29CI/dFfwJkdgpz+prPoDBDTMZTKjx2J/79MoS0nd4q4C0RfcqppZNO6R1weQOc
         XWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hpAKD2r15KuuorLUlWpg+jxkkajz9UElSewoolxl9Os=;
        b=3aRSpdcXYLfUsQYIjj9TJ6sBklVV/NUuBeMu5mIk1PUbpMos08oLZuneXj9TqU3ZLo
         uomb2vVOp9e9DVkJ7cjPlj1bhUX7RKNanBqBGuPKyxpqqMAATXnrJCMQXJpBJG3wKCPm
         g13sCVpv1CWDKrO8AZspIs68hCYjIknUgF1B2KP/NZMWnPcT5Lcm0oUIElR0RUnL5Bbe
         etu/fzxraJPUNa3IagwjdTRzJf7g0GrL6sZfjucQEsYo2gAwtwknzTYIhdk86LasiSls
         Sygdz1o+eaKgkL2qvfpk07C3VgDOBm2RC1s3V4P7QuuKk9jYcOI4wQADjABdg+AKyIVM
         TwLQ==
X-Gm-Message-State: AOAM533BmvEZ58gari1q3ZkuLFTmi3hR4+/7LvyLPQeNXe3AgAfX36gU
	sFgcI37ftOtaCx9tUxLZo3xihJmReNHiyPol9hM=
X-Google-Smtp-Source: 
 ABdhPJySWQbF8rJ6dKLW8uWKOyPWEFHvDj2/jTvyOk0KO8kGq5n3nbecaQwh46NKx959EaxOkqtYdO5jFq54jOfRxeQ=
X-Received: by 2002:a19:5611:: with SMTP id
 k17mr35853778lfb.106.1636054279442;
 Thu, 04 Nov 2021 12:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211015234728.338196-1-quaresma.jose@gmail.com>
 <CAJdd5GZka84w1vRP6ufegohVaRrh1=ZKP=YB6gmzzxOcyZ8ZyA@mail.gmail.com>
 <16AEEDE195E53F78.3027@lists.openembedded.org>
In-Reply-To: <16AEEDE195E53F78.3027@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 4 Nov 2021 19:31:08 +0000
Message-ID: 
 <CANPvuR=royjGCGWZ7ogm3r=aZuywKSkLh10nV4Ybq2HBF-wxmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake: cooker: check if upstream hash
 equivalence server is available
To: quaresma.jose@gmail.com
Cc: Joshua Watt <jpewhacker@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000028d4ca05cffb924d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 19:31:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157860

--00000000000028d4ca05cffb924d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia domingo, 17/10/2021 =C3=
=A0(s)
22:14:

>
>
> Joshua Watt <jpewhacker@gmail.com> escreveu no dia s=C3=A1bado, 16/10/202=
1
> =C3=A0(s) 20:15:
>
>>
>>
>> On Fri, Oct 15, 2021, 6:47 PM Jose Quaresma <quaresma.jose@gmail.com>
>> wrote:
>>
>>> When the user specify an upstream hash equivalence server in
>>> BB_HASHSERVE_UPSTREAM abort if we can't connect otherwise the
>>> user will never be notified about the problem.
>>>
>>> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>>> ---
>>>  bitbake/lib/bb/cooker.py | 12 +++++++++++-
>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
>>> index af794b4c42..34603c5ea2 100644
>>> --- a/bitbake/lib/bb/cooker.py
>>> +++ b/bitbake/lib/bb/cooker.py
>>> @@ -388,12 +388,22 @@ class BBCooker:
>>>              # Create a new hash server bound to a unix domain socket
>>>              if not self.hashserv:
>>>                  dbfile =3D (self.data.getVar("PERSISTENT_DIR") or
>>> self.data.getVar("CACHE")) + "/hashserv.db"
>>> +                upstream =3D self.data.getVar("BB_HASHSERVE_UPSTREAM")=
 or
>>> None
>>> +                if upstream:
>>> +                    import socket
>>> +                    try:
>>> +                        sock =3D
>>> socket.create_connection(upstream.split(":"), 5)
>>> +                        sock.close()
>>> +                    except socket.error as e:
>>> +                        bb.fatal("BB_HASHSERVE_UPSTREAM is not valid,
>>> unable to connect hash equivalence server at '%s': %s"
>>> +                                 % (upstream, repr(e)))
>>> +
>>>
>>
>> Perhaps this should just be a warning? The upstream missing should not b=
e
>> fatal for a given server, if it is we probably need to fix that
>>
>
I have changed it to be a warning in V2


> In my opinion this needs to be fatal or fixed with a different approach.
>
> If we launch bitbake in a clean build without build/cache with an invalid
> server it will deadlock printing the follow message after several minutes=
:
> WARNING: Error contacting Hash Equivalence Server
> unix:///build/hashserve.sock: Connection closed
>
> The build/bitbake-cookerdaemon.log have all the connections errors as wel=
l
> as exceptions.
> This cooker log is a bit ugly imho and I will try to improved it in a
> follow up patch.
>
>
>>                  self.hashservaddr =3D "unix://%s/hashserve.sock" %
>>> self.data.getVar("TOPDIR")
>>>                  self.hashserv =3D hashserv.create_server(
>>>                      self.hashservaddr,
>>>                      dbfile,
>>>                      sync=3DFalse,
>>> -                    upstream=3Dself.data.getVar("BB_HASHSERVE_UPSTREAM=
")
>>> or None,
>>> +                    upstream=3Dupstream,
>>>                  )
>>>                  self.hashserv.serve_as_process()
>>>              self.data.setVar("BB_HASHSERVE", self.hashservaddr)
>>> --
>>> 2.33.1
>>>
>>>
>>>
>>>
>>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157046):
> https://lists.openembedded.org/g/openembedded-core/message/157046
> Mute This Topic: https://lists.openembedded.org/mt/86362510/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000028d4ca05cffb924d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; escreveu no dia domingo, 17/10/2021 =C3=A0(s) 22:14:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com" target=
=3D"_blank">jpewhacker@gmail.com</a>&gt; escreveu no dia s=C3=A1bado, 16/10=
/2021 =C3=A0(s) 20:15:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Oct 15, 2021, 6:47 PM Jose Quaresma &=
lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jo=
se@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">When the user specify an upstream hash equivalence server in<br=
>
BB_HASHSERVE_UPSTREAM abort if we can&#39;t connect otherwise the<br>
user will never be notified about the problem.<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 rel=3D"noreferrer" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0bitbake/lib/bb/cooker.py | 12 +++++++++++-<br>
=C2=A01 file changed, 11 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py<br>
index af794b4c42..34603c5ea2 100644<br>
--- a/bitbake/lib/bb/cooker.py<br>
+++ b/bitbake/lib/bb/cooker.py<br>
@@ -388,12 +388,22 @@ class BBCooker:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create a new hash server =
bound to a unix domain socket<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.hashserv:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dbfile =3D (s=
elf.data.getVar(&quot;PERSISTENT_DIR&quot;) or self.data.getVar(&quot;CACHE=
&quot;)) + &quot;/hashserv.db&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 upstream =3D self.=
data.getVar(&quot;BB_HASHSERVE_UPSTREAM&quot;) or None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if upstream:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 impo=
rt socket<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sock =3D socket.create_connection(upstream.split(&quot;:&quot;),=
 5)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sock.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exce=
pt socket.error as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.fatal(&quot;BB_HASHSERVE_UPSTREAM is not valid, unable to con=
nect hash equivalence server at &#39;%s&#39;: %s&quot; <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% (upstream, repr(e)))<br>
+<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Perhaps this should just be a warning? The upstream missing should not be =
fatal for a given server, if it is we probably need to fix that</div></div>=
</blockquote></div></div></blockquote><div><br></div><div>I have changed it=
 to be a warning in V2</div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></di=
v><div>In my opinion this needs to be fatal or fixed with a different appro=
ach.</div><div><br></div><div>If we launch=C2=A0bitbake in a clean build wi=
thout build/cache with an invalid server it will deadlock printing the foll=
ow message after several minutes:</div><div>WARNING: Error contacting Hash =
Equivalence Server unix:///build/hashserve.sock: Connection closed=C2=A0=C2=
=A0<br></div><div><br></div><div>The=C2=A0build/bitbake-cookerdaemon.log ha=
ve all the connections=C2=A0errors as well as exceptions.</div><div>This co=
oker log is a bit ugly imho and I will try to improved it in a follow up pa=
tch.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.hashserv=
addr =3D &quot;unix://%s/hashserve.sock&quot; % self.data.getVar(&quot;TOPD=
IR&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.hashserv=
 =3D hashserv.create_server(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.hashservaddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dbfile,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sync=3DFalse,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 upst=
ream=3Dself.data.getVar(&quot;BB_HASHSERVE_UPSTREAM&quot;) or None,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 upst=
ream=3Dupstream,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.hashserv=
.serve_as_process()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.data.setVar(&quot;BB_H=
ASHSERVE&quot;, self.hashservaddr)<br>
-- <br>
2.33.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157046): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157046" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157046</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86362510/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86362510/5052612</a><br>
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

--00000000000028d4ca05cffb924d--

