Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2740C60B87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 14:24:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g3so6886956wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gsX47D1X76Nfh9RoQi9qUMylJR1nw9iyF/dlmJ0PE88=;
	b=YzG9UyI7fM94eF4xLSAIsArGqlZNHyPPGwBe0PsVW8lO3Dn+uk7miE0gD4IBLk2Igp
	d3ktFFg34CClafCgDXWm/KS2L5buN4xUvxN6WiPWThrSHaPxbQi9ri8l9vP5qKdhhCdK
	0qDJdoCVDMN3BfEKlLqLNGPi30R9vvBIrhI+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gsX47D1X76Nfh9RoQi9qUMylJR1nw9iyF/dlmJ0PE88=;
	b=QRQPUgpiitBD7vowXWbBmodDZ20U5j5fToJcLdZTmuvmCgku6Y3EZhy93ON+V4ChqE
	nDhY/LaiGl9UXYqWqJW+6FzI8wKmRbih+JUden4zvcCJk64oBQlBSAgAd6FesKl1AGan
	RFo3oIV3sXi/f+28odYRSnh/P8u1mykunO0X2+1uTKYD/2beQyhi4/oUYKBl2rnqPNzb
	66qrQlc9QRTOI3xnC86JHBAXEh2C7JfeJUX1YXJWh0RzDu5x3StdPXS1Hm1aj3mf4cU2
	g3kabfHbbN78Niq/B1tsgKWhyVm3QhvLhSWhmPFw3k0U6VbfShChtfqmBvc99MKwAuwR
	+alQ==
X-Gm-Message-State: APjAAAW1TcZfRVZ+fOVDh6tDVKV1JnN4rAq3qN8obGLn4di2Qpd21Y0L
	mSNDJHjb5zhTJvmq4EL82+zHMQ==
X-Google-Smtp-Source: APXvYqwLg2WLjLnLtag9ToORm74DReRyTAwaSqQBfQcjyNE41pYXdETuy+j9ijtiucexkXaJQncFXw==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr21497623wrs.309.1581603881548;
	Thu, 13 Feb 2020 06:24:41 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y139sm3310314wmd.24.2020.02.13.06.24.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 06:24:40 -0800 (PST)
Message-ID: <fea6b9336e34c7df3cd23217cf2715b04fbd9ae6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Maxime =?ISO-8859-1?Q?Roussin-B=E9langer?=
	<maxime.roussinbelanger@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 14:24:39 +0000
In-Reply-To: <20200210214211.2696-1-maxime.roussinbelanger@gmail.com>
References: <20200210214211.2696-1-maxime.roussinbelanger@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] wpa-supplicant: add virtual supplicant
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
X-List-Received-Date: Thu, 13 Feb 2020 14:24:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-02-10 at 16:42 -0500, Maxime Roussin-Bélanger wrote:
> There is a second supplicant raising, iwd. User should be
> able to switch between wpa-supplicant and iwd. Let's provide
> a virtual package.
> 
> ConnMan, systemd-networkd and NetworkManager supports iwd.
> 
> Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
> ---
>  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb | 3 +++
>  meta/recipes-core/packagegroups/packagegroup-base.bb           | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)

I know its not easy to understand but we don't support virtual/* names
in the runtime namespace, only the build time one (PROVIDES/DEPENDS).

Grep for VIRTUAL-RUNTIME to see how we handle this (its ugly I know).

Cheers,

Richard


