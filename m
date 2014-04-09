Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6165965E22
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 15:02:34 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id n15so1267655lbi.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Apr 2014 08:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=7vM1FaJczfq9S4nR5DxvTAQfopcIi+QDIvVtSq4hu+s=;
	b=kJIcj/OnOBx9+cY2NanvKQ7krWPccYgvegVXB7B6edJO1DIJtxcMJlU7PP9pIsHL08
	QxwYXspRT5IsZwC2ACSFXztzpgInnl66uPnT/GPurq6g/vJBpQDGYssEgFMC1CC/KB4D
	sdnw7FHCh4JTW9hoLi1q6VqS/38IiLVx98GVBF9RfYDFjMjaa1njKk8c7DVjqqfzK+K+
	7pe34oM+2+UxMPJIOafe3l6H8cwHAbbFRp13eV7gmSBCLUlTN1ossGyNYzEyuNGsPTD4
	ocbAIgRY1Ylo/nsO5rmoT2SI9PhQnuEXO3F673TFV5j6b2VJqRzojr10RTDuWvOYRrRh
	GH2A==
X-Received: by 10.152.2.131 with SMTP id 3mr7808087lau.20.1397055754635; Wed,
	09 Apr 2014 08:02:34 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Wed, 9 Apr 2014 08:02:14 -0700 (PDT)
In-Reply-To: <CAGNsrLC-RbVJd+uD15XTto9oYFQHrWckBnoGWBjLZ+k6bLvcsQ@mail.gmail.com>
References: <1396965637-4802-1-git-send-email-fathi.boudra@linaro.org>
	<1396965637-4802-2-git-send-email-fathi.boudra@linaro.org>
	<CAMKF1so-wo3wsD73dfbUEXYpCEMTxXgPBzqiKucCMVDYnFu+Sw@mail.gmail.com>
	<CAGNsrLC-RbVJd+uD15XTto9oYFQHrWckBnoGWBjLZ+k6bLvcsQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 9 Apr 2014 08:02:14 -0700
X-Google-Sender-Auth: i9SPcnVKJ1gMCMcjr_LZA_LE4Mk
Message-ID: <CABcZANmMZ4LDyk+iG=MveJZKi66JukS65o3W8Muo_HrFymgxWA@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Apr 2014 15:02:37 -0000
Content-Type: multipart/alternative; boundary=089e013c674cfc910a04f69d6386

--089e013c674cfc910a04f69d6386
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 8, 2014 at 10:16 AM, Fathi Boudra <fathi.boudra@linaro.org>wrote:

> On 8 April 2014 20:05, Khem Raj <raj.khem@gmail.com> wrote:
> > On Tue, Apr 8, 2014 at 7:00 AM, Fathi Boudra <fathi.boudra@linaro.org>
> wrote:
> >>  do_install() {
> >> -       oe_runmake prefix="${prefix}" DESTDIR="${D}" install
> >> +       ${MAKE} NO_PYTHON=1 prefix=${prefix}
> plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install
> >>  }
> >
> > can you explain/document this change
>
> sure. trace-cmd doesn't have a build system generated Makefile. It's
> hand written.
> To do the install properly, one has to pass prefix/plugin_dir.
> In addition, the previous command in the recipe doesn't do the right
> thing anymore (you'll end with duplicated prefix /usr/usr/).


You don't need to avoid the use of oe_runmake to pass variables in, that's
what EXTRA_OEMAKE is for :) See
https://github.com/MentorEmbedded/meta-mentor/commit/4639877 for a version
of this fix that uses it instead.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013c674cfc910a04f69d6386
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Apr 8, 2014 at 10:16 AM, Fathi Boudra <span dir=3D"ltr">&lt;<a href=
=3D"mailto:fathi.boudra@linaro.org" target=3D"_blank">fathi.boudra@linaro.o=
rg</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"">On 8 April 2014 20:05, Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>


&gt; On Tue, Apr 8, 2014 at 7:00 AM, Fathi Boudra &lt;<a href=3D"mailto:fat=
hi.boudra@linaro.org">fathi.boudra@linaro.org</a>&gt; wrote:<br>
&gt;&gt; =C2=A0do_install() {<br>
&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 oe_runmake prefix=3D&quot;${prefix}&quot; D=
ESTDIR=3D&quot;${D}&quot; install<br>
&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 ${MAKE} NO_PYTHON=3D1 prefix=3D${prefix} pl=
ugin_dir=3D${libdir}/trace-cmd/plugins DESTDIR=3D${D} install<br>
&gt;&gt; =C2=A0}<br>
&gt;<br>
&gt; can you explain/document this change<br>
<br>
</div>sure. trace-cmd doesn&#39;t have a build system generated Makefile. I=
t&#39;s<br>
hand written.<br>
To do the install properly, one has to pass prefix/plugin_dir.<br>
In addition, the previous command in the recipe doesn&#39;t do the right<br=
>
thing anymore (you&#39;ll end with duplicated prefix /usr/usr/).</blockquot=
e></div><br>You don&#39;t need to avoid the use of oe_runmake to pass varia=
bles in, that&#39;s what EXTRA_OEMAKE is for :) See=C2=A0<a href=3D"https:/=
/github.com/MentorEmbedded/meta-mentor/commit/4639877">https://github.com/M=
entorEmbedded/meta-mentor/commit/4639877</a> for a version of this fix that=
 uses it instead.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e013c674cfc910a04f69d6386--
