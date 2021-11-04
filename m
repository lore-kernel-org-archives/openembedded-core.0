Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3447C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:46:08 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.2733.1636055167404635322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aMfE+YWm;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id bi35so14140120lfb.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YwCCL0EsxngIkn5aHQ0XhzDpnX+NgZ6S6OcpPaMggBU=;
        b=aMfE+YWm1qi4z6Znqcq9Kg3MkFrBe7Ukgkbt7rcBeKG5R51CtE2kPjCYFDiZaJh9ax
         P794NZKNTj6qT7OA4SSovj8nJxsUvIgtr1IZyuiooGD0ZsoD/lN+ps1KbouVLbj/P3Y9
         a2PGBcIYdM1NnPN84EOj+4N1wzJi7V7ZwBOUK+JrHmPimcJNr8AkW5oEus+cRYj9HPXA
         d9SAIpUEBlxQo1/ekPu7gqsBtCEO98aGdVsLpsa4ydZ+ozpHoXvyzkIMgMWyu1/A9A47
         gdc/eD/q/Xl6sDKZQadw69R65MqtOYgM+V7A8h2qqoat9qvfrHfOyymPyCKlM5KHGW+0
         PhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YwCCL0EsxngIkn5aHQ0XhzDpnX+NgZ6S6OcpPaMggBU=;
        b=ZHtWRMpbcBgpTxtWFBnRhqEe9fAyjkShfzxQDXR5RH00F46BkMioK8JhdzVD1l9KWQ
         ClrzC6ipilleQC3nYn3l3YbULwVc5Ktr3FOqFK5bdAspbrSGzy2fqNOCqsZ2ObdhYfp0
         VEYrcdVpWU2TinLqU3pt+ORHvQ2bSbm70pHfIciTlAq6kjm5XmrhU3oVCRvpeFrusW1c
         VVY/4jtg61g/U7UVEIgebKncRpiaLjHHiMYZzqBsjjIgqgOw2BS5/kVuGXVvarPz7e9q
         yBoqBvvpHYaLz3CjGPL1Cb3EpMVY6XjcxiUAJYyQUhtlRtg1skuwZCkkgDO2WNpPNQYI
         RYgA==
X-Gm-Message-State: AOAM532K/8QXMwcgMHfbVHFBBkOv7td3Nzo7Z7qElfSyj80OMW3Z53Hb
	kaEB71nZ2eXXqCZYzf1V+3zp+7BkY9GO/kv85qI=
X-Google-Smtp-Source: 
 ABdhPJxQLmLbJPvCIUFxd8VU4L2RXM8KP0fRsqsT780Kbv0RESx9YQA3I5oNw6lY65JB+72qxaEz1IxuCUYODrZ8RLw=
X-Received: by 2002:a05:6512:2022:: with SMTP id
 s2mr19110397lfs.95.1636055165493;
 Thu, 04 Nov 2021 12:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211015234728.338196-1-quaresma.jose@gmail.com>
 <CAJdd5GZka84w1vRP6ufegohVaRrh1=ZKP=YB6gmzzxOcyZ8ZyA@mail.gmail.com>
 <16AEEDE195E53F78.3027@lists.openembedded.org>
 <16B46EB3823D5730.4935@lists.openembedded.org>
In-Reply-To: <16B46EB3823D5730.4935@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 4 Nov 2021 19:45:54 +0000
Message-ID: 
 <CANPvuRmeSdETQJqwUmNiKNSHXKsR_wk_FaE5nmO+tPBwrHUyAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake: cooker: check if upstream hash
 equivalence server is available
To: quaresma.jose@gmail.com
Cc: Joshua Watt <jpewhacker@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f8e56405cffbc62b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 19:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157861

--000000000000f8e56405cffbc62b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To reproduce we can set:

# the real port is 8687 and with the 18687 we can simulate a firewall block
BB_HASHSERVE_UPSTREAM =3D "typhoon.yocto.io:18687"

With the V2 patch and we get on the log:

WARNING: BB_HASHSERVE_UPSTREAM is not valid, unable to connect hash
equivalence server at 'typhoon.yocto.io:18687': timeout('timed out')

