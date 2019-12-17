Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E02637EDF1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 08:51:46 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m24so2034786wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 00:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+jSY7cN2QYAuPOvLW2zk5vANMuAEl4U2WEJ/zeJxI2o=;
	b=fp+DSn5T4XAvQqu0LQ5CB1BX8/foEskj5VM4x/GScGfVfknof6HlRkneVb5DRSXaqO
	GdE6pKA6iO3PrI8+SHYSxTeYt8Sps65KFVGAEcDwZRWvHsNP8xAbQSZRsIlGSbLc2iyD
	q+oOW2tkvKDelqtZkEs602VP/mOSc28V2CtNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+jSY7cN2QYAuPOvLW2zk5vANMuAEl4U2WEJ/zeJxI2o=;
	b=pbRTpoStIH0WJd3N1p78deq+SnTKK1UvCW4ayPdlo+fNFKo+FoMXOTjXlk/4KCkraR
	MB2B8mXdL2fYdtV2P3DZJou7KzzC/ZvlaAC9DIewAfseA/kVeYodYvO/1qTra7n3cc7g
	aly1e/25iBqlZRPCinl3LfUDedF0mN3Fy9LcczOouYhd3amki/Fp+XN5aUCriP0HGQXL
	p/8bTwESp6kycONraBD05TTdJ3uyP23OD7uK3Jd0r/NQyXylo4WSlpA/h1sNfT8lqhY7
	wlW7UPd+5nbz0RKipK1iWHw9YowLhq34Z14h0sj2yX+wCZDmsd+IOYxN2L+8EHqYGv2w
	We4w==
X-Gm-Message-State: APjAAAWTJzV2weGh7VlHSr9e9gx8r5dSTTzJUAWtBqVCJr8di4FArNuA
	02ub8AL9W0YgLSFjSboVW5zCag==
X-Google-Smtp-Source: APXvYqwM+PkrvPFry2A03ZA5D/xi+qqZQNSkNUDPKVznfwgHBgrG/mvaJiCUrq84vLo5EtOdl3ij0A==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr3734032wmc.145.1576572707433;
	Tue, 17 Dec 2019 00:51:47 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s82sm2296142wms.28.2019.12.17.00.51.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 00:51:46 -0800 (PST)
Message-ID: <f61025197cf0939a1f769d595fb9df70e599f237.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2019 08:51:45 +0000
In-Reply-To: <20191212181436.1322-8-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-8-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 08/30] shadow: update 4.6 -> 4.8
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
X-List-Received-Date: Tue, 17 Dec 2019 08:51:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-12-12 at 19:14 +0100, Alexander Kanavin wrote:
> Drop two backports.
> 
> Remove 0001-useradd.c-create-parent-directories-when-necessary.patch
> as upstream has addressed the issue:
> https://github.com/shadow-maint/shadow/commit/b3b6d9d77c1d18b98670b97157777bb74092cd69
> 
> Rebase the rest of the paches.
> 
> Add a patch to remove the check for validity of login shells
> which does not work in our environment.

This upgrade causes this failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/1346

ERROR: core-image-sato-1.0-r0 do_rootfs: [log_check] core-image-sato:
found 16 error messages in the logfile:
[log_check] pwconv: Failed to flush the sssd cache.
[log_check] pwconv: Failed to flush the sssd cache.
[log_check] grpconv: Failed to flush the sssd cache.
[log_check] grpconv: Failed to flush the sssd cache.
[log_check] useradd: Failed to flush the sssd cache.
[log_check] useradd: Failed to flush the sssd cache.
[log_check] useradd: Failed to flush the sssd cache.
[log_check] useradd: Failed to flush the sssd cache.
[log_check] useradd: Failed to flush the sssd cache.
[log_check] useradd: Failed to flush the sssd cache.
[log_check] useradd: Failed to flush the sssd cache.
[log_check] useradd: Failed to flush the sssd cache.
[log_check] groupadd: Failed to flush the sssd cache.
[log_check] groupadd: Failed to flush the sssd cache.
[log_check] useradd: Failed to flush the sssd cache.
[log_check] useradd: Failed to flush the sssd cache.


Cheers,

Richard


