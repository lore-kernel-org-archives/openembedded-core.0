Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 78714721E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 15:32:15 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id r5so13142564qcx.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 07:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=riXDJMgh7e+aATRoo+jDSEBj2yiWmgxq4m8DU7jvj3s=;
	b=Y8F9V1bxo/vJVG5+pX68NC39NhtuerlToRNfYmZCU8MLVoFTRthZgX972eytn+0N+Q
	HRJkrgZpWMolJlJR7OZYdgKlvXBSItzm9Hjo5al4teFxiWR0ybLb9SB8k8EWSZOhkCk3
	4D2Oymr5y5zHkZlPA0Xaz+MFL4BlxmSKgtABOAg6vbh1YweSkAql4tyZt/rBDr9TwPPm
	xOtRM0UcOo92W7N5r/psrDmmA/8yvlKOPT1JVv+2TUlyxOn2NChWd+PzLE8QSOXv4Web
	6OmgLD0HDMNCH22wHFOgzUKJ2/90QLIuGfjnzRSN0OJnW0o7w+7Mghz5hWCKPmlSH7Wq
	fl4A==
X-Gm-Message-State: ALoCoQklPN2txGuty8OnVCCFr7XIVr00+iUm760ZRQ3lTwU5rTjqR1ciJ7Qg9CZnadNGcn+9//D2
X-Received: by 10.140.102.144 with SMTP id w16mr13350911qge.59.1417707136453; 
	Thu, 04 Dec 2014 07:32:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 4 Dec 2014 07:31:56 -0800 (PST)
In-Reply-To: <CAP71Wjyjw9xSbwDjzjdYUqTmNcb+W4yGUHtNmk924c1fYOKzmw@mail.gmail.com>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<fef682ae2a0028af5d14a4cc82e83208c6a440aa.1417466734.git.anibal.limon@linux.intel.com>
	<CAJTo0LZ6b0SYW7GY5KZ+zC-UGx8+afDif9y5iGTumj7Yycjr_A@mail.gmail.com>
	<CAP71WjzrWaBs-q8i=4UwbMpzsMzOxePXOFAyCCxa0xckwX2pbw@mail.gmail.com>
	<CAJTo0LYXOobX8Nnjy1KrQizBpUTZDdHLjDV0uLzrUGED1iKjoQ@mail.gmail.com>
	<CAP71Wjyjw9xSbwDjzjdYUqTmNcb+W4yGUHtNmk924c1fYOKzmw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Dec 2014 15:31:56 +0000
Message-ID: <CAJTo0LY8s3e_Sdg47pOxktFGEemZpJANxGa=_Jx1x7FrP7Q8DQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libdrm: Upgrade to 2.4.58.
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
X-List-Received-Date: Thu, 04 Dec 2014 15:32:23 -0000
Content-Type: multipart/alternative; boundary=001a11c16bc243aacf050965aaa3

--001a11c16bc243aacf050965aaa3
Content-Type: text/plain; charset=UTF-8

On 4 December 2014 at 15:23, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> i didn't find any other package in -core where we really used a
> PACKAGECONFIG for doc. so i would vote to simply do like we do in
> every other packages, e.g.
>

There is an effort by some to improve documentation generation, and this is
a fairly easy one to fix, but I'm easy either way.


> By the way, this is not a new problem (sorry I know i reported it on
> that thread ;-). This change for manpages was done in 2.4.42. So we
> should not really block the update to 2.4.58, and if you agree on the
> patch above, i can send it separately.
>

As you've kindly tested it I'll merge a version with --disable unless
Anibal is going to go the extra mile.  :)

Ross

--001a11c16bc243aacf050965aaa3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 December 2014 at 15:23, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@=
linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":9rt" class=3D"a3s" style=3D"overflow:hidden">i didn&#39;t find any oth=
er package in -core where we really used a<br>
PACKAGECONFIG for doc. so i would vote to simply do like we do in<br>
every other packages, e.g.<br>
</div></blockquote><div><br></div><div>There is an effort by some to improv=
e documentation generation, and this is a fairly easy one to fix, but I&#39=
;m easy either way.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":9rt" class=3D"a3s" style=3D"overflow:hidden">
By the way, this is not a new problem (sorry I know i reported it on<br>
that thread ;-). This change for manpages was done in 2.4.42. So we<br>
should not really block the update to 2.4.58, and if you agree on the<br>
patch above, i can send it separately.</div></blockquote></div><br>As you&#=
39;ve kindly tested it I&#39;ll merge a version with --disable unless Aniba=
l is going to go the extra mile. =C2=A0:)</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c16bc243aacf050965aaa3--
