Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id CD9E260670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:18:38 +0000 (UTC)
Received: by mail-ig0-f194.google.com with SMTP id ik10so13423956igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 08:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=0V5dBzfrJx1NjeIm/I8/OFal9z9fw/HaiyQtE/wDvTE=;
	b=L379s6Y+O17hVZ3zzGgdbgiGHbtgqgKs1uv9amdn5JrnD6+xgR8EcKBIIs0/8r682g
	TasQyniCuJrFbFNS3aNdaApEYyNV7wXMxYmb1mpfyHJI5RPK02GgtoKL6xAtUya2mPjC
	JVtzATVKDvjcy7Df8XyFbWYDTB5zy1VW1BndykvO9VFXSxJyCSbmy4LqixXqgwjPbsJj
	UYN+Ig+Lo2KYJGwB6ggAe+ZOOCg9MqNyVqlT1KRt5kxVB9xyi6CKL0jT+jyBVEbf3E1S
	KFfXNKNcBWkxof3FU/IBt0yU5a5Q7zGUHOPB38APcVL6kfuw2v99XJWxL8KU/hFB0FjF
	bO+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=0V5dBzfrJx1NjeIm/I8/OFal9z9fw/HaiyQtE/wDvTE=;
	b=HELUCaIbWNGIeYm5lcJ7tVw378DIaZZCZD2oXbxdiRYh4bFOyTKeG03JCGtiZFq4dx
	TYgoXWLirdwjxm3e6+O3nZf52j2YA5CJcAJyLLdusmwMKoHhUuIrtG+Yllp4FbLjn2+3
	l8VdDDsc0MNl7V5544xgHczE0Q+nsEKm9L3YG070kINhh5EdYeQuq3v1zQttATNrLFmm
	3HSgEbspeaCcT0Hr0Ft6iMRnIGkBL6Ze3ErIhNSbnDbgkhRlZAU73yo5avoItpMSx7df
	gUiqAwAfNMQ/XzvDfxkXCcatIObOJDicVQGq5hrs/O6VndNMp53TY5nqwYQPfew7n1Lb
	LuJg==
X-Received: by 10.50.131.201 with SMTP id oo9mr12328837igb.68.1452529118797;
	Mon, 11 Jan 2016 08:18:38 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.104.194 with HTTP; Mon, 11 Jan 2016 08:18:19 -0800 (PST)
In-Reply-To: <5693C4EE.4040507@windriver.com>
References: <cover.1452489034.git.liezhi.yang@windriver.com>
	<4f5f10ebe2593fb40fbb637978480d87d9697f40.1452489034.git.liezhi.yang@windriver.com>
	<5693C245.7060304@gmail.com> <5693C4EE.4040507@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 11 Jan 2016 09:18:19 -0700
X-Google-Sender-Auth: Vsy4i4rt80_QlnYArR6_aQnDExM
Message-ID: <CABcZANkU3GRDbP0UXkFkGfD8uS7BOKk4XKFcAr9HazbYwTjPBQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] glibc-initial.inc: use relative path to run configure
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
X-List-Received-Date: Mon, 11 Jan 2016 16:18:39 -0000
Content-Type: multipart/alternative; boundary=047d7b2e47c826e87a0529114a67

