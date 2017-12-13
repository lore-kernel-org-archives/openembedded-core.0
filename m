Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 57E777887C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:30:31 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id b184so2156488qkc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 06:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=s3b439GybIPg2Sem4pUAVvrIKlQFW5T7DiN4gtBUvFo=;
	b=gwtjhICX2wKuzt4ccbs+VfoENNqNBJNJQ2n9btPYoN4i6Bq6ymfbcm4kYhqlvKFctr
	AaE7juj8m1QXOe9BKzPgdO3rYSFKLDqQlkf0oxdlV3bfV81ItMPZeWXNsCDO74B03970
	pEhyo6dymQxUkGsP/FJ4S1Pa6lUN0EIWhhFGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=s3b439GybIPg2Sem4pUAVvrIKlQFW5T7DiN4gtBUvFo=;
	b=RXclf45a1Z0PNTun7FBCY2DCSI4fErOtYukeUpAXZuHBKev//5qwoIUClBXsptd6E1
	Oj+dYCRA+g0s2enA86YiulY+ZDeqSzOYJzdi0ED106MtvqTu094AArTwYIfl+9u9augy
	VoIuYwCM4JvgCUSac4mF7al4e26s+Z1lIiULDXM71KCO/56CyBx0jEVmGHh3hIKb4wNS
	5crkL9LYyJgAippUBwKIzJdGYrRilTxY81neMebwtGO0DUQ8RyuYz670JHFr8b8bRQvt
	8qjyb6j0AfwW5EkNk2JcDmYjmIrnMMrX0uH8J+Xq5/SWV0c79tgcHoqSGiEG7tvORQnB
	q6BA==
X-Gm-Message-State: AKGB3mKHaff/+kBW4MwXH0W8nX7KhauGMRInY/p8QrOg74nbYWDm0FGr
	T5UDZHMelpRG0ZznqrbXx3DYow==
X-Google-Smtp-Source: ACJfBouCiJm95MfmKsMyrRK4y/noyDn7zim/SDo2A/6sEP+2z7eBAeQXYxM3hNImnD1h+haChtEkUA==
X-Received: by 10.55.25.22 with SMTP id k22mr10130937qkh.120.1513175432349;
	Wed, 13 Dec 2017 06:30:32 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	i35sm1094401qte.96.2017.12.13.06.30.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 06:30:31 -0800 (PST)
Date: Wed, 13 Dec 2017 09:30:30 -0500
From: Tom Rini <trini@konsulko.com>
To: Kristian Amlie <kristian.amlie@northern.tech>
Message-ID: <20171213143030.GS372@bill-the-cat>
References: <1513171550-25534-1-git-send-email-kristian.amlie@northern.tech>
	<1513173807-26292-1-git-send-email-kristian.amlie@northern.tech>
MIME-Version: 1.0
In-Reply-To: <1513173807-26292-1-git-send-email-kristian.amlie@northern.tech>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] u-boot-fw-utils: Fix broken makefile in v2017.11.
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
X-List-Received-Date: Wed, 13 Dec 2017 14:30:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 13, 2017 at 03:03:27PM +0100, Kristian Amlie wrote:

> See the patch for details. This patch has already been applied
> upstream, but we need it for v2017.11.
> 
> Upstream-Status: Accepted [http://git.denx.de/?p=u-boot.git;a=commit;h=ded84f90a1066eef5f34daa4539273de64f7b811]
> 
> Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

