Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9751C75F44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 19:24:15 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so6835401qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 12:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0bO5J9MZkEFCiQEcmjWAQtcwZzvRJx1D162mmq5eKCA=;
	b=OwqtNBZOt6kRuNZFZaJoGAJvOigmZyZb4cLg2U+ypJPJjd+mMA9dFEdjDtAD9q6l3B
	YBSgyb4m5j3PKru2nlxwcsXL6K9D4fGsODXbgr5Xh91pJJ86L88p9jcg0+PDPD0ZrEuc
	ARRsLoVTHsUXpoXdo/ZfFhZHITF0UU9BiRzoudL9rpstOoqL1LGVenbI4ciQJ7BMHa8/
	sybVGAmS2bNTL6ENOEqzPpq5PeeLlxDGw1YjmJGDNpGW0ihkUkmXuntHcKE3RVidbTkI
	TZrOlLk14ZJGddSsZHQgOCm2S3YdVM4H1Wv0XO3LC1aF1jERR9nEfiMiAPVRJL9iPsz5
	Omeg==
X-Gm-Message-State: ALoCoQn9wZZOGpYPmFENUmsD+vo+5dcWpJAFBgcP9gwRdAaromaCmUs5bQ+EtoXgq5oc4h1Mx6yo
X-Received: by 10.140.33.164 with SMTP id j33mr15742466qgj.77.1439925855499;
	Tue, 18 Aug 2015 12:24:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 18 Aug 2015 12:23:56 -0700 (PDT)
In-Reply-To: <20150818190406.GB10246@jama>
References: <20150810194122.4ED1750388@opal.openembedded.org>
	<20150818190406.GB10246@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Aug 2015 20:23:56 +0100
Message-ID: <CAJTo0Lbpqowa0Vmq7HziVBUR_pwyPcLSxtfzaphg1RS3fwZrfQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Nicolas Dechesne : mesa: upgrade 10.5.8 -> 10.6.3
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
X-List-Received-Date: Tue, 18 Aug 2015 19:24:18 -0000
Content-Type: multipart/alternative; boundary=001a1139bd9c1f193e051d9addc7

--001a1139bd9c1f193e051d9addc7
Content-Type: text/plain; charset=UTF-8

On 18 August 2015 at 20:04, Martin Jansa <martin.jansa@gmail.com> wrote:

> I haven't tried to find out what's the replacement for this yet, but
> it's the reason why mesa is now failing in my bitbake world builds
> (fbdev is added in ./meta-luneui/recipes-graphics/mesa/mesa_%.bbappend)
>

I think what you were building wouldn't actually have done anything useful
anyway, that configuration was removed by this commit:

commit 0d6e7620f35331be301ec3177c0d9236838a845b
Author: Emil Velikov <emil.l.velikov@gmail.com>
Date:   Sat Mar 14 22:36:28 2015 +0000

    egl/main: drop platform fbdev specific code

    st/egl was the only one which had support for this platform.

Ross

--001a1139bd9c1f193e051d9addc7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 August 2015 at 20:04, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":40s" class=
=3D"a3s" style=3D"overflow:hidden">I haven&#39;t tried to find out what&#39=
;s the replacement for this yet, but<br>
it&#39;s the reason why mesa is now failing in my bitbake world builds<br>
(fbdev is added in ./meta-luneui/recipes-graphics/mesa/mesa_%.bbappend)</di=
v></blockquote></div><div class=3D"gmail_extra"><br></div>I think what you =
were building wouldn&#39;t actually have done anything useful anyway, that =
configuration was removed by this commit:</div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_extra">commit 0d6e7620f35331be301ec3177c0d9236838a84=
5b</div><div class=3D"gmail_extra">Author: Emil Velikov &lt;<a href=3D"mail=
to:emil.l.velikov@gmail.com">emil.l.velikov@gmail.com</a>&gt;</div><div cla=
ss=3D"gmail_extra">Date: =C2=A0 Sat Mar 14 22:36:28 2015 +0000</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 egl/=
main: drop platform fbdev specific code</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 st/egl was the only one whi=
ch had support for this platform.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div></div>

--001a1139bd9c1f193e051d9addc7--
