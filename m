Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tw7yJ-0005tf-91
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 10:10:50 +0100
Received: by mail-wg0-f52.google.com with SMTP id 12so2102685wgh.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 00:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=tERQlKoTUtH3iPD5LeYA2ToZ4SLFSwuCOlHLMar+ZRg=;
	b=LH6ncPeRuxTSrGCSCMl3nop7WWX90OfCaFvz3LMP9L9/FAnuaGRHCQMXCC4zpov6CO
	6BOMtvdlEJuvSG3Ev9QTCSwvDvu9gGHPlvVvOWvk9DuooSYj4ZJeyebgSQh9q+Q+Rjnc
	AZaVYhGqrWi8cUs3GE43I9YafomGRp7jdz9Grv+dLbmc6XVZ08Ju099adtUW4ObA+hV+
	/htN2pIIyZzek5A4qLdFuCZ7Let3800NYKKo6tMuNwMWBCkcxreM9gPMOaghi1ne7IJT
	XDqWgSd4Guf4uDbYpxDjb6otTrljOiz//cyWADtREFW1m8aWrcfILTrBknP6R6sGhPAr
	HJdg==
MIME-Version: 1.0
X-Received: by 10.180.88.138 with SMTP id bg10mr2242475wib.13.1358499323047;
	Fri, 18 Jan 2013 00:55:23 -0800 (PST)
Received: by 10.194.178.72 with HTTP; Fri, 18 Jan 2013 00:55:23 -0800 (PST)
In-Reply-To: <06a101cdf556$5c273b80$1475b280$@st.com>
References: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>
	<20130116150205.GE3002@jama>
	<CAOHjBZsXebja8FB4GbQNwm5zxBCoEOPh40rE9b71EzXG5fGWdA@mail.gmail.com>
	<20130117124209.GE3067@jama>
	<065b01cdf4b6$e1510160$a3f30420$@st.com>
	<20130117134619.GI3067@jama>
	<068101cdf4d3$f2e58fa0$d8b0aee0$@st.com>
	<20130117172817.GK3067@jama>
	<06a101cdf556$5c273b80$1475b280$@st.com>
Date: Fri, 18 Jan 2013 09:55:23 +0100
Message-ID: <CA+chaQecHVmeRUmsJ1-guXMv7n8Y2B2AVF-bf4CxfyD3rdrYow@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: fix as and ld check in libc dir
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
X-List-Received-Date: Fri, 18 Jan 2013 09:10:51 -0000
X-List-Received-Date: Fri, 18 Jan 2013 09:10:51 -0000
Content-Type: multipart/alternative; boundary=f46d0442685293efde04d38c4586

--f46d0442685293efde04d38c4586
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 18, 2013 at 9:32 AM, Giuseppe CONDORELLI <
giuseppe.condorelli@st.com> wrote:

> Yes Martin,
>
> but I discovered the issue building (erroneously because eglibc was
> actually
> not required at all) an external-toolchain a little bit old (gcc and
> binutils) against the master oe-core repository,
> which contains eglic-2.16 as you know. And libc/configure comes with the
> issue I highlighted.
> So, please, think to my patch as a nice to have and not as a mandatory one.
> I don't know if other people will fall in my same condition.
>
> Thanks so much for your support.
> Giuseppe
>

And are you using eglibc-2.16 built with binutils-2.19 in runtime on some
targets?

My point is that if upstream developers decided to support binutils-2.20+
only, they probably had some reason to do it and failing configure check is
better way to show you're building unsupported combination then something
failing badly in runtime on target.

http://sourceware.org/git/?p=glibc.git;a=commit;f=configure.in;h=bec039bcefe6a0494a249e2b78e112a0ab60893b
This commit also doesn't say why..

Cheers,

--f46d0442685293efde04d38c4586
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jan 18, 2013 at 9:32 AM, Giuseppe CONDORELLI <span dir=3D"ltr">&lt;=
<a href=3D"mailto:giuseppe.condorelli@st.com" target=3D"_blank">giuseppe.co=
ndorelli@st.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":6">Yes Martin,<br>
<br>
but I discovered the issue building (erroneously because eglibc was actuall=
y<br>
not required at all) an external-toolchain a little bit old (gcc and<br>
binutils) against the master oe-core repository,<br>
which contains eglic-2.16 as you know. And libc/configure comes with the<br=
>
issue I highlighted.<br>
So, please, think to my patch as a nice to have and not as a mandatory one.=
<br>
I don&#39;t know if other people will fall in my same condition.<br>
<br>
Thanks so much for your support.<br>
Giuseppe</div></blockquote></div><br>And are you using eglibc-2.16 built wi=
th binutils-2.19 in runtime on some targets?</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra" style>My point is that if upstream d=
evelopers decided to support binutils-2.20+ only, they probably had some re=
ason to do it and failing configure check is better way to show you&#39;re =
building unsupported combination then something failing badly in runtime on=
 target.</div>
<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
><a href=3D"http://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;f=3Dconfigu=
re.in;h=3Dbec039bcefe6a0494a249e2b78e112a0ab60893b">http://sourceware.org/g=
it/?p=3Dglibc.git;a=3Dcommit;f=3Dconfigure.in;h=3Dbec039bcefe6a0494a249e2b7=
8e112a0ab60893b</a><br>
</div><div class=3D"gmail_extra" style>This commit also doesn&#39;t say why=
..</div><div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extr=
a" style>Cheers,</div></div>

--f46d0442685293efde04d38c4586--
