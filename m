Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 396B87C673
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 14:24:32 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id l139so4674396ita.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 06:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=xDkYg3CUVkPjaAp98CUUGcG1KRgXxi0hbvdAS1X/9Bg=;
	b=ENGqF43KBNhB8ftMwqH25/TNNqVc09mhM4y+/BIN/GWsthigo5x+DFIYkZCoIHDT4Z
	dTri8uRAWnWA9y88sGjTHpiPUxn9McupKsnMj1zpJrrKadu91wiahnDhePn0zBLKgjJe
	qeAVjM6e1JIg4+V8axKyCj5ctqixPRqbIlk9iiv/6yhdhOoV5Dw9HrVO8lewxRiCTrDi
	ETWFLsKU9DJwnLZ4+yHEpvd+OfyX7s4R8OiiNtIKdpje7Y5NGEWw2a9cXjgiO9GWtfeQ
	uXAIHusvZ4NHO4eb9bZITAb/3Xe048AOIdhNK0OvoWmYNeHzYdC+RLhikDJ6HTFLaTW1
	1Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xDkYg3CUVkPjaAp98CUUGcG1KRgXxi0hbvdAS1X/9Bg=;
	b=K4NiJ6vBmig/ANroRH0FcWzKs5X+jlImoy8P2MaMddYDMuTRi4w092rIn9oA2cdZUr
	LCF3Ue6gTCZFcKLpHUH6+oB+84c4M+GNSouW272BRRIC/Fi25HDm5x5EYGfDPtXUHheO
	PLV4bcKdZYZ6H8wfR/9F32AYcvIvhrTCoWeHVLE9xBFJR9cDMtYJtR6w8HXN9kxqQzs+
	M7BUHbiUGmF/jbXLcNDM4bRjKSakHsouM8x2UqjBOvUv5V9s5FJpQXiUByEQxNCTL3ep
	i1hAqr1s3GMfNZYtBQ5JVfAy/Zvxvtzn6lNXEhuoPbltEPCrGYDhfSGhsolHES94AVHP
	MVpQ==
X-Gm-Message-State: APjAAAVuZzfzRMvDd6T76Jrxa+lbSsNIjqP0so9YN1mj4nqFQ7L45PFT
	lWfGWSE+LsGQIaizpRafSkA=
X-Google-Smtp-Source: APXvYqwmP0oij+7yhIK+4koR2YF/2hWg3yB68xir+bjaSnizeAxBGdvPbYoHVe84l2xXPx4FZ1RBZQ==
X-Received: by 2002:a24:73c5:: with SMTP id y188mr2802143itb.147.1551795873116;
	Tue, 05 Mar 2019 06:24:33 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g12sm3621688ioh.83.2019.03.05.06.24.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 05 Mar 2019 06:24:32 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <6d92a4f8d8eadb028ebea6b4e4c3c212167b9901.camel@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 05 Mar 2019 08:24:31 -0600
In-Reply-To: <CAJTo0Laz4+bSQOxvoijuHq382fuYrRBBDxG7FW4s3TsdqouJvg@mail.gmail.com>
References: <20190305024514.14753-1-JPEWhacker@gmail.com>
	<CAJTo0Laz4+bSQOxvoijuHq382fuYrRBBDxG7FW4s3TsdqouJvg@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add source package to ${PACKAGES}
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
X-List-Received-Date: Tue, 05 Mar 2019 14:24:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-03-05 at 11:19 +0000, Burton, Ross wrote:
> On Tue, 5 Mar 2019 at 02:46, Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > +ALLOW_EMPTY_${PN}-src = "1"
> 
> Is that what we want?  Empty PN-src packages for packages which have
> no source code, or when source splitting is disabled?

I found this while attempting to "targeted" debugging where I only put
the -dbg packages for the things I actually wanted to debug on the root
file system (as opposed to using the "dbg-pkgs src-pkgs"
IMAGE_FEATURES), i.e. IMAGE_INSTALL += "foo-dbg"

The problem I encountered was that I couldn't do the same thing with
the source packages (i.e. IMAGE_INSTALL += "foo-src") because they
don't exist at parsing time.


> 
> Ross
-- 
Joshua Watt <JPEWhacker@gmail.com>


