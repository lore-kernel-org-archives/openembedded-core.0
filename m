Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1E071993
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 10:43:29 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n204so130080606qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 02:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q9DgVJmm6OnaseaX8IBSYhPIuA8Xk0yzCg1oyDRfv4U=;
	b=KvsurUAbVvQjprm0TptxRyXBxMeiJAud4EymWiwSmQUKYIRmE/fTXEqL5DV/hsY7JI
	UW/hvRUUgD1W99XxwZ8RSrlUEeMhewEVfG5XeqyhMyFIWzEtJfblqW/ydVxmTtaM8RT+
	QLTCLkrtkHHHfYQ4aBtkRDUzkLi/RUBOeYzirNYTymeDRBwdlMOcEx2zc4WeVvDzvqFX
	yqt204MU/AxYUAS0Xp6GNPZ/1/Bwis/sKUtExnbSHltkXJ8qiAyaVAxPv79WrLwoYGZb
	N+ciqqU9cN/h/zDsp1QBk+wlBgB4qRMq98s0MOm7HzRuCDBqCkcI2plEL/XMbb1cH3j0
	opyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q9DgVJmm6OnaseaX8IBSYhPIuA8Xk0yzCg1oyDRfv4U=;
	b=gt2ZEN4skGDBRJdagsBV4+St2NKv6avP8mCKYePbDbQs0MM8w8PdZCrmfbUYxItl7z
	c+7aglJTwgOJlqfd8i64MiLXQEwX8p5l3u8DOpJMa70yirSMHnlQAwwc8XCsT/FCJKEV
	OKE/iGGEeWp7USGCwI3Atw1ktOvptUbCmN/CTq8/DqcEC4Z6e2zEfHOFTG1ctBQeVz9e
	CdbTg07Ct7vJN2QHsmtLm45L0GiJ/zmR0e/7z4agpgXpeEsqqROkfqjsm7BCsziFHeiE
	zkWayJorfil+tDB9dAEELTkc1Jmr15mIPzlcKwyM6kRXYuORnrjQOdBqSrertSfuWodx
	uMFw==
X-Gm-Message-State: ABUngvdtpZrLLiYxLl0/FlY5voGjXrvQuQK/HwL8QFeth5AsL6hVDXuVktgnA+oBuESaDfjyqkEC0s2VPBmyKxgV
X-Received: by 10.55.5.145 with SMTP id 139mr21378697qkf.77.1479206611239;
	Tue, 15 Nov 2016 02:43:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 15 Nov 2016 02:43:10 -0800 (PST)
In-Reply-To: <1479202785-20652-1-git-send-email-diego.ml@zoho.com>
References: <1479202785-20652-1-git-send-email-diego.ml@zoho.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Nov 2016 10:43:10 +0000
Message-ID: <CAJTo0LboEcommpQrRwz0svMtc-0orYVDCeZsW7Gz30brb92OEA@mail.gmail.com>
To: Diego Rondini <diego.ml@zoho.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xinput-calibrator: use up-to-date git version
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
X-List-Received-Date: Tue, 15 Nov 2016 10:43:30 -0000
Content-Type: multipart/alternative; boundary=001a114c8f849d02a8054154a097

--001a114c8f849d02a8054154a097
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 09:39, Diego Rondini <diego.ml@zoho.com> wrote:

> -PR = "r6"
> +PR = "r7"
>

No need to bump PR anymore, this is historical and when they release PR can
be removed.

Ross

--001a114c8f849d02a8054154a097
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 09:39, Diego Rondini <span dir=3D"ltr">&lt;<a href=
=3D"mailto:diego.ml@zoho.com" target=3D"_blank">diego.ml@zoho.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4nd" class=3D"a3=
s aXjCH m158676f416f9b6a5">-PR =3D &quot;r6&quot;<br>
+PR =3D &quot;r7&quot;<br></div></blockquote></div><br>No need to bump PR a=
nymore, this is historical and when they release PR can be removed.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a114c8f849d02a8054154a097--
