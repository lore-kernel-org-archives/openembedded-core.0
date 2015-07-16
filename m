Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1913A73BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 18:22:05 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so55657393qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 11:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=VlgHIrFxlCRt11J2QyfxukDXrtojzAWrXqPNp2xB6nQ=;
	b=hwI+0IjzhdlOH9+Utw1Q2g4cUdHIqlCLXQiGmJyi1FPBoBu2VFqgc4EsHmUat3c9/P
	B+envGqSFk41/Hl8lGa4a3f8QEogts5gcapXg0o8+EQGnLdfmLvo/J127gqw01iZ/LTN
	BH7lwVhvH65iQfmOgYLKUXhDKTilg3b2aZZy9iLI02tOPE0YmkwoxnwnBk2vgTj1ghVQ
	GtrSA7wn1+aCxSdrTA91UGLPu1/5XnCgiEFPK8LO8UJthjVjST7DARQN4qnUCfLEUsTA
	5QFloI5BoveWiGfNThfkFWfoeO2/KGb6nwe7RhudZVPb+xrUzjcqG6VvZl0Af4VXUp5c
	1ndA==
X-Received: by 10.140.92.41 with SMTP id a38mr19141897qge.30.1437070925569;
	Thu, 16 Jul 2015 11:22:05 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.55 with HTTP; Thu, 16 Jul 2015 11:21:46 -0700 (PDT)
In-Reply-To: <1437070403.16819.47.camel@tkkaskin-mobl3.ger.corp.intel.com>
References: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
	<CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
	<CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
	<CABcZAN=z8xMuAABa54A8L2uFhC9fjRbZ36iszxSTJOpWcnFypw@mail.gmail.com>
	<CAEGpDubUdvEM=VHWzYqjBWoLz5Pz+2JP+j9oJLtdij-GSDamCg@mail.gmail.com>
	<CABcZANmfHHYLE=-9dP2-LfQ-uF8WJMxugbGOEEbR-9WQu67j=g@mail.gmail.com>
	<1437041956.16819.32.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<CABcZAN=G=izCZKV+2qL9TEBrtBqBiw74gPPZ0s=mkdmDeGY3pQ@mail.gmail.com>
	<1437070403.16819.47.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 16 Jul 2015 11:21:46 -0700
X-Google-Sender-Auth: zf-vZiSlY2E63w3j1qNPeL7G72w
Message-ID: <CABcZANm3yiV98wDX0WtQdLEvpo9cV8PEqPJwjFQVLyJphFau6g@mail.gmail.com>
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
X-List-Received-Date: Thu, 16 Jul 2015 18:22:07 -0000
Content-Type: multipart/alternative; boundary=001a1139b3e8092483051b02268c

--001a1139b3e8092483051b02268c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 11:13 AM, Tanu Kaskinen <
tanu.kaskinen@linux.intel.com> wrote:

