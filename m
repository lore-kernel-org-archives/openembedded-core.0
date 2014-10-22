Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3F45D60097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 07:39:36 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id hy10so1559331vcb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 00:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bSEQ8ZpEQ7GkDzMy7IlTC+JAD9eZpktbOxhQl5Zt9SI=;
	b=oYVTcdicMc5SYnMyeBHmM/ZIParmGkfWSq8YgukTf0rfQg24jPnkuadxuBpr0aUu7e
	+SAZ138Bh6KKh2ZXdtqBAXlgcpmBzCRQqKmGcGGj3dx6gT0IQ2NjHZU7gPMQZG8OvDXI
	ENXtEHEx3yKsWDM3g/RxdHA1uIWVRcCuYXNZPGFMwEQ1LVayMzut43ZBVXtynKaDdu5W
	UNB+S4i1Uv7vN/yfiQQN9yp2ACaiwiPybODMgyUQGvBVxuqSZAUZbZNgJz+sqTDfkC3r
	+7vF5+nBYJdPinB5TJ3Sew7QWC3SyFA4HiWbdQabhOGnPsDyCBicrMXVSvHXmUBX3iAE
	orOg==
MIME-Version: 1.0
X-Received: by 10.220.184.198 with SMTP id cl6mr6977027vcb.36.1413963576667;
	Wed, 22 Oct 2014 00:39:36 -0700 (PDT)
Received: by 10.52.102.204 with HTTP; Wed, 22 Oct 2014 00:39:36 -0700 (PDT)
In-Reply-To: <CAJTo0LYPW+L1h=nRhEK=VSc4c6Kgh9+DtMd872zHMCteqZUp7g@mail.gmail.com>
References: <1412697030-1033-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LYPW+L1h=nRhEK=VSc4c6Kgh9+DtMd872zHMCteqZUp7g@mail.gmail.com>
Date: Wed, 22 Oct 2014 09:39:36 +0200
Message-ID: <CALbNGRTfaQ_Z-dQQkSGwTxDMfBro4WiQKiTKTHJXuRgfE8N46Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Oct 2014 07:39:39 -0000
Content-Type: multipart/alternative; boundary=001a11c1bc40b674870505fe0c98

--001a11c1bc40b674870505fe0c98
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
A PACKAGECONFIG for something which will never be included in an image? I
have no strong opinion on that but need remote debugging for qt. So let me
know what the decision is.

Andreas

--001a11c1bc40b674870505fe0c98
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
</font></span></blockquote></div>A PACKAGECONFIG for something which will n=
ever be included in an image? I have no strong opinion on that but need rem=
ote debugging for qt. So let me know what the decision is.<br><br></div><di=
v class=3D"gmail_extra">Andreas<br></div></div>

--001a11c1bc40b674870505fe0c98--
