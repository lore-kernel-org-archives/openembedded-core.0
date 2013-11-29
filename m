Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id 47D536B4BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 20:10:43 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id 10so6936839vbe.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:10:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J+1zfg3Snfq2pj7bgsDD3YM/32tBQLYLxofDq5V/WeI=;
	b=RRVpNq8PpxOPONyLLSbr+OVcoexP9yLpeiXiF3+1nL5nNZOIcSh9VO/VkylIV4BvUu
	XAxt7rguEKBlfwTPHsGND8RlzQtlTk1sM/x+GgWPnkcaehpyUUURpMiDbavw+PmiJrch
	lwSlwwyIyR7YEl1ox9CO8neO5FHkLg7hFwG328+jbC6TXoW3ZUuazeUeN6RykLVIghnf
	2mortwI/uBK/CUPPcBi708pC6Vib4FdJB47Pu6KhJPeVcRyLcInrVh7hIhISmPKz8p5/
	lgTqGO5gUWAQGwGu5XAVmY99iirRI/I6/biLd67qmRODUzb0lb/bQOyfxgW/73DHKPlh
	AkGw==
X-Gm-Message-State: ALoCoQkQ1vDAkUXMqiWZRX9zds8LeVTemIscICA2LPARCU8Ob4obzw1/oqj/VylwQITqLNTH+uUP
X-Received: by 10.221.47.193 with SMTP id ut1mr42999445vcb.8.1385755842163;
	Fri, 29 Nov 2013 12:10:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 29 Nov 2013 12:10:22 -0800 (PST)
In-Reply-To: <1935443.LMsZVW7734@helios>
References: <1385733065-13722-1-git-send-email-ross.burton@intel.com>
	<1935443.LMsZVW7734@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Nov 2013 20:10:22 +0000
Message-ID: <CAJTo0Lbdfn9-jRp1d=XTH+LD=aMg=wX70L4=j1RO5zRHiH8sKQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4-x11-free: depend on ICU
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
X-List-Received-Date: Fri, 29 Nov 2013 20:10:44 -0000
Content-Type: text/plain; charset=UTF-8

On 29 November 2013 14:47, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> It seems like ICU might still have problems building for PowerPC. If that's
> the case, we should probably be explicitly disabling ICU for that
> architecture, right?

From discussion with Richard he reminded me that the problem is where
host and target endian are different, so this impacts more than just
PPC (and not all PPC machines).  A quick look at the ICU documentation
suggests that they have tooling in place for this so it's certainly
worth checking that this is still an issue.

That said, this is simply enforcing the behaviour that was pretty
consistent before as harfbuzz and beecrypt were both causing ICU to be
installed.

Ross

