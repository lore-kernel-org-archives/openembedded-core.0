Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id C133B601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:32:10 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id u75so73446194qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 02:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VHJAD1p3h3+aEnKvja8//JRiK3diiVmz002PdSja/GE=;
	b=cKBFeixW0OqlRgz5WnNFU/N1RokMXtY2SR/cEs5gLw1x3s8wx3Vo1Is0FxskymOWwW
	SjHeTQbBjij5Qbzi27vRL0Cn1r5Af6riZHyTiyz04ZEDfTq91QxYHH4Y7VNNtOma8jWS
	6rxTlK+lcxeLUk4bqTQ87jUZ03jT8zwKMb/8d/xfPqAl1ZZU5b7j5tJq6F8QKavn+o/c
	w9fYoUctnYOeXF7Se6rQk3tZuT/rg7DXU6e4EYOtVLNSYui5J/A+6fHBJPNsJd261wKl
	1JxJLi9KphniAtQP1jz6LVyDPHki4OtHb34Ur7uQjop8ArmJLsHTFgaDF72LLxtqJj8w
	8nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VHJAD1p3h3+aEnKvja8//JRiK3diiVmz002PdSja/GE=;
	b=MqeYPhhscUHcVbv+Rh6l921444W8SYs6lfRGb8qiROpCoBJAU6lj6fIG+AMhLf+a3J
	dn75ZzCC1GjEQDAKcnPIkM9tVqQtPNYSyEO7iu5zckjv1WERaaPVzUTqiFaLCsnnpaXz
	/J56kU8sUTwBmdHnWebvd1tp4e4vtNzzB9JFHDCgSES+9Pnzmr6W8IhE/UAochgCiSLL
	P+WKY80mXIzL+gM1V7Lf8RyJPkU8o9dMrWHWHSdbW4OlOMc/tbLXacIgmuJiBZT7cGMz
	bcEOc1tIGNzUXijgiLB2RHFBvHV3rLanRaIdlgdBn8msgAcuJN4eHzWwIpz6QLucRkJB
	Fx3Q==
X-Gm-Message-State: AODbwcCor2wEYMsPgfWfKmtYGQZ3D8/qmE+Nozg5vTJpeCzqsdI44whV
	XtOLz/CEMyTzUDe7mJiYz6Y8SXjeb82K
X-Received: by 10.55.93.193 with SMTP id r184mr27363480qkb.221.1494322331817; 
	Tue, 09 May 2017 02:32:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Tue, 9 May 2017 02:31:51 -0700 (PDT)
In-Reply-To: <19df6b88-60e2-a188-550a-ac333ac153d7@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
	<be95c443-df9a-2c9a-394b-4b02c8710fdc@linux.intel.com>
	<931ee9bc-a5cb-fcc2-278b-20a07731524d@dynamicdevices.co.uk>
	<70344400-e36e-497e-e061-56821561c353@gmail.com>
	<19df6b88-60e2-a188-550a-ac333ac153d7@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 May 2017 10:31:51 +0100
Message-ID: <CAJTo0LbP=k=WMH=Xm2b7+G330zB=i6Y=G=Weumybb-1V3rKwEA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 09:32:11 -0000
Content-Type: multipart/alternative; boundary=001a114ed8eec4d6bf054f140755

--001a114ed8eec4d6bf054f140755
Content-Type: text/plain; charset=UTF-8

On 9 May 2017 at 10:30, Alexander Kanavin <alexander.kanavin@linux.intel.com
> wrote:

> Seriously, for those who say that qt5 should be in oe.core - this does the
> job far better than oe-core ever would.
>

This. :)

Ross

--001a114ed8eec4d6bf054f140755
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 May 2017 at 10:30, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"=
mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanav=
in@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":1uw" class=3D"a3s aXjCH m15bec8bc8e988086">Seriously, for those=
 who say that qt5 should be in oe.core - this does the job far better than =
oe-core ever would.<br></div></blockquote></div><br></div><div class=3D"gma=
il_extra">This. :)</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--001a114ed8eec4d6bf054f140755--