and bitbake deadlock in Initialising tasks:

Initialising tasks:  44%
|####################################################
                                                                  | ETA:
 0:00:00

on bitbake-cookerdaemon.log we have:

3 19:32:26.434306 Running command ['buildTargets', ['core-image-minimal'],
'build']
63 19:32:26.434386 Command Completed
Error talking to server: [Errno 110] Connect call failed ('35.233.185.178',
18687)
Error talking to server: [Errno 110] Connect call failed ('35.233.185.178',
18687)
Error talking to server: [Errno 110] Connect call failed ('35.233.185.178',
18687)
Error talking to server: [Errno 110] Connect call failed ('35.233.185.178',
18687)
Error from client: [Errno 110] Connect call failed ('35.233.185.178',
18687)
Traceback (most recent call last):
 File "/work/poky/bitbake/lib/bb/asyncrpc/client.py", line 57, in
_send_wrapper
   await self.connect()
 File "/work/poky/bitbake/lib/bb/asyncrpc/client.py", line 43, in connect
   (self.reader, self.writer) =3D await self._connect_sock()
 File "/work/poky/bitbake/lib/bb/asyncrpc/client.py", line 26, in
connect_sock
   return await asyncio.open_connection(address, port)
 File "/usr/lib/python3.7/asyncio/streams.py", line 77, in open_connection
   lambda: protocol, host, port, **kwds)
 File "/usr/lib/python3.7/asyncio/base_events.py", line 959, in
create_connection
   raise exceptions[0]
 File "/usr/lib/python3.7/asyncio/base_events.py", line 946, in
create_connection
   await self.sock_connect(sock, address)
 File "/usr/lib/python3.7/asyncio/selector_events.py", line 464, in
sock_connect
   return await fut
 File "/usr/lib/python3.7/asyncio/selector_events.py", line 494, in
_sock_connect_cb
   raise OSError(err, f'Connect call failed {address}')
TimeoutError: [Errno 110] Connect call failed ('35.233.185.178', 18687)

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
 File "/work/poky/bitbake/lib/bb/asyncrpc/serv.py", line 192, in
handle_client
   await client.process_requests()
 File "/work/poky/bitbake/lib/hashserv/server.py", line 200, in
process_requests
   await super().process_requests()
 File "/work/poky/bitbake/lib/bb/asyncrpc/serv.py", line 72, in
process_requests
   await self.dispatch_message(d)
 File "/work/poky/bitbake/lib/hashserv/server.py", line 210, in
dispatch_message
   await self.handlers[k](msg[k])
 File "/work/poky/bitbake/lib/hashserv/server.py", line 355, in
handle_get_stream
   upstream =3D await self.upstream_client.get_unihash(method, taskhash)
 File "/work/poky/bitbake/lib/hashserv/client.py", line 57, in get_unihash
   await self._set_mode(self.MODE_GET_STREAM)
 File "/work/poky/bitbake/lib/hashserv/client.py", line 46, in _set_mode
   r =3D await self.send_message({"get-stream": None})
 File "/work/poky/bitbake/lib/bb/asyncrpc/client.py", line 110, in
send_message
   return await self._send_wrapper(proc)
 File "/work/poky/bitbake/lib/bb/asyncrpc/client.py", line 68, in
_send_wrapper
   raise ConnectionError(str(e))
ConnectionError: [Errno 110] Connect call failed ('35.233.185.178', 18687)
Error talking to server: Connection closed
Traceback (most recent call last):
 File "/work/poky/bitbake/lib/bb/asyncrpc/client.py", line 57, in
_send_wrapper
   await self.connect()
 File "/work/poky/bitbake/lib/bb/asyncrpc/client.py", line 43, in connect
   (self.reader, self.writer) =3D await self._connect_sock()
 File "/work/poky/bitbake/lib/bb/asyncrpc/client.py", line 26, in
connect_sock
   return await asyncio.open_connection(address, port)
 File "/usr/lib/python3.7/asyncio/streams.py", line 77, in open_connection
   lambda: protocol, host, port, **kwds)
 File "/usr/lib/python3.7/asyncio/base_events.py", line 959, in
