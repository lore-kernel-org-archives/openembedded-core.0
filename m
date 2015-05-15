Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id ED0F572207
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 16:01:38 +0000 (UTC)
Received: by qgfa7 with SMTP id a7so5959488qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 09:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yzNESBrue4CqGAqn4kBldTLLPr1epGx2sHAqjCg5p/8=;
	b=g9Up/2CCFtktNbUx1US1ms28ebW5O9eWq/+eB9rFETf811uO3GmlQmFPhtUUU+v8nZ
	TVtTrItBwgwdxLeNLxpBJOvEJRtn/i7KrKrY1R0ul/hLntrRem8rfCTy7bHHl6yd7bBA
	+URFjKznWKGvapfK9T5v3VjuXskvBA/M2uuvHVVNDEa0EOHfZ2nORtFij2dkRUqFwUmC
	t6LPSj3FX4uNdnWOq4QUnOViILVgsR001x6/uU7sXfSmRCdvrNVsX45Va5I4+fLdK7pN
	tYYxQ/SE5PES9+0DRuEhFBDd89dTUP9pDz5k/vgk49xUQGQEc9le1dB5UK9nUHVWktzR
	BgAA==
X-Gm-Message-State: ALoCoQnm74CBD+7lhHAzE4NTLIb40iLfADdRzb7R/pjEIeaqMaFpPqfApgJcV1Hlpr4E3SpT3xpy
X-Received: by 10.55.50.20 with SMTP id y20mr22189361qky.58.1431705698859;
	Fri, 15 May 2015 09:01:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 15 May 2015 09:01:18 -0700 (PDT)
In-Reply-To: <555615C9.3030503@opendreambox.org>
References: <cover.1431696945.git.joshua.lock@collabora.co.uk>
	<a77975067764b47f3e9cf28b3de7ecfbfe5b2342.1431696945.git.joshua.lock@collabora.co.uk>
	<555615C9.3030503@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 May 2015 17:01:18 +0100
Message-ID: <CAJTo0LaeNkOW8a=s-q57WnP6z+WfCe9u8G+m5arWFfU-N0Lemw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cairo: make xlib and libxcb dependencies explicit
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
X-List-Received-Date: Fri, 15 May 2015 16:01:41 -0000
Content-Type: multipart/alternative; boundary=001a114713929a91e7051620f5c2

--001a114713929a91e7051620f5c2
Content-Type: text/plain; charset=UTF-8

On 15 May 2015 at 16:50, Andreas Oberritter <obi@opendreambox.org> wrote:

> your patch adds a dependency on xcb by default, which you didn't
> mention.
>

Considering libx11 depends on xcb, this is in practise enabled by default.

I'll take Josh's patch, but extending Cairo's detection would be good.  I'm
not sure I agree with splitting the X11 packageconfigs to finely - in
practise everyone using libx11 will want shm/render enabled too.

Ross

--001a114713929a91e7051620f5c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 May 2015 at 16:50, Andreas Oberritter <span dir=3D"ltr">&lt;<a href=
=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8s" class=
=3D"a3s" style=3D"overflow:hidden">your patch adds a dependency on xcb by d=
efault, which you didn&#39;t<br>
mention.<br></div></blockquote></div><br>Considering libx11 depends on xcb,=
 this is in practise enabled by default.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">I&#39;ll take Josh&#39;s patch, but exte=
nding Cairo&#39;s detection would be good.=C2=A0 I&#39;m not sure I agree w=
ith splitting the X11 packageconfigs to finely - in practise everyone using=
 libx11 will want shm/render enabled too.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114713929a91e7051620f5c2--
