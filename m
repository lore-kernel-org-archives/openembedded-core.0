Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TOc0C-0000ND-S3
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 00:22:13 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so6698370pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 15:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=htcaEkEp+d5u5YKalJioqXvp3eIr1VDvlpmVtKUkRr0=;
	b=S6c2VIgoLlHMU9Pf0rkGGmE3ewuiJUw+d1nT81MvR7rvh3LrPFNCLKnahEY+5NtFlC
	ynvHZOq2/XC5z/8zsB79ii+dkusEjmyxq5vsa5IZqNunbxkLGyG+4D9t2FzhAVC26Fu/
	Z14BwucBVFz0lO5CftYp5SZz8inzFVgnBHTXkGxO/rxzxDH28bI0JGEBYkLJhLqSAzIo
	+PySXfMEItfT1anlxtMt+/WmqygP6pLsxh7UmLnYpJ36i0fHZ0AwiVpzwQm8Wj5lfXgB
	4OfbJGwE6cgapSnaOVp7KjhvsLE4rNLY4T1rswdxAafYMY5Ibdm+o6UyflgExSOnbAD7
	5Lxw==
MIME-Version: 1.0
Received: by 10.68.197.9 with SMTP id iq9mr59436938pbc.130.1350511733439; Wed,
	17 Oct 2012 15:08:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 17 Oct 2012 15:08:53 -0700 (PDT)
In-Reply-To: <1350509329.2185.136.camel@ted>
References: <1350500844-10356-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKpprdTNmgJCZvir9jM7mnpS9RN17G_s=mbNW0RL4ZvQww@mail.gmail.com>
	<1350509329.2185.136.camel@ted>
Date: Wed, 17 Oct 2012 19:08:53 -0300
X-Google-Sender-Auth: xYbFOihJDFfgBBb8qB5XdGuwl-0
Message-ID: <CAP9ODKqHhw5cNvCJhW13hpAYc52VGsby9y+Mxpqi-Fi-DztVvg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFT][PATCH V2] eglibc-2.16: Use tar ball instead of svn SRC_URI
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
X-List-Received-Date: Wed, 17 Oct 2012 22:22:13 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c85c22fe2e04cc488411

--e89a8ff1c85c22fe2e04cc488411
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 17, 2012 at 6:28 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2012-10-17 at 17:42 -0300, Otavio Salvador wrote:
> > On Wed, Oct 17, 2012 at 4:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >         Adapt the recipes to fetch a tarball.
> >         Tarball is generated from latest 2.16 branch
> >         which has e500-math_private.patch already applied
> >         hence we remove that patch.
> >
> >         Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > What the motivation to move to the tarball?
>
> svn:// recipes depend on subversion-native. Having switched to the new
> ubversion version, we've in a nasty position of it being hard to
> ASSUME_PROVIDED with the API breakage.
>
> Building subversion-native is a pain and delays the core part of the
> build significantly. Switching to tarball recipes should improve our
> build speed a lot.
>
> So its mainly for performance reasons that we should do this.
>
> My only question is whether we need to include the svn revision in the
> tarball name?
>

Yes please do or it is a nightmare to track it back to a revision.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c85c22fe2e04cc488411
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Oct 17, 2012 at 6:28 PM, Richard=
 Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2012-10-17 at 17:4=
2 -0300, Otavio Salvador wrote:<br>
&gt; On Wed, Oct 17, 2012 at 4:07 PM, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; =A0 =A0 =A0 =A0 Adapt the recipes to fetch a tarball.<br>
&gt; =A0 =A0 =A0 =A0 Tarball is generated from latest 2.16 branch<br>
&gt; =A0 =A0 =A0 =A0 which has e500-math_private.patch already applied<br>
&gt; =A0 =A0 =A0 =A0 hence we remove that patch.<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt; What the motivation to move to the tarball?<br>
<br>
</div>svn:// recipes depend on subversion-native. Having switched to the ne=
w<br>
ubversion version, we&#39;ve in a nasty position of it being hard to<br>
ASSUME_PROVIDED with the API breakage.<br>
<br>
Building subversion-native is a pain and delays the core part of the<br>
build significantly. Switching to tarball recipes should improve our<br>
build speed a lot.<br>
<br>
So its mainly for performance reasons that we should do this.<br>
<br>
My only question is whether we need to include the svn revision in the<br>
tarball name?<br></blockquote><div><br></div><div>Yes please do or it is a =
nightmare to track it back to a revision.</div><div>=A0</div></div>-- <br>O=
tavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.=
S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"=
_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.=
br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8ff1c85c22fe2e04cc488411--
