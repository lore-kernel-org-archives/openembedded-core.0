Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA749C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 21:14:28 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.27811.1634505267308685538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 14:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PEyyR8X2;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id e19so5169883ljk.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qquDH59CXxtFkj226gu5IzhlPdA/yGr5SQSGXOp/cm0=;
        b=PEyyR8X2KeXfn8vmnoCDVNU45veQHrWNmLcOWqA/EH9FY0lTjeoIvQcdEwO78okTz+
         0pychAqJCoy1IkTeHt8EgIyd0A/LwTTPksobml6vV+/qtSmskdEODerFuWYr263+UtXB
         4+3Go60ipKAFaJ1O49jpDZhS6HNiam1K6+BVVMCbOpbZgKii8kBVUGETEx9kfoFB6975
         SwjS1DCr4rP5/Yk3k9fVMO1eqUrNyCYhXOJVisOGd4d59DpQFu52uD3LMUI9nSSbETf/
         /Q+FmL+LtEBAa5ArmJrrSKfYUddC9dYqU58DXVnX1iyO4vtoiw+AG5yVD8r2WuQMUk3A
         GLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qquDH59CXxtFkj226gu5IzhlPdA/yGr5SQSGXOp/cm0=;
        b=qiP2sADSZS173EweG71yDTtlncK8cxctxqA7Go1ARTlfGMHZAF0oAbJD0p5jgZ7W3b
         1EGVwec0LVRNWZHFpvz1g7h+gg2xwIVNvdoWODWS0ZkToCm/WTInDoYhwy1nTdOXG9A5
         +xT8VBi/c0NhJdfM4PrOWpXidQ2t6tqJp9HSVUMR3tfOLWvmNjJ5FBH3iD9uYl2d6TlV
         5SkbFh6hIJLch3Rd4Z+1J9wyBQDktrGs63Qh/kX4oCPI80qARbV7E7LKk2jnYlvUXMuQ
         ikwVNpQ9zGOJEFX/GeryR2w5SvogonBFWP+XOLwWnsqz9TNY+CxKF/UXRJon3zSHDNJS
         3j9w==
X-Gm-Message-State: AOAM531JMlTLvS81IbIzB8cmpaZdhlvQUaAIfpCc1f1NT+zkDgE/6Sfc
	udFl4DE1e9VdbDaAguEa52nB/8AQpDmXcpkZ6Ho=
X-Google-Smtp-Source: 
 ABdhPJxbXORPP/IW3meDDrFjAO/wguYFwlDqr/rYjbZ14mFnZVoNZsf5bV9wAzyIjmPcpsCm8RoBjREMxosRU1tKPSQ=
X-Received: by 2002:a2e:9b4e:: with SMTP id
 o14mr26879664ljj.278.1634505265344;
 Sun, 17 Oct 2021 14:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211015234728.338196-1-quaresma.jose@gmail.com>
 <CAJdd5GZka84w1vRP6ufegohVaRrh1=ZKP=YB6gmzzxOcyZ8ZyA@mail.gmail.com>
In-Reply-To: 
 <CAJdd5GZka84w1vRP6ufegohVaRrh1=ZKP=YB6gmzzxOcyZ8ZyA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sun, 17 Oct 2021 22:14:17 +0100
Message-ID: 
 <CANPvuRm1uhQJQ1jdJ_jqoorHVdTBTtseumSwGtTa0a_=MRdLzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake: cooker: check if upstream hash
 equivalence server is available
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b973e605ce92e961"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 21:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157046

--000000000000b973e605ce92e961
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Joshua Watt <jpewhacker@gmail.com> escreveu no dia s=C3=A1bado, 16/10/2021 =
=C3=A0(s)
20:15:

>
>
> On Fri, Oct 15, 2021, 6:47 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
>
>> When the user specify an upstream hash equivalence server in
>> BB_HASHSERVE_UPSTREAM abort if we can't connect otherwise the
>> user will never be notified about the problem.
>>
>> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> ---
>>  bitbake/lib/bb/cooker.py | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
>> index af794b4c42..34603c5ea2 100644
>> --- a/bitbake/lib/bb/cooker.py
>> +++ b/bitbake/lib/bb/cooker.py
>> @@ -388,12 +388,22 @@ class BBCooker:
>>              # Create a new hash server bound to a unix domain socket
>>              if not self.hashserv:
>>                  dbfile =3D (self.data.getVar("PERSISTENT_DIR") or
>> self.data.getVar("CACHE")) + "/hashserv.db"
>> +                upstream =3D self.data.getVar("BB_HASHSERVE_UPSTREAM") =
or
>> None
>> +                if upstream:
>> +                    import socket
>> +                    try:
>> +                        sock =3D
>> socket.create_connection(upstream.split(":"), 5)
>> +                        sock.close()
>> +                    except socket.error as e:
>> +                        bb.fatal("BB_HASHSERVE_UPSTREAM is not valid,
>> unable to connect hash equivalence server at '%s': %s"
>> +                                 % (upstream, repr(e)))
>> +
>>
>
> Perhaps this should just be a warning? The upstream missing should not be
> fatal for a given server, if it is we probably need to fix that
>

In my opinion this needs to be fatal or fixed with a different approach.

If we launch bitbake in a clean build without build/cache with an invalid
server it will deadlock printing the follow message after several minutes:
WARNING: Error contacting Hash Equivalence Server
unix:///build/hashserve.sock: Connection closed

The build/bitbake-cookerdaemon.log have all the connections errors as well
as exceptions.
This cooker log is a bit ugly imho and I will try to improved it in a
follow up patch.


>                  self.hashservaddr =3D "unix://%s/hashserve.sock" %
>> self.data.getVar("TOPDIR")
>>                  self.hashserv =3D hashserv.create_server(
>>                      self.hashservaddr,
>>                      dbfile,
>>                      sync=3DFalse,
>> -                    upstream=3Dself.data.getVar("BB_HASHSERVE_UPSTREAM"=
)
>> or None,
>> +                    upstream=3Dupstream,
>>                  )
>>                  self.hashserv.serve_as_process()
>>              self.data.setVar("BB_HASHSERVE", self.hashservaddr)
>> --
>> 2.33.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#157010):
>> https://lists.openembedded.org/g/openembedded-core/message/157010
>> Mute This Topic: https://lists.openembedded.org/mt/86362510/3616693
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> JPEWhacker@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b973e605ce92e961
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Joshua Watt &lt;<a href=3D"mailto:jpe=
whacker@gmail.com">jpewhacker@gmail.com</a>&gt; escreveu no dia s=C3=A1bado=
, 16/10/2021 =C3=A0(s) 20:15:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 15, 2021, 6:47 PM Jose Quare=
sma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quares=
ma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">When the user specify an upstream hash equivalence server =
in<br>
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
</blockquote><div><br></div><div>In my opinion this needs to be fatal or fi=
xed with a different approach.</div><div><br></div><div>If we launch=C2=A0b=
itbake in a clean build without build/cache with an invalid server it will =
deadlock printing the follow message after several minutes:</div><div>WARNI=
NG: Error contacting Hash Equivalence Server unix:///build/hashserve.sock: =
Connection closed=C2=A0=C2=A0<br></div><div><br></div><div>The=C2=A0build/b=
itbake-cookerdaemon.log have all the connections=C2=A0errors as well as exc=
eptions.</div><div>This cooker log is a bit ugly imho and I will try to imp=
roved it in a follow up patch.</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157010): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157010" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/157010</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86362510/3616=
693" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/86362510/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmai=
l.com" rel=3D"noreferrer" target=3D"_blank">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000b973e605ce92e961--

