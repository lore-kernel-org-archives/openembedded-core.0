Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SWO9G-00082G-TU
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 10:39:27 +0200
Received: by yhjj56 with SMTP id j56so4331859yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 01:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=BNrjgTGDaL9oQecXgi2nLPVkQwLQ2sRSCqwsu19pLJE=;
	b=kjPwqGTwhO+gLcJdbD5WLoYtSngm/08+II4TcOTdTlc13IyydnD6T9IfecoScJJbKU
	qgbIrrKtFqERTI69z94IkSC+IH/oJ9uxOLOTohBEnbmOxvAo7+HrmwkMCHtjjFHLnwOI
	bt/AcXD0hoCc/Ghkwxdb3X9KiyaoS7hJbbeV6gwrYwcakmXHpOzN+CcujgZrITN+Cmiy
	FrA8c+bTNgNp5qDXaKbiX+gx7iqkaOs1kM4OyUZRLoaEdTBUNu4BN8uTm3k+WrRer4/z
	/QPjjL2q+jii2PfUl0ieP5YaYQ/rD+QseRfcbHqM4VjZQzNcEOc803C85aY/1FbahNo+
	KjZA==
Received: by 10.50.135.37 with SMTP id pp5mr6038495igb.33.1337588959005; Mon,
	21 May 2012 01:29:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.18 with HTTP; Mon, 21 May 2012 01:28:58 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1337588714.11345.607.camel@ted>
References: <1337534195-5184-1-git-send-email-andrei@gherzan.ro>
	<1337588714.11345.607.camel@ted>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 21 May 2012 11:28:58 +0300
Message-ID: <CAK18fxHF=cXtcLmPL7LDUQS=58vOM5Uf4FGh_y2KgT1Wi+jmEw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQno68+LkqQqyCA5AezwklZc7CS2E46ju9DXlGvckDqRryzjU2Wu4if+uSYIXoOfh44DnAEl
Subject: Re: [PATCH] bb/fetch2/__init__.py: Don't try to compute checksums for directories
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
X-List-Received-Date: Mon, 21 May 2012 08:39:27 -0000
Content-Type: multipart/alternative; boundary=e89a8f83a12fc1cd6604c087b25b

--e89a8f83a12fc1cd6604c087b25b
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 21, 2012 at 11:25 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2012-05-20 at 20:16 +0300, Andrei Gherzan wrote:
> > In this way we avoid failing the build while trying to fetch local
> > directories.
> >
> > [YOCTO #2475]
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  bitbake/lib/bb/fetch2/__init__.py |    5 +++++
> >  1 file changed, 5 insertions(+)
>
> Please send bitbake patches to the bitbake-devel list in future. I've
> applied this one directly since there is a clear need to fix problems
> though, thanks!
>
>
I will. Thanks.

@g

--e89a8f83a12fc1cd6604c087b25b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote">On Mon, May 21, 2012 at 11:25 AM, Richard Pu=
rdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation=
.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> w=
rote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Sun, 2012-05-20 at 20:1=
6 +0300, Andrei Gherzan wrote:<br>
&gt; In this way we avoid failing the build while trying to fetch local<br>
&gt; directories.<br>
&gt;<br>
&gt; [YOCTO #2475]<br>
&gt;<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
&gt; ---<br>
&gt; =A0bitbake/lib/bb/fetch2/__init__.py | =A0 =A05 +++++<br>
&gt; =A01 file changed, 5 insertions(+)<br>
<br>
</div>Please send bitbake patches to the bitbake-devel list in future. I&#3=
9;ve<br>
applied this one directly since there is a clear need to fix problems<br>
though, thanks!<br>
<br></blockquote><div>=A0</div><div>I will. Thanks.</div><div></div></div><=
br><div>@g</div>

--e89a8f83a12fc1cd6604c087b25b--
