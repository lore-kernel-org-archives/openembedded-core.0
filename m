Received: from mail-la0-f51.google.com ([209.85.215.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TqsLn-0005LQ-34
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 22:29:20 +0100
Received: by mail-la0-f51.google.com with SMTP id fj20so8740531lab.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 13:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hzw+gEKE2ERG0yNKROz+AT1b8MeyOKvQezsda2TowjQ=;
	b=ZdLigCjsen141Vs1HzKoX7x9JVaZpIT8UFvHn3scyNQWXkcNGZ0X3hvajVk9GoBJiy
	Q6gwkhABBmNX7q0WkOuPBiuPZOVK5Mk+iZYGeBXI6s0WrZg0O5/oogGmNsyVr77Mliyt
	cyq+wS31txGZDK4LFYd9eWmSa+nF/CkQXpYfpomNAmCK+LfVqinVLJZrdYCGgCOJCJGk
	9D0YfNa5tYfIIwiQg6PPLq52ld6Sa3/1mgLjGrz6DFAUQ2Tsjd/TKNww06UqlgD0R5Go
	0MLYnCffb4DFI7YscTt0byHAsPXL5bao9+Joz88pxLFjPFPFFPP5si+95/dOo/sUdAIt
	cv6Q==
MIME-Version: 1.0
Received: by 10.112.54.6 with SMTP id f6mr20646379lbp.71.1357247654869; Thu,
	03 Jan 2013 13:14:14 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Thu, 3 Jan 2013 13:14:14 -0800 (PST)
In-Reply-To: <1355851953.18874.45.camel@ted>
References: <1355220771-32095-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<CADkTA4NLkvWThY4fzqzqDc5FO+U+CMJGEjOD9oJsLXDidfoapg@mail.gmail.com>
	<1355828839.18874.8.camel@ted>
	<CADkTA4Nwm2VxcAfrX7p0qy6CVYHMpH+WKbwv4Mr6BkGaJ3+WFw@mail.gmail.com>
	<50D0729C.2090703@linaro.org>
	<CADkTA4OAKuK6Sk0=vSnr6P+M8_svdZ2VNEbH18HZNbWt_LpzuQ@mail.gmail.com>
	<1355851953.18874.45.camel@ted>
Date: Thu, 3 Jan 2013 16:14:14 -0500
Message-ID: <CADkTA4O4sfn4cH0H1XHhgz7nF2FgbrDO9w+XZjBu4kgxCjK2wA@mail.gmail.com>
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
X-List-Received-Date: Thu, 03 Jan 2013 21:29:20 -0000
Content-Type: multipart/alternative; boundary=bcaec5540070573a8704d268d80e

--bcaec5540070573a8704d268d80e
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 18, 2012 at 12:32 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2012-12-18 at 08:56 -0500, Bruce Ashfield wrote:
>
> > On Tue, Dec 18, 2012 at 8:41 AM, Marcin Juszkiewicz
> > <marcin.juszkiewicz@linaro.org> wrote:
> >         W dniu 18.12.2012 14:32, Bruce Ashfield pisze:
> >         > On Tue, Dec 18, 2012 at 6:07 AM, Richard Purdie On Tue,
> >         2012-12-11
>
> >         > If we bring this in, I'd prefer to completely drop the 3.4
> >         kernel
> >         > headers, since having just one recipe in the tree make
> >         sense, and it
> >         > won't tempt us to start having a trail of one libc-header
> >         per kernel
> >         > version (since there's always a layer somewhere that's using
> >         a given
> >         > version).
> >
> >         > What about a middle ground ? I can pull this into my tree,
> >         since I'm
> >         > doing some 3.8 and 3.4-stable work at the moment, I'll
> >         remove the 3.4
> >         > kernel headers and then submit it again as part of my queue
> >         with some
> >         > extra tests run ?
> >
> >
> >         I am fine with it.
> >
> > Thanks, I'll pull this in if Richard agrees.
> >
>
> Sounds like a plan to me.
>
>
FYI: I haven't forgotten about this, all the changes are done and tested
here.
I'm finished digging out of my holiday email queue and will start sending
changes
out tomorrow if all goes well.

Cheers,

Bruce


> Cheers,
>
> Richard
>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec5540070573a8704d268d80e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Dec 18, 2012 at 12:32 PM, Richard Purdie <span dir=3D"ltr">=
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, 2012-12-18 at 08:5=
6 -0500, Bruce Ashfield wrote:<br>
<br>
&gt; On Tue, Dec 18, 2012 at 8:41 AM, Marcin Juszkiewicz<br>
&gt; &lt;<a href=3D"mailto:marcin.juszkiewicz@linaro.org">marcin.juszkiewic=
z@linaro.org</a>&gt; wrote:<br>
&gt; =A0 =A0 =A0 =A0 W dniu 18.12.2012 14:32, Bruce Ashfield pisze:<br>
&gt; =A0 =A0 =A0 =A0 &gt; On Tue, Dec 18, 2012 at 6:07 AM, Richard Purdie O=
n Tue,<br>
&gt; =A0 =A0 =A0 =A0 2012-12-11<br>
<br>
</div><div class=3D"im">&gt; =A0 =A0 =A0 =A0 &gt; If we bring this in, I&#3=
9;d prefer to completely drop the 3.4<br>
&gt; =A0 =A0 =A0 =A0 kernel<br>
&gt; =A0 =A0 =A0 =A0 &gt; headers, since having just one recipe in the tree=
 make<br>
&gt; =A0 =A0 =A0 =A0 sense, and it<br>
&gt; =A0 =A0 =A0 =A0 &gt; won&#39;t tempt us to start having a trail of one=
 libc-header<br>
&gt; =A0 =A0 =A0 =A0 per kernel<br>
&gt; =A0 =A0 =A0 =A0 &gt; version (since there&#39;s always a layer somewhe=
re that&#39;s using<br>
&gt; =A0 =A0 =A0 =A0 a given<br>
&gt; =A0 =A0 =A0 =A0 &gt; version).<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; What about a middle ground ? I can pull this into=
 my tree,<br>
&gt; =A0 =A0 =A0 =A0 since I&#39;m<br>
&gt; =A0 =A0 =A0 =A0 &gt; doing some 3.8 and 3.4-stable work at the moment,=
 I&#39;ll<br>
&gt; =A0 =A0 =A0 =A0 remove the 3.4<br>
&gt; =A0 =A0 =A0 =A0 &gt; kernel headers and then submit it again as part o=
f my queue<br>
&gt; =A0 =A0 =A0 =A0 with some<br>
&gt; =A0 =A0 =A0 =A0 &gt; extra tests run ?<br>
&gt;<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 I am fine with it.<br>
&gt;<br>
&gt; Thanks, I&#39;ll pull this in if Richard agrees.<br>
&gt;<br>
<br>
</div>Sounds like a plan to me.<br>
<br></blockquote><div><br></div><div style>FYI: I haven&#39;t forgotten abo=
ut this, all the changes are done and tested here.</div><div style>I&#39;m =
finished digging out of my holiday email queue and will start sending chang=
es</div>
<div style>out tomorrow if all goes well.</div><div style><br></div><div st=
yle>Cheers,</div><div style><br></div><div style>Bruce</div><div>=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">

Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;
</div></div>

--bcaec5540070573a8704d268d80e--
