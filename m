Return-Path: <kergoth@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 52FFF72C42
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 16:24:49 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id a41so3759098yho.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 08:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=dtXbsXKiiBPpQWfwuM4GyFtu7JrhjKDoaKd7byNaAqc=;
	b=mOr3MtuvM+6W/VtFzyMlaycjEMgmZF53Qlow5Nt7zeXcS5eouZf3zzYHfAGg/czy4K
	mlBOb66JbyZg0+sdg+jJi2+TY6sMp1GhzMf20ktvyb0y7v56qOJSqIZpLk1NaClQ3PwW
	y1W0UaTZt67dVzfJIx/k+fNloRLXLIzbGj5wq3qzYxM6e4Pi9dIa8cpj82op5suFW544
	RNbZXmhgZRVTpzJ2r+OuapGQxiuo+4wWi4/3fVR5Td01bFCUm3aPlxfkNE/YgJ5+ZBXc
	w4LRkAANdBdDwT1AtDY/fCotKj/qS4mjwAsFnmI491TvuaUpsM+R12SzQq3nnBoW1wrt
	JReg==
X-Received: by 10.236.25.166 with SMTP id z26mr3679602yhz.30.1422030289839;
	Fri, 23 Jan 2015 08:24:49 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.190.16 with HTTP; Fri, 23 Jan 2015 08:24:29 -0800 (PST)
In-Reply-To: <CAP9ODKrqNOqQ1_d7iJRAcpNQgEbeNg=Ve1SLob1m2k2xZX4DkA@mail.gmail.com>
References: <54C1AE00.6010402@windriver.com>
	<CAP9ODKrqNOqQ1_d7iJRAcpNQgEbeNg=Ve1SLob1m2k2xZX4DkA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 23 Jan 2015 09:24:29 -0700
X-Google-Sender-Auth: 95AvNCYJnwAHpcGCdJEg5r6W8L8
Message-ID: <CABcZAN=pfOo74AmmtTkwPy4_Z5nVfA4JhBaU807KFEP=F7e5_g@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] About GPLv2's native recipe
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
X-List-Received-Date: Fri, 23 Jan 2015 16:24:54 -0000
Content-Type: multipart/alternative; boundary=089e013d0890492cb0050d543ae5

--089e013d0890492cb0050d543ae5
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 23, 2015 at 5:47 AM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> On Fri, Jan 23, 2015 at 12:12 AM, Robert Yang <liezhi.yang@windriver.com>
> wrote:
> > We have several GPLv2 recipes such as m4-native_1.4.9.bb, while we also
> > have GPLv3's m4-native_1.4.17.bb, I think that we can remove
> > m4-native_1.4.9.bb if the target m4_1.4.9.bb builds well ?
> >
> > I'd like to remove it because we don't build the lower native version by
> > default, and we don't know whether it works or when it would fail.
>
> I second this; not tested recipes are always good to remove.


The one case I'd be concerned with is where a native tool is used to
crosscompile something for the target, specifically in the case of
scripting tools which often have implicit dependency on the exact same
version, so it can parse what it needs to parse to build. Python for
example, I doubt you'd want to try to use 2.4 as part of the 2.7
crosscompilation process. m4 being a scripting language, that might be the
case here. Of course, if the language is compatible between the two
versions, maybe that's a non-issue.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013d0890492cb0050d543ae5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jan 23, 2015 at 5:47 AM, Otavio Salvador <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.c=
om.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Fri, Jan 23, 2015 at 12:12 AM, Robert Yang &lt;<a href=3D"mailto:l=
iezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br>
&gt; We have several GPLv2 recipes such as <a href=3D"http://m4-native_1.4.=
9.bb" target=3D"_blank">m4-native_1.4.9.bb</a>, while we also<br>
&gt; have GPLv3&#39;s <a href=3D"http://m4-native_1.4.17.bb" target=3D"_bla=
nk">m4-native_<span class=3D"aBn"><span class=3D"aQJ">1.4.17</span></span>.=
bb</a>, I think that we can remove<br>
&gt; <a href=3D"http://m4-native_1.4.9.bb" target=3D"_blank">m4-native_1.4.=
9.bb</a> if the target <a href=3D"http://m4_1.4.9.bb" target=3D"_blank">m4_=
1.4.9.bb</a> builds well ?<br>
&gt;<br>
&gt; I&#39;d like to remove it because we don&#39;t build the lower native =
version by<br>
&gt; default, and we don&#39;t know whether it works or when it would fail.=
<br>
<br>
</span>I second this; not tested recipes are always good to remove.</blockq=
uote></div><br>The one case I&#39;d be concerned with is where a native too=
l is used to crosscompile something for the target, specifically in the cas=
e of scripting tools which often have implicit dependency on the exact same=
 version, so it can parse what it needs to parse to build. Python for examp=
le, I doubt you&#39;d want to try to use 2.4 as part of the 2.7 crosscompil=
ation process. m4 being a scripting language, that might be the case here. =
Of course, if the language is compatible between the two versions, maybe th=
at&#39;s a non-issue.<br>-- <br><div class=3D"gmail_signature">Christopher =
Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Op=
enZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics=
</div>
</div></div>

--089e013d0890492cb0050d543ae5--
