Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E11E578FC0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 09:54:07 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q8-v6so3770112wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 02:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WGfZvOEMKPzNfD2s8JzRorZLjmOQ+x7HTPCs3iuq4iU=;
	b=JQSEVfgSy7rQLOf8qur4eRs0rWQRkRGBJC1jR5GZ2EOXIt2Rk4sc67dztokqhw9Q/t
	WMS2PbZGYS/0FtIU/z22wN1euR4I21XGKFkD4hmWbhasspXG9Oxq5RoQrlx4d8adgZq3
	rwEybEiRONpjGGK1PiDMwJPkAEqNS+vokyHV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WGfZvOEMKPzNfD2s8JzRorZLjmOQ+x7HTPCs3iuq4iU=;
	b=dj7yO5biiXc1w20Kj1QqtgqSzhUBOxWwV91Ln4Khw+/okKBF5XugCWUKWoGnJDLTqn
	Nr333WJ3A+6YYNQNK4INcL7ageUSllNy7RwiPGOXRAmnPGazeYF+dVHax06AT75jt/Ci
	xrhOwuPxm6T3hUZOEL6lYB5GhX2CERumdrK77S/t5d3gT1DWwsOgzod55a+AwX+Q0y9o
	gItKIybz51+PMp55qlxwjXyCIpD+Ah1mPLOePRxTbgUl7eT8IdQULR6MyPDuQ0SL2WQB
	70ynDdug9PBIX+IsX4aK1AgISnwFwnxGmQ4wDDVibis3Uymkw9TRd1KFTlgzzcBoJ1wd
	qRyQ==
X-Gm-Message-State: AOUpUlHiu9kZcs4OOC0g53E+/ta7is8cYjTNt95hZWNHSi8YUN1LSpnU
	VfhzOs3HP8K96nrfALCP3CkTzw==
X-Google-Smtp-Source: AA+uWPxtWQ0uDLHaNnYsy2DG7AV4XS9yow8DDNQ+SyBWEuI/OV2fUS2IMoe/z17476Whsa+Wouf6yg==
X-Received: by 2002:a1c:af0c:: with SMTP id
	y12-v6mr14703706wme.87.1534413248527; 
	Thu, 16 Aug 2018 02:54:08 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u7-v6sm20392043wrq.13.2018.08.16.02.54.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 02:54:07 -0700 (PDT)
Message-ID: <b84eab657418f2b8e7747d36f0249e6930d1746e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Dengke Du <dengke.du@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 10:54:06 +0100
In-Reply-To: <1534151172-28001-1-git-send-email-dengke.du@windriver.com>
References: <1534151172-28001-1-git-send-email-dengke.du@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH V2] nfs-export-root: add it to nfs-server FEATURE_PACKAGES
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
X-List-Received-Date: Thu, 16 Aug 2018 09:54:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-08-13 at 17:06 +0800, Dengke Du wrote:
> When we enable nfs-server feature, we should add the required file
> /etc/exports installed by nfs-export-root.
> 
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  meta/classes/core-image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

We do not we want to add nfs-export-root anywhere by default. If you
look at what it does, it nfs exports the root filesystem rw:

/ *(rw,no_root_squash,async,no_subtree_check)

So if a user is it include that, they really want to do so explicitly.
Its find for debug and things like qemu testing, its not find to
automatically include anywhere.

I've just noticed it is part of packagegroup-core-device-devel and I'm
not even sure it should be part of that. That group is only used in
poky for the qemu machines though.

Cheers,

Richard

