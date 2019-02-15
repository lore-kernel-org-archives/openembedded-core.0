Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A1FC97C765
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 16:04:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v16so10859396wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 08:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=+6s1AV3cq+EdzdKz2+RGQXeCz5wH4otEJYI9ts+X2qI=;
	b=JLRW1tdI07sTFN2uPvWUqQ74Hp1zLC+Q1oxzA3cAUYzwIaXMdVbyuu+uO5YkCurd4p
	2BnPIu7X000kqfp59onOGoryCHShPLgjrPymSGzLx09cHKzV2EZHlodPQUiAVgkRsRKc
	xdQQIyOvunruRQ5emWWvaM/Pg0YuWsbEsorqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+6s1AV3cq+EdzdKz2+RGQXeCz5wH4otEJYI9ts+X2qI=;
	b=BIPNoI1t6IP47BZoafHVnOCWmFFWfD3TAR/CiymVH3jdbLRh/n8+h/XW/yK2OZgx+C
	0EOihtMQnqZ+pJ91GwkgCsIBiN0iAc5QohNwnCQG37OuzpXKgIAi18rk/uz5YC0Imo8v
	xBGAz7NBHwgaQlUwM9EVvDW2Yx6PMtj5wgnTkq2d21TlF5tR3XEe3lgMC7iyEH5dQdB5
	bu/XdmYorW1EFbqGC64eas9m75Fw7JDvwoBdOPBumUJK0a6U6o7hlgwuRoIVTjc/M40N
	rWTVAR6FQNM2qQ6SO8fl97+nqQz/lxm7g2TH/wsMU/v1T909sjrcdDSUnJzXtBzodLZl
	pufw==
X-Gm-Message-State: AHQUAuakdqoBXnIY+4fydjHUEMBI/sbK2kvKbIoHGeKI4VTxPDxQlGKP
	G2U18i6XHDP6duZs8BXorMXypQ==
X-Google-Smtp-Source: AHgI3IaST2TPx3H5alvHQ+2fou2b+qWt2UAArQEZUedoZKxlvB9uB+YiPV3U4n4A4H8adgSPQmI3jg==
X-Received: by 2002:adf:ecd2:: with SMTP id s18mr6024647wro.293.1550246658459; 
	Fri, 15 Feb 2019 08:04:18 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id v4sm7650372wme.6.2019.02.15.08.04.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 15 Feb 2019 08:04:17 -0800 (PST)
Message-ID: <5488b4afbc5710c972e1be9f5c9c88d2a9aef648.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Feb 2019 16:04:15 +0000
In-Reply-To: <CAMKF1spu7DXTNqjEV4-oTryBxOnGo0ypcCv9W=A5OdibMcv6tA@mail.gmail.com>
References: <20190212054754.2801-1-raj.khem@gmail.com>
	<CAJTo0LYDstsDdmO-Y++5nkAuPgk4OFS+bpYTTYKh8edpzW=hkw@mail.gmail.com>
	<CAMKF1srYzGOXxXkHKG04_AB5xcyMKe1KTP6aoYqO3pQJr=jy0A@mail.gmail.com>
	<CAMKF1spu7DXTNqjEV4-oTryBxOnGo0ypcCv9W=A5OdibMcv6tA@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] busybox: Remove PN from rdeps of PN-dev
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
X-List-Received-Date: Fri, 15 Feb 2019 16:04:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-15 at 07:01 -0800, Khem Raj wrote:
> Richard/Ross
> 
> Are you able to reproduce the problem and have
> alternative solution?

Your reproduction steps needed "use ipk", then yes, I could. I've sent
out a patch which addresses the problem.

Cheers,

Richard

	


