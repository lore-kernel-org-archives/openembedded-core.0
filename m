Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id C53A173B73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 12:17:00 +0000 (UTC)
Received: by qgfh3 with SMTP id h3so17294602qgf.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 05:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZFxEhqR9jsJ/jCWMgKbsd3f1Sy8ggFWkbN7dihFwztQ=;
	b=K+HN7/Q8YLOUx/VArTdGIOFSLIRmixR9BKaodTrAGwdCZXpf9NIQJQzAfjboIbZAWn
	GfGyLugkFyTDpieW6KBuesKdH43LAocTu0ds+wzsXQgJeXT/rlH86IL1+nRKMpq5p2E5
	TOFG4Nph/xiIbnv34DxLBaDh97D8gh3atAp0Vz+K7ouEHGC4oPusFwYbysushPQyn71M
	FLEfaABTwGknO5CtDLvlnSmLKNDOdHJKwJr8AbgINdTdCYShi0dHvIfsENn3Vwk0l20T
	1Baxufelsup0Fl4w5Vxdfe6hl5mQ4f+xyE/vS8aBdtPFF5OMhfebhT9ZWT66hhbfZ5IP
	rO0A==
X-Gm-Message-State: ALoCoQljwU82PvVK5P5ENqqYS710JoccXNJuAgKYRTEJ4X9+RS041DpktOBMQTyDnao+AySU24Zp
X-Received: by 10.140.40.70 with SMTP id w64mr53375378qgw.14.1426162622198;
	Thu, 12 Mar 2015 05:17:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 12 Mar 2015 05:16:40 -0700 (PDT)
In-Reply-To: <418f6d2d447b8719d99dd9819cf13e213dc5c62a.1426140850.git.liezhi.yang@windriver.com>
References: <cover.1426140850.git.liezhi.yang@windriver.com>
	<418f6d2d447b8719d99dd9819cf13e213dc5c62a.1426140850.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Mar 2015 12:16:40 +0000
Message-ID: <CAJTo0LbtbqvHgJG9i6zdY+YcBU70dHJhVFE=fBX=k46ty8N8=g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] tar: set acpaths to avoid "Argument list too long" error
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
X-List-Received-Date: Thu, 12 Mar 2015 12:17:05 -0000
Content-Type: multipart/alternative; boundary=001a11c14f4a7d075a0511165c5f

--001a11c14f4a7d075a0511165c5f
Content-Type: text/plain; charset=UTF-8

On 12 March 2015 at 06:14, Robert Yang <liezhi.yang@windriver.com> wrote:

> +acpaths = "-I ./m4"
>

Why does this only happen on tar?  Why is it safe to pass just -I ./m4 when
the detected list that you're overriding is effectively -I ./m4 -I ./tests?

Would it be better to just make all include paths relative to ${S} when
generating the acpaths?

Ross

--001a11c14f4a7d075a0511165c5f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 March 2015 at 06:14, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D":1fm" class=3D"" style=
=3D"overflow:hidden">+acpaths =3D &quot;-I ./m4&quot;<br></div></blockquote=
><div><br></div><div>Why does this only happen on tar?=C2=A0 Why is it safe=
 to pass just -I ./m4 when the detected list that you&#39;re overriding is =
effectively -I ./m4 -I ./tests?</div><div><br></div><div>Would it be better=
 to just make all include paths relative to ${S} when generating the acpath=
s?</div><div><br></div><div>Ross</div></div></div></div>

--001a11c14f4a7d075a0511165c5f--
