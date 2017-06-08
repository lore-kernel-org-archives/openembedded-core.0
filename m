Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id A8D0560778
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 10:52:18 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id u19so36405585qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 03:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FA1offWkWSOyW3gz2D6ZWx3ZW8A3jcETGpRvcB+eMAY=;
	b=cVVXAtaHyUI8sEopxz8lWjwzTY6+Fvqhm0FMKV1GtbuaxfrV0tO4izhBYZMiWmk1Qf
	a/jOwAKr6Q98rD7OJS9oZCoGBaKJ3MSVlS/Vwu7F3ShhmWfT2tuzTXzWuQzzcNtzzDYy
	cBzh9fuPxGFcr5W7ywxUUIqjbQPNw0iF+v14TVcUSnWjoyl/z8HKVTW0xL216cxp0X+0
	X2wa1hpPmnR5b3cc5ALCokMsWnv8tDrxUQUmskkx9iPTKY/J1Zsb5o/eOKdmjZBPdW8J
	wSXO1UQvJllR3mRuqWXFfg/0QcH7XDXsBNlvs1IkAp5tcHiKOsvwKlFmLR1t+HtLJygQ
	8n1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FA1offWkWSOyW3gz2D6ZWx3ZW8A3jcETGpRvcB+eMAY=;
	b=Wmv+At0mjFzkZy1tn1saAiCzekwK83JqOb2aIvGwtNCLk7AhiaHkcxLLvwjTskC01h
	IEg9issWbUGrpM+o4R6Kok8ewdO1GZZTPbmIgDRssbJQW/kzdUGWRvlOcxW1b0UIVprZ
	Co8Rcq2rzJYa4Rz0SHd2ziJEfNBCusWq04uT33hewUzcN78nFaUaNXnuib2+3R0Vhrfa
	e18jg0ANCC1EnnP/rzhWNQxvUkX/SiWLFkvL7PA2zkYYcaik4x/GE4u7qjVELH4PmSBm
	PrH5XM/NTSMt+L0+2B702cQGr2khwnQ93LzULY0+/96gXOjg0n4YHW39GSfoqDzuA10Y
	fIhg==
X-Gm-Message-State: AKS2vOzg7QaXiESvh1+fFzccGtyt9rAlWJDXVr22euZ7WRLUy7cmahGu
	7xIwZk/RrhV4FXeYCALoRYgW+glzBzLr
X-Received: by 10.237.40.97 with SMTP id r88mr33874422qtd.27.1496919139614;
	Thu, 08 Jun 2017 03:52:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 8 Jun 2017 03:51:59 -0700 (PDT)
In-Reply-To: <1496777398-4493-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1496777398-4493-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Jun 2017 11:51:59 +0100
Message-ID: <CAJTo0LbgJFFBPoF=CsOEYauBn1_uDX66hh1zvE5Xw81BiRmR4A@mail.gmail.com>
To: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] oeqa/selftest: Adds verification for the integrity compressed images
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
X-List-Received-Date: Thu, 08 Jun 2017 10:52:18 -0000
Content-Type: multipart/alternative; boundary="94eb2c068b34931730055170a57b"

--94eb2c068b34931730055170a57b
Content-Type: text/plain; charset="UTF-8"

On 6 June 2017 at 20:29, Francisco Pedraza <
francisco.j.pedraza.gonzalez@intel.com> wrote:

> Added verification for images compression divided in 3 steps.
> 1. Add IMAGE_FSTYPES += "[type(s)]" to ~/conf/local.conf
> 2. Build a "core-image-minimal" using this configuration.
> 3. Verify that the image compressed file is present in rootfs directory.
> YOCTO[#10745]
>

Still fails on the main AB:

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/911/steps/Running%20oe-selftest/logs/stdio

Ross

--94eb2c068b34931730055170a57b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 June 2017 at 20:29, Francisco Pedraza <span dir=3D"ltr">&lt;<a href=3D=
"mailto:francisco.j.pedraza.gonzalez@intel.com" target=3D"_blank">francisco=
.j.pedraza.gonzalez@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><di=
v id=3D"gmail-:5wx" class=3D"gmail-a3s gmail-aXjCH gmail-m15c7ee30c81e817e"=
>Added verification for images compression divided in 3 steps.<br>
1. Add IMAGE_FSTYPES +=3D &quot;[type(s)]&quot; to ~/conf/local.conf<br>
2. Build a &quot;core-image-minimal&quot; using this configuration.<br>
3. Verify that the image compressed file is present in rootfs directory.<br=
>
YOCTO[#10745]</div></blockquote></div><br>Still fails on the main AB:</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"=
https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/buil=
ds/911/steps/Running%20oe-selftest/logs/stdio">https://autobuilder.yoctopro=
ject.org/main/builders/nightly-oe-selftest/builds/911/steps/Running%20oe-se=
lftest/logs/stdio</a><br></div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--94eb2c068b34931730055170a57b--
