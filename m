Return-Path: <rewitt@declaratino.com>
X-Greylist: delayed 431 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Oct 2015 22:37:13 UTC
Received: from p3plsmtpa09-03.prod.phx3.secureserver.net
	(p3plsmtpa09-03.prod.phx3.secureserver.net [173.201.193.232])
	by mail.openembedded.org (Postfix) with ESMTP id 00561755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 22:37:13 +0000 (UTC)
Received: from mail-lb0-f173.google.com ([209.85.217.173])
	by p3plsmtpa09-03.prod.phx3.secureserver.net with 
	id bAW11r0093l3Eu901AW1xi; Thu, 29 Oct 2015 15:30:02 -0700
Received: by lbjm5 with SMTP id m5so38825750lbj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 15:30:00 -0700 (PDT)
X-Received: by 10.112.64.41 with SMTP id l9mr2304183lbs.32.1446157800950; Thu,
	29 Oct 2015 15:30:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.5.207 with HTTP; Thu, 29 Oct 2015 15:29:31 -0700 (PDT)
In-Reply-To: <1446157200.4521.40.camel@linuxfoundation.org>
References: <1446151418-16034-1-git-send-email-juro.bystricky@intel.com>
	<1446151418-16034-2-git-send-email-juro.bystricky@intel.com>
	<1446157200.4521.40.camel@linuxfoundation.org>
From: Randy Witt <rewitt@declaratino.com>
Date: Thu, 29 Oct 2015 15:29:31 -0700
Message-ID: <CAP5N7XEJ0R4aZBB+biq+LKSmWrYBHooas5S61wtcq9yLbSB07Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: jurobystricky@hotmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glibc: Allow 64 bit atomics for x86
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
X-List-Received-Date: Thu, 29 Oct 2015 22:37:14 -0000
Content-Type: multipart/alternative; boundary=001a11c3f5a803d586052345dac1

--001a11c3f5a803d586052345dac1
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 3:20 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2015-10-29 at 13:43 -0700, Juro Bystricky wrote:
> > This patch fixes [YOCTO#8140].
> >
> > The fix consist of allowing 64bit atomic ops for x86.
> > This should be safe for i586 and newer CPUs.
> > It also makes the synchronization more efficient.
> >
> > Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > ---
> >  .../glibc/glibc/use_64bit_atomics.patch            | 24
> ++++++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.22.bb              |  1 +
> >  2 files changed, 25 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
>
> Since the patch is only changing nativesdk 32 bit x86 and we know that
> the 32 bit SDK is pretty broken at the moment I've merged this on the
> basis that it can't really make it any worse. There is pressure to move
> to the next rc candidate for 2.0.
>
> I would like to get to the bottom of the real issue here and I still
> suspect 32 bit x86 images are likely broken too :/.
>

With Juro's change I built core-image-minimal using a 32-bit buildtools on
a 32-bit host(vm) and that appears to boot fine using runqemu.


> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c3f5a803d586052345dac1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Oct 29, 2015 at 3:20 PM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Thu, 2015-10-29 at 13:43 -0700, Juro Byst=
ricky wrote:<br>
&gt; This patch fixes [YOCTO#8140].<br>
&gt;<br>
&gt; The fix consist of allowing 64bit atomic ops for x86.<br>
&gt; This should be safe for i586 and newer CPUs.<br>
&gt; It also makes the synchronization more efficient.<br>
&gt;<br>
&gt; Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@int=
el.com">juro.bystricky@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../glibc/glibc/use_64bit_atomics.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 24 ++++++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/glibc/<a href=3D"http://glibc_2.22.bb" rel=3D"=
noreferrer" target=3D"_blank">glibc_2.22.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 25 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/glibc/glibc/use_64bit_atomi=
cs.patch<br>
<br>
</span>Since the patch is only changing nativesdk 32 bit x86 and we know th=
at<br>
the 32 bit SDK is pretty broken at the moment I&#39;ve merged this on the<b=
r>
basis that it can&#39;t really make it any worse. There is pressure to move=
<br>
to the next rc candidate for 2.0.<br>
<br>
I would like to get to the bottom of the real issue here and I still<br>
suspect 32 bit x86 images are likely broken too :/.<br></blockquote><div><b=
r></div><div>With Juro&#39;s change I built core-image-minimal using a 32-b=
it buildtools on a 32-bit host(vm) and that appears to boot fine using runq=
emu.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div></div>

--001a11c3f5a803d586052345dac1--
