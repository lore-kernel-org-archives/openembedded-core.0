Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id E255C606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 02:21:51 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id u134so32815164ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 19:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Bt1TMmRfKB0mk327/PpDNAPgmYfygDenlwYV1po8saM=;
	b=CCv3V4n/nASF4hhOKDJ+PXv7gvptVxTeCdIoLOFpXHpmbrvcKinf4obw3ab6NKnY7s
	fRaI3sdYJmvY8nqB0M3Tsm6JULBo1B3kxIVRdDpueeIsHUmOVl8S0lHM1GapT37P6nf/
	Wp77YFK/xwP9Cx1zd33JRregxuB6//goHAg7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Bt1TMmRfKB0mk327/PpDNAPgmYfygDenlwYV1po8saM=;
	b=C/NjoUj+LRMK3M9XzzjM+BikJ0pDF7lqRm6+Jrnq4jGDCbfBFqrclKec1DhnhcViNh
	Wt6cX1bLQmJ/y/iYRwXLajj7UMtdZHea/QLMNzLBoIS8ydlR/GpqtdO/qSHzE58Q2Wbd
	KIGwcM9A9+t37kgUDIK/poL4TIwyfFUR0VEbykuiuYN0U7ykWP6E9Q+KLQJAvQkN0qbN
	2Eo2rQ0Aromcm+nYRwVX6retKZ4iOv5FeBeuH9hEHCC9HY6TmbZJk4t4bNMclmb5Pcmo
	2wRcfUu7wk+K8ipO1xpGWzwlH0RCQL958ksfCgfVWw+Fk+gPEb5gsmtUp/z4HCQNsCNG
	6qBA==
X-Gm-Message-State: ALyK8tIR7DlA8Je7GzqYuiwUe7djfzkqHcP7icqq2jld8vHYQPT5ldZoXnLmW6xvLF6+1w==
X-Received: by 10.129.115.194 with SMTP id o185mr31931642ywc.159.1468981312192;
	Tue, 19 Jul 2016 19:21:52 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1407-C0E8-B199-1101-CD04-8ABF.dyn6.twc.com.
	[2606:a000:1407:c0e8:b199:1101:cd04:8abf])
	by smtp.gmail.com with ESMTPSA id
	j124sm173716ywg.49.2016.07.19.19.21.51
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 19 Jul 2016 19:21:51 -0700 (PDT)
Date: Tue, 19 Jul 2016 22:21:59 -0400
From: Tom Rini <trini@konsulko.com>
To: George McCollister <george.mccollister@gmail.com>
Message-ID: <20160720022159.GQ7260@bill-the-cat>
References: <cover.1468862824.git.george.mccollister@gmail.com>
	<79c64bfd7932e78cae2876ac14b19737d5a4d578.1468862824.git.george.mccollister@gmail.com>
MIME-Version: 1.0
In-Reply-To: <79c64bfd7932e78cae2876ac14b19737d5a4d578.1468862824.git.george.mccollister@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: marex@denx.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] uboot-sign: Handle .rom signing the same as .img
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
X-List-Received-Date: Wed, 20 Jul 2016 02:21:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 18, 2016 at 12:57:57PM -0500, George McCollister wrote:

> Handle u-boot.rom signing (U-Boot as x86 BIOS replacement) the same way
> that u-boot.img signing is handled.
> 
> Signed-off-by: George McCollister <george.mccollister@gmail.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

