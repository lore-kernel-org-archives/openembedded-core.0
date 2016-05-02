Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4BCB273695
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 20:37:47 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id qu10so305588igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JVjX5qFYI4UC2WTH1Dy7c+bu9PJqQrsJTdtHNKZObSU=;
	b=Vt8oDqt8DmF+FDbnBFKY8HPlmrOk5zO5NEXCjFnow2cN2Me6FlcZpcDP8m061Ol/r1
	IXYDlYizUpiqwDphh7VpLQJ9G+YF6YdTFa8Js851vjJvAWPa+no5s4VWOxfzYG4F/0SE
	LWqhe5iFxai2i/o2Ww4ST+15Qph+nyOwfnLmuiSkSPjOzrMG1E7avr5+XfWfsBGuIpiu
	ZYQ0Sw+cQ+bJhNu8AlsQIA95mUGHX6hFHK6aouN0T/AoXIhVih9/vMBOGCN2/XaiqfLi
	y2G1efUkArcYq+40Aq+sgaU/lOAStjhvYMHxNUkiPP/EUsCqAybWVOW7cKl0CcE0TamP
	yBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JVjX5qFYI4UC2WTH1Dy7c+bu9PJqQrsJTdtHNKZObSU=;
	b=gWGnhBiGmCI1MHxWtOLbQwf79l0aFWVS/R9a0KgTkw/Zw+HNPVd9weLqQCPTuFOnnC
	8L3qwmbu3bM7DLERxLDHlojW2yRjjmt18FONrKTvy/sPj7uwHzW9t0GoMI8I0y371990
	JSriutiVlFeGfCGFU/sTq1DenRDOwaMRbHRKKNpcUZAKDGWp8cy0csjCC10/X0UcJ1bN
	tSznqy5BrCveEfcp2BEKb3WRKRcNVDg2kk+9NNiqZ276nqzidfPxa+UZOuvJE9H8uZLm
	jwfrTw5ht/nhjr9iwQS9/WIBTr0ch44ejmlRX9Cf+aVTGF+nVFidPJthPs23s+Dg8aCc
	0rBg==
X-Gm-Message-State: AOPr4FU1ENe11b1luQ6+BNV0xTEScUCx8A7S5Nl9Ro3ObNDSjX4Iq8dke9suYY2DI4Xey/EyO/xZ6MNedQv3Ew==
X-Received: by 10.50.221.169 with SMTP id qf9mr22814812igc.13.1462221468280;
	Mon, 02 May 2016 13:37:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.134.70 with HTTP; Mon, 2 May 2016 13:37:28 -0700 (PDT)
In-Reply-To: <B873B241-2AB0-4CDA-B4CF-7AEA166BEE68@gmail.com>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<B873B241-2AB0-4CDA-B4CF-7AEA166BEE68@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 2 May 2016 20:37:28 +0000
Message-ID: <CABcZAN=ECJ15QzuHx-a2aovhS3hagRJuo3u-kazjZ4xnHjt=zA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Mon, 02 May 2016 20:37:49 -0000
Content-Type: multipart/alternative; boundary=f46d042ac0203336340531e1f7c9

--f46d042ac0203336340531e1f7c9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 2, 2016 at 8:34 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On May 2, 2016, at 1:09 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
> >
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > We explicitly set the hash style to gnu in our LDFLAGS. Setting the
> default to
> > this in the toolchain, while convenient, actually hides bugs, as a
> failure to
> > obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to ho=
w
> we
> > poison the sysroot -- rather than relying on the default, notice right
> away if
> > somoeone isn't obeying the needed flags.
> >
> > This will result in a failure to obey LDFLAGS causing a GNU_HASH QA
> failure,
> > which is what's often seen with external toolchains. This brings us all
> on the
> > same page, and makes sure a failure to obey LDFLAGS is seen early.
> >
>
>
> Default or gnu linkers is to use sysv for legacy reasons and by passing
> this option
> to configuring the toolchain we want to make sure that components are
> using sane defaults
> even if they have not configured these options.
>

But that's not what we want. We want to know when we're not passing
arguments we need to be passing. For example, the sysroot is poisoned
today, so we *know* when the user is trying to run it without --sysroot=3D.

if you do not pass the right linker flags from compiler driver and also
> ignore
> the LDFLAGS then you now have a safe pass for the app to build without GN=
U
> hash
> while I understand it will spread the external toolchain=E2=80=99s pains =
into
> internal toolchain
> I fail to understand the benefit of doing this otherwise.


Silently ignoring the fact that recipes ignore LDFLAGS is not good default
behavior, and this is precisely what oe-core is doing today. If you know of
a better way to detect that in another QA check, I'm certainly open to
hearing it.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--f46d042ac0203336340531e1f7c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 2, 2016 at 8:34 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
&gt; On May 2, 2016, at 1:09 PM, Christopher Larson &lt;<a href=3D"mailto:k=
ergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; We explicitly set the hash style to gnu in our LDFLAGS. Setting the de=
fault to<br>
&gt; this in the toolchain, while convenient, actually hides bugs, as a fai=
lure to<br>
&gt; obey LDFLAGS isn&#39;t noticed. By removing this, it&#39;s not dissimi=
lar to how we<br>
&gt; poison the sysroot -- rather than relying on the default, notice right=
 away if<br>
&gt; somoeone isn&#39;t obeying the needed flags.<br>
&gt;<br>
&gt; This will result in a failure to obey LDFLAGS causing a GNU_HASH QA fa=
ilure,<br>
&gt; which is what&#39;s often seen with external toolchains. This brings u=
s all on the<br>
&gt; same page, and makes sure a failure to obey LDFLAGS is seen early.<br>
&gt;<br>
<br>
<br>
</span>Default or gnu linkers is to use sysv for legacy reasons and by pass=
ing this option<br>
to configuring the toolchain we want to make sure that components are using=
 sane defaults<br>
even if they have not configured these options.<br></blockquote><div><br></=
div><div>But that&#39;s not what we want. We want to know when we&#39;re no=
t passing arguments we need to be passing. For example, the sysroot is pois=
oned today, so we *know* when the user is trying to run it without --sysroo=
t=3D.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
if you do not pass the right linker flags from compiler driver and also ign=
ore<br>
the LDFLAGS then you now have a safe pass for the app to build without GNU =
hash<br>
while I understand it will spread the external toolchain=E2=80=99s pains in=
to internal toolchain<br>
I fail to understand the benefit of doing this otherwise.</blockquote></div=
><br clear=3D"all"><div>Silently ignoring the fact that recipes ignore LDFL=
AGS is not good default behavior, and this is precisely what oe-core is doi=
ng today. If you know of a better way to detect that in another QA check, I=
&#39;m certainly open to hearing it.</div>-- <br><div class=3D"gmail_signat=
ure"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Fou=
nder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior So=
ftware Engineer, Mentor Graphics</div></div>
</div></div>

--f46d042ac0203336340531e1f7c9--
