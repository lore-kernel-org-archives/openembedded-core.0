Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D9BF7731E0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 12:07:25 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id 9so14632935iom.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eOSaYcjYQIoE8r4ZKSQU9rnb59Y424Cls3s9tv7vlF8=;
	b=U8VnoFlmZ11ilKx1DEzUvXfLVb3Uh03N+St+vXL+Jqq8hLvqlb6jUpjKLyEjTx84JS
	b3A1lipwGYCtOkbLvT5WUL2YbP7EjMhriO/xrEq/VbWmfN8xFthlH+hv5pdodjenZiee
	di+xoTmXeL2ZzeKuqBgzy65xwXBLjY4Xk5EqlNizW8zZNZeCK2L2qqN1qEK2b5xshmK9
	t4U5PjZeaoh3azU6sS05VCf+XYUNr3ot/Y1r6NI/j1O7+XVgCRvnNzWosPS5dHx8/RUb
	hVh0n8Xw5N7g7yeNVA1u1q6pm3Ka0DwPk6ttWpatRFkxmtQNjaWOl0OTts3DSfsAI2nK
	H8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eOSaYcjYQIoE8r4ZKSQU9rnb59Y424Cls3s9tv7vlF8=;
	b=OHLmTYtyVVJo2vKft60ezf264xOKiP+idL6aSmqItpcXLwgVwkWfCX37pPXZh/UIO0
	7Mzjucm0j/RoERLQrpgo5CXmkBht2Grxwt8TzJ0mZE9lbeyTOere4zyW4gDd2yECHIdp
	tHyNIHN5LJnPylh44VW5I4e1uylb4pqtPx8S4zYqHqogRC1iTuBn9/XPg5b168MSEcn1
	pmsZY1mmfvGl7dxsnG74oCa1L6R2UMv0tlmCQ6cXXBDqq8hO7UPbLBmEpWS5nEOfJCus
	+JXtnSHDLTFO6D0qqLk95uNzU+2g9LJLGYmrgJeJYlJCiCccpAkfFFEsdcvAMKr8j4SV
	wg2w==
X-Gm-Message-State: AG10YOTXPI6qvrRz45VNPrhinMBErQqXQcI6frVCC1s6tULPJgCRs+ENAJ0J1BZXk6LNpSIMZkdwEp8Cxny0IyG7
X-Received: by 10.107.10.157 with SMTP id 29mr14854254iok.133.1454414846237;
	Tue, 02 Feb 2016 04:07:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 2 Feb 2016 04:07:06 -0800 (PST)
In-Reply-To: <20160202115926.GA2607@jama>
References: <1454411051-15095-1-git-send-email-maxin.john@intel.com>
	<1454411051-15095-3-git-send-email-maxin.john@intel.com>
	<20160202115926.GA2607@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Feb 2016 12:07:06 +0000
Message-ID: <CAJTo0LZ9-EmDCP1Mx9i-BmanmPVAkFCM-v4KenCiDQUp8YVfLQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] formfactor: add machconfig for qemumips64 and beaglebone
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
X-List-Received-Date: Tue, 02 Feb 2016 12:07:28 -0000
Content-Type: multipart/alternative; boundary=001a113f8df844338b052ac8581e

--001a113f8df844338b052ac8581e
Content-Type: text/plain; charset=UTF-8

On 2 February 2016 at 11:59, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Feb 02, 2016 at 01:04:11PM +0200, Maxin B. John wrote:
> > We need machconfig file to automatically choose between physical and
> virtual
> > keyboards.
>
> beaglebone has its own BSP layer, why it should be added in oe-core?
>

This would be for the purely open beaglebone BSP in meta-yocto-bsp.  We've
always had some sort of real ARM BSP in meta-yocto-bsp for QA purposes.

I'm not sure whether we want to say the beaglebone has a keyboard and mouse
by default or not though.

Ross

--001a113f8df844338b052ac8581e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2016 at 11:59, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tu=
e, Feb 02, 2016 at 01:04:11PM +0200, Maxin B. John wrote:<br>
&gt; We need machconfig file to automatically choose between physical and v=
irtual<br>
&gt; keyboards.<br>
<br>
</span>beaglebone has its own BSP layer, why it should be added in oe-core?=
<br>
<div class=3D"HOEnZb"></div></blockquote></div><br>This would be for the pu=
rely open beaglebone BSP in meta-yocto-bsp.=C2=A0 We&#39;ve always had some=
 sort of real ARM BSP in meta-yocto-bsp for QA purposes.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;m not sure whether=
 we want to say the beaglebone has a keyboard and mouse by default or not t=
hough.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a113f8df844338b052ac8581e--
