Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3952D6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 13:37:01 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id n190so59361863iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FEVea4YgSntBikqZGjnp4j9zpwrAzvyyZJWzvMjOlDA=;
	b=qkDO3juTkpkhupr0he0M1f23OmC9uNVBD4F+mGzb4pbfOroI30gnq8UdBRi/rFBSG5
	E05n1Bix0uPhaq4DJo2HlJJ5hznTRYDxZiCKwyuN1xmQpPL11fh4vVWDG/m2tE2XkQcU
	pInVm4fh+0jvAklhYCVYqLdpw73pw1tnWuLEGxwrrIPM2Ttyq6DsDSUSF1zX2USXzdeN
	w6yPJqHQ661nYHkV7LTJdmJrkLt1PCwf65hW0XFdsLhCaolxfq6IbVN3SSFOtGCTkUih
	f98Xt1m9436zGU45fk8Y8EPaCzbj85uqOGyjktcX8Z5XrWYJsi2MGc9cGtkbS+FqXJdS
	6izQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FEVea4YgSntBikqZGjnp4j9zpwrAzvyyZJWzvMjOlDA=;
	b=m5STmRSlPlmkQLHkkTOX7I6A7+e7tOAZXEIZeV9M0cpr9VUnI31WTvw+Gf3w9LcptD
	5SkcPSpQF69tuWxilu4st9yzj+8d9j11YjInnQrBZjTUy0baWvIj7mfTLYE6uSVwG8jG
	NzaQUraiVqVljGFTaWEzjQaMV/Jb/R+yYODtsEJdFQSUYH9VmcxHl2+USMbg+2DTCZOI
	k+nNxsjenrap2mmCXGsGbB6NUTOlqvn21oGnCUEybsF+mHEJWX1C0jRj8NlHr0yzj1lf
	qJxI57+yn+SFdVtz+iHbf0LH3kpczeDfhgl9/lnTputC42dfziKDNBgtqwaXD+OtKkyz
	4+Ew==
X-Gm-Message-State: AD7BkJKdiyQbSVPf8NrJYm/zVkWOgrOX6If8NNygQi+ef4jQIvk0QkdExaHSwKHiyZlHPjRszPGh+7JF1Pw2od1/
X-Received: by 10.107.137.38 with SMTP id l38mr4067263iod.133.1458135422437;
	Wed, 16 Mar 2016 06:37:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 16 Mar 2016 06:36:43 -0700 (PDT)
In-Reply-To: <3CD796C7-081D-4A3E-A529-14C47561239E@gmail.com>
References: <E262EC7C-008A-421F-894E-40BED850BDEB@gmail.com>
	<1458130840.2038.23.camel@pbcl.net>
	<3CD796C7-081D-4A3E-A529-14C47561239E@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Mar 2016 13:36:43 +0000
Message-ID: <CAJTo0Lb9xUjB9CKitmBbC-OJL0w6pyt7L0VDpOb9j+tFr9pXcw@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH RESEND 1/4] ARM: handle missing thumb suffix
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
X-List-Received-Date: Wed, 16 Mar 2016 13:37:02 -0000
Content-Type: multipart/alternative; boundary=001a113ec522e3b1df052e2a9b12

--001a113ec522e3b1df052e2a9b12
Content-Type: text/plain; charset=UTF-8

On 16 March 2016 at 13:18, Jens Rehsack <rehsack@gmail.com> wrote:

> Again: Please send me an updated commit message. I tried my best in
> digging down where and what is appended to dozen of flags resulting
> in proper or weird build behavior.
>

s/poky/oe-core/, and the subject prefix should be tune-arm926ejs instead of
ARM.

To be honest I'll apply those in my staging branch, don't bother re-sending.

Ross

--001a113ec522e3b1df052e2a9b12
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2016 at 13:18, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D":5ct" class=3D"" style=3D"overflow:hi=
dden">Again: Please send me an updated commit message. I tried my best in<b=
r>
digging down where and what is appended to dozen of flags resulting<br>
in proper or weird build behavior.<br></div></blockquote></div><br>s/poky/o=
e-core/, and the subject prefix should be=C2=A0<span style=3D"font-size:13p=
x">tune-arm926ejs instead of ARM.</span></div><div class=3D"gmail_extra"><s=
pan style=3D"font-size:13px"><br></span></div><div class=3D"gmail_extra"><s=
pan style=3D"font-size:13px">To be honest I&#39;ll apply those in my stagin=
g branch, don&#39;t bother re-sending.</span></div><div class=3D"gmail_extr=
a"><span style=3D"font-size:13px"><br></span></div><div class=3D"gmail_extr=
a"><span style=3D"font-size:13px">Ross</span></div></div>

--001a113ec522e3b1df052e2a9b12--
