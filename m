Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id A269F73171
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 17:44:05 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id a188so82705523vkc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 09:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5ucBezz8/0IXhBOkxqI8ZkBTp7V32RjCMtnEIVaoRe4=;
	b=tuUH60yLqYOllOfTt5cZp9YeiPlZHgyQzo3tTkAGxYAFrPzWzArOvoBq9QoHclCQO9
	LzjYLpvTR4k0NnUBBrseFATBeaIlFrQPeY1/VjF4oyx3uVZxzss9Z3gLfe/kvS0I2i6V
	pjdJfZ1/S7mHgtpciFAj6f4TCMvMGsbd4aWc2MsuIhpEinPSv6XI2tV3AlbpQ+zzRuhq
	Hc+Fy0OzAAcJx3rcyDRuj4rppoltj7q5mZYR0lA8qmguiV8BNxtaQfk5ejisVAeM9We8
	1+hRmWlWjoYaN3KnpN+tdAY11yeKQZMrVM7mKNlmUN4wpeTkVdhU+3QCUg4dGzET8xuS
	aYyQ==
MIME-Version: 1.0
X-Received: by 10.31.170.149 with SMTP id t143mr4309190vke.63.1450547045867;
	Sat, 19 Dec 2015 09:44:05 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Sat, 19 Dec 2015 09:44:05 -0800 (PST)
In-Reply-To: <CAP9ODKqJyZq29L7=mFzCVo2=oAX3O8WtyiJ498inW5d2fJrBBQ@mail.gmail.com>
References: <cover.1450471022.git.bruce.ashfield@windriver.com>
	<0aa694bda5500aef7d326fa880c77b726c8c2779.1450471022.git.bruce.ashfield@windriver.com>
	<CAP9ODKqJyZq29L7=mFzCVo2=oAX3O8WtyiJ498inW5d2fJrBBQ@mail.gmail.com>
Date: Sat, 19 Dec 2015 12:44:05 -0500
Message-ID: <CADkTA4OLTmiDHTwHec+Pnyhs_p-kLZp=yD2k4GOpc-LB-7sEUA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] lttng-modules: fix build issue against kernel 4.4
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
X-List-Received-Date: Sat, 19 Dec 2015 17:44:06 -0000
Content-Type: multipart/alternative; boundary=001a114326c6662688052743cdb5

--001a114326c6662688052743cdb5
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 19, 2015 at 5:05 AM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Fri, Dec 18, 2015 at 6:44 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
> > f4b27072
>
>
> Use this revision on commit log; latest is not accurate as it moves during
> time.
>
>
We'll disagree on that. The patch has the commit hash, repeating it in the
commit message is not necessary. It's like patches saying "this patch", or
explaining what is obvious from the patch. Both are not necessary.

If Ross wants to change the commit during merge, I won't complain, but
I'm happy with it, as is.

Bruce


> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114326c6662688052743cdb5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Dec 19, 2015 at 5:05 AM, Otavio Salvador <span dir=3D"ltr">&lt;=
<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavi=
o.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">On Fri, Dec 18, 2015 at 6:44 PM, Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windrive=
r.com</a>&gt; wrote:<br>
&gt; f4b27072<br>
<br>
<br>
Use this revision on commit log; latest is not accurate as it moves during =
time.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div>We&#39;ll disagree on that. The patch has the commit=
 hash, repeating it in the</div><div>commit message is not necessary. It&#3=
9;s like patches saying &quot;this patch&quot;, or</div><div>explaining wha=
t is obvious from the patch. Both are not necessary.</div><div><br></div><d=
iv>If Ross wants to change the commit during merge, I won&#39;t complain, b=
ut</div><div>I&#39;m happy with it, as is.</div><div><br></div><div>Bruce</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"HOEnZb">=
<font color=3D"#888888">
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a114326c6662688052743cdb5--
