Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7774465CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 19:12:20 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id n190so234936435iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 12:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=UDVL9xfYOs9dhzZl2qy+piB7UWsB28x6d4pbSfeC5Mk=;
	b=dwS3nOb5Nu549MB5n5exB+88Y9qKyaw1Z1dA63HTAY3BnyWr1XHt9K4cUOJ/1uEbxF
	55bBakb8caND0XQggMosphqkSdSe0UzEdIUMtJjrGklq1NiwICBUd+tjziVG4bHZCa4N
	igtzS8JGGdVwXnY7Wi62EJhtw2mFlyxr3F9kTIZaZfe56kGVaA5Ppvi8zBBTWJfaje3e
	iUbFZMTokWu3TGd+tyCSYfrNQ6vCGJYqjCwiCsVMoQF+LkAX9+tFyh5avq5pKD+3+mgQ
	aQHetrzHHcudK5o/jtKg1ETPvIONFxohagfCPnIPaLRGztiiaJZL+AJxJfMW6H6j32ai
	yt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=UDVL9xfYOs9dhzZl2qy+piB7UWsB28x6d4pbSfeC5Mk=;
	b=Xja//PrM5Ud4jS3nBoryItqNHMM8wNYzuoVQnj6SjJj81kdRO/ix1AWycGtsUdE1xc
	xi3Z+/bLuD+ZekGuIfJW17sfu06QaDVcx7zZxlNnmZCK2RkK65iWK7owR5PPPBm0vtFR
	1GPH6IoZSYoU5GjR1+l2aUcmYkYAiwQoujX5p1jaU7urfC3H4W6fFIsPFEqA3Yb6IOao
	DO218fPxADu5PPDZWQeA5tDDOe+rFzLsrtBTtq7dnGgalxxu4XLACGxlLgbPZ1UpT0yL
	/TUoJIKW35btKrDmHNZS5VUnb16ZesvCjJmfHYTNmWLKZGYPdwtjoGORESjtul3zM/Ww
	IAPA==
X-Gm-Message-State: AD7BkJLqsk6Utqy3sqs/noLbM0CsxwzqS4h7ZFx2t5Kp4TVQpQvJwHKjwN5PGQ1zZbgEmg==
X-Received: by 10.107.138.224 with SMTP id c93mr28919099ioj.143.1457982740748; 
	Mon, 14 Mar 2016 12:12:20 -0700 (PDT)
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com.
	[209.85.213.169])
	by smtp.gmail.com with ESMTPSA id o2sm7172138igv.0.2016.03.14.12.12.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 12:12:19 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ig0-f169.google.com with SMTP id mh10so22224972igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 12:12:18 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.111.230 with SMTP id il6mr19339140igb.66.1457982738553;
	Mon, 14 Mar 2016 12:12:18 -0700 (PDT)
Received: by 10.79.91.133 with HTTP; Mon, 14 Mar 2016 12:12:18 -0700 (PDT)
In-Reply-To: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 14 Mar 2016 16:12:18 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
Message-ID: <CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 19:12:21 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2016 at 3:46 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> To allow the use of Framebuffer-only distributions we cannot force the
> existence of X11. This fixes:
>
> ,----
> | ERROR: Nothing PROVIDES 'virtual/libx11-native' (but
> |     virtual:native:.../meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> |     DEPENDS on or otherwise requires it)
> `----
>
> Error catch by O.S. Systems' autobuilder.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Just for completeness, this is only need on Jethro.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

