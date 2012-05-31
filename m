Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Sa62b-0004MQ-O0
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 16:07:53 +0200
Received: by yhjj56 with SMTP id j56so697291yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GRZtdxkJCOnjaX5CIjbVampR8qSluMQOQZOP2XatgfA=;
	b=xfSwvxMVppcb1Z0QyKEqI4/BxyPrOjp8I15hOWo3c5fC2qdkQv0wJLqsRWJ/4YgzN0
	Wwv69bITsYJBH4blrNqVVMOeXWY5xlnhu+lS6UMaPCge2pX9GXrdt9vZrZacQpa9t/AS
	SXlHo3eMGKJIaWcTXBZVWBD4hBOTnW+CBUj+W8PYzmLdXj+0tPkAdN+1NWB9CN6O3nWI
	cwcRc0dbkDRhvvnUTjC8sBBU4m+NX13LU15tzevQyb/j+m5d2duXZbDYBrRISwqwxOS3
	ubb7OkZGbSh6cwoummyenuLQlPUUqQdauTNpBTHbwvHUEsBU6DkoJZp9NsmOyNF6gKVS
	KXGg==
MIME-Version: 1.0
Received: by 10.50.207.36 with SMTP id lt4mr1831721igc.5.1338472653224; Thu,
	31 May 2012 06:57:33 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Thu, 31 May 2012 06:57:33 -0700 (PDT)
In-Reply-To: <CAMKF1so8aA=s7wfo9k9wGNSwyuGYXmd5Ec9x=5Bp0YJbaiJoFA@mail.gmail.com>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
	<CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
	<CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
	<CAOHjBZvGY9BWkyS+9V4OtGFcQpCC2SdzKwG9pQ0wq_oeqU=uTw@mail.gmail.com>
	<CAMKF1so8aA=s7wfo9k9wGNSwyuGYXmd5Ec9x=5Bp0YJbaiJoFA@mail.gmail.com>
Date: Thu, 31 May 2012 15:57:33 +0200
Message-ID: <CAOHjBZvZmXugpmxypMamZbm1LYdOqTAp4Z+1CBPn1DyohjO3Yw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: target rpm build failure
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
X-List-Received-Date: Thu, 31 May 2012 14:07:53 -0000
Content-Type: multipart/alternative; boundary=14dae9340a9909794d04c15573b8

--14dae9340a9909794d04c15573b8
Content-Type: text/plain; charset=ISO-8859-1

Thanks for the reply,

unfortunately I depend from rpm, I need just rpm packages.
So can you confirm the target rpm for uclibc is not building?

Thanks again,
Giuseppe

2012/5/31 Khem Raj <raj.khem@gmail.com>

> On Thu, May 31, 2012 at 5:35 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
> > Is there some difference for uclibc? Please let me know.
>
> opkg works well with uclibc based systems. Those functions are not
> implemented in uclibc I am sure it can be fixed
> by linking in other libs or may be creating one. However if you are
> not bound to rpm then I would suggest to use opkg
>
> in your local.conf set it
>
> PACKAGE_CLASSES = "package_ipk"
>
> -Khem
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae9340a9909794d04c15573b8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Thanks for the reply,</div><div>=A0</div><div>unfortunately I depend f=
rom rpm, I need just rpm packages.</div><div>So can you confirm the target =
rpm for uclibc is not building?</div><div>=A0</div><div>Thanks again,</div>=
<div>
Giuseppe<br><br></div><div class=3D"gmail_quote">2012/5/31 Khem Raj <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.=
khem@gmail.com</a>&gt;</span><br><blockquote style=3D"margin:0px 0px 0px 0.=
8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1=
px;border-left-style:solid" class=3D"gmail_quote">
<div class=3D"im">On Thu, May 31, 2012 at 5:35 AM, Giuseppe Condorelli<br>
&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gm=
ail.com</a>&gt; wrote:<br>
&gt; Is there=A0some=A0difference for uclibc? Please let me know.<br>
<br>
</div>opkg works well with uclibc based systems. Those functions are not<br=
>
implemented in uclibc I am sure it can be fixed<br>
by linking in other libs or may be creating one. However if you are<br>
not bound to rpm then I would suggest to use opkg<br>
<br>
in your local.conf set it<br>
<br>
PACKAGE_CLASSES =3D &quot;package_ipk&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-Khem<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--14dae9340a9909794d04c15573b8--