create_connection
   raise exceptions[0]
 File "/usr/lib/python3.7/asyncio/base_events.py", line 946, in
create_connection
   await self.sock_connect(sock, address)
 File "/usr/lib/python3.7/asyncio/selector_events.py", line 464, in
sock_connect
   return await fut
 File "/usr/lib/python3.7/asyncio/selector_events.py", line 494, in
_sock_connect_cb
   raise OSError(err, f'Connect call failed {address}')
TimeoutError: [Errno 110] Connect call failed ('35.233.185.178', 18687)

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
 File "/work/poky/bitbake/lib/bb/asyncrpc/serv.py", line 192, in
handle_client
   await client.process_requests()
 File "/work/poky/bitbake/lib/hashserv/server.py", line 200, in
process_requests
   await super().process_requests()
 File "/work/poky/bitbake/lib/bb/asyncrpc/serv.py", line 72, in
process_requests
   await self.dispatch_message(d)
 File "/work/poky/bitbake/lib/hashserv/server.py", line 210, in
dispatch_message
   await self.handlers[k](msg[k])
 File "/work/poky/bitbake/lib/hashserv/server.py", line 355, in
handle_get_stream
   upstream =3D await self.upstream_client.get_unihash(method, taskhash)
 File "/work/poky/bitbake/lib/hashserv/client.py", line 57, in get_unihash
   await self._set_mode(self.MODE_GET_STREAM)
 File "/work/poky/bitbake/lib/hashserv/client.py", line 46, in _set_mode
   r =3D await self.send_message({"get-stream": None})
 File "/work/poky/bitbake/lib/bb/asyncrpc/client.py", line 110, in
send_message
   return await self._send_wrapper(proc)
 File "/work/poky/bitbake/lib/bb/asyncrpc/client.py", line 68, in
_send_wrapper
   raise ConnectionError(str(e))
ConnectionError: [Errno 110] Connect call failed ('35.233.185.178', 18687)
Error talking to server: [Errno 110] Connect call failed ('35.233.185.178',
18687)


Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia quinta, 4/11/2021 =C3=A0(=
s)
19:31:

>
>
> Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> gmail.com@lists.openembedded.org> escreveu no dia domingo, 17/10/2021
> =C3=A0(s) 22:14:
>
>>
>>
>> Joshua Watt <jpewhacker@gmail.com> escreveu no dia s=C3=A1bado, 16/10/20=
21
>> =C3=A0(s) 20:15:
>>
>>>
>>>
>>> On Fri, Oct 15, 2021, 6:47 PM Jose Quaresma <quaresma.jose@gmail.com>
>>> wrote:
>>>
>>>> When the user specify an upstream hash equivalence server in
>>>> BB_HASHSERVE_UPSTREAM abort if we can't connect otherwise the
>>>> user will never be notified about the problem.
>>>>
>>>> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>>>> ---
>>>>  bitbake/lib/bb/cooker.py | 12 +++++++++++-
>>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
>>>> index af794b4c42..34603c5ea2 100644
>>>> --- a/bitbake/lib/bb/cooker.py
>>>> +++ b/bitbake/lib/bb/cooker.py
>>>> @@ -388,12 +388,22 @@ class BBCooker:
>>>>              # Create a new hash server bound to a unix domain socket
>>>>              if not self.hashserv:
>>>>                  dbfile =3D (self.data.getVar("PERSISTENT_DIR") or
>>>> self.data.getVar("CACHE")) + "/hashserv.db"
>>>> +                upstream =3D self.data.getVar("BB_HASHSERVE_UPSTREAM"=
)
>>>> or None
>>>> +                if upstream:
>>>> +                    import socket
>>>> +                    try:
>>>> +                        sock =3D
>>>> socket.create_connection(upstream.split(":"), 5)
>>>> +                        sock.close()
>>>> +                    except socket.error as e:
>>>> +                        bb.fatal("BB_HASHSERVE_UPSTREAM is not valid,
>>>> unable to connect hash equivalence server at '%s': %s"
>>>> +                                 % (upstream, repr(e)))
>>>> +
>>>>
>>>
>>> Perhaps this should just be a warning? The upstream missing should not
>>> be fatal for a given server, if it is we probably need to fix that
>>>
>>
> I have changed it to be a warning in V2
>
>
>> In my opinion this needs to be fatal or fixed with a different approach.
>>
>> If we launch bitbake in a clean build without build/cache with an invali=
d
>> server it will deadlock printing the follow message after several minute=
s:
>> WARNING: Error contacting Hash Equivalence Server
>> unix:///build/hashserve.sock: Connection closed
>>
>> The build/bitbake-cookerdaemon.log have all the connections errors as
>> well as exceptions.
>> This cooker log is a bit ugly imho and I will try to improved it in a
>> follow up patch.
>>
>>
>>>                  self.hashservaddr =3D "unix://%s/hashserve.sock" %
>>>> self.data.getVar("TOPDIR")
>>>>                  self.hashserv =3D hashserv.create_server(
>>>>                      self.hashservaddr,
>>>>                      dbfile,
>>>>                      sync=3DFalse,
>>>> -                    upstream=3Dself.data.getVar("BB_HASHSERVE_UPSTREA=
M")
>>>> or None,
>>>> +                    upstream=3Dupstream,
>>>>                  )
>>>>                  self.hashserv.serve_as_process()
>>>>              self.data.setVar("BB_HASHSERVE", self.hashservaddr)
>>>> --
>>>> 2.33.1
>>>>
>>>>
>>>>
>>>>
>>>>
>>
>> --
>> Best regards,
>>
>> Jos=C3=A9 Quaresma
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157860):
> https://lists.openembedded.org/g/openembedded-core/message/157860
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

