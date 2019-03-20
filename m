Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE646C45B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 13:43:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y13so2842427wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=86YTjdqRixGMefNUhNPcswUpThb6bItQs677YvbUR2I=;
	b=Iz7rt4XqF+4IaeURIznJP2aqzGhZ5nyPJAuRMWOT4tMuFUDcnpAoXESyhXLxksBZAT
	UmTFvTVdQigGHROpDqvSYgNpdo8ylPQwLpNJmVrey361nIjqZ5PwXbwYi/K9is6dMrRO
	jMJ/JulUYa5LnWY4cjvHX/o/Tw94qT2hQLKpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=86YTjdqRixGMefNUhNPcswUpThb6bItQs677YvbUR2I=;
	b=c9Q729D4dCdHOKbiWB2vUKDCS7VHxhdzzCKBBd6RTTxLD8siro2THGAPVWBu4ZnyHq
	/5CxwUQ99Eh8oVlz69qKmZs5hPeHyJ2o6lclOxxIQXHn1aYRHJIVT/vwisTE4hC76F51
	QJHj+/a5gasDuNTBGpXA5DOcrhj3AXUbWWNPfJdeYjxess3RzwqcW+3Nmo8nWJEFhuAQ
	n2B2iWfTl51PBmyBOOYpcWq4R/L1OJ8c21V7IbKykpKNlGSdGeHXWPH6s71fo/yiktEi
	8nSnT9dpJOqkfhmn4fkIcjmwaNfGRlOZx2O7E117Du0e5bnkgl6nlRYcBqJV6W0csW6/
	v/1g==
X-Gm-Message-State: APjAAAUwq0FF7DwgBhoePZBG02/f0MlN7KmsKbfeYTq7DRk5gzwp2V4F
	LAg4docFiYo+WIRAfzeKRRQvMA==
X-Google-Smtp-Source: APXvYqzWc8Uk5EdtBIb1RIdzOl2QvnklzNN3GPkFtKRIXBHyC1RMW2GahJKDKQPmcFIbm1oWNIeeZg==
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr21462359wrw.314.1553089408655; 
	Wed, 20 Mar 2019 06:43:28 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t62sm3303564wmf.15.2019.03.20.06.43.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Mar 2019 06:43:27 -0700 (PDT)
Message-ID: <b8806868b4e27cf4d9f7a1017eb5aab904348094.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Adrian Bunk <bunk@stusta.de>
Date: Wed, 20 Mar 2019 13:43:26 +0000
In-Reply-To: <CAMKF1soQbssBdHEgmdGmeNFPWWQH+FdRbdzBuPDo_TOdnY0oRA@mail.gmail.com>
References: <1552383718-62708-1-git-send-email-changqing.li@windriver.com>
	<20190315104552.GB14180@localhost>
	<CAMKF1spft7gbJ983GtbyVtjXO5hECMuTqg6TM1bV2ozu0Np_CQ@mail.gmail.com>
	<20190320052115.GA25499@localhost>
	<CAMKF1soQbssBdHEgmdGmeNFPWWQH+FdRbdzBuPDo_TOdnY0oRA@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mdadm: fix gcc8 maybe-uninitialized/format-overflow warning
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
X-List-Received-Date: Wed, 20 Mar 2019 13:43:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-20 at 08:59 -0400, Khem Raj wrote:
> On Wed, Mar 20, 2019 at 1:21 AM Adrian Bunk <bunk@stusta.de> wrote:
> > On Tue, Mar 19, 2019 at 11:51:47PM -0400, Khem Raj wrote:
> > > On Fri, Mar 15, 2019 at 6:45 AM Adrian Bunk <bunk@stusta.de>
> > > wrote:
> > > > On Tue, Mar 12, 2019 at 05:41:58PM +0800, 
> > > > changqing.li@windriver.com wrote:
> > > > > From: Changqing Li <changqing.li@windriver.com>
> > > > > 
> > > > > while compiled with -Werror=maybe-uninitialized/-
> > > > > Werror=format-overflow=,
> > > > > it failed
> > > > > 
> > > > > [snip]
> > > > > > Incremental.c: In function 'Incremental_container':
> > > > > > Incremental.c:1593:3: error: 'mdfd' may be used
> > > > > > uninitialized in this function [-Werror=maybe-
> > > > > > uninitialized]
> > > > > > close(mdfd);
> > > > > > ^~~~~~~~~~~
> > > > > 
> > > > > [snip]
> > > > > super-intel.c: In function 'apply_takeover_update':
> > > > > > super-intel.c:9615:15: error: '%d' directive writing
> > > > > > between 1 and 11 bytes into a region of size 7 [-
> > > > > > Werror=format-overflow=]
> > > > > > " MISSING_%d", du->index);
> > > > > > ^~
> > > > > ...
> > > > 
> > > > I am seeing these warnings only with -Og, are you also seeing
> > > > them with
> > > > -Og (DEBUG_OPTIMIZATION) only?
> > > > 
> > > > If this is true, I would consider
> > > > https://sources.debian.org/src/mdadm/4.1-2/debian/patches/debian-no-Werror.diff/
> > > > a better workaround.
> > > > 
> > > This seems a broader brush, I really dont like to relegate Werror
> > > if
> > > we dont have to, because it will force us
> > > to fix the code.
> > 
> > How are we getting such fixes properly reviewed?
> > 
> > What actually happens is that the easiest change that silences a
> > warning
> > gets applied.
> > 
> > And for such bogus -Og only warnings there was no problem in the
> > code,
> 
> so then probably a better fix is to add -Wno-error to DEBUG_FLAGS
> which will limit it to -Og case, and revert the original fix.
> 
> 
> 
> > meaning regression risks by OE/Yocto-only patches without fixing
> > anything.
> > 
> > > However, I am seeing it fail with clang now
> > > 
> > > https://errors.yoctoproject.org/Errors/Details/233618/
> > 
> > This is caused by the "fix" for the -Og gcc warning.
> > 
> > Which looks bogus, and might be harmful.
> 
> I think that is right. the fix seems to be regressing on gcc 9 as
> well so it has to be done differently.

Agreed, we should revert it, its creating more problems than it solves.

Cheers,

Richard



