Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 42AC57C88E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 13:44:07 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id e1so19602957iok.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2019 05:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bn92sBGVHLSUkYPYyCdiUBs1ULU7Gaa+gOsV2hD+E9Q=;
	b=02KjkTdwxGZx87kt0juuvMAX3uYH/jBINjxR2Zetcdp/UYrkzoplGCFb6MaTCjowtx
	pyFWX3NUlf1PZ8kd0qJyoQKMnJuQmwN396gOs425HYmOsdQXiSMAtE4hxSb23NekAeaF
	R7T+QwdHOY6gEpdnDQt2rXUcX6K6SKHMcdA0w1wL2RMnuRv+g9m/4uaE6Bu9QzGAVJ1o
	xfqD53ag4PiPV5sDY8c1Q3fvfWT0ZfBBcFc8wLCVihzD0jrhR4qukacNO0o6bEVJqkZe
	qcJBHyuxdsTbb0Y12ttV22cva/9bvAyLRe5i0K+keePgFDz0fo3lzO2ZKFBI9nrap7R/
	F3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bn92sBGVHLSUkYPYyCdiUBs1ULU7Gaa+gOsV2hD+E9Q=;
	b=Yi23xcUO4KXB8/Po4TAm7o61aeBXWHUlTahRnX4FeMS4BTbapoYkStzJrM12nd2DbX
	wuLHjXzlMUxGur+Nl0mglqb6Sr+BcRkftpHZqlT3mHLj52KvcXv8SH/Vc0zj0KxVN1KP
	20HlAfg39/7JbMUi/3VswHNT2Npb9j1l+59XLcEp5NxkEoW/T9el1oUnae6/NzJ/0UBI
	rw4nb5vRUhC5Nboj7Z9khj+8olYtXkTeanqDigyWLqhAhkYA78zbHkXDwbMRPF3dy+mG
	E4ec3XUlhGVrMClc9HqQe3KSCjv5QiehrAxqWV12oA5gtKakeTpnFOWsuFN63gCKF8B9
	uHdg==
X-Gm-Message-State: APjAAAVnWX05PYfUJs5613z5D4wL8sQMtYWtZXLp0GeoKu3vJQYKewhq
	ebb08EiYRD7vAe0e8gwK8sigQVeKoJ1T/GR2Zumptw==
X-Google-Smtp-Source: APXvYqzF3tYl+EIngj8DBeSarSVUzeGAYXQ/Hc3ufkhwNIGyMtbIOiY43ozGfwTWb59UHLYnhcg5FzS1El5uQ8HBgcs=
X-Received: by 2002:a5d:848b:: with SMTP id t11mr2370684iom.270.1551447848299; 
	Fri, 01 Mar 2019 05:44:08 -0800 (PST)
MIME-Version: 1.0
References: <20190228142745.23630-1-luca.boccassi@gmail.com>
In-Reply-To: <20190228142745.23630-1-luca.boccassi@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Mar 2019 13:43:57 +0000
Message-ID: <CAJTo0La+VEpKorv4BDBuBxyqsgBk=Ym2Z9M6-OR9d0+u7p93UQ@mail.gmail.com>
To: luca.boccassi@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] swig: fix build with musl
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
X-List-Received-Date: Fri, 01 Mar 2019 13:44:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Feb 2019 at 14:28, <luca.boccassi@gmail.com> wrote:
> +Origin: https://github.com/swig/swig/commit/90ba174fcea1618af57aa594199541d47a89b7f6
> +Applied-Upstream: yes

This should be:

Upstream-Status: Backport
[https://github.com/swig/swig/commit/90ba174fcea1618af57aa594199541d47a89b7f6]
Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>

Can you update the patch and repost?

Ross

