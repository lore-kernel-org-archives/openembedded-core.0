Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2C95F77251
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 16:29:13 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id t79so2313177wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 08:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DCrZk2YO4X6IHJvCxQoSGSRuPgiYAYOYFNdTOKb3QxY=;
	b=aHVS62mtBbjZxdf0UkpZ6337SxrtcOr5xvCF0oAQkbY4EPUhDtRG3NgCEzI1tAwjUO
	BOlCBQKMTO+Q3L+ctw11/r9NYSENsgItC4HbTzKhfwl6CGUP1qNOEoXhTcVxfnfyePrM
	M6z2pGfoyCiAK3DV40dTCyvXUnAudPeRsTHEXoIpa9Z5LOeQ/LHiUlfgjlR+ghNBhuBa
	G5HcsEVLAEGw+mwNlyIQYgqNEf2aP/zVek7n0ZkAj/J8ZBCUGiJp/2sxX2TLB4y/u1Fz
	FNVtF057NlcG/POgcZljr4wxrcDwL0PL0209MtD9V6qDxvjazJOJ7zlk/dWuv/JxSQdy
	LWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DCrZk2YO4X6IHJvCxQoSGSRuPgiYAYOYFNdTOKb3QxY=;
	b=EM7tV65fMtwmzAQSiwid2vI9FJMtcUcjgjIfL8lCuxUaQfMZtyIGg3gYpHeKPp44qe
	Wd2TAlZY6mQckya5EPQ0zJSuMZWkd4IdlGUlFRRir95e6cNjvUxM7AWCMStw0rZSGWWR
	FuCLSO0YkA7NXE3e6lDJKoMu+D8yYMpfg4jYLAnmzzQZ8AW+CaeCPAryGMcVzga5/QYu
	EQdsI8k+pmZ3Gs9/LzDEkYyRHt3WGP7m3Ar+hECv260R7G4KadTNniuv3DYIgi/Rafkr
	BFSj/1Mx+fOXT+8GUNKLf8Hrim1duaZzcgERP67gpq/BcKFlgaFQ9qzdvpSd+kM/eHnH
	oRZA==
X-Gm-Message-State: AKaTC01Xab7Ko1y2nofyGQpmiZoR2fTtqwd6RShclAN4tTLYaGbRHzDpeao3SbZy3RkVjA==
X-Received: by 10.25.145.91 with SMTP id y27mr22448403lfj.29.1481732953972;
	Wed, 14 Dec 2016 08:29:13 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	9sm10891875ljn.20.2016.12.14.08.29.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Dec 2016 08:29:13 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 17:28:51 +0100
Message-Id: <1481732934-5128-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20161128111825.GA16035@linux.intel.com>
References: <20161128111825.GA16035@linux.intel.com>
Subject: [PATCH v2] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Wed, 14 Dec 2016 16:29:15 -0000


Alright, this took a bit longer than I expected, I had to learn a bit about the
test framework in OpenEmbedded. But here is the updated patch with additional
patches enabling tests.

Two things I'm a bit unsure about: I had to add a path to the wic python script
in order to use the copyhardlinktree() function that was suggested earlier. And
I also had to modify the path in the test itself in order to use the e2ls tool
which I provided in a recipe in order to inspect the image. I hope those things
are ok.

-- 
Kristian

