Received: from mail-la0-f46.google.com ([209.85.215.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Tkxsz-0001hu-9R
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 15:11:09 +0100
Received: by mail-la0-f46.google.com with SMTP id p5so538185lag.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 05:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0QhZkr4Xvf71ARPZU6cKpvpvCLlukToVhJPRINGYOBE=;
	b=w4OdgUo4uo4sr+zfCE7xg26f05i/oTrZp2OmJ1T/hpEK5au0Woe1S8Bd/q/qqWAPhl
	hv7kJ0poeowvx/8ipHWyW0TKtmhr44yMJTGoJm2M2X349tgzTF/vIVV3RINXIcKOLrB0
	zveb+w4cZAQZU6elk7I5fev6sJN9BXlcwJOgAEsxznbJwjKgRbO9vbgjyhmqoKdIFicZ
	H9Qv8uDeQB+50PDasePDqKVxElfA7wUibOcsGSMznGLhbCmgKuEQaqrV7Dev9g9PA2h7
	S+ndGVDUS3C47GsZoNL3UKJ1BK4ZnGT6qwF1pHEX3BJTqKyaAPWyQPfTniZcFxYmtIOP
	LfWQ==
MIME-Version: 1.0
Received: by 10.112.40.129 with SMTP id x1mr901207lbk.95.1355838987414; Tue,
	18 Dec 2012 05:56:27 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Tue, 18 Dec 2012 05:56:27 -0800 (PST)
In-Reply-To: <50D0729C.2090703@linaro.org>
References: <1355220771-32095-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<CADkTA4NLkvWThY4fzqzqDc5FO+U+CMJGEjOD9oJsLXDidfoapg@mail.gmail.com>
	<1355828839.18874.8.camel@ted>
	<CADkTA4Nwm2VxcAfrX7p0qy6CVYHMpH+WKbwv4Mr6BkGaJ3+WFw@mail.gmail.com>
	<50D0729C.2090703@linaro.org>
Date: Tue, 18 Dec 2012 08:56:27 -0500
Message-ID: <CADkTA4OAKuK6Sk0=vSnr6P+M8_svdZ2VNEbH18HZNbWt_LpzuQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
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
X-List-Received-Date: Tue, 18 Dec 2012 14:11:09 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe323e37ae5f04d120ddb1

--e0cb4efe323e37ae5f04d120ddb1
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 18, 2012 at 8:41 AM, Marcin Juszkiewicz <
marcin.juszkiewicz@linaro.org> wrote:

> W dniu 18.12.2012 14:32, Bruce Ashfield pisze:
> > On Tue, Dec 18, 2012 at 6:07 AM, Richard Purdie On Tue, 2012-12-11 at
> >> 05:52 -0500, Bruce Ashfield wrote:
> >>> On Tue, Dec 11, 2012 at 5:12 AM, Marcin Juszkiewicz
>
> >>> I would like to know are there plans to use 3.7 kernel for libc
> >>> headers. This will allow me to drop own copy which I need to keep
> >>> due to AArch64 stuff which got added in 3.7 cycle.
>
> >> As I understand things we agreed that we'd not bump for point
> >> releases on the headers unless there was some pressing reason too.
> >> The rest of the policy for kernel headers is a bit more fuzzy.
> >>
> >> For actual major version increments like this, I'm tempted to accept
> >> that in this case we have a good argument for updating to 3.7 and
> >> even though the linux-yocto kernels will lag behind this for a
> >> (short) while, it shouldn't make any real world difference to
> >> anything, certainly not cause breakage.
>
> > Right, they'll lag, but then jump and increment it to 3.8+. The dev
> > kernel is already on 3.7 and currently building and working fine
> > against the 3.4.x libc-headers.
>
> I need 3.7 for AArch64 as this is first version which has support for it.
>

Yep, I didn't mean to imply that 3.4 would work for your needs as well,
sorry
if it came across that way.

I assume 3.8+ will be ok for your case as well, since when we jump to the
1.4 kernel, the standing plan of purging all the headers and go back to a
single version that matches that kver was going to kick in. I don't want to
break your builds.


>
> >> There isn't any technical reason we have to keep in lockstep, or any
> >> known issues with doing that with these versions, right? I know you
> >> have been burnt in the past but that was quite a while ago and the
> >> kernel/toolchain communities have moved to address that?
>
> > I've definitely been burt in the past, I admit to being a little
> > nervous about 3.7 sideffects due to the uapi split in the kernel ..
> > and right around the Holidays, I'm a bit more paranoid about bringing
> > this in. I'd rather be full time at my keyboard, just in case
> > something subtle breaks.
>
> Remember that even when l-l-h 3.7 will be present in repo 3.4 can be
> still used as default one.
>

Absolutely. We are just trying to keep things small and clean and avoid
having multiple options and then using defaults/preferences to pick ..
unless
required. We can always pretend things are simple and clean :)


>
> > If we bring this in, I'd prefer to completely drop the 3.4 kernel
> > headers, since having just one recipe in the tree make sense, and it
> > won't tempt us to start having a trail of one libc-header per kernel
> > version (since there's always a layer somewhere that's using a given
> > version).
>
> > What about a middle ground ? I can pull this into my tree, since I'm
> > doing some 3.8 and 3.4-stable work at the moment, I'll remove the 3.4
> > kernel headers and then submit it again as part of my queue with some
> > extra tests run ?
>
> I am fine with it.
>

Thanks, I'll pull this in if Richard agrees.

Cheers,

Bruce

-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e0cb4efe323e37ae5f04d120ddb1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, D=
ec 18, 2012 at 8:41 AM, Marcin Juszkiewicz <span dir=3D"ltr">&lt;<a href=3D=
"mailto:marcin.juszkiewicz@linaro.org" target=3D"_blank">marcin.juszkiewicz=
@linaro.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">W dniu 18.12.2012 14:32, Bruce Ashfield pisz=
e:<br>
&gt; On Tue, Dec 18, 2012 at 6:07 AM, Richard Purdie On Tue, 2012-12-11 at<=
br>
<div class=3D"im">&gt;&gt; 05:52 -0500, Bruce Ashfield wrote:<br>
&gt;&gt;&gt; On Tue, Dec 11, 2012 at 5:12 AM, Marcin Juszkiewicz<br>
<br>
</div><div class=3D"im">&gt;&gt;&gt; I would like to know are there plans t=
o use 3.7 kernel for libc<br>
&gt;&gt;&gt; headers. This will allow me to drop own copy which I need to k=
eep<br>
&gt;&gt;&gt; due to AArch64 stuff which got added in 3.7 cycle.<br>
<br>
</div><div class=3D"im">&gt;&gt; As I understand things we agreed that we&#=
39;d not bump for point<br>
&gt;&gt; releases on the headers unless there was some pressing reason too.=
<br>
&gt;&gt; The rest of the policy for kernel headers is a bit more fuzzy.<br>
&gt;&gt;<br>
&gt;&gt; For actual major version increments like this, I&#39;m tempted to =
accept<br>
&gt;&gt; that in this case we have a good argument for updating to 3.7 and<=
br>
&gt;&gt; even though the linux-yocto kernels will lag behind this for a<br>
&gt;&gt; (short) while, it shouldn&#39;t make any real world difference to<=
br>
&gt;&gt; anything, certainly not cause breakage.<br>
<br>
&gt; Right, they&#39;ll lag, but then jump and increment it to 3.8+. The de=
v<br>
&gt; kernel is already on 3.7 and currently building and working fine<br>
&gt; against the 3.4.x libc-headers.<br>
<br>
</div>I need 3.7 for AArch64 as this is first version which has support for=
 it.<br></blockquote><div><br></div><div>Yep, I didn&#39;t mean to imply th=
at 3.4 would work for your needs as well, sorry</div><div>if it came across=
 that way.</div>
<div><br></div><div>I assume 3.8+ will be ok for your case as well, since w=
hen we jump to the</div><div>1.4 kernel, the standing plan of purging all t=
he headers and go back to a</div><div>single version=A0that matches that kv=
er was going to kick in. I don&#39;t want to=A0</div>
<div>break your builds.</div><div>=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt;&gt; There isn&#39;t any technical reason we have to keep in lockstep, =
or any<br>
&gt;&gt; known issues with doing that with these versions, right? I know yo=
u<br>
&gt;&gt; have been burnt in the past but that was quite a while ago and the=
<br>
&gt;&gt; kernel/toolchain communities have moved to address that?<br>
<br>
&gt; I&#39;ve definitely been burt in the past, I admit to being a little<b=
r>
&gt; nervous about 3.7 sideffects due to the uapi split in the kernel ..<br=
>
&gt; and right around the Holidays, I&#39;m a bit more paranoid about bring=
ing<br>
&gt; this in. I&#39;d rather be full time at my keyboard, just in case<br>
&gt; something subtle breaks.<br>
<br>
</div>Remember that even when l-l-h 3.7 will be present in repo 3.4 can be<=
br>
still used as default one.<br></blockquote><div><br></div><div>Absolutely. =
We are just trying to keep things small and clean and avoid</div><div>havin=
g multiple options and then using defaults/preferences to pick .. unless</d=
iv>
<div>required. We can always pretend things are simple and clean :)</div><d=
iv>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; If we bring this in, I&#39;d prefer to completely drop the 3.4 kernel<=
br>
&gt; headers, since having just one recipe in the tree make sense, and it<b=
r>
&gt; won&#39;t tempt us to start having a trail of one libc-header per kern=
el<br>
&gt; version (since there&#39;s always a layer somewhere that&#39;s using a=
 given<br>
&gt; version).<br>
<br>
&gt; What about a middle ground ? I can pull this into my tree, since I&#39=
;m<br>
&gt; doing some 3.8 and 3.4-stable work at the moment, I&#39;ll remove the =
3.4<br>
&gt; kernel headers and then submit it again as part of my queue with some<=
br>
&gt; extra tests run ?<br>
<br>
</div>I am fine with it.<br>
</blockquote></div><br>Thanks, I&#39;ll pull this in if Richard agrees.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cheers,</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Bruce<b=
r clear=3D"all">
<div><br></div>-- <br>&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;<br>
</div>

--e0cb4efe323e37ae5f04d120ddb1--
