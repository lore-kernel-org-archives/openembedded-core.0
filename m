Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1443E77168
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 17:57:46 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id s64so18198414lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2016 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=I7Sp/ha9InP9qpwDlwa0YhLhuDNNRowqwSXQRc0DMUs=;
	b=J/lSjELE+IuJAmUkNsZBqG98XG9GqRwktXmjW4UiDqrP8HtYp1wqCFLMbArou1TizY
	RqDWs1hlt0G0ouEPG2X/67YAs2TwLXdPbJoQtXjNSxC/GMmnOU7MIq6jCawx1MLm7lQh
	BuRopFYY4t3Iek/Ukmr0U/kR92cDj5c7vTbXfCMaMD4xfy9/E1k+6Y9wCN9lBu3G2YpW
	ebf7oudOKXitETjdR8Pn5Qcsx5uD8Mv/64iztKo42hqVtEbtFE8qAADgxjtnlOJaFxet
	WiC55yG9b4+3iZIIWnYJzzg1oqV4IgoXqCnApMfvT0mZGFSqeMcaHgPPDpeJowZTOcPa
	R8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=I7Sp/ha9InP9qpwDlwa0YhLhuDNNRowqwSXQRc0DMUs=;
	b=D1b9GAyJFg2ZOemWyCxOLG37WmoZKMlmWMEocpMZgnM6PYY12q8m76xzNgyd23hpSa
	R0NROpsueWEaiWpeY78eb+7KAb0BJWmMWz95wiqmC4GifpuzsjaprFEY7T3BgiNduLWP
	8WvpxHdjqx4Ecard5+f50NaVMmhJklpQ0NTj9NiqoeaoL8pA1//Es3J2iv46vdhnBpvs
	QTtBF+9eiuRDVicZnzaDrUTsfW69wcINvpJGXY7T/8atRZNWxjJQVJbaN+gBaXalXvl0
	7XnWgNCCbs1ZGCtq5sVMKSkuyVWHbBVxNvdC85NfUlrBrUpaX0IPFkMcoorw6dpnuIQl
	/WFg==
X-Gm-Message-State: ALyK8tKv36wHD3Rf5WYHYZMOLUd969rsjIv6L0QVAfM56Ym/IS8XCPEDD9ALnFEMvUVA6g==
X-Received: by 10.46.5.133 with SMTP id 127mr2184640ljf.8.1464803865190;
	Wed, 01 Jun 2016 10:57:45 -0700 (PDT)
Received: from ad.chargestorm.se ([212.214.9.162])
	by smtp.gmail.com with ESMTPSA id
	g69sm3672889lji.20.2016.06.01.10.57.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2016 10:57:44 -0700 (PDT)
Date: Wed, 1 Jun 2016 19:57:42 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160601175742.GA4052@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1463734861-23862-1-git-send-email-anders@chargestorm.se>
	<20160601100059.GA2600@jama>
MIME-Version: 1.0
In-Reply-To: <20160601100059.GA2600@jama>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [PATCH] lib/oe/rootfs: Fix DEBUGFS generation, without openssl
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
X-List-Received-Date: Wed, 01 Jun 2016 17:57:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Martin Jansa <martin.jansa@gmail.com> [160601 12:00]:

> On Fri, May 20, 2016 at 11:01:01AM +0200, Anders Darander wrote:
> > In commit 20ea6d274bb0a9a5addb111f32793de49b907865, debugfs generation
> > for images using opkg, which included openssl was fixed.

> > However, that broke the generation of the opkg-based images, that lacks
> > openssl. The error is a python stack trace, showing that shutil.copytree
> > tries to copy a non-existing directory.

> > This relates to [YOCTO #9040].

> Please merge this to krogoth as well, the first part which causes this
> issue was already merged as:

It was sent as a cherry-picked commit marked [krogoth] the same day this
patch went into master.

I've sofar just assumed that it was delayed due to the hard load on the
autobuilders.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

