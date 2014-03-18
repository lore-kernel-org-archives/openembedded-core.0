Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1DB6F918
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 16:52:44 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id ec20so4934468lab.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 09:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UcdcS9RhGLeSMXuqHDQ4aCKOBvKIzFspjlhddb2WGpI=;
	b=LbMENYX6bE8OI77ylQ4yuM8Wf1bg+ZQmYBkIbO2arR7qMYpd1+Y2OVkjOV26CvE/t0
	Cfpmq7vrRbk2fofeyFkBnh6oL7D5m4asBR4KvWKuqsxZmmD44uRPdGp1gh8KCV2fhNZj
	jkofdHnOYLHuaEDUOusYsQD3cG1FC0yG/nS2GAWt0PHmJADnOzS44bqAie6TXyx9BZbS
	vI9uzbPqCGf8iP/a9ogRIe5Y+E+o868us2lvN/4fQyTV7QbpgmXhSUjQ0RmlUn11cHra
	t9PlezVTG4TMOSOkBDCVc2vbqhMjp0Lz3MIAbxtCclAmi9nIKDDSlF9JZdmf4o+vM0TJ
	T9tw==
X-Received: by 10.112.46.225 with SMTP id y1mr20805244lbm.12.1395161564016;
	Tue, 18 Mar 2014 09:52:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.35.200 with HTTP; Tue, 18 Mar 2014 09:52:23 -0700 (PDT)
In-Reply-To: <CABcZANnY5ni7nShC0mXJP0kndowTeTet4qb0nCRvEe2V=1_pXQ@mail.gmail.com>
References: <1394849186-25396-1-git-send-email-kergoth@gmail.com>
	<1667020.PzS0jxAa6O@peggleto-mobl5.ger.corp.intel.com>
	<CABcZANnY5ni7nShC0mXJP0kndowTeTet4qb0nCRvEe2V=1_pXQ@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 18 Mar 2014 09:52:23 -0700
Message-ID: <CABcZAN=owvQPkgnnzaU3tCvDvtGCZZEDLLFL9RXTZM1ZqRQnAQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe: turn oe into a namespace package
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
X-List-Received-Date: Tue, 18 Mar 2014 16:52:46 -0000
Content-Type: multipart/alternative; boundary=001a113494746d738704f4e45de1

--001a113494746d738704f4e45de1
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 18, 2014 at 7:38 AM, Chris Larson <kergoth@gmail.com> wrote:

>
> On Tue, Mar 18, 2014 at 6:48 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
>
>> On Friday 14 March 2014 19:06:26 Christopher Larson wrote:
>> > This will let folks extend the oe package with modules from other
>> layers.
>> > Given openembedded consists of more than just oe-core, I think this
>> makes
>> > sense, and adds some useful flexibility.
>> >
>> > Signed-off-by: Christopher Larson <kergoth@gmail.com>
>> > ---
>> >  meta/lib/oe/__init__.py | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
>> > index e69de29..3ad9513 100644
>> > --- a/meta/lib/oe/__init__.py
>> > +++ b/meta/lib/oe/__init__.py
>> > @@ -0,0 +1,2 @@
>> > +from pkgutil import extend_path
>> > +__path__ = extend_path(__path__, __name__)
>>
>> FWIW, this broke builds on my CentOS build machine that uses a slightly
>> older
>> buildtools install from 1.4. I hope we have pkgutil in our more current
>> buildtools - if not could you please send a fix for that as well?
>
>
> Ah, interesting, sorry about the hassle there. I'm 90% certain it's in the
> current buildtools tarball, as I do all my build testing with a CentOS 6
> chroot using a buildtools tarball, and didn't hit that problem, but I'll
> double check.
>

Looks like it was added in
https://github.com/openembedded/oe-core/commit/7d93288.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113494746d738704f4e45de1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Mar 18, 2014 at 7:38 AM, Chris Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</=
span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D""><div clas=
s=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, =
Mar 18, 2014 at 6:48 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.in=
tel.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>On Friday 14 Ma=
rch 2014 19:06:26 Christopher Larson wrote:<br>
&gt; This will let folks extend the oe package with modules from other laye=
rs.<br>
&gt; Given openembedded consists of more than just oe-core, I think this ma=
kes<br>
&gt; sense, and adds some useful flexibility.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.=
com" target=3D"_blank">kergoth@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oe/__init__.py | 2 ++<br>
&gt; =C2=A01 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py<br>
&gt; index e69de29..3ad9513 100644<br>
&gt; --- a/meta/lib/oe/__init__.py<br>
&gt; +++ b/meta/lib/oe/__init__.py<br>
&gt; @@ -0,0 +1,2 @@<br>
&gt; +from pkgutil import extend_path<br>
&gt; +__path__ =3D extend_path(__path__, __name__)<br>
<br>
</div></div>FWIW, this broke builds on my CentOS build machine that uses a =
slightly older<br>
buildtools install from 1.4. I hope we have pkgutil in our more current<br>
buildtools - if not could you please send a fix for that as well?</blockquo=
te></div><br></div></div></div><div class=3D"gmail_extra">Ah, interesting, =
sorry about the hassle there. I&#39;m 90% certain it&#39;s in the current b=
uildtools tarball, as I do all my build testing with a CentOS 6 chroot usin=
g a buildtools tarball, and didn&#39;t hit that problem, but I&#39;ll doubl=
e check.</div>

</blockquote></div><br></div><div class=3D"gmail_extra">Looks like it was a=
dded in <a href=3D"https://github.com/openembedded/oe-core/commit/7d93288">=
https://github.com/openembedded/oe-core/commit/7d93288</a>.<br>-- <br>Chris=
topher Larson<br>

clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<b=
r>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a113494746d738704f4e45de1--
