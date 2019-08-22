Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0433F7F2B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:29:46 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id p17so6159394wrf.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 10:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eEOLuaSh+ZVLkXitTxw5pyR/e1OuAm++yG3yPqYZdsc=;
	b=sc+koZvptS/wwKN9DfZTuuhOmlRHRtNMlMSgDGj7Fx0zrQS0SqXLturWNAfIBuCVus
	mhAQtTbaJILnzjRSFka2fvYtM72OYGZ9/Z0Esh/dSDY2o/8UtHLLdvYQ0gCMj2bJqafb
	o8QqlHvCu1a/jXt3sr7WSLkVJ3tCMmYpX0OL0JEJlXpyckyfOVjH5FQ3ExyB7MD7KJ4T
	TILEk9JzEBW+DMzrU9ARY4HBMEeBt9DAje3SNhNzDTqVu9/2V6M8kvvE0sx6SK1dBeav
	U/gO4mMw3XcFDB5BHh8cB9Gh+ruRYO6mwpzNDOe9XPT6JP9njSU4jPh5i7PtXrQeF3zc
	i8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eEOLuaSh+ZVLkXitTxw5pyR/e1OuAm++yG3yPqYZdsc=;
	b=FSyUb2x8CsG6xbkM2ZY/Vp3uVxcLl5++YCM/OuziSUz/Uxvxmq4DJYIi0Kx5tEI2cq
	GR3evp4tK1hsIwS3Pi+Tg7kUZsjKPiFU7yn4qnOdNxVsXk6Swx7KZRcqmG2VCFUni7xG
	qkwkLH8QY9w7eGQf2ESwu+ZlQ3ippfdXAAOlZ8+I0+uxACKnlOu1spxfIKR0y73KsIz1
	X+ydEdbU5R95VQLdW8aV0ZZOAZ4rOzdIaSTEdtzF79r73d2D32b9DtzCd/CuzWHayhBC
	sevgRc6Nlmj7BTtttOl2ROM4lji3X74A0w/vaxu8xCHVLcHTwntZbRyOJOJk32mh4Bdr
	EqRw==
X-Gm-Message-State: APjAAAUrlsLJM6HMcQ4pCr6P9v+ShAVBb2cWIyEm8oMN4WV9WXfTkTIB
	dK/dnjXXP9ggpoHf2Wc44on0d0xIVac0Mm526q4=
X-Google-Smtp-Source: APXvYqytwdIO6qNuIbqRbV1eQPKpPSgT3Lpy+ELjU6/Tef9+Q1WVybAaA43AhFyCx4heVoUysNZa87oo2uBcLnqjLqs=
X-Received: by 2002:a5d:4083:: with SMTP id o3mr86004wrp.150.1566494986671;
	Thu, 22 Aug 2019 10:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <7f3ba0cee887064b4716353f31bcd2e64b1ce291.camel@linuxfoundation.org>
In-Reply-To: <7f3ba0cee887064b4716353f31bcd2e64b1ce291.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 22 Aug 2019 10:29:34 -0700
Message-ID: <CAJdd5GZ6xDP-LPJzYt9Op9YetyR8qS1_CG9YKMod1map+7G7BA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Hash Equiv Server experiment results
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Aug 2019 17:29:47 -0000
Content-Type: multipart/alternative; boundary="000000000000391aad0590b809ec"

--000000000000391aad0590b809ec
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 22, 2019, 9:20 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I wanted to summarise what my local tests with the hash server
> concluded.
>
> a) the opendb() changes I made in:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ca04aaf7b51e3ee2bb04da970d5f20f2c9982cb8
>    broke things as the database is opened for each request. I have
>    local patches to fix that but it only helps by about 10%.
>
> b) the overhead from the separate receive and handling threads is not
>    worth the overhead:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d40d7e43856f176c45cf515644b5f211c708e237
>    This probably halves throughput.
>
> c) I moved the database writes to their own thread with a queue but it
>    doesn't seem to help much other than allowing other threads to
>    handle requests in parallel.
>
> d) the ThreadedMixin regresses performance further and is the worst
>    change I've tested.
>
> e) Using ThreadPoolExecutor along the lines of:
>    self.executor = concurrent.futures.ThreadPoolExecutor(max_workers=10)
>    self.executor.submit(self.process_request_thread, request,
> client_address)
>    doesn't help speed. Its faster then ThreadedMixin but slower than no
> threads.
>
> f) The profile data I have suggests we spend a lot of time in TCP/HTTP
>    header overhead and connection setup which confirms Joshua's
>    thoughts.
>

