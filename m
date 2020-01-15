Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 01A7B7FA41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 10:08:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q10so15110730wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 02:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=o80JVxACM1+g6eDWI2TZMJbtCN/HM2pZoJgE19HBzRQ=;
	b=atPz18DOhKtmGp+YMsCO8r50zYWD+RTXfvQvbdaLXZO8ajZxCUXTk+OclPmuHKGjhn
	ALtWpiJJ9RoSEnQN6t1rINCO9VlaF0VKybv5AxEj/WOxdt659tX2xyqRxLG8OCTz5a/J
	DwtM9/IpB///fw5hIA5T+P3K/zIwcwV1hkfeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=o80JVxACM1+g6eDWI2TZMJbtCN/HM2pZoJgE19HBzRQ=;
	b=Ykkbev0l+OUmUaHJ8jZS67/UAllvIE4AkqZiLCGic2qcAGnpYgF9JRWIzndcei0nNE
	duGMPZXy4GuemEJcURUrNiSruuVVAv452/WZDFTG3aCjda9KFJB+14DI2Rye4iqetfwC
	eOeJysKa0aMdgxdN9AhVmIv8UrMVNGm4fRd12MNNbtczM+I53+J2LhNpi6jDrPgJAl6H
	DxzZtHGooPE4BNQF1zjz9fjDUVgUMEZPmQKn3cOXuYgL+cN/ZQ7PxXx+AYGGNjpNwy/i
	hzC55CvApBmXo9U6AgCoMuTECb9ZKg2ZNZMp5aPuVffWSZOxkHZnpa2VX51342Dp4DYO
	quiA==
X-Gm-Message-State: APjAAAV6nMu5PniMPKmAWDE1qGb8b21/iSSJOiDZHfZ2dUfodh2zse9Z
	hZAyx02Io0pUsLknNuFSLGqnHg==
X-Google-Smtp-Source: APXvYqwUcmbX7VnCAIVvPciKZ6d9puqJm03yWjLgRLAdEtF56MwKxUP1aawtHw8jn9CRyQ227aHDWQ==
X-Received: by 2002:a05:6000:1044:: with SMTP id
	c4mr31037752wrx.204.1579082884480; 
	Wed, 15 Jan 2020 02:08:04 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g21sm22313897wmh.17.2020.01.15.02.08.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 02:08:03 -0800 (PST)
Message-ID: <f9bb7d730e2b52931abb910f8154c1840c065a28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 10:08:02 +0000
In-Reply-To: <cover.1578993027.git.Martin.Jansa@gmail.com>
References: <cover.1578993027.git.Martin.Jansa@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCHv5 0/6] YOCTO #12937 - Consistent naming scheme for deployed artifacts
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
X-List-Received-Date: Wed, 15 Jan 2020 10:08:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-14 at 10:12 +0100, Martin Jansa wrote:
> The following changes since commit
> b6d4150f9c74f25a4022a3fa0bd489a8e85deb77:
> 
>   gettext: fix typo in Upstream-Status (2020-01-13 13:07:32 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib
> jansa/artifacts
>   
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/artifacts
> 
> Martin Jansa (8):
>   image-artifact-names: introduce new bbclass and move some variables
>     into it
>   bitbake.conf, kernel*.bbclass: include IMAGE_VERSION_SUFFIX only in
>     the _LINK_NAME variables and change it to hard link
>   kernel-artifact-names.bbclass: use PR instead of PKGR in
>     KERNEL_ARTIFACT_NAME
>   kernel.bbclass: imageType without {}
>   kernel.bbclass: drop unnecessary package_get_auto_pr for do_install
>   *-artifact-names: include version only in the artifact links
>   *-initramfs: don't use .rootfs IMAGE_NAME_SUFFIX
>   images: respect IMAGE_NAME_SUFFIX also for *-testdata.json and
>     *-qemuboot.conf files

Unfortunately this triggered a lot of failures in testing:

selftest:
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/612
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/615
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/621
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/611
qa-extras:
https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/1451
qa-extras2:
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/1482
qemuarm:
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/1451
qemuarm64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/1444
qemumips:
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1444
qemumips64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1446
qemuppc:
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/1436
qemux86:
https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/1444
qemux86-64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/1448

A lot of errors but possibly only from a smaller number of root causes,
the selftest and step3d failures look like specific patterns.

Cheers,

Richard


