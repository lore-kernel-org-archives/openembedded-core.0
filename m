Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0B51B6B99C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 12:39:08 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id o19so3122806itg.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 04:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r1zieHSqVRZyDqd3TUjXZBLBcFHvyZuXYspJjoJarC4=;
	b=tGSBZ70bASvyaWmjsEdT7hLPmcHgKzVVFacUnKl21u3tYZ9O1hzVL6YDsBOr0tgOwO
	55jdk8TkIZFbT08ifvT2+x8FLydV/Wg5zkX2eGBdsHw3A3mAeaQU4FxClwV3JxU2g/ln
	xBx2eb7/GafDPzj+d0+q90/dGXqalX9/nYc66v5Z8R9C4bAGdpivaO5UPOjpTNvvcq+V
	D1ZickczDNofPB8Ol/cqBs/jX/rIn9KoiL6NkUDdqEGzN6SzzDnyWMEL+30k7wLgyF7s
	ZYXlIQ1PgblcIjQ2/m1tPh6YzfnZL9vEy3KN8duVW76KIvSBQGtil9Pq0mOYg4ESLJuF
	seFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r1zieHSqVRZyDqd3TUjXZBLBcFHvyZuXYspJjoJarC4=;
	b=ofWMdwvYKCloFaxr81BoPHlAVvj7ehAjhR1sn1xjXj+C4ZtudPr8jYc0yJusn91rkE
	mkhwB2ubSgqnyeYqIXpXzRWmmmolcG/s1H17pyf5+f1ENqveO7ZRmAUHRq2aV78Tp6Qt
	jQ4Tzi+NcGgEpoi8GOE3kDirG3RyhBIsT57CYCgomQc5a+1eq0Z8SyWN69zCNjG04E7M
	QyGxMWBZ1jKOV7bE2ltJISC5S2nD9wzw8KulpfhAjyRmMmaMRv4Y3ja6WPColEHnudnL
	lFVkJps1wlkSOZognXi4Lu8mNFmw/tCcQdVCFozvKoeorJN3aKc5zzc8obOjN8SNiKME
	BE9A==
X-Gm-Message-State: AGRZ1gJMyiRVWlsb+3Aw60Jnrfd2gpY8Y7ouS2pztXierzPvWjOdvUak
	8MXZKpBZ9h3rv1VXfqgtMoPlVy0Yx3XfSCGw0FNjGw==
X-Google-Smtp-Source: AJdET5eTZ1WSt98Kxmg4qhD2UcXSanMxnjNjkLDNSLBv43xo4x8JDb8AQEEDGQ4P3ZOui46pdDi4G8RPI80ed+jdliM=
X-Received: by 2002:a02:1e4c:: with SMTP id m73mr606412jad.79.1542026349978;
	Mon, 12 Nov 2018 04:39:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1541754319.git.hongxu.jia@windriver.com>
	<7ca3585dedd8a98d3b7d7f858f19ae69cd1b213c.1541754319.git.hongxu.jia@windriver.com>
In-Reply-To: <7ca3585dedd8a98d3b7d7f858f19ae69cd1b213c.1541754319.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Nov 2018 12:38:59 +0000
Message-ID: <CAJTo0LYLxciQZcMt+5SPBWKoOxS9C98WP_Te8LGDXciA6FmEDQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] rpcbind: 0.2.4 -> 1.2.5
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
X-List-Received-Date: Mon, 12 Nov 2018 12:39:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Nov 2018 at 08:58, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> - Drop backport fixes
>   0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
>   pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
>   rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch

packages/corei7-64-poky-linux/rpcbind/rpcbind: FILELIST: removed
"/usr/sbin/rpcinfo", added "/usr/sbin/bin/rpcinfo"

Ross

