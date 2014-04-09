Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id A818E65E39
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 19:15:27 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id 10so1482248lbg.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Apr 2014 12:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=UsjatGwGyU9yPS8Wrh3KJWSw49fjCXB4iHiQXn27How=;
	b=JLkYoznPce7S9z16G3YYUBLoH5XC86Dc0eL6dIVIuZGx93DrAHk2T/XWTcJhkI7/oP
	lmPIYv2NTO+71vr3P5og1Xv6KQRAYVPt1nBF1dEoHYtXw+Rnc1KSrtGSB+/xMSX+aglT
	WP5zr7Wg97EzOri+/+rR0MFscfeIu2w++XanSHWgGOnUlw/dGTP4aNJLjrSoJ4konSeV
	kZbbRlC/wruUp3WcIG1n20JWNO58JQPc03/PE4I6m8CcLQrz+B0L0g0FeN8avuyXjPbD
	6J19OfGffflgvMrJ9A5KbzWG5eRtF0U9939FfbvZZYoyXw4TjG/5PuBZc/rZgmEHPxpp
	bEXA==
X-Received: by 10.112.26.199 with SMTP id n7mr8166526lbg.27.1397070927390;
	Wed, 09 Apr 2014 12:15:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Wed, 9 Apr 2014 12:15:07 -0700 (PDT)
In-Reply-To: <CAGNsrLDUXVSukrJCg=rs8AuT6DTa6y_kfnZTUVroFm0-zb3qwQ@mail.gmail.com>
References: <1396965637-4802-1-git-send-email-fathi.boudra@linaro.org>
	<1396965637-4802-2-git-send-email-fathi.boudra@linaro.org>
	<CAMKF1so-wo3wsD73dfbUEXYpCEMTxXgPBzqiKucCMVDYnFu+Sw@mail.gmail.com>
	<CAGNsrLC-RbVJd+uD15XTto9oYFQHrWckBnoGWBjLZ+k6bLvcsQ@mail.gmail.com>
	<CABcZANmMZ4LDyk+iG=MveJZKi66JukS65o3W8Muo_HrFymgxWA@mail.gmail.com>
	<CAGNsrLDUXVSukrJCg=rs8AuT6DTa6y_kfnZTUVroFm0-zb3qwQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 9 Apr 2014 12:15:07 -0700
X-Google-Sender-Auth: dhpQhTvhbQEdpwfEIER3NNc8L-w
Message-ID: <CABcZANmn9=b_onZz-mCSicPeDgxg=u4ebuDhE1KExvRDbN00Tg@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] trace-cmd/kernelshark: update to 2.3.2 release (latest stable branch)
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
X-List-Received-Date: Wed, 09 Apr 2014 19:15:29 -0000
Content-Type: multipart/alternative; boundary=001a113373025a6cb704f6a0ecaa

--001a113373025a6cb704f6a0ecaa
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 9, 2014 at 9:18 AM, Fathi Boudra <fathi.boudra@linaro.org>wrote:

> On 9 April 2014 18:02, Chris Larson <clarson@kergoth.com> wrote:
> >
> > On Tue, Apr 8, 2014 at 10:16 AM, Fathi Boudra <fathi.boudra@linaro.org>
> > wrote:
> >>
> >> On 8 April 2014 20:05, Khem Raj <raj.khem@gmail.com> wrote:
> >> > On Tue, Apr 8, 2014 at 7:00 AM, Fathi Boudra <fathi.boudra@linaro.org
> >
> >> > wrote:
> >> >>  do_install() {
> >> >> -       oe_runmake prefix="${prefix}" DESTDIR="${D}" install
> >> >> +       ${MAKE} NO_PYTHON=1 prefix=${prefix}
> >> >> plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install
> >> >>  }
> >> >
> >> > can you explain/document this change
> >>
> >> sure. trace-cmd doesn't have a build system generated Makefile. It's
> >> hand written.
> >> To do the install properly, one has to pass prefix/plugin_dir.
> >> In addition, the previous command in the recipe doesn't do the right
> >> thing anymore (you'll end with duplicated prefix /usr/usr/).
> >
> >
> > You don't need to avoid the use of oe_runmake to pass variables in,
> that's
> > what EXTRA_OEMAKE is for :) See
> > https://github.com/MentorEmbedded/meta-mentor/commit/4639877 for a
> version
> > of this fix that uses it instead.
>
> You don't need oe_runmake or EXTRA_OEMAKE to properly build and
> install the files in the right path either :)
> You can even drop inherit pkgconfig pythonnative since they aren't
> used. My version is also slightly shorter to achieve the same goal.
>

