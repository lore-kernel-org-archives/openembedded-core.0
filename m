Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 34E6272B9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 12:05:22 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id v10so778498qac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 04:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DTstKsI8D24jO2WazVynJw6b1iVsM271xyaddNjyN/c=;
	b=X6aI6bFo91iyzy7uDF/vVtGCAO8fqoBipbgSvjQ87Wpd0Mijt3K7cdGSzwtPLsUDUl
	4toyQ2+7snPyJnv5NMk/w/hTTnj/F9ybvCuxYKojg9GkF6uuZtT+TianAV+QjMVnwACg
	tidV1V0xhBc1WMmbckdVYWrhOXUNbjTLdmSorJWuktuZ4KTpU6hZRNtx8/Kfok1kg0VY
	2NXQauyQrgjkhDPnFEv9TLD9PNYMLn0lbXhfbyDiaQjH01n1bgIaxm8cQ3Zr+rxUaqMO
	+FYId7xGwj2pZljQTRXvlEfB2NLOF6tpSOLPHHMmj21o03Jr7xqSsXUTx9pxx4V/hPYn
	0zgA==
X-Gm-Message-State: ALoCoQlheb156zaXrGTyOXRpc6z/evuzr8VXLqr/NxmG1OAYFq+S+6HhNtTTxgoST6wV21KIlDXE
X-Received: by 10.224.12.19 with SMTP id v19mr1765346qav.22.1421928323211;
	Thu, 22 Jan 2015 04:05:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 22 Jan 2015 04:05:02 -0800 (PST)
In-Reply-To: <CAENGNheynLDPzuS6xEJTLbkuheB93cH0wsa2DY-M6i=jqHkdvA@mail.gmail.com>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
	<CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
	<20150121202005.GK20639@denix.org>
	<CAENGNheynLDPzuS6xEJTLbkuheB93cH0wsa2DY-M6i=jqHkdvA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jan 2015 12:05:02 +0000
Message-ID: <CAJTo0LbY54BAQAx1HcgwBZNGNPSwEzmV6zhbn_mB76=vLnkWxg@mail.gmail.com>
To: Raphael Philipe <rapphil@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2015.01
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
X-List-Received-Date: Thu, 22 Jan 2015 12:05:26 -0000
Content-Type: multipart/alternative; boundary=089e0149cadc99fa5c050d3c7c61

--089e0149cadc99fa5c050d3c7c61
Content-Type: text/plain; charset=UTF-8

On 22 January 2015 at 09:50, Raphael Philipe <rapphil@gmail.com> wrote:

> Hey Denys, I tested u-boot-fw-utils-cross_2014.07.bb in Ubuntu 12.04
> and got the same error .
>
> Can you confirm that this recipe works for you?
>

I can confirm that it doesn't work on the autobuilder:

https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/builds/164/steps/BuildImages/logs/stdio

Didn't we discuss exactly this thing a few months ago?

Ross

--089e0149cadc99fa5c050d3c7c61
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2015 at 09:50, Raphael Philipe <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rapphil@gmail.com" target=3D"_blank">rapphil@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><div id=3D":6q4" class=3D"" style=3D"overf=
low:hidden">Hey Denys, I tested <a href=3D"http://u-boot-fw-utils-cross_201=
4.07.bb" target=3D"_blank"><span class=3D"">u</span>-<span class=3D"">boot<=
/span>-fw-utils-cross_2014.07.bb</a> in Ubuntu 12.04<br>
and got the same error .<br>
<br>
Can you confirm that this recipe works for you?</div></blockquote></div><br=
>I can confirm that it doesn&#39;t work on the autobuilder:</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"https://au=
tobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/builds/164/steps/B=
uildImages/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/n=
ightly-fsl-ppc/builds/164/steps/BuildImages/logs/stdio</a><br></div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Didn&#39;t we disc=
uss exactly this thing a few months ago?</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--089e0149cadc99fa5c050d3c7c61--
