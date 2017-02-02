Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7A40471B0B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 12:40:44 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id k15so27733620qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 04:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lPI8jk0hHeVeW0eFKsUeaYP3FdPCZQJpNCSj4pxDuZA=;
	b=UgkyNNLPBPFMDHehiltOsaRGPLyWcUF2okh1ELuXBrzu2jgWdf5HsQyRpyO3aCs7Vk
	DqJc0LoywwqZBQZqe/OJOyVEhgtMbLjLuPtqjSvFQmCWsIRMpu7swhceNY+NrtZaREMI
	rmo1l37A5rtcBvWya91aFAeLDidDyDiLIy4j1wIMBUTUFggdJ8ayJH6TeVvpmyfU4VZn
	u7brvnNjDc4UzlwEM3DNybUdiCtWOPxDMOW72IXx243XjwoVx3U8KMQW0szUKP4YrTPC
	K7coC5OwlbRN3fID7EdsbAjkb4JQennKYBoPRPcBhGyxQwCiCCTWydxisbzBtnejcBV3
	P50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lPI8jk0hHeVeW0eFKsUeaYP3FdPCZQJpNCSj4pxDuZA=;
	b=ejZ/IH5MJ1khcPjBCSUbDTmO1LqlI9Rt2/CCFMLoiTmcSAVYD2MbGFQnXr7yvx4XcW
	g95xQCWQ6MGRjrETblPD9uIAGy4eVVnFk2A5N45DYQfurY6tb20rRSlSGu7D9kd6K56u
	xqS70XykA5IrUzq0B/E+6ndSpt842vjfcnWhx/lxpXgeiV45DZZ3aL05qYfMhNS7/Asr
	txFXV4a2LKSfyizetTulWrNr/hVIgj3WaN5Jpso+1FQ1Wt29Ow8RhCiacQkl0MRPq7ja
	8AEuQLpor2WwlQ9VfCybIZ5O/oy/c1Ha+1RM5qBzQDyUbbgTzfSzI+zpQPy95DAvj0oN
	SUmA==
X-Gm-Message-State: AIkVDXL2eBbY9jiPdWS5BZJNp5IpJ/EGoF6Jr7Vc2qpJthXBA4zoAoyTI7dF1/dSWytkyh5YMEPxz5YmQl1Gz1pd
X-Received: by 10.55.175.195 with SMTP id y186mr7688638qke.26.1486039244281;
	Thu, 02 Feb 2017 04:40:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 2 Feb 2017 04:40:23 -0800 (PST)
In-Reply-To: <6e39192de91d20d920b9f4982e669874aa659625.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<6e39192de91d20d920b9f4982e669874aa659625.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Feb 2017 12:40:23 +0000
Message-ID: <CAJTo0LaS3L4ZssXj=MM_4SKhpLUB8Cf7vO92TDv3NM6_Fsrujg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] selftest/buildoptions: use a thinner image to test 'read-only-rootfs' feature
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
X-List-Received-Date: Thu, 02 Feb 2017 12:40:51 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c477c2605478b79a5

--94eb2c06093c477c2605478b79a5
Content-Type: text/plain; charset=UTF-8

On 31 January 2017 at 22:50, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> The minimal is much faster to build that sato, so use the former to test
> read-only feature.
>

What Patrick and Richard said.  In particular, it's things like the
gdk-pixbuf and fontconfig postinsts which we need to ensure are not
delayed, and these are not in minimal images.

Ross

--94eb2c06093c477c2605478b79a5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 January 2017 at 22:50,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leona=
rdo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.=
gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":6vv" class=3D"a3s aXjCH m159f6b31f98d68c2">The minimal is=
 much faster to build that sato, so use the former to test<br>
read-only feature.<br></div></blockquote></div><br>What Patrick and Richard=
 said.=C2=A0 In particular, it&#39;s things like the gdk-pixbuf and fontcon=
fig postinsts which we need to ensure are not delayed, and these are not in=
 minimal images.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--94eb2c06093c477c2605478b79a5--
