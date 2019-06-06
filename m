Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id F3E2A6D52B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 22:04:44 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id i21so2471971ita.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 15:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tUKVhQgb4Y7yINWp9CWtY20N4KeHAJbA31YzHnt9bzA=;
	b=BYsULIFtWV4uDKQx2chKoxZxocWWVL5PyGNPuJkMa5BKNQJL9mdt4uFuUTismdsRVV
	0ZoaU0ejUfeXbHd75wzyXItEXy3jJcxatzCu2b9FFnjnYc/x7OCFFO2p49g5LODoKcK2
	H6mD7NZ4ldz9/IhHZG+IkxFNGi61tMfx746+EZO+IzlJzCp+JjatCWtx96VcwQDGXWL7
	1OVuCiTnOQkWeMTTl3cQcuWT+PzoUV7dlmLVOekeEDZiJ4w8clVvo4lkayHwcmZPJOEB
	lP+MaIMiuj+Fm59POgHGC9OTxoYB0eT/Jj+phBfQAa3rDG/3Cg1q1OtEhXjxsxC/1ld1
	gAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tUKVhQgb4Y7yINWp9CWtY20N4KeHAJbA31YzHnt9bzA=;
	b=uQkBFn/uO7LtLBVb/8+mHD6KG47WjUGoDLcd/OrJ6ouWQOFCC3owF3JbuC9BaVNthw
	DSzGVacOzky/mxCWgGMF5BaNsSE/e1XP+FQjUPaRLgqgxaoBZ6R0tnODU1bp6Hq2X/g4
	aOUHB49Q6vd1dTwWcYh4fi7M7qPUJkvVfSxzhV21Cei12IhlX2w6pNqL/sdFJPDQUCdD
	H1DhCzjMEwWAudE0MI7pNlztv5Uevi29KAOe4JLubIc/tn4yrg/zXw6lT7FXevN//x3w
	dVDml0qJImYqQMdWe6uNmoKE9Xd7FfULHkmeGXhovqgWL4p0XnmOZB+HeiUCJIAgNYUZ
	RMgw==
X-Gm-Message-State: APjAAAXF3xoUbu9Apa4B1b0mNUCuiVxzV4PyY7E0ZCG2bsUt8iwBtqCn
	sVt9vSbXDIlfVOQyL9SuFkOGOzULjJzV7YHMeQEgkg==
X-Google-Smtp-Source: APXvYqysdYzxZGu0cotx+QjDscdq9xEiKIwQjzDoWcnfm/PynSrQT+OKXnvSancZDLKr56vmDqFRtLKiRNsSEx4Qgs8=
X-Received: by 2002:a24:19cd:: with SMTP id b196mr2026956itb.74.1559858685862; 
	Thu, 06 Jun 2019 15:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190606020544.26181-1-douglas.royds@taitradio.com>
	<CAJTo0LY8p=p=6kOxQBkrUPXi_EPTpCnAXzrp7con1q7pOxj0EA@mail.gmail.com>
	<d958f915-78aa-57b8-6f31-0d50806685f7@taitradio.com>
In-Reply-To: <d958f915-78aa-57b8-6f31-0d50806685f7@taitradio.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Jun 2019 23:04:33 +0100
Message-ID: <CAJTo0LaUOJW8kFG801bZw-PH04Rc95Oy-eo7+VoQeMPEZ0TcYA@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] json-c: Disable icecc to avoid implicit-fallthrough warning as error
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
X-List-Received-Date: Thu, 06 Jun 2019 22:04:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Jun 2019 at 22:03, Douglas Royds <douglas.royds@taitradio.com> wrote:
> The problem is somewhat specific to json-c, as -Werror is hard-coded
> into configure.ac in this package.

Which is downright evil, and to be honest we should patch that out.

Ross

