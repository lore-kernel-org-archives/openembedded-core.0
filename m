Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id ABECE65C9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 09:52:02 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id hq11so401567vcb.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VNLlB6gtHNwC+H+oAxz4acBIYoXGwwszxDzEknAIcVM=;
	b=oKn+/ylMM+8nLXPE5SpaQbjtgrl7LlSUIC5d9mXgDxuLMcfrPaRVL6FSIp3Po2BWPy
	Dy3su1d5yF6xIw1K24oKeBAOHVxylXD81xCVXxkWxucJp56v4sN97CBcpRU0Odxk+Gj5
	o31TKgFG++pbWlagaqnMh0xB2/A2iNmTGS74IxpMxByleNPKntvawzWLblS2F/vcm6PH
	67mH+Sf4TnjOAr1f0k2nevbQgR5AJUxES8VTxM4l77OduMK0mkfxIdnmUbArJcBklfY4
	R5ObYSt2vWlD2iokaxCHQCMkhXHhtPK8Up/NvUkfntWb7F60Q8WoTsC5Qfkj9MtkVwOP
	NheQ==
MIME-Version: 1.0
X-Received: by 10.52.183.8 with SMTP id ei8mr31615vdc.64.1414057923243; Thu,
	23 Oct 2014 02:52:03 -0700 (PDT)
Received: by 10.52.102.204 with HTTP; Thu, 23 Oct 2014 02:52:03 -0700 (PDT)
In-Reply-To: <CAJTo0LYPW+L1h=nRhEK=VSc4c6Kgh9+DtMd872zHMCteqZUp7g@mail.gmail.com>
References: <1412697030-1033-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LYPW+L1h=nRhEK=VSc4c6Kgh9+DtMd872zHMCteqZUp7g@mail.gmail.com>
Date: Thu, 23 Oct 2014 11:52:03 +0200
Message-ID: <CALbNGRTdw1s5p69NcF8ObjhWsqzmqd=_ZSdemCNBR342y3R9VQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross: build with python support
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
X-List-Received-Date: Thu, 23 Oct 2014 09:52:04 -0000
Content-Type: multipart/alternative; boundary=bcaec548673e34f3f705061404cf

--bcaec548673e34f3f705061404cf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2014 at 5:26 PM, Burton, Ross <ross.burton@intel.com> wrote=
:

> On 7 October 2014 16:50, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
> wrote:
> > -DEPENDS =3D "expat-native ncurses-native readline-native"
> > +DEPENDS =3D "expat-native ncurses-native readline-native python-native=
"
> >
> > -EXTRA_OECONF +=3D "--without-python"
> > +inherit pythonnative
>
> Do we want to make this a PACKAGECONFIG option?  Adding Python isn't a
> trivial dependency.
>
> Ross
>
Could you live with a PACKAGECONFIG enabled by default?

Andreas

--bcaec548673e34f3f705061404cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Oct 21, 2014 at 5:26 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span=
 class=3D"">On 7 October 2014 16:50, Andreas M=C3=BCller &lt;<a href=3D"mai=
lto:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt; wrot=
e:<br>
&gt; -DEPENDS =3D &quot;expat-native ncurses-native readline-native&quot;<b=
r>
&gt; +DEPENDS =3D &quot;expat-native ncurses-native readline-native python-=
native&quot;<br>
&gt;<br>
&gt; -EXTRA_OECONF +=3D &quot;--without-python&quot;<br>
&gt; +inherit pythonnative<br>
<br>
</span>Do we want to make this a PACKAGECONFIG option?=C2=A0 Adding Python =
isn&#39;t a<br>
trivial dependency.<br>
<span class=3D""><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div>Could you live with a PACKAGECONFIG enable=
d by default?<br><br></div><div class=3D"gmail_extra">Andreas<br></div></di=
v>

--bcaec548673e34f3f705061404cf--
