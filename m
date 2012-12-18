Received: from mail-la0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TkxW2-0000bF-CC
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 14:47:26 +0100
Received: by mail-la0-f42.google.com with SMTP id s15so528858lag.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 05:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=M41v6kCgaiOeikVZ7TZoQENDrIYIlTzQhocYzW1Vexs=;
	b=tnAl1WolhAehCntKanVxfgaWEjr2+LLUmNHMnbMA6d3eKaUIVnPwInFv58oze/qpuM
	bt8KLXzd3GBTGuokA/ntthgJioCY2wNPMDcA/qnms1daurzSb2XZAkjkaL1Xg9ezZ6CH
	BrK6jCNNQPPSDkfw5JepuYBquXeDGJgUaiyVeq5jnYG3OHPx/RucmAOwmooL6Z+csWjd
	lApTs1kI7cIKpcuYqa9oRwQnF8mY+OUZQwK407Ech6BE1lQw/IcZT7AqkVZZ48WDIbpI
	3HUEmgEVfSYToZ/XihiEoDhT2ZCTvs1hYMHYL2kSrh63f7xROzf9fbchEtzsfpV0Q8pZ
	oz9Q==
MIME-Version: 1.0
Received: by 10.152.110.18 with SMTP id hw18mr1889970lab.22.1355837564424;
	Tue, 18 Dec 2012 05:32:44 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Tue, 18 Dec 2012 05:32:44 -0800 (PST)
In-Reply-To: <1355828839.18874.8.camel@ted>
References: <1355220771-32095-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<CADkTA4NLkvWThY4fzqzqDc5FO+U+CMJGEjOD9oJsLXDidfoapg@mail.gmail.com>
	<1355828839.18874.8.camel@ted>
Date: Tue, 18 Dec 2012 08:32:44 -0500
Message-ID: <CADkTA4Nwm2VxcAfrX7p0qy6CVYHMpH+WKbwv4Mr6BkGaJ3+WFw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Add 3.7 version of linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 13:47:26 -0000
Content-Type: multipart/alternative; boundary=bcaec54d4de866918504d1208816

--bcaec54d4de866918504d1208816
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 18, 2012 at 6:07 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2012-12-11 at 05:52 -0500, Bruce Ashfield wrote:
> > On Tue, Dec 11, 2012 at 5:12 AM, Marcin Juszkiewicz
> > <marcin.juszkiewicz@linaro.org> wrote:
> >         I would like to know are there plans to use 3.7 kernel for
> >         libc headers.
> >         This will allow me to drop own copy which I need to keep due
> >         to AArch64
> >         stuff which got added in 3.7 cycle.
> >
> > There aren't any plans to use 3.7 for the headers, since we are
> > tracking the headers
> > with the same cadence as the yocto release kernels. Otherwise, we'd
> > really need
> > to have all versions available, and keeping things clean and focussed
> > was the
> > goal.
> >
> > 3.8 is the next likely update.
> >
> > That being said,  since the libc-headers version is controlled by the
> > LINUXLIBCVERSION in tcmode-default.inc, simply having 3.7 headers
> > available shouldn't cause any problems or disconnects.
> >
> > So we can open up the discussion if we want to carry extra libc
> > headers or
> > keep with the current strategy. I've added Richard explicitly to the
> > cc' so he
> > can jump in as appropriate.
> >
> As I understand things we agreed that we'd not bump for point releases
> on the headers unless there was some pressing reason too. The rest of
> the policy for kernel headers is a bit more fuzzy.
>
> For actual major version increments like this, I'm tempted to accept
> that in this case we have a good argument for updating to 3.7 and even
> though the linux-yocto kernels will lag behind this for a (short) while,
> it shouldn't make any real world difference to anything, certainly not
> cause breakage.
>

Right, they'll lag, but then jump and increment it to 3.8+. The dev kernel
is already on 3.7 and currently building and working fine against the 3.4.x
libc-headers.


>
> There isn't any technical reason we have to keep in lockstep, or any
> known issues with doing that with these versions, right? I know you have
> been burnt in the past but that was quite a while ago and the
> kernel/toolchain communities have moved to address that?
>

I've definitely been burt in the past, I admit to being a little nervous
about
3.7 sideffects due to the uapi split in the kernel .. and right around
the Holidays, I'm a bit more paranoid about bringing this in. I'd rather be
full time at my keyboard, just in case something subtle breaks.

