Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4250875578
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 03:17:18 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id t134-v6so1143294lff.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a1OTXbI8HAjgkdzV4StS8b9GXaCBI4wTSroombCD1ns=;
	b=mNMgtkurSvhWdY6UcYYsvJCaNcGrylH7DTu+ylm6iRuGpsBJFZwzI06mnc/IfgnRjP
	/1riK5jd2bXFbrpBgrY5MK7l0MQ+rq6041y+kuRQCJ83jzx97hDZWSL3umB8zd14zgt2
	XcYD3rSBOQpR480bQfHzwTbGTVTZtYZEgZDGWTI30D7zGgZ/PaFPV3pid0qnrUv/mMLF
	vRXgpE18zZgXONtsBd27Pu0YmFD/GdP5bX4L27Tus92bmD9fuNXznaXml6+Dd3ciXxmf
	grHftx8hTCXBVg3T4GbuyybPOKAv95q/ziHpd60bTP5kVr4rEmat1dS3fLVDdc+X6os5
	vWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a1OTXbI8HAjgkdzV4StS8b9GXaCBI4wTSroombCD1ns=;
	b=TjCd2yOhp5aKW/CD+lniohm7UjS7Dk1DD4Ye5WjuCMtgMR+bTeco0eVbrqck+E1Qb1
	SBk5fby0yyJNTzLfs+6FXP2GjUBD8ewGnd8x1mQekfiRLLcjQL0xfwF/IBqjVb2tm7vo
	hNWP29Yg5RIShCVKaU0/dnCc1OZLEehBsTsGVlY6WIF/InfN7qk5rWXX2LusZrl6hnlp
	2ayFXIAxe4t8VUKalDg7Ebc5igHWCHBMZ/zGaOOjQ7SS2KafhMZc5dd/xMQf7fjwyBIG
	VxnzMrAQmAojw0+r0p/6VJWhKqWQArSHRu4RgRN5wOiEOOsMUk/nzIQifVN886/zKJFm
	12Qw==
X-Gm-Message-State: APt69E188M3Gqhnnr77FVrHd1/RkArFZhyksw+23MCFyErEmZpDHKkbL
	EQDI/0wtd4Ig2ODls/Ms9XNUO1xH6dqsRFCaUnc=
X-Google-Smtp-Source: ADUXVKIWX0oX1zuasRGeITXGjzaQWLqejx2f3MQmYD3OcFXRNgAHZztlmfk/oYQGSAi+g6wPJ6If8ImOShWD9LvTzu8=
X-Received: by 2002:a19:a892:: with SMTP id
	r140-v6mr383862lfe.39.1528168638757; 
	Mon, 04 Jun 2018 20:17:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb07:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 20:17:17 -0700 (PDT)
In-Reply-To: <5e1d741f-e9a9-db4b-4a31-14d8367b3d5b@gmail.com>
References: <20180531200659.28877-1-twoerner@gmail.com>
	<5e1d741f-e9a9-db4b-4a31-14d8367b3d5b@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 4 Jun 2018 23:17:17 -0400
Message-ID: <CAHUNapT3ogkbgvd9YxFAvHBQtUOTQD_uXcdrO3iOcweerFimLQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [devtool][PATCH] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Tue, 05 Jun 2018 03:17:18 -0000
Content-Type: multipart/alternative; boundary="000000000000dec148056ddc7cf6"

--000000000000dec148056ddc7cf6
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

On Fri, Jun 1, 2018 at 1:11 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On 5/31/18 1:06 PM, Trevor Woerner wrote:
> > Instead of installing an entire recipe's build output (i.e. ${D}), allow
> the
> > user to optionally specify a package from said recipe to be installed
> > exclusively (i.e. ${PKGDEST}/<package>).
> >
>
> Thinking of developer's workflow, it might be needed to be able to
> install debug/dev packages to debug the package on device.
>
> although I think we should be able to segment it and may be have an
> option to install the dev part separately
>

Currently -dev packages will be installed, but -dbg packages will not
(since the components of the -dbg package aren't placed in ${D}). So if
anything this patch (or better yet, the v2 I'll be sending shortly) will
improve the situation.

Although I have noticed that there are differences between the -dbg package
that is created with the normal bitbake workflow and the -dbg package that
is created as part of the "devtool modify ..." workflow.

--000000000000dec148056ddc7cf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">Hi K=
hem,<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quot=
e">On Fri, Jun 1, 2018 at 1:11 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 5/31/1=
8 1:06 PM, Trevor Woerner wrote:<br>
&gt; Instead of installing an entire recipe&#39;s build output (i.e. ${D}),=
 allow the<br>
&gt; user to optionally specify a package from said recipe to be installed<=
br>
&gt; exclusively (i.e. ${PKGDEST}/&lt;package&gt;).<br>
&gt; <br>
<br>
</span>Thinking of developer&#39;s workflow, it might be needed to be able =
to<br>
install debug/dev packages to debug the package on device.<br>
<br>
although I think we should be able to segment it and may be have an<br>
option to install the dev part separately<br></blockquote><div><br></div><d=
iv>Currently -dev packages will be installed, but -dbg packages will not (s=
ince the components of the -dbg package aren&#39;t placed in ${D}). So if a=
nything this patch (or better yet, the v2 I&#39;ll be sending shortly) will=
 improve the situation.</div><div><br></div><div>Although I have noticed th=
at there are differences between the -dbg package that is created with the =
normal bitbake workflow and the -dbg package that is created as part of the=
 &quot;devtool modify ...&quot; workflow.<br></div></div></div></div>

--000000000000dec148056ddc7cf6--
