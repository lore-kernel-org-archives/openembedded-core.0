Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4884C6E687
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 13:44:05 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id yy13so86186700pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 05:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=5KpecV4CP9Kn6BcQAVTNoAttJoQzJ5J4Uh1yJZfeBMU=;
	b=p1nMiuSk1allcWNIN/bFexoMxBFHzR34uRYAB9fA1DoLFio6hzU5ALPYsYlj+xke2p
	Q7CuVAR7PSROwidO+CSdx4TDVnu2iHYDeTEVF3V+N0YrPUATyYe4roL1Crgk0TUp1mQ5
	Agx0mDwucLvZnnu6uR2jrJ/w99Q4bfky47qPB48FcBjEBQdh9Wmx5RBVPFke73ZqJNUq
	keRijBQr/kJRWIjahFffaOXK5gyPpSIIDN2Su8vTCg8gQx71cJ/5rjRE4lOQnQM85I0W
	4cXw9EqROWQjOAKBO3E3aGRvuACOo04r1B4ecc35I1xE8o7K9ZxHt0V3uSUfBviUCLRF
	BVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=5KpecV4CP9Kn6BcQAVTNoAttJoQzJ5J4Uh1yJZfeBMU=;
	b=kXv6Rmh6t+t6rPYYzDSUY53vovqpR3+ErjsKsO5PeqqOD3ULo5ixBvxz+4xPZMFRoF
	asNcMgFoUPutndAvoBW+LqJOiCG8LNmCLbruC10lGO3a6Z69jCUZ7jDVDG+kFLHw9uQF
	4HULgh84V8aDysuinfffyXYy+0H/oWIze3K3Mxo0W5Bum/IkC4hGhqEi+FE8KPgPCHtD
	AKYKB/N1y/G4cYEcPQcLgXOzFOEL2L/4mv8YM/yVYH8kE1LRmlFa0TALIlq7R9ZadpGJ
	sfSea2rqGdkOsFTMgLiRZFHxpfV7ZoROgrnE7FV93GOaVQFQiGYlB+i2V7Vms7ZfxVgg
	ZOVQ==
X-Gm-Message-State: AG10YOTIt2viiD4elVLhPCyFUJzFBU/ciCFxCYLTnBgjiDRwjNVYzM5FCLuZ0DBtOSo7YA==
X-Received: by 10.66.150.133 with SMTP id ui5mr20111839pab.85.1455543846532;
	Mon, 15 Feb 2016 05:44:06 -0800 (PST)
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com.
	[209.85.220.42]) by smtp.gmail.com with ESMTPSA id
	li13sm16686602pab.6.2016.02.15.05.44.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Feb 2016 05:44:04 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f42.google.com with SMTP id fy10so46827055pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 05:44:04 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.151.177 with SMTP id ur17mr23265521pab.68.1455543843964; 
	Mon, 15 Feb 2016 05:44:03 -0800 (PST)
Received: by 10.66.80.194 with HTTP; Mon, 15 Feb 2016 05:44:03 -0800 (PST)
In-Reply-To: <1455460128.16142.400.camel@linuxfoundation.org>
References: <1455460128.16142.400.camel@linuxfoundation.org>
Date: Mon, 15 Feb 2016 11:44:03 -0200
X-Gmail-Original-Message-ID: <CAP9ODKryst11Tr3QpuCA87pDYdsezEjTwxpb2HOwcVvi32f+pg@mail.gmail.com>
Message-ID: <CAP9ODKryst11Tr3QpuCA87pDYdsezEjTwxpb2HOwcVvi32f+pg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/distro/include: Add no-static-libs.inc
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
X-List-Received-Date: Mon, 15 Feb 2016 13:44:07 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 14, 2016 at 12:28 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Maintaining this list in a common location is more desireable than
> everyone doing it themselves. Poky will switch to using this, OE-Core
> will need to discuss that as its default.

I support this being enabled by default on OE-Core as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

