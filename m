Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id B4BA86013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 14:56:21 +0000 (UTC)
Received: by qgep37 with SMTP id p37so33690857qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 07:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=s7DG4AaKbSrGUcHDIEZTVFHQIoB1UvkDi5AhgzfVc3g=;
	b=bcxAn7Tc58zP6FmZUKn2nFXt9OoBnnWA38MiI1JmQRTCsnmzhAtXnugY0eH6nBltix
	8gHpeooOeHe+3+CIH2wMkJu9D8slRqTyLR8DRa1Vqx2VX9eI+GdlG2AVXlBTT2Wk3Oh8
	CovCC7/YZgnLaAkb2AzEuWTG3FLj9SW4AcqDvMR78LWJS1WRZicYK2rVCy8lsJukpV36
	s787Wz1Ca96E0H5t2e4DO37bpmSuyCEpswsz4G6orQHRCrESBlNZdU8bR93EXKU03Ub+
	QTnSKJeXeZQvOfFA394arCO70RT8ehXHWrn0CoaDsaL4XuEsJMP30wmzDRo3oE0/JaZt
	8lbA==
X-Received: by 10.140.144.131 with SMTP id 125mr11427855qhq.75.1437058581266; 
	Thu, 16 Jul 2015 07:56:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.55 with HTTP; Thu, 16 Jul 2015 07:56:01 -0700 (PDT)
In-Reply-To: <1437041956.16819.32.camel@tkkaskin-mobl3.ger.corp.intel.com>
References: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
	<CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
	<CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
	<CABcZAN=z8xMuAABa54A8L2uFhC9fjRbZ36iszxSTJOpWcnFypw@mail.gmail.com>
	<CAEGpDubUdvEM=VHWzYqjBWoLz5Pz+2JP+j9oJLtdij-GSDamCg@mail.gmail.com>
	<CABcZANmfHHYLE=-9dP2-LfQ-uF8WJMxugbGOEEbR-9WQu67j=g@mail.gmail.com>
	<1437041956.16819.32.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 16 Jul 2015 07:56:01 -0700
X-Google-Sender-Auth: gN8nHI4swRadDCWl0hHb3QaLMR8
Message-ID: <CABcZAN=G=izCZKV+2qL9TEBrtBqBiw74gPPZ0s=mkdmDeGY3pQ@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Pau Espin Pedrol <pau.espin@aweurope.be>
Subject: Re: [PATCH v2] pulseaudio: add systemd to PACKAGECONFIG if enabled in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 16 Jul 2015 14:56:25 -0000
Content-Type: multipart/alternative; boundary=001a113769e84208d2051aff46c6

--001a113769e84208d2051aff46c6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 3:19 AM, Tanu Kaskinen <
tanu.kaskinen@linux.intel.com> wrote:

> On Mon, 2015-07-13 at 09:22 -0700, Christopher Larson wrote:
> >
> > On Mon, Jul 13, 2015 at 9:17 AM, Pau Espin Pedrol
> > <pespin.shar@gmail.com> wrote:
>
> >         So, pulseaudio is intended to be used as a systemd user
> >         service, not
> >         as a systemd system service, and that means it needs to end up
> >         in
> >         /usr/lib/systemd/user and not in /lib/systemd/system/.
> >
> >         All these changes are part of my efforts to improve systemd
> >         user
> >         service support in OE, which is kind of bad nowadays imho.
> >
> > Fair enough, thanks for the clarification. Given that systemd user
> > services require pam, and most embedded distros disable pam, I wonder
> > if we shouldn=E2=80=99t have an option, at least for daemons in recipes=
 that
> > can handle it, to switch from user to system via a PACKAGECONFIG, and
> > possibly default that for the non-pam case.. Hmm.
>
> Do you mean that there are many distros that have systemd but don't have
> pam, and that the lack of pam strongly suggests that the system won't
> have any regular users? If so, then your proposal sounds good.


No, I mean that systemd user services require pam, as far as I know,
because it=E2=80=99s a systemd pam plugin which actually starts and stops t=
he user
services. Without that hook, they won=E2=80=99t be run at all.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113769e84208d2051aff46c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jul 16, 2015 at 3:19 AM, Tanu Kaskinen <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:tanu.kaskinen@linux.intel.com" target=3D"_blank">tanu.kaskinen@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On Mon, 2015-07-13 at 09:22 -0700, Christopher Larson wrote:<=
br>
&gt;<br>
&gt; On Mon, Jul 13, 2015 at 9:17 AM, Pau Espin Pedrol<br>
&gt; &lt;<a href=3D"mailto:pespin.shar@gmail.com">pespin.shar@gmail.com</a>=
&gt; wrote:<br>
<br>
</span><span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0So, pulseaudi=
o is intended to be used as a systemd user<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0service, not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as a systemd system service, and that=
 means it needs to end up<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/systemd/user and not in /lib=
/systemd/system/.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0All these changes are part of my effo=
rts to improve systemd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0service support in OE, which is kind =
of bad nowadays imho.<br>
&gt;<br>
&gt; Fair enough, thanks for the clarification. Given that systemd user<br>
&gt; services require pam, and most embedded distros disable pam, I wonder<=
br>
&gt; if we shouldn=E2=80=99t have an option, at least for daemons in recipe=
s that<br>
&gt; can handle it, to switch from user to system via a PACKAGECONFIG, and<=
br>
&gt; possibly default that for the non-pam case.. Hmm.<br>
<br>
</span>Do you mean that there are many distros that have systemd but don&#3=
9;t have<br>
pam, and that the lack of pam strongly suggests that the system won&#39;t<b=
r>
have any regular users? If so, then your proposal sounds good.</blockquote>=
</div><br>No, I mean that systemd user services require pam, as far as I kn=
ow, because it=E2=80=99s a systemd pam plugin which actually starts and sto=
ps the user services. Without that hook, they won=E2=80=99t be run at all.<=
br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at k=
ergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer=
 - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113769e84208d2051aff46c6--
