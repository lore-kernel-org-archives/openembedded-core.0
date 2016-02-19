Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6955A6011B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 23:55:31 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id xg9so45541542igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 15:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LnB2gz2Ld/rsj5PwNhuGOKw0MgJXIcs46l6Hh0ehM/M=;
	b=0TiO3d3FVF/429B7pM0eWfNIopdnh8yPsJiUxmTBgYom8+eD54J4KB5/g1Fn6mhq3i
	xkm5JHXaR5BBcvIjTkn2nLKz+lVS5XDy1jseynPrSoOnp1D/I4XVcGzHsKx+VQN7MXOc
	3p+td7wRz6N+eH+VrAubRjSwpFfgOSJLbTBcNZ1p9WwnVQjF4Qh+N8kjwmCLybpJ65cz
	XGFYTdR4XNAojp1oBD1TZJkCktig5hExNsQS4MlZbcE9C4dAHa0eu9E8jbA743jleebV
	VyU1WpdwKRjpNEEB0DLQ0kbrzC5DjqOErzFE2nORHLr2rH1Fq1nnBcwR+lKp++8FxDxw
	sgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LnB2gz2Ld/rsj5PwNhuGOKw0MgJXIcs46l6Hh0ehM/M=;
	b=eaRMwAw9k3BuQF18rQz7tgGo1IcYthThg0U28sEHBGeMoYSlRsMoTWOEfZU0J6g/87
	0Z4kp0yVo26u2jctsFv0FQSwPdCuq1lif3O3W25I6SCRzSmlmSvyNSaAVt9WRdKzdJDY
	1rTRJj74YUNew/ESZtOs/p6JtYLBmfMpaVNH9QsZYzb8XzMS/b/aYbd7jwBc4rWwYBBZ
	voeQ3srDQGacHRiUN8C83nC/YF0Bon9045iBF4NRQ6ye2ahjf6C31t7aKt0ti1HDmb90
	Uc/3ciqctv1GRiqt9/E4OM5mDFfhTNXU3ULbLSXxLJLX+4YJtshi+R5UPHV2M3Hk70Wa
	RDow==
X-Gm-Message-State: AG10YOTqWsVKDyUHENc2FZUK0ge0JNkYRZIgZJ+HqxSTfvqc1df/btozM9r8bx9EVP2Mjhe5i+1VSbytZNtxq5rc
X-Received: by 10.50.43.226 with SMTP id z2mr523553igl.78.1455926131996; Fri,
	19 Feb 2016 15:55:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 19 Feb 2016 15:55:12 -0800 (PST)
In-Reply-To: <5ddb8ef58e1cd3c4b95de6439894510641f2e70a.1455874404.git.zhe.he@windriver.com>
References: <cover.1455874404.git.zhe.he@windriver.com>
	<5ddb8ef58e1cd3c4b95de6439894510641f2e70a.1455874404.git.zhe.he@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Feb 2016 23:55:12 +0000
Message-ID: <CAJTo0LZggb6+EhU5csOinY-otfLrd6DMW-6J2FUEfr0w0T=iMw@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] kernel: Make symbol link to vmlinuz in boot directory
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
X-List-Received-Date: Fri, 19 Feb 2016 23:55:33 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4ead84c052c2837ea

--047d7bfea0f4ead84c052c2837ea
Content-Type: text/plain; charset=UTF-8

On 19 February 2016 at 09:56, <zhe.he@windriver.com> wrote:

>  documentation/ref-manual/ref-tasks.xml    |  8 ++++----
>  meta/classes/kernel.bbclass               | 13 ++++++++-----
>  meta/conf/documentation.conf              |  2 +-
>  meta/recipes-kernel/linux/linux-yocto.inc |  2 +-
>

documentation/ is actually a separate git repo (yocto-docs), please submit
a patch to yocto@ (with [yocto-docs] in the subject) when this patch is
merged into oe-core.

Ross

--047d7bfea0f4ead84c052c2837ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 February 2016 at 09:56,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.=
he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":my" class=3D"a3s" style=
=3D"overflow:hidden">=C2=A0documentation/ref-manual/ref-tasks.xml=C2=A0 =C2=
=A0 |=C2=A0 8 ++++----<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 13 ++++++++-----<br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc |=C2=A0 2 +-</div></blockqu=
ote></div><br>documentation/ is actually a separate git repo (yocto-docs), =
please submit a patch to yocto@ (with [yocto-docs] in the subject) when thi=
s patch is merged into oe-core.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--047d7bfea0f4ead84c052c2837ea--
