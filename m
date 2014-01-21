Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 90F626DC53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:13:17 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id le5so3728324vcb.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 08:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mFBOYOLXXHzFkEFuz3vokoHwwiA6PihwN5S5t5a66PM=;
	b=F9toEtzSr/+gtRmVQO2jIZbaCqYwE4cu4Peig/c5bJkRWtVFftE+cQoVMzoFPpmxV2
	IvuC8hpXMdJUs70HXPE+IinwVwdQs9tZ6GhZPRaZHc2PXtZr0CrPtPb6aYiLm6WnikPq
	F+8zb9EyUQ9JI1foMtI+CiRTAeyu0KKAqLtaWRj8pNmEXX4YD3tUYrZ6XVu5SHoALUH6
	Sp+W1SLWfJL6at97jFDamjD/jKrvHJsWp47J+EKHgOvjo5wCiq7jdVTy71ezAv5gwyGe
	dv6UDnbOGZ8XAEXoqdseEGbbYJXZ6ETWnJRiUKv0O3f9R7YwYyKwYGUr0RsD+ZtVnoxo
	Qq/w==
X-Gm-Message-State: ALoCoQlyqh2xppfdN9sDvAcQL2nrWHBlgw6gb8SLnlB3CUOx2rZfsOJ/YgTQbP67//KFR+CPQt3k
X-Received: by 10.221.66.73 with SMTP id xp9mr1955527vcb.27.1390320798033;
	Tue, 21 Jan 2014 08:13:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Tue, 21 Jan 2014 08:12:57 -0800 (PST)
In-Reply-To: <20140121130243.GD4100@jama>
References: <1389547991-3456-1-git-send-email-Martin.Jansa@gmail.com>
	<20140121130243.GD4100@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Jan 2014 16:12:57 +0000
Message-ID: <CAJTo0LZ4+Lo5ZgjBeON1FBeddKu4tr2EPs3Kccx+k+vioVniKA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Fix freetype detection
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
X-List-Received-Date: Tue, 21 Jan 2014 16:13:17 -0000
Content-Type: text/plain; charset=UTF-8

On 21 January 2014 13:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> + Ross as he is working on cmake as well as freetype

I think I need to state for the record that I only fixed up cmake's
S/B stuff because it was driving me insane, and hate cmake. :)

Ross