oe_runmake is the convention used by nearly every recipe in oe-core.
Breaking that convention for no good reason accomplishes nothing.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113373025a6cb704f6a0ecaa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Apr 9, 2014 at 9:18 AM, Fathi Boudra <span dir=3D"ltr">&lt;<a href=
=3D"mailto:fathi.boudra@linaro.org" target=3D"_blank">fathi.boudra@linaro.o=
rg</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On 9 April 2014 18:02, Chris=
 Larson &lt;<a href=3D"mailto:clarson@kergoth.com">clarson@kergoth.com</a>&=
gt; wrote:<br>


&gt;<br>
&gt; On Tue, Apr 8, 2014 at 10:16 AM, Fathi Boudra &lt;<a href=3D"mailto:fa=
thi.boudra@linaro.org">fathi.boudra@linaro.org</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 8 April 2014 20:05, Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; On Tue, Apr 8, 2014 at 7:00 AM, Fathi Boudra &lt;<a href=3D"m=
ailto:fathi.boudra@linaro.org">fathi.boudra@linaro.org</a>&gt;<br>
&gt;&gt; &gt; wrote:<br>
&gt;&gt; &gt;&gt; =C2=A0do_install() {<br>
&gt;&gt; &gt;&gt; - =C2=A0 =C2=A0 =C2=A0 oe_runmake prefix=3D&quot;${prefix=
}&quot; DESTDIR=3D&quot;${D}&quot; install<br>
&gt;&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 ${MAKE} NO_PYTHON=3D1 prefix=3D${p=
refix}<br>
&gt;&gt; &gt;&gt; plugin_dir=3D${libdir}/trace-cmd/plugins DESTDIR=3D${D} i=
nstall<br>
&gt;&gt; &gt;&gt; =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; can you explain/document this change<br>
&gt;&gt;<br>
&gt;&gt; sure. trace-cmd doesn&#39;t have a build system generated Makefile=
. It&#39;s<br>
&gt;&gt; hand written.<br>
&gt;&gt; To do the install properly, one has to pass prefix/plugin_dir.<br>
&gt;&gt; In addition, the previous command in the recipe doesn&#39;t do the=
 right<br>
&gt;&gt; thing anymore (you&#39;ll end with duplicated prefix /usr/usr/).<b=
r>
&gt;<br>
&gt;<br>
&gt; You don&#39;t need to avoid the use of oe_runmake to pass variables in=
, that&#39;s<br>
&gt; what EXTRA_OEMAKE is for :) See<br>
&gt; <a href=3D"https://github.com/MentorEmbedded/meta-mentor/commit/463987=
7" target=3D"_blank">https://github.com/MentorEmbedded/meta-mentor/commit/4=
639877</a> for a version<br>
&gt; of this fix that uses it instead.<br>
<br>
</div>You don&#39;t need oe_runmake or EXTRA_OEMAKE to properly build and<b=
r>
install the files in the right path either :)<br>
You can even drop inherit pkgconfig pythonnative since they aren&#39;t<br>
used. My version is also slightly shorter to achieve the same goal.<br></bl=
ockquote><div><br></div><div>oe_runmake is the convention used by nearly ev=
ery recipe in oe-core. Breaking that convention for no good reason accompli=
shes nothing.</div>

</div>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software =
Engineer, Mentor Graphics
</div></div>

--001a113373025a6cb704f6a0ecaa--