--047d7b2e47c826e87a0529114a67
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 11, 2016 at 8:06 AM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> On 1/11/16 8:55 AM, Trevor Woerner wrote:
> >
> >
> > On 01/11/16 00:11, Robert Yang wrote:
> >> Avoid potential build path in output files.
> >>
> >> [YOCTO #8894]
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>  meta/recipes-core/glibc/glibc-initial.inc |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-core/glibc/glibc-initial.inc
> b/meta/recipes-core/glibc/glibc-initial.inc
> >> index 8e81f09..cb2f8dd 100644
> >> --- a/meta/recipes-core/glibc/glibc-initial.inc
> >> +++ b/meta/recipes-core/glibc/glibc-initial.inc
> >> @@ -11,7 +11,7 @@ TOOLCHAIN_OPTIONS = "
> --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
> >>  do_configure () {
> >>      (cd ${S} && gnu-configize) || die "failure in running
> gnu-configize"
> >>      find ${S} -name "configure" | xargs touch
> >> -    ${S}/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
> >> +    ../git/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
> >
> > Although I haven't tested it, this _looks_ like it might fail quite
> > readily. I'm sure there are some recipes that play tricks with ${S}, and
> > what about recipes that don't pull their sources from git?
> >
> > Maybe something like: (cd ${S} && ./configure ...) would be better?
>
> That won't work since it'll run configure in the S directory.
>
> IF we need to use relative paths here, we need to calculate the relative
> path
> from B to S and use that.  It looks like patch 2/2 already does something
> like
> this using the python..  we can probably do the same.  (I don't know any
> reason,
> at least for glibc, that all of the items won't be in the same "WORKDIR".
> So it
> would be relative within the WORKDIR, which SHOULD be fine.)


Unless we want to specifically not support externalsrc (and therefore,
devtool modify -x) for a particular recipe, we should probably not make the
assumption that S and B are relative to WORKDIR :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b2e47c826e87a0529114a67
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jan 11, 2016 at 8:06 AM, Mark Hatle <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On 1/11/16 8:55 AM, Trevor Woerner wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 01/11/16 00:11, Robert Yang wrote:<br>
&gt;&gt; Avoid potential build path in output files.<br>
&gt;&gt;<br>
&gt;&gt; [YOCTO #8894]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windr=
iver.com">liezhi.yang@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-core/glibc/glibc-initial.inc |=C2=A0 =C2=A0 2 +=
-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/reci=
pes-core/glibc/glibc-initial.inc<br>
&gt;&gt; index 8e81f09..cb2f8dd 100644<br>
&gt;&gt; --- a/meta/recipes-core/glibc/glibc-initial.inc<br>
&gt;&gt; +++ b/meta/recipes-core/glibc/glibc-initial.inc<br>
&gt;&gt; @@ -11,7 +11,7 @@ TOOLCHAIN_OPTIONS =3D &quot; --sysroot=3D${STAGI=
NG_DIR_TCBOOTSTRAP}&quot;<br>
&gt;&gt;=C2=A0 do_configure () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 (cd ${S} &amp;&amp; gnu-configize) || die &quo=
t;failure in running gnu-configize&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 find ${S} -name &quot;configure&quot; | xargs =
touch<br>
&gt;&gt; -=C2=A0 =C2=A0 ${S}/configure --host=3D${TARGET_SYS} --build=3D${B=
UILD_SYS} \<br>
&gt;&gt; +=C2=A0 =C2=A0 ../git/configure --host=3D${TARGET_SYS} --build=3D$=
{BUILD_SYS} \<br>
&gt;<br>
&gt; Although I haven&#39;t tested it, this _looks_ like it might fail quit=
e<br>
&gt; readily. I&#39;m sure there are some recipes that play tricks with ${S=
}, and<br>
&gt; what about recipes that don&#39;t pull their sources from git?<br>
&gt;<br>
&gt; Maybe something like: (cd ${S} &amp;&amp; ./configure ...) would be be=
tter?<br>
<br>
</span>That won&#39;t work since it&#39;ll run configure in the S directory=
.<br>
<br>
IF we need to use relative paths here, we need to calculate the relative pa=
th<br>
from B to S and use that.=C2=A0 It looks like patch 2/2 already does someth=
ing like<br>
this using the python..=C2=A0 we can probably do the same.=C2=A0 (I don&#39=
;t know any reason,<br>
at least for glibc, that all of the items won&#39;t be in the same &quot;WO=
RKDIR&quot;.=C2=A0 So it<br>
would be relative within the WORKDIR, which SHOULD be fine.)</blockquote></=
div><br></div><div class=3D"gmail_extra">Unless we want to specifically not=
 support externalsrc (and therefore, devtool modify -x) for a particular re=
cipe, we should probably not make the assumption that S and B are relative =
to WORKDIR :)<br>-- <br><div class=3D"gmail_signature">Christopher Larson<b=
r>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus=
<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--047d7b2e47c826e87a0529114a67--
