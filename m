Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Semwa-0003RK-0v
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 14:45:04 +0200
Received: by yhjj56 with SMTP id j56so406445yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 05:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=kj4ZzLLZmI4vALkRl6uIUf2+Gh8nq9rfgyqlzdlyh3U=;
	b=OcuZKMAvo89ql/VhfWaHRLyFxnaYyDixUXbgdanLyQo0Hi8+M6GOgXmeDRW6bMZ09Y
	Zhw/Kg+00GB14uSA0WchUPqtDiVpftSoSjhQqv0uoj8VY8sShnQh8q1cAyyni9hvwP/Z
	sCsCEqGkT+9YXfyZJY3O885aH+LCrd3pC6JfHNUhJpK7W+9rAvOsohSHthuHIcBHUaje
	0hcn5C4x4cZOS/1lPRECaMxovGbr088sFrAGXb6TrHIZ/GlOY1TnST2owY490OW50DlO
	CBB/u8y0J11iZ1wJVNVgxJzuYYvskHYiAeVA4oFpcYHAuX78LcLZvMlE2pzIzgzToNcQ
	glXQ==
MIME-Version: 1.0
Received: by 10.50.208.34 with SMTP id mb2mr10524489igc.5.1339590867409; Wed,
	13 Jun 2012 05:34:27 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Wed, 13 Jun 2012 05:34:27 -0700 (PDT)
In-Reply-To: <CAMKF1srAO=qZzCkxiSo=Az+sdS+YCzaQnU-=u1KeThZO42Faig@mail.gmail.com>
References: <CAOHjBZuZrjs+Uza6yF+WxVmfFoQ1GZfkry0U4UOr1g+0xzdNqA@mail.gmail.com>
	<CAMKF1srAO=qZzCkxiSo=Az+sdS+YCzaQnU-=u1KeThZO42Faig@mail.gmail.com>
Date: Wed, 13 Jun 2012 14:34:27 +0200
Message-ID: <CAOHjBZtan6ZKdWV8i8qYs8c7WTPFphoeP26nr+EHbmbT2cTL-Q@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: fixup_perms failure on linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2012 12:45:04 -0000
Content-Type: multipart/alternative; boundary=14dae9340cadcbdaba04c259cd24

--14dae9340cadcbdaba04c259cd24
Content-Type: text/plain; charset=ISO-8859-1

Sorry guys, I forgot to reply that I'm using the bitbake 1.15.2.
Have I to update it? Since now I was based on the best so far archive file
for bitbake.

2012/6/12 Khem Raj <raj.khem@gmail.com>

> On Tue, Jun 12, 2012 at 2:07 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
> > OSError: [Errno 1] Operation not permitted:
> >
> '/oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/linux-libc-headers-2.6.32-r1/package/usr'
>
> what is your host machine ? did you also update bitbake ?
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae9340cadcbdaba04c259cd24
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Sorry guys, I forgot to reply that I&#39;m using the bitbake 1.15.2.</=
div><div>Have I to update it? Since now I was based on the best so far arch=
ive file for bitbake.<br><br></div><div class=3D"gmail_quote">2012/6/12 Khe=
m Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im">On Tue, Jun 12, 2012 at 2:07 AM, Giusepp=
e Condorelli<br>

&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gm=
ail.com</a>&gt; wrote:<br>
&gt; OSError: [Errno 1] Operation not permitted:<br>
&gt; &#39;/oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/w=
ork/sh4-oe-linux-uclibc/linux-libc-headers-2.6.32-r1/package/usr&#39;<br>
<br>
</div>what is your host machine ? did you also update bitbake ?<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br>

--14dae9340cadcbdaba04c259cd24--