Based on the profiling I did, the overhead of the HTTP requests is also
substantial compared to the amount of actual body data sent.


> g) The most optimal setup is therefore the original server with no
>    threading.
>

Ya threading is *bad*. I don't exactly know why...


> h) The autobuilder would need to cope with 9000*40 requests in under a
>    minute, preferably faster. The current server does not have
>    anywhere near that speed.
>

I have tried a few improvements to the client and server model, and I was
able to get a 5x improvement in performance. On my desktop, this went from
less than 3000 requests/sec to 15000 requests/sec. (both tests were with 40
simultaneous clients). I believe this would allow my underpowered desktop
to process these requests in under 30 seconds, let alone the autobuilder
server.


> My conclusion based on this is that we need to rewrite the way runqueue
> makes the hash computations, perhaps seeding the cache in advance so we
> minimise the number of single calls. We can make one query for all 9000
> entries to the server on a single connection/request, or batch in
> blocks of 1000 or similar.
>

Would that work? Aren't the hash calculations dependent on each other? My
concern here is that we might end up making much more than 9000 requests as
unihashes are changed by the server.


> The other option would be a custom server/protocol but I think what
> we're using is fine, we just need to change how.
>

I've recently been investigating how to optimize the protocol for the heavy
request load expirenced during signature generation. There are a few ways I
have thought of that this could be done.

1) use the HTTP upgrade header to "convert" an http connection to an
endpoint to an optimized byte stream based hash lookup protocol (this is
effectively how websockets work). This protocol would be a simple
persistent connection where the client would send a line to the server and
the server would reply with a single line that was the unihash.

2) The same hash lookup protocol as before, but over an actual websocket.

3) a custom TCP protocol, perhaps some sort of JSON based message protocol.
This protocol would also be able to enter a "stream" mode, just like the
previous two for optimal transfer speed.

The trick here of course is that if you are leaving persistent connections
open, you need a way to service the streams fairly between the clients, and
you can't use threads, since we've seen that they do not scale well. Using
Pythons asynchronous API (async/await) can be used to solve this and run
everything on a single thread.

The three proposed solutions have their tradeoffs. 1 & 2 would require 3rd
party modules, as there is no AIO http server in vanilla python. 3 can be
done with vanilla python (3.5 or later), but doesn't have any of the
advantages that we get from using HTTP, such as proxy transversal, HTTPS
negotiation, and others. I'm not sure how important these things are anyway.

One advantage here is that the runqueue changes are relatively simple, and
isolated to the hash equivalence mix in class.


> I have some profiling code for the hashserver but its doing profiling
> per thread so doesn't integrate well until we decide what form the
> codebase should have. Simpler is looking to perform better.
>
> I haven't had a chance to work on these patches, nor will I over the
> next few days as I'm taking a break but I think I know what we need to
> do now.
>

Thanks a lot for looking into this, Richard. Have a good break. We can pick
it back up next week and try to figure out the best path.

Joshua Watt




> Cheers,
>
> Richard
>
>
>

