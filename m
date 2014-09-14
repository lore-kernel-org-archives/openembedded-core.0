Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3A35C65CE7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 22:43:59 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id i8so2932463qcq.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 15:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sktb209CIKx+lowGMbhV/Na/ABVZp82DOT5dij2pf3Q=;
	b=iGIrUWfVE58OL1x5kXf5HGYRd5GFkNQ//hEVYKQJqIMiQeJQpIpBHS48dI3owr8eeP
	0tnVRFGpuOlmU7AsJgV5fiaDGbr9ZMsdfGsGVh5kpqNz/BcSZuxUT4UdVFsEEwZwzBlE
	bDflMPH71V8GUqwdfb3kDzo6s4x5uBglMa5kGKtCXlbJNZdmPhB+WvYt+TUHj1COWopc
	ObppvKqcanKPvTl8JsJe3BIlLkn8gC6Krn+O8HB0pM8jXmjDb0VgcwHrLecGysbXZOCI
	RzkWugJL+AQL3fBHkVlsASrJYsoRocgi9i0M2PhqR6TdxKTXWKpzI0CiOQIEHWY5Iwzi
	Xk5A==
X-Gm-Message-State: ALoCoQksWIIeE1hJ6pQIG98CdyqYd6EujbCZID/BRdJVTL/JyCxvuTM5D6UQfoUfQjwtOScKqt9D
X-Received: by 10.229.231.68 with SMTP id jp4mr31471881qcb.4.1410734640958;
	Sun, 14 Sep 2014 15:44:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Sun, 14 Sep 2014 15:43:40 -0700 (PDT)
In-Reply-To: <b4b89028043c706ebd9e5d81d25f55224069e5a5.1410247971.git.liezhi.yang@windriver.com>
References: <cover.1410247971.git.liezhi.yang@windriver.com>
	<b4b89028043c706ebd9e5d81d25f55224069e5a5.1410247971.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 14 Sep 2014 23:43:40 +0100
Message-ID: <CAJTo0LZx+PrHbn=2imh1gpFQF2fnHaUZ6xbMeO8bhvixnWWOsA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix python path and enable libxml2-python
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
X-List-Received-Date: Sun, 14 Sep 2014 22:44:07 -0000
Content-Type: text/plain; charset=UTF-8

On 9 September 2014 08:34, Robert Yang <liezhi.yang@windriver.com> wrote:
> We have libxml2-python for native and nativesdk, but don't have it for
> target, and can't find the reason from the git log, libxml2-python is
> widely used, after looked into it's configure.in, we can enable it
> easily.

It seems like adding a PACKAGECONFIG for Python would be a good idea,
we don't want to force target Python to be built.

Ross