> On Thu, 2015-07-16 at 07:56 -0700, Christopher Larson wrote:
> >
> > On Thu, Jul 16, 2015 at 3:19 AM, Tanu Kaskinen
> > <tanu.kaskinen@linux.intel.com> wrote:
> >         On Mon, 2015-07-13 at 09:22 -0700, Christopher Larson wrote:
> >         >
> >         > On Mon, Jul 13, 2015 at 9:17 AM, Pau Espin Pedrol
> >         > <pespin.shar@gmail.com> wrote:
> >
> >         >         So, pulseaudio is intended to be used as a systemd
> >         user
> >         >         service, not
> >         >         as a systemd system service, and that means it needs
> >         to end up
> >         >         in
> >         >         /usr/lib/systemd/user and not
> >         in /lib/systemd/system/.
> >         >
> >         >         All these changes are part of my efforts to improve
> >         systemd
> >         >         user
> >         >         service support in OE, which is kind of bad nowadays
> >         imho.
> >         >
> >         > Fair enough, thanks for the clarification. Given that
> >         systemd user
> >         > services require pam, and most embedded distros disable pam,
> >         I wonder
> >         > if we shouldn=E2=80=99t have an option, at least for daemons =
in
> >         recipes that
> >         > can handle it, to switch from user to system via a
> >         PACKAGECONFIG, and
> >         > possibly default that for the non-pam case.. Hmm.
> >
> >         Do you mean that there are many distros that have systemd but
> >         don't have
> >         pam, and that the lack of pam strongly suggests that the
> >         system won't
> >         have any regular users? If so, then your proposal sounds good.
> >
> > No, I mean that systemd user services require pam, as far as I know,
> > because it=E2=80=99s a systemd pam plugin which actually starts and sto=
ps the
> > user services. Without that hook, they won=E2=80=99t be run at all.
>
> OK, then it's less clear that services should be run in system mode by
> default when pam isn't present. If the lack of pam doesn't imply lack of
> regular users, at least pulseaudio should still run as a user service by
> default (but not started by systemd if pam isn't enabled).


Running it as a user service by default when it=E2=80=99ll not actually eve=
r be
run, lacking a mechanism to run it, seems pretty pointless to me. If
someone installs pulseaudio, presumably they want it to actually run.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1139b3e8092483051b02268c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jul 16, 2015 at 11:13 AM, Tanu Kaskinen <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:tanu.kaskinen@linux.intel.com" target=3D"_blank">tanu.kaskinen=
@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D"">On Thu, 2015-07-16 at 07:56 -0700, Christopher Larson wrote:=
<br>
&gt;<br>
&gt; On Thu, Jul 16, 2015 at 3:19 AM, Tanu Kaskinen<br>
</span><span class=3D"">&gt; &lt;<a href=3D"mailto:tanu.kaskinen@linux.inte=
l.com">tanu.kaskinen@linux.intel.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 2015-07-13 at 09:22 -0700, Ch=
ristopher Larson wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Mon, Jul 13, 2015 at 9:17 AM,=
 Pau Espin Pedrol<br>
</span><div><div class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;=
<a href=3D"mailto:pespin.shar@gmail.com">pespin.shar@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0So, pulseaudio is intended to be used as a systemd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0service, not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0as a systemd system service, and that means it needs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to end up<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/usr/lib/systemd/user and not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in /lib/systemd/system/.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0All these changes are part of my efforts to improve<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0user<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0service support in OE, which is kind of bad nowadays<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imho.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Fair enough, thanks for the clar=
ification. Given that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd user<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; services require pam, and most e=
mbedded distros disable pam,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I wonder<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; if we shouldn=E2=80=99t have an =
option, at least for daemons in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipes that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; can handle it, to switch from us=
er to system via a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACKAGECONFIG, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; possibly default that for the no=
n-pam case.. Hmm.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Do you mean that there are many distr=
os that have systemd but<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0don&#39;t have<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pam, and that the lack of pam strongl=
y suggests that the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0system won&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have any regular users? If so, then y=
our proposal sounds good.<br>
&gt;<br>
&gt; No, I mean that systemd user services require pam, as far as I know,<b=
r>
&gt; because it=E2=80=99s a systemd pam plugin which actually starts and st=
ops the<br>
&gt; user services. Without that hook, they won=E2=80=99t be run at all.<br=
>
<br>
</div></div>OK, then it&#39;s less clear that services should be run in sys=
tem mode by<br>
default when pam isn&#39;t present. If the lack of pam doesn&#39;t imply la=
ck of<br>
regular users, at least pulseaudio should still run as a user service by<br=
>
default (but not started by systemd if pam isn&#39;t enabled).</blockquote>=
</div><br>Running it as a user service by default when it=E2=80=99ll not ac=
tually ever be run, lacking a mechanism to run it, seems pretty pointless t=
o me. If someone installs pulseaudio, presumably they want it to actually r=
un.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson =
at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Mainta=
iner - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1139b3e8092483051b02268c--
