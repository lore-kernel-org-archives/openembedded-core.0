Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF50D7F092
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 21:56:06 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j6so16001127ioa.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 14:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=691BQV/qgtPCnJllT+QRO+OStTrMqEei1ka0IN7JWnw=;
	b=IrySBfB53EgzOcZwq+jONkquhnGiqhE8L+w//bwWnDow1FKQTXG9++X5Z1+XqQ+WP6
	I3Oedoy4yGM9KslOH0mWtIDdAf6wHYQxexONCszhhtH43uyzMKW7FOuKFaC1VWSnHfgu
	cK+SBEZbRgi4xoV81GNWe6zeFWmENjaDhsbmLPQMexdThoDV1tMElCxbK1M2zDunI6Zc
	1r5BSmLwkEOMcpH1IXazzZGZb4kTOrRgQelZdmHPm/rTylOq1RKFBxwgpXIIFT+xru2W
	nU6Thl2GCdNcZ8TyUzCAjwv+ctZWSSnxNIsQADMYhxK29BDeQONj5rwLcrCEaIwSMjoJ
	oMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=691BQV/qgtPCnJllT+QRO+OStTrMqEei1ka0IN7JWnw=;
	b=EMEZRGKsx8OPNG9/jLzlThyZ3IxqRQMuxw4nWhIFO0HpS9zKFtQA+VYYVPtrFo5deG
	FRCHc2rdmx8mLJjzGJyhYTtZ5LK2TDuySYG/zwlTyuODbuEogEQCZrm0pWIY3owRo3Os
	X7QXNjbKk3hVs2LwWbFV/HrQ9ViiidZaWR+c7cuqTfRVSZAOqvmq3tokvPBB+jx7h/xh
	5jplABADWAujgMhZ+rPsi9VSodQnHNNQKiDpX+cf+TjLwfZSw4NSPfNXKqNnxZenfceZ
	hXveVxzbGW84Y3xlGl09DLPNj1NENy2eYCDpWO1LUjxc8WPThNaWowWI5n3LZu4oiNXJ
	zOzw==
X-Gm-Message-State: APjAAAXK/AAP0JyyDcLMu2wx6fYdU9vqytJv/XYOvIokZ35NrDa5D0zz
	qpCUutxwFysXA+lMGJJ7KTXbhIMJ/e9gOrpWlKcnRA==
X-Google-Smtp-Source: APXvYqzJ4qbrOU4p0LaIEnkI3t8SToSfSvDEK/mYB1IhHTKeOOG1jhftSEUOOPXiMlG7TnkcT20egWAV7WTgaw4HbN8=
X-Received: by 2002:a02:c7c9:: with SMTP id s9mr7077048jao.82.1562882167863;
	Thu, 11 Jul 2019 14:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190711202739.131168-1-joe.slater@windriver.com>
	<20190711204424.GA2092@localhost>
In-Reply-To: <20190711204424.GA2092@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2019 22:55:56 +0100
Message-ID: <CAJTo0LYnXYrkfa_HrU=QPxxngpP0qHsAUMkFENYGU=MCFGDZyA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libtool: allow for use of reproducible_build bbclass
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
X-List-Received-Date: Thu, 11 Jul 2019 21:56:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jul 2019 at 21:45, Adrian Bunk <bunk@stusta.de> wrote:
> The Debian patch for the same purpose simply removes the problematic
> line - a comment with the build host was anyways not important information.

Agreed, it's just a comment, and replacing it with logic just means
more effort when we need to rebase.  Ideally, upstream remove that
comment too, as it doesn't have much value at all.

Ross