--000000000000f8e56405cffbc62b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">To reproduce we can set:<div><br></div><div># the real por=
t is 8687 and with the 18687 we can simulate a firewall block<br></div><div=
>BB_HASHSERVE_UPSTREAM =3D &quot;<a href=3D"http://typhoon.yocto.io:18687">=
typhoon.yocto.io:18687</a>&quot;=C2=A0</div><div><br>With the V2 patch and =
we get on the log:<div><br></div><div><span style=3D"font-family:monospace"=
><span style=3D"font-weight:bold;color:rgb(255,255,84)">WARNING</span><span=
 style=3D"color:rgb(0,0,0)">: </span><span style=3D"color:rgb(178,104,24)">=
BB_HASHSERVE_UPSTREAM is not valid, unable to connect hash equivalence serv=
er at &#39;<a href=3D"http://typhoon.yocto.io:18687">typhoon.yocto.io:18687=
</a>&#39;: timeout(&#39;timed out&#39;)</span><br><span style=3D"color:rgb(=
0,0,0)">
</span><br></span></div><div><div>and bitbake deadlock in Initialising task=
s:<span style=3D"font-family:monospace"><br></span></div><div><br></div></d=
iv><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,=
0)">Initialising tasks: =C2=A044% |########################################=
############ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| ETA: =C2=A00:00:00</span><br></span><=
/div><div><br></div><div>on bitbake-cookerdaemon.log we have:<br></div></di=
v><div><br></div><div><span style=3D"font-family:monospace"><span style=3D"=
color:rgb(0,0,0)">3 19:32:26.434306 Running command [&#39;buildTargets&#39;=
, [&#39;core-image-minimal&#39;], &#39;build&#39;]
</span><br>63 19:32:26.434386 Command Completed
<br>Error talking to server: [Errno 110] Connect call failed (&#39;35.233.1=
85.178&#39;, 18687)
<br>Error talking to server: [Errno 110] Connect call failed (&#39;35.233.1=
85.178&#39;, 18687)
<br>Error talking to server: [Errno 110] Connect call failed (&#39;35.233.1=
85.178&#39;, 18687)
<br>Error talking to server: [Errno 110] Connect call failed (&#39;35.233.1=
85.178&#39;, 18687)
<br>Error from client: [Errno 110] Connect call failed (&#39;35.233.185.178=
&#39;, 18687)
<br>Traceback (most recent call last):
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/client.py&quot;, l=
ine 57, in _send_wrapper
<br> =C2=A0=C2=A0=C2=A0await self.connect()
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/client.py&quot;, l=
ine 43, in connect
<br> =C2=A0=C2=A0=C2=A0(self.reader, self.writer) =3D await self._connect_s=
ock()
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/client.py&quot;, l=
ine 26, in connect_sock
<br> =C2=A0=C2=A0=C2=A0return await asyncio.open_connection(address, port)
<br> =C2=A0File &quot;/usr/lib/python3.7/asyncio/streams.py&quot;, line 77,=
 in open_connection
<br> =C2=A0=C2=A0=C2=A0lambda: protocol, host, port, **kwds)
<br> =C2=A0File &quot;/usr/lib/python3.7/asyncio/base_events.py&quot;, line=
 959, in create_connection
<br> =C2=A0=C2=A0=C2=A0raise exceptions[0]
<br> =C2=A0File &quot;/usr/lib/python3.7/asyncio/base_events.py&quot;, line=
 946, in create_connection
<br> =C2=A0=C2=A0=C2=A0await self.sock_connect(sock, address)
<br> =C2=A0File &quot;/usr/lib/python3.7/asyncio/selector_events.py&quot;, =
line 464, in sock_connect
<br> =C2=A0=C2=A0=C2=A0return await fut
<br> =C2=A0File &quot;/usr/lib/python3.7/asyncio/selector_events.py&quot;, =
line 494, in _sock_connect_cb
<br> =C2=A0=C2=A0=C2=A0raise OSError(err, f&#39;Connect call failed {addres=
s}&#39;)
<br>TimeoutError: [Errno 110] Connect call failed (&#39;35.233.185.178&#39;=
, 18687)
<br>
<br>During handling of the above exception, another exception occurred:
<br>
<br>Traceback (most recent call last):
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/serv.py&quot;, lin=
e 192, in handle_client
<br> =C2=A0=C2=A0=C2=A0await client.process_requests()
<br> =C2=A0File &quot;/work/poky/bitbake/lib/hashserv/server.py&quot;, line=
 200, in process_requests
<br> =C2=A0=C2=A0=C2=A0await super().process_requests()
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/serv.py&quot;, lin=
e 72, in process_requests
<br> =C2=A0=C2=A0=C2=A0await self.dispatch_message(d)
<br> =C2=A0File &quot;/work/poky/bitbake/lib/hashserv/server.py&quot;, line=
 210, in dispatch_message
<br> =C2=A0=C2=A0=C2=A0await self.handlers[k](msg[k])
<br> =C2=A0File &quot;/work/poky/bitbake/lib/hashserv/server.py&quot;, line=
 355, in handle_get_stream
<br> =C2=A0=C2=A0=C2=A0upstream =3D await self.upstream_client.get_unihash(=
method, taskhash)
<br> =C2=A0File &quot;/work/poky/bitbake/lib/hashserv/client.py&quot;, line=
 57, in get_unihash
<br> =C2=A0=C2=A0=C2=A0await self._set_mode(self.MODE_GET_STREAM)
<br> =C2=A0File &quot;/work/poky/bitbake/lib/hashserv/client.py&quot;, line=
 46, in _set_mode
<br> =C2=A0=C2=A0=C2=A0r =3D await self.send_message({&quot;get-stream&quot=
;: None})
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/client.py&quot;, l=
ine 110, in send_message
<br> =C2=A0=C2=A0=C2=A0return await self._send_wrapper(proc)
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/client.py&quot;, l=
ine 68, in _send_wrapper
<br> =C2=A0=C2=A0=C2=A0raise ConnectionError(str(e))
<br>ConnectionError: [Errno 110] Connect call failed (&#39;35.233.185.178&#=
39;, 18687)
<br>Error talking to server: Connection closed
<br>Traceback (most recent call last):
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/client.py&quot;, l=
ine 57, in _send_wrapper
<br> =C2=A0=C2=A0=C2=A0await self.connect()
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/client.py&quot;, l=
ine 43, in connect
<br> =C2=A0=C2=A0=C2=A0(self.reader, self.writer) =3D await self._connect_s=
ock()
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/client.py&quot;, l=
ine 26, in connect_sock
<br> =C2=A0=C2=A0=C2=A0return await asyncio.open_connection(address, port)
<br> =C2=A0File &quot;/usr/lib/python3.7/asyncio/streams.py&quot;, line 77,=
 in open_connection
<br> =C2=A0=C2=A0=C2=A0lambda: protocol, host, port, **kwds)
<br> =C2=A0File &quot;/usr/lib/python3.7/asyncio/base_events.py&quot;, line=
 959, in create_connection
<br> =C2=A0=C2=A0=C2=A0raise exceptions[0]
<br> =C2=A0File &quot;/usr/lib/python3.7/asyncio/base_events.py&quot;, line=
 946, in create_connection
<br> =C2=A0=C2=A0=C2=A0await self.sock_connect(sock, address)
<br> =C2=A0File &quot;/usr/lib/python3.7/asyncio/selector_events.py&quot;, =
line 464, in sock_connect
<br> =C2=A0=C2=A0=C2=A0return await fut
<br> =C2=A0File &quot;/usr/lib/python3.7/asyncio/selector_events.py&quot;, =
line 494, in _sock_connect_cb
<br> =C2=A0=C2=A0=C2=A0raise OSError(err, f&#39;Connect call failed {addres=
s}&#39;)
<br>TimeoutError: [Errno 110] Connect call failed (&#39;35.233.185.178&#39;=
, 18687)
<br>
<br>During handling of the above exception, another exception occurred:
<br>
<br>Traceback (most recent call last):
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/serv.py&quot;, lin=
e 192, in handle_client
<br> =C2=A0=C2=A0=C2=A0await client.process_requests()
<br> =C2=A0File &quot;/work/poky/bitbake/lib/hashserv/server.py&quot;, line=
 200, in process_requests
<br> =C2=A0=C2=A0=C2=A0await super().process_requests()
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/serv.py&quot;, lin=
e 72, in process_requests
<br> =C2=A0=C2=A0=C2=A0await self.dispatch_message(d)
<br> =C2=A0File &quot;/work/poky/bitbake/lib/hashserv/server.py&quot;, line=
 210, in dispatch_message
<br> =C2=A0=C2=A0=C2=A0await self.handlers[k](msg[k])
<br> =C2=A0File &quot;/work/poky/bitbake/lib/hashserv/server.py&quot;, line=
 355, in handle_get_stream
<br> =C2=A0=C2=A0=C2=A0upstream =3D await self.upstream_client.get_unihash(=
method, taskhash)
<br> =C2=A0File &quot;/work/poky/bitbake/lib/hashserv/client.py&quot;, line=
 57, in get_unihash
<br> =C2=A0=C2=A0=C2=A0await self._set_mode(self.MODE_GET_STREAM)
<br> =C2=A0File &quot;/work/poky/bitbake/lib/hashserv/client.py&quot;, line=
 46, in _set_mode
<br> =C2=A0=C2=A0=C2=A0r =3D await self.send_message({&quot;get-stream&quot=
;: None})
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/client.py&quot;, l=
ine 110, in send_message
<br> =C2=A0=C2=A0=C2=A0return await self._send_wrapper(proc)
<br> =C2=A0File &quot;/work/poky/bitbake/lib/bb/asyncrpc/client.py&quot;, l=
ine 68, in _send_wrapper
<br> =C2=A0=C2=A0=C2=A0raise ConnectionError(str(e))
<br>ConnectionError: [Errno 110] Connect call failed (&#39;35.233.185.178&#=
39;, 18687)
<br>Error talking to server: [Errno 110] Connect call failed (&#39;35.233.1=
85.178&#39;, 18687)<br>
<br></span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; escreveu=
 no dia quinta, 4/11/2021 =C3=A0(s) 19:31:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quare=
sma via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.o=
penembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;=
 escreveu no dia domingo, 17/10/2021 =C3=A0(s) 22:14:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">=
jpewhacker@gmail.com</a>&gt; escreveu no dia s=C3=A1bado, 16/10/2021 =C3=A0=
(s) 20:15:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 15, 2021, 6:47 PM Jose Quaresma &lt;<a href=3D"=
mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Wh=
en the user specify an upstream hash equivalence server in<br>
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
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157860): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157860" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157860</a><br>
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
 Quaresma</div></div></div>

--000000000000f8e56405cffbc62b--