--000000000000391aad0590b809ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Aug 22, 2019, 9:20 AM Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" rel=3D"noreferrer noreferr=
er" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">I wanted to summarise what my local te=
sts with the hash server<br>
concluded.<br>
<br>
a) the opendb() changes I made in:<br>
=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?i=
d=3Dca04aaf7b51e3ee2bb04da970d5f20f2c9982cb8" rel=3D"noreferrer noreferrer =
noreferrer noreferrer" target=3D"_blank">http://git.yoctoproject.org/cgit.c=
gi/poky/commit/?id=3Dca04aaf7b51e3ee2bb04da970d5f20f2c9982cb8</a><br>
=C2=A0 =C2=A0broke things as the database is opened for each request. I hav=
e <br>
=C2=A0 =C2=A0local patches to fix that but it only helps by about 10%.<br>
<br>
b) the overhead from the separate receive and handling threads is not <br>
=C2=A0 =C2=A0worth the overhead:<br>
=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?i=
d=3Dd40d7e43856f176c45cf515644b5f211c708e237" rel=3D"noreferrer noreferrer =
noreferrer noreferrer" target=3D"_blank">http://git.yoctoproject.org/cgit.c=
gi/poky/commit/?id=3Dd40d7e43856f176c45cf515644b5f211c708e237</a><br>
=C2=A0 =C2=A0This probably halves throughput.<br>
<br>
c) I moved the database writes to their own thread with a queue but it <br>
=C2=A0 =C2=A0doesn&#39;t seem to help much other than allowing other thread=
s to <br>
=C2=A0 =C2=A0handle requests in parallel.<br>
<br>
d) the ThreadedMixin regresses performance further and is the worst <br>
=C2=A0 =C2=A0change I&#39;ve tested.<br>
<br>
e) Using ThreadPoolExecutor along the lines of:<br>
=C2=A0 =C2=A0self.executor =3D concurrent.futures.ThreadPoolExecutor(max_wo=
rkers=3D10)<br>
=C2=A0 =C2=A0self.executor.submit(self.process_request_thread, request, cli=
ent_address)<br>
=C2=A0 =C2=A0doesn&#39;t help speed. Its faster then ThreadedMixin but slow=
er than no threads.<br>
<br>
f) The profile data I have suggests we spend a lot of time in TCP/HTTP <br>
=C2=A0 =C2=A0header overhead and connection setup which confirms Joshua&#39=
;s <br>
=C2=A0 =C2=A0thoughts.<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Based on the profiling I did, the overhead of the HTT=
P requests is also substantial compared to the amount of actual body data s=
ent.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<br>
g) The most optimal setup is therefore the original server with no <br>
=C2=A0 =C2=A0threading.<br></blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Ya threading is *bad*. I don&#39;t exactly know why.=
..</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<br>
h) The autobuilder would need to cope with 9000*40 requests in under a <br>
=C2=A0 =C2=A0minute, preferably faster. The current server does not have <b=
r>
=C2=A0 =C2=A0anywhere near that speed.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I have tried a few improvements to th=
e client and server model, and I was able to get a 5x improvement in perfor=
mance. On my desktop, this went from less than 3000 requests/sec to 15000 r=
equests/sec. (both tests were with 40 simultaneous clients). I believe this=
 would allow my underpowered desktop to process these requests in under 30 =
seconds, let alone the autobuilder server.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
My conclusion based on this is that we need to rewrite the way runqueue<br>
makes the hash computations, perhaps seeding the cache in advance so we<br>
minimise the number of single calls. We can make one query for all 9000<br>
entries to the server on a single connection/request, or batch in<br>
blocks of 1000 or similar.<br></blockquote></div></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Would that work? Aren&#39;t the hash calculations=
 dependent on each other? My concern here is that we might end up making mu=
ch more than 9000 requests as unihashes are changed by the server.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<br>
The other option would be a custom server/protocol but I think what<br>
we&#39;re using is fine, we just need to change how.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ve recently been =
investigating how to optimize the protocol for the heavy request load expir=
enced during signature generation. There are a few ways I have thought of t=
hat this could be done.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
1) use the HTTP upgrade header to &quot;convert&quot; an http connection to=
 an endpoint to an optimized byte stream based hash lookup protocol (this i=
s effectively how websockets work). This protocol would be a simple persist=
ent connection where the client would send a line to the server and the ser=
ver would reply with a single line that was the unihash.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">2) The same hash lookup protocol as before=
, but over an actual websocket.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">3) a custom TCP protocol, perhaps some sort of JSON based message=
 protocol. This protocol would also be able to enter a &quot;stream&quot; m=
ode, just like the previous two for optimal transfer speed.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">The trick here of course is that if y=
ou are leaving persistent connections open, you need a way to service the s=
treams fairly between the clients, and you can&#39;t use threads, since we&=
#39;ve seen that they do not scale well. Using Pythons asynchronous API (as=
ync/await) can be used to solve this and run everything on a single thread.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">The three proposed solu=
tions have their tradeoffs. 1 &amp; 2 would require 3rd party modules, as t=
here is no AIO http server in vanilla python. 3 can be done with vanilla py=
thon (3.5 or later), but doesn&#39;t have any of the advantages that we get=
 from using HTTP, such as proxy transversal, HTTPS negotiation, and others.=
 I&#39;m not sure how important these things are anyway.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">One advantage here is that the runqueue ch=
anges are relatively simple, and isolated to the hash equivalence mix in cl=
ass.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<br>
I have some profiling code for the hashserver but its doing profiling<br>
per thread so doesn&#39;t integrate well until we decide what form the<br>
codebase should have. Simpler is looking to perform better.<br>
<br>
I haven&#39;t had a chance to work on these patches, nor will I over the<br=
>
next few days as I&#39;m taking a break but I think I know what we need to<=
br>
do now.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Thanks a lot for looking into this, Richard. Have a good break. We c=
an pick it back up next week and try to figure out the best path.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Joshua Watt</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000391aad0590b809ec--
