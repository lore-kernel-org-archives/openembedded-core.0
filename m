Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 14D7B6093D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:21:32 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id n143so44440218ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 02:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8XaKwYoNiimvkUU1LtT8OhmgOqmGLe7qwGyFLrcYBqY=;
	b=JL2d1pGXAbuQewSOA/X1mUPeR1YOtJ2eG0IFLR+ETVkt2DtV4uS6NdyvPSomc2ML0n
	k9b65kbKO3Fl7YxD9eNnEPbR31W59OtBQoXJWVU4o1cvM7Bar4w2CvNAeqVVTwlXDBT2
	HTqhNodeLAza45Cua3J8abInS9trOiCfFDWVzwUeYsMUqPh5FmFy8OUR3VjpMZ05ZO14
	k4VeExNSW9WYjW30pDap4WR3ESxkNZgl8tHaMxTv7vL1hiGm7eDhMoRLldHElR6h9gZ3
	vC+E5JaCSggzex5ir1XJtWhauvStKtXccxCLGhuL5pQV4H0OkydPgSdSKVimqAu346pc
	YBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8XaKwYoNiimvkUU1LtT8OhmgOqmGLe7qwGyFLrcYBqY=;
	b=VeUnYu1gmLYzamJ4l9i4nugdFSrTKmyIJVKy3CpzUhkwDH3rlENa9PrtqasoTSypZt
	N+CUJQlhFZ9H/KaoCaN6I9n7N0FnNEigJayBUsGIIa5C9LOze1QiQlyKSCMgIqk66X/n
	OE+Bhoxsi+mb/uP2O8pIiZqcH5aC5mnfqf6pwBgEqVSywa41tjVt6CVYbGsZJavqI30m
	chbSnudzhT612h9HjOcyMOjL2ksL+kfHovvX/UxboRw8oemh/XjMVnJC9fur4BjqdR+O
	7Bg5VH4Rod3ji+529PSxHuM2//7Ld1CNWItrtffY6/ufx6bVpONhKVibk5ycuHMa3Ym9
	FXhA==
X-Gm-Message-State: AE9vXwN/pJRjykKM/VZJNIjLw+MeugyAxzKQVoVaoI4hRXCS+EJqeRn9P/b6OmN1RjhUB3PYemXAHUlrnNKbdd51
X-Received: by 10.36.246.68 with SMTP id u65mr2817137ith.104.1474449694277;
	Wed, 21 Sep 2016 02:21:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 21 Sep 2016 02:21:13 -0700 (PDT)
In-Reply-To: <1474436335-8086-1-git-send-email-mingli.yu@windriver.com>
References: <1474436335-8086-1-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Sep 2016 10:21:13 +0100
Message-ID: <CAJTo0LboMqEDWqXse_7ViPZjo+v4q3eXaf9H6r2u5XEMEEXUpw@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] perl: fix CVE-2016-6185
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
X-List-Received-Date: Wed, 21 Sep 2016 09:21:33 -0000
Content-Type: multipart/alternative; boundary=94eb2c0349fa4457a2053d011250

--94eb2c0349fa4457a2053d011250
Content-Type: text/plain; charset=UTF-8

On 21 September 2016 at 06:38, <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Backport patch to fix CVE-2016-6185 from perl upstream:
> http://perl5.git.perl.org/perl.git/commitdiff/08e3451d7
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>

Can you please add CVE: tags to the patches alongside the upstream-status
and s-o-b, so that the automated CVE tooling can work?

Ross

--94eb2c0349fa4457a2053d011250
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 September 2016 at 06:38,  <span dir=3D"ltr">&lt;<a href=3D"mailto:min=
gli.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":d5" class=3D"a3s a=
XjCH m1574b44bd155c837">From: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@win=
driver.com">Mingli.Yu@windriver.com</a>&gt;<br>
<br>
Backport patch to fix CVE-2016-6185 from perl upstream:<br>
<a href=3D"http://perl5.git.perl.org/perl.git/commitdiff/08e3451d7" rel=3D"=
noreferrer" target=3D"_blank">http://perl5.git.perl.org/<wbr>perl.git/commi=
tdiff/08e3451d7</a><br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.com">Min=
gli.Yu@windriver.com</a>&gt;</div></blockquote></div><br>Can you please add=
 CVE: tags to the patches alongside the upstream-status and s-o-b, so that =
the automated CVE tooling can work?</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0349fa4457a2053d011250--