If we bring this in, I'd prefer to completely drop the 3.4 kernel headers,
since
having just one recipe in the tree make sense, and it won't tempt us to
start having a trail of one libc-header per kernel version (since there's
always
a layer somewhere that's using a given version).

What about a middle ground ? I can pull this into my tree, since I'm doing
some 3.8 and 3.4-stable work at the moment, I'll remove the 3.4 kernel
headers and then submit it again as part of my queue with some extra
tests run ?

Cheers,

Bruce


>
> Cheers,
>
> Richard
>
>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec54d4de866918504d1208816
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, D=
ec 18, 2012 at 6:07 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@li=
nuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, 2012-12-11 at 05:5=
2 -0500, Bruce Ashfield wrote:<br>
&gt; On Tue, Dec 11, 2012 at 5:12 AM, Marcin Juszkiewicz<br>
&gt; &lt;<a href=3D"mailto:marcin.juszkiewicz@linaro.org">marcin.juszkiewic=
z@linaro.org</a>&gt; wrote:<br>
&gt; =A0 =A0 =A0 =A0 I would like to know are there plans to use 3.7 kernel=
 for<br>
&gt; =A0 =A0 =A0 =A0 libc headers.<br>
&gt; =A0 =A0 =A0 =A0 This will allow me to drop own copy which I need to ke=
ep due<br>
&gt; =A0 =A0 =A0 =A0 to AArch64<br>
&gt; =A0 =A0 =A0 =A0 stuff which got added in 3.7 cycle.<br>
&gt;<br>
&gt; There aren&#39;t any plans to use 3.7 for the headers, since we are<br=
>
&gt; tracking the headers<br>
&gt; with the same cadence as the yocto release kernels. Otherwise, we&#39;=
d<br>
&gt; really need<br>
&gt; to have all versions available, and keeping things clean and focussed<=
br>
&gt; was the<br>
&gt; goal.<br>
&gt;<br>
&gt; 3.8 is the next likely update.<br>
&gt;<br>
&gt; That being said, =A0since the libc-headers version is controlled by th=
e<br>
&gt; LINUXLIBCVERSION in tcmode-default.inc, simply having 3.7 headers<br>
&gt; available shouldn&#39;t cause any problems or disconnects.<br>
&gt;<br>
&gt; So we can open up the discussion if we want to carry extra libc<br>
&gt; headers or<br>
&gt; keep with the current strategy. I&#39;ve added Richard explicitly to t=
he<br>
&gt; cc&#39; so he<br>
&gt; can jump in as appropriate.<br>
&gt;<br>
</div>As I understand things we agreed that we&#39;d not bump for point rel=
eases<br>
on the headers unless there was some pressing reason too. The rest of<br>
the policy for kernel headers is a bit more fuzzy.<br>
<br>
For actual major version increments like this, I&#39;m tempted to accept<br=
>
that in this case we have a good argument for updating to 3.7 and even<br>
though the linux-yocto kernels will lag behind this for a (short) while,<br=
>
it shouldn&#39;t make any real world difference to anything, certainly not<=
br>
cause breakage.<br></blockquote><div><br></div><div>Right, they&#39;ll lag,=
 but then jump and increment it to 3.8+. The dev kernel</div><div>is alread=
y on 3.7 and currently building and working fine against the 3.4.x</div>
<div>libc-headers.</div><div>=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
There isn&#39;t any technical reason we have to keep in lockstep, or any<br=
>
known issues with doing that with these versions, right? I know you have<br=
>
been burnt in the past but that was quite a while ago and the<br>
kernel/toolchain communities have moved to address that?<br></blockquote><d=
iv><br></div><div>I&#39;ve definitely been burt in the past, I admit to bei=
ng a little nervous about</div><div>3.7 sideffects due to the uapi split in=
 the kernel .. and right around=A0</div>
<div>the Holidays, I&#39;m a bit more paranoid about bringing this in. I&#3=
9;d rather be</div><div>full time at my keyboard, just in case something su=
btle breaks.</div><div><br></div><div>If we bring this in, I&#39;d prefer t=
o completely drop the 3.4 kernel headers, since</div>
<div>having just one recipe in the tree make sense, and it won&#39;t tempt =
us to</div><div>start having a trail of one libc-header per kernel version =
(since there&#39;s always</div><div>a layer somewhere that&#39;s using a gi=
ven version).</div>
<div><br></div><div>What about a middle ground ? I can pull this into my tr=
ee, since I&#39;m doing</div><div>some 3.8 and 3.4-stable work at the momen=
t, I&#39;ll remove the 3.4 kernel</div><div>headers and then submit it agai=
n as part of my queue with some extra</div>
<div>tests run ?</div><div><br></div><div>Cheers,</div><div><br></div><div>=
Bruce</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;<br>
</div>

--bcaec54d4de866918504d1208816--
