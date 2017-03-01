Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id D2B81730C4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:41:12 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id x24so45012337uab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 08:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PT/AP0Y7n92IBftFBNqXyegjRK1aeTaHiT3qkqoRMws=;
	b=hwIZG8PPv5bDr+HEkJ91C1wtyGErR9Y7w0yfcFVxhQcPAJKsSdXM8LlZoTM7ULG/GQ
	BoHbzIIJVaP1Ua8sG0oF2kIt/9GswYrIZY0D1aYj4rj/wnd5eE+ZHBDIKr2NELXLr5mu
	T0ul3HpXope84cI1Kjljgo8Y18TBNc+pfKH6RvXNs/1ydRAybpC3kKHxLyEEgnPHOEN8
	+e0JgIeRZtXQhH9794lC85C57cHkSHfeor3xg2XO9q7Cs6h7dEt3yrX7N0cY+kvBnRFG
	Cg1+iPHeHpSC7lxY8PDl18jVc/Q9Cca5kHStM9H3bXMDbwqs/73k80XlbPWRyu1k35ZQ
	rZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PT/AP0Y7n92IBftFBNqXyegjRK1aeTaHiT3qkqoRMws=;
	b=QPdheUk6SC7t0xv7SkFVmxnmV/v3Le+IUa8cC1ZPRumAWk+DUXQQ2pbYUjWeJ7KLKT
	NBJhb0P0+54WD+B64VI2t1xHP/1LeiQ6PrWe/0KapPW3uVUOEFwvOGjrkx0jL2UPKulC
	WX5ICask4K8NHzEPSxZKU49uoHSw+LyBZugw0NMXwfdc5h1x/vISAXB8zkkqhUFHpgw0
	G4GzJ8VqDzCeWOH9QCjYHdfU2XAQbmSUtN5vH5mRzlpghJIm4i1FmdFzc+XpUQegZPgr
	hxt106VvJ7CTwFYv2SXMGNdMfSRQYAQj25FAdSKVRNXMvNp3QudwCZSHeGzMzShEH8Bf
	xhUQ==
X-Gm-Message-State: AMke39kn387SIpRxt2gnlGSzPTHuCSYfPCKpiBzWsqEPHqxFE/kJUGiKEoqLn1SwSbDGxE/u/OmfUah6LAlleA==
X-Received: by 10.176.64.225 with SMTP id i88mr4435007uad.60.1488386473066;
	Wed, 01 Mar 2017 08:41:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Wed, 1 Mar 2017 08:40:42 -0800 (PST)
In-Reply-To: <20170301110722.10260-1-alexander.kanavin@linux.intel.com>
References: <20170301110722.10260-1-alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Mar 2017 09:40:42 -0700
Message-ID: <CAMKF1sp1JFMO_J=uz8j-eWaoJkzqhvjW6aZGoqYBBEJ0QpZvCw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgpg-error: correctly configure on mips64
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
X-List-Received-Date: Wed, 01 Mar 2017 16:41:14 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 1, 2017 at 4:07 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> +         mips64*)    TUPLE=mips64el-unknown-linux-gnuabi64 ;;

This probably is going to fail for big-endian mips64

