Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 046E07DED3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 21:47:39 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y5so455820wma.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 14:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=mmhlxPoX6PmwoifRS14AOUhE1XJ/e2mYLWmEat7n7zw=;
	b=HJifmoYmVdYbNjlbvpgonTxilcQBvbNfnkxQdcPMyoJxQjs0aFuZBgqbxvr9mhVQaI
	eA8kdDrsd//ekHHHV5uDkXteKt48i+d+CI1RVJH837U/BZhu7qvx4YxraQcYr+bNxkZk
	vxSq3zOY+c/zm2CvWibtNGrDw1mbpd2jJlvg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mmhlxPoX6PmwoifRS14AOUhE1XJ/e2mYLWmEat7n7zw=;
	b=BvaXp/TP6V3Mwpxvs1S44AxnEpZPedsUgEQbp5Al4ZBnVpQZzYBGVtGqZwOOmsnHhY
	jD5wN9/F6VBkOakvAl1pbX6U1we2q71DNvrmgySfKXcgHPFURNsj1fY5CS5BdKrfiabN
	WTZVO8nPVVP6Pp+qpQ+iG141NtI7T2M1scWa86B9olwNERWWYFWziAzcb7EohDl4NA6S
	tZW/BjGsB1b/PYjIk0CtRYZXB3SA8bUei4wDF1fugd/hlpCNKYHWCyrqcfPnk7TSMhiu
	kyorvH1170JvaOt6EAo7TtTF0LxD1MQcf7zV5Vs3KI6fmBByl056Zue9jt2WbW+5uJgK
	8jCQ==
X-Gm-Message-State: APjAAAV0NWs/Z8EoW07TmyaVR+SP+LOqJ1wFftgGSGnYahqGv38pf0nX
	hlOdd1hAtuFUaNtIEWu87s7PbalyXec=
X-Google-Smtp-Source: APXvYqyv+Y0qFTr9E2XFTv5YoZLXPPN4ku1ktxNMediv11XvZbhOoV3h20mdUvsiHHPhPYy9K6n3aw==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr278975wmh.86.1557352060648;
	Wed, 08 May 2019 14:47:40 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id d14sm37352wre.78.2019.05.08.14.47.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 May 2019 14:47:39 -0700 (PDT)
Message-ID: <2909bc2066098ba29ccd864c0a4b4669ed2d7735.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Wed, 08 May 2019 22:47:38 +0100
In-Reply-To: <20190507131151.31070-6-bunk@stusta.de>
References: <20190507131151.31070-6-bunk@stusta.de>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] ccache: upgrade 3.6 -> 3.7.1
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
X-List-Received-Date: Wed, 08 May 2019 21:47:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-07 at 16:11 +0300, Adrian Bunk wrote:
> Remove backported patches.
> Switch to new download location.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

This patch caused an unintended side effect which you can reproduce
with:

oe-selftest -r buildoptions.ImageOptionsTests.test_ccache_tool

Its the change from .gz to .xz which introduces circular dependencies
for ccache-native.

(one of the issues in 
https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/456)

Cheers,

Richard


