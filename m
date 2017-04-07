Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id D286A77D83
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 12:52:44 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id f204so16753285ybc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 05:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mpxImQSQGkAnBPxeB7xe2R/T61sVyfJ+ZKQqxuKv0dM=;
	b=Y3vQe9QpkuUv1dW7+gvI4Fz+JUKM98FvdRgfRhdw4rBn0RyNphxri6UwPMvquQbc79
	69fTZ6+1+5SW7CVBoULbwnf4rsMxv8zKRcVw4a3TcN7mWQu5jF2yCwSP7mkxYRD+FVve
	togJ1OPCqHzqYHB/SBTr3vvl/AyCxnhDH9K6ZKs3gSbSYZRTSh4yai3K5wWUzQETs9sA
	J3drvO49Vyt8PqGp9GMlK+eN9PkGjl9EHPzJvAbAhpQWAEu9flJw7eSIwOUUQmDtTN6A
	UqqtylJQmNpzWc3liYUeYOwiFfv4fdTyraDEVlu0XU/I2KltkFY0jQ9/MzzHk4EPpcfO
	RIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mpxImQSQGkAnBPxeB7xe2R/T61sVyfJ+ZKQqxuKv0dM=;
	b=JcWE4pyPof2L5pqh0PubScGF8wAIgaKyCOA5nx5fjtKgHShfyAH/f1JSS2QOhnI2cm
	Zc0WBEAcBdGoGG/P78W+jaDlqeD7hEzW/w0jYxlLONbvQhYybghjuHiTVla8FuQixhV7
	vbK8I3lRQAwarFSDEDOqr49uqrqoWFLHp6dO8HU+HRC4FO6JCWC6rto8vUABKAPm+NTW
	hiYMydTr9drPLXlaCNldI4Pk9+TBJYvLMtggMttGayvU+CE4TOkmRxMWs11m01rpIdn0
	ad+/Duk6TlErGYwP6taR7VexUaJyZIliK0az+Sp4CzdbIciUV0Jk5JwyZXnHJtpDfLre
	N1XQ==
X-Gm-Message-State: AFeK/H3zgDAcqfaTQCzIKx8tLWDVXHzkJZZFvInXFfQ+PTFYnwJYXiLJ1AyM1VakcslxRhTVLL+JhPd6g8eroRiJ
X-Received: by 10.37.173.203 with SMTP id d11mr18073934ybe.3.1491569565296;
	Fri, 07 Apr 2017 05:52:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Fri, 7 Apr 2017 05:52:14 -0700 (PDT)
In-Reply-To: <3319701.6ygbhHyYrO@crde-port-20.cahors.local>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<CAHiDW_FWnBo8vsQ_OTwHYDJmMDXfH1b+6UkTjWf1=qK9QiYWLg@mail.gmail.com>
	<CA+chaQdGcpevoyue494P0FkYp_C8dt4fbZ3CLoza7sVHoRSWjg@mail.gmail.com>
	<3319701.6ygbhHyYrO@crde-port-20.cahors.local>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 7 Apr 2017 15:52:14 +0300
Message-ID: <CAHiDW_HOTUP-juoYOjobnkQGi33AamKJRWhPui7-vhCxuGDsFw@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Fri, 07 Apr 2017 12:52:45 -0000
Content-Type: multipart/alternative; boundary=f403045eb8a418fff5054c931a8e

--f403045eb8a418fff5054c931a8e
Content-Type: text/plain; charset=UTF-8

On 7 April 2017 at 15:27, David Vincent <freesilicon@gmail.com> wrote:
>
> On jeudi 6 avril 2017 15:03:36 CEST Martin Jansa wrote:
> > I still don't understand why not use standard update-alternatives and
> > install another package with your favorite openssl.conf which has higher
> > ALTERNATIVE_PRIORITY.
>
> Why not, but maybe this https://bugzilla.yoctoproject.org/show_bug.cgi?
> id=10777 can be a stopper since libcrypto RRECOMMENDS openssl-conf
>
> > This way u-a will switch to new config even when you just install the
> > package which require it on the target later and will switch back to
> > default openssl.conf when the alternative package with config file is
> > uninstalled.
> >
> > On Thu, Apr 6, 2017 at 12:55 PM, Jussi Kukkonen <
jussi.kukkonen@intel.com>
> >> So previously openssl-conf package included etc/ssl/openssl.cnf and the
> >> symlink ${libdir}/ssl/openssl.conf.
>
> The symlink is not inside openssl-conf package but rather inside openssl.

