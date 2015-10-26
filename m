Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6781F60657
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 17:20:58 +0000 (UTC)
Received: by qgad10 with SMTP id d10so125063287qga.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 10:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=t9Jk9xHHuT4pZO39i/rOIFPbAJPYGtBd1FEj9VeTyjA=;
	b=f8j9dLjNOyr6Env22UwmWDvUinEm5uqIid4eXk3vFqkaJnDq1Tl8K49KRn1CsazIJ7
	JOq+qEAEZ62eaPYXWtr8lx1vjI6u62TAQV7DCr4/8XlBTmhTTq00RqT83ehsvziveuSV
	euv1nqaxG0TL5xJIO2WE5zzKizbN7Us65h1lkHRgnbcIU2PT3Mu1hFeXtKIPZJvNZ9EL
	yt/249yb6Sx0sQKnrihR+heH2534ZuT3QUTIxpHl0mLOIOKSg1/5N1H2YZT4vEl4iab+
	1Da24dZsad3CzOxkH5k7PI2k8uVNoL7pVh9cfHk7YcJwe30jDA3QFw8l4wQw9StNmz1B
	GYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=t9Jk9xHHuT4pZO39i/rOIFPbAJPYGtBd1FEj9VeTyjA=;
	b=h8CXD0V/6CFDF+LRgkXv69t2JTXKWRYhgY+2NfBtAoIMjr1mcjUGlGKHWl3hCSrJT1
	IFreyylm1Bi5Apq4E651GwF3VQbRkZzwQAB04G1aoJKNeEhyguPs0vSlpVlucIUW6NMV
	TbFDZAbFY3u4gHIinBf8DKPaetpLjNCbgGA1OIA6TdCDj8JERHlio+qDDfrX/bDbjVzj
	K7kjNRIOfdbJnOCJynXIBtAPFIumriWv265LQ8XOEnCim9a3bzV2+ivs0MPEvp3birD4
	lVY+Y1Oin9b+QCklFa4Ds5gRNQH4oE7vsphUQdJOJR7zi983ktDlS5jvHdjB97W2vTHM
	1bLA==
X-Gm-Message-State: ALoCoQkzlMMw2K1vAHo9/8OusCesN6TYGbp7pzs3tvpfImBZPEu/iYwaPky+E5mGlta3KjJvnNy3
X-Received: by 10.140.44.54 with SMTP id f51mr15891750qga.80.1445880058823;
	Mon, 26 Oct 2015 10:20:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 26 Oct 2015 10:20:39 -0700 (PDT)
In-Reply-To: <1443390491-23728-4-git-send-email-dv@pseudoterminal.org>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
	<1443390491-23728-4-git-send-email-dv@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Oct 2015 17:20:39 +0000
Message-ID: <CAJTo0LY2cDqCZe99YZP3bXuTq1bKdMaDAze6aEQJ2N1Vcb-K2g@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] gstreamer1.0-plugins-bad: upgrade to version 1.6.0
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
X-List-Received-Date: Mon, 26 Oct 2015 17:20:59 -0000
Content-Type: multipart/alternative; boundary=001a113b4cb64b79070523052f94

--001a113b4cb64b79070523052f94
Content-Type: text/plain; charset=UTF-8

Hi Carlos,

On 27 September 2015 at 22:48, Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> 0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch is now
> in upstream, and therefore not needed as a separate patch anymore.
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>

I started looking for pieces to queue for when master re-opens and
discovered that this doesn't apply anymore, so the branch will need
rebasing.

Cheers,
Ross

--001a113b4cb64b79070523052f94
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Carlos,</div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 27 September 2015 at 22:48, C=
arlos Rafael Giani <span dir=3D"ltr">&lt;<a href=3D"mailto:dv@pseudotermina=
l.org" target=3D"_blank">dv@pseudoterminal.org</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div id=3D":2p8" class=3D"a3s" style=3D"overflo=
w:hidden">0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch i=
s now<br>
in upstream, and therefore not needed as a separate patch anymore.<br>
<br>
Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudoterminal.=
org">dv@pseudoterminal.org</a>&gt;<br></div></blockquote><div><br></div><di=
v>I started looking for pieces to queue for when master re-opens and discov=
ered that this doesn&#39;t apply anymore, so the branch will need rebasing.=
</div><div><br></div><div>Cheers,</div><div>Ross</div></div></div></div>

--001a113b4cb64b79070523052f94--