Right.

> >> Nothing RDEPENDS on this package (but
> >> libcrypto RRECOMMENDS it).
> >>
> >> After your patch the actual configuration file is still installed. In a
> >> postinst
> >>
> >>   * ${libdir}/ssl/openssl.conf is removed if it exists (why? If it's
for
> >> upgrading, then this should happen in a prerm or postrm)
> >>   * the symlink ${libdir}/ssl/openssl.conf is created
> >>
> >> My confusion is this: how does the above solve the problem you
describe?
> >> If you've managed to use RCONFLICTS to prevent the configuration
package
> >> from getting included in the image, why are changes to the package
needed?
> >>
>
> To avoid creation of the symlink inside openssl package.

I'm really not trying to be difficult but ... that still doesn't help me
understand your reasons at all and I think I need to if I want to fix the
current issue.

Could you please explain what your other configuration recipe does and what
files it contains, how you switch between the two and why the symlink in a
postinstall works for you but an installed symlink does not.

Thank you,
 Jussi

--f403045eb8a418fff5054c931a8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 April 2017 at 15:27, David Vincent &lt;<a href=3D"mai=
lto:freesilicon@gmail.com">freesilicon@gmail.com</a>&gt; wrote:<br>&gt;<br>=
&gt; On jeudi 6 avril 2017 15:03:36 CEST Martin Jansa wrote:<br>&gt; &gt; I=
 still don&#39;t understand why not use standard update-alternatives and<br=
>&gt; &gt; install another package with your favorite openssl.conf which ha=
s higher<br>&gt; &gt; ALTERNATIVE_PRIORITY.<br>&gt;<br>&gt; Why not, but ma=
ybe this <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi">https:/=
/bugzilla.yoctoproject.org/show_bug.cgi</a>?<br>&gt; id=3D10777 can be a st=
opper since libcrypto RRECOMMENDS openssl-conf<br>&gt;<br>&gt; &gt; This wa=
y u-a will switch to new config even when you just install the<br>&gt; &gt;=
 package which require it on the target later and will switch back to<br>&g=
t; &gt; default openssl.conf when the alternative package with config file =
is<br>&gt; &gt; uninstalled.<br>&gt; &gt;<br>&gt; &gt; On Thu, Apr 6, 2017 =
at 12:55 PM, Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com"=
>jussi.kukkonen@intel.com</a>&gt;<br>&gt; &gt;&gt; So previously openssl-co=
nf package included etc/ssl/openssl.cnf and the<br>&gt; &gt;&gt; symlink ${=
libdir}/ssl/openssl.conf.<br>&gt;<br>&gt; The symlink is not inside openssl=
-conf package but rather inside openssl.<br><br>Right.<br><br>&gt; &gt;&gt;=
 Nothing RDEPENDS on this package (but<br>&gt; &gt;&gt; libcrypto RRECOMMEN=
DS it).<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; After your patch the actual confi=
guration file is still installed. In a<br>&gt; &gt;&gt; postinst<br>&gt; &g=
t;&gt;<br>&gt; &gt;&gt; =C2=A0 * ${libdir}/ssl/openssl.conf is removed if i=
t exists (why? If it&#39;s for<br>&gt; &gt;&gt; upgrading, then this should=
 happen in a prerm or postrm)<br>&gt; &gt;&gt; =C2=A0 * the symlink ${libdi=
r}/ssl/openssl.conf is created<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; My confusi=
on is this: how does the above solve the problem you describe?<br>&gt; &gt;=
&gt; If you&#39;ve managed to use RCONFLICTS to prevent the configuration p=
ackage<br>&gt; &gt;&gt; from getting included in the image, why are changes=
 to the package needed?<br>&gt; &gt;&gt;<br>&gt;<br>&gt; To avoid creation =
of the symlink inside openssl package.<br><br>I&#39;m really not trying to =
be difficult but ... that still doesn&#39;t help me understand your reasons=
 at all and I think I need to if I want to fix the current issue.<div><br><=
div>Could you please explain what your other configuration recipe does and =
what files it contains, how you switch between the two and why the symlink =
in a postinstall works for you but an installed symlink does not.</div><div=
><br></div><div>Thank you,</div><div>=C2=A0Jussi</div><div><br></div></div>=
</div>

--f403045eb8a418fff5054c931a8e--
