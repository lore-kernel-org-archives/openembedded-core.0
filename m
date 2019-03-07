Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id EEAFA7CEB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 14:47:54 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id v10so13703327iop.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 06:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BvbBvalhuw6hLWtXFVw1YXfVojukibYJiIdzx4CSSF4=;
	b=ZsQtEutC08qnSciH0pjtExgDcuiaGHchedZhWbrps25otRbcDOBkAvJWydDEKrynbJ
	Fp9322ZHuhoGaCvDVp0mJDti5wFq5LAUrrzAvFIr3/Z+0nLLpk8eQf2/1GAKrc2dxHT0
	jYutFdvxSTa3OUeRXihniJKr0L3eBsF8h1zCUXe8uKvVlkfUzjCWUcnNnjGyT7Zh3VVy
	fn0lsiXRwCDi4x3Na6JgTBamSJhlUdbYGrn0h2euCM5HU5A/hWyYQJLOgfDXViuE45WY
	LJURPsQ3SKp1+6iFHUGjQfmPvSHMyVpR0CvrE2BzruWz2gU8ZM8z8y74OuWFl/VEHm9i
	+J4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BvbBvalhuw6hLWtXFVw1YXfVojukibYJiIdzx4CSSF4=;
	b=Ee4eoPn+5D5uZeL9LC0jmVon9fOo9ojhk382zNAAclYyw7OQLz/YZZzskY9MqJ2Yu1
	hOO0cgxgxY+MhOtuBANu997N1YYrPZvf5RQKHD82ePCfuYsTwkVDsLfab7MvL/XY2QFV
	InowinY5Hk0MLvMTZj4A1UsX2sC5SesQABw+GDdnjvmXk/aEzouW4OqMiiX/P8CoFlpI
	HDHscxz/RRjTAYhTg6DaSK49NVVtftwDeVZcHgYPzRISDbpHNEZplVG8QeGBmR8hSoaO
	qI8M42srZIrzkPcTgs+LWIhUpwqai4627rkMtfjrVkoK5Mg5TW6Yx4tNijkLhDgSAatm
	mU6A==
X-Gm-Message-State: APjAAAXEsAMVjwx9FbULDThjz1ixA2iB7GOsHqpF7EDZyiibLmPDD7Q9
	xtZG1VUHt47S3PzMpAn1ydYA24hsGByIG1ypDaDQjQ==
X-Google-Smtp-Source: APXvYqyqw6dzLXiEAOmUeh2UDZ2aBc1t3QG/9oYfj2TzOqyqTWeO5Vd9V8DnrPcsayOI1TbFFEVdhy1o5Qz6pAaYFR0=
X-Received: by 2002:a5d:848b:: with SMTP id t11mr5939847iom.270.1551970076030; 
	Thu, 07 Mar 2019 06:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20190307065138.54589-1-zhixiong.chi@windriver.com>
	<CAJTo0LbsGET5t6AyfgfQ2L=jR01g+uM8Ec0FA5L5nxpchGd49g@mail.gmail.com>
	<eadbbfcd-6dd6-929e-1fbc-8aee74b5961b@windriver.com>
	<8d5794a8bfe5ac118a77efbdb4b8f712d53116c6.camel@linuxfoundation.org>
	<CAJTo0LZCbH6XyQrWevL0g0f1OsCV3MmvcPme6Qf8VR17uUYVNA@mail.gmail.com>
	<CAMKF1sqoUULB=P9e6XLnGfxHBYM_ma+9Yfyv-yKqqSKHgZ0-sA@mail.gmail.com>
In-Reply-To: <CAMKF1sqoUULB=P9e6XLnGfxHBYM_ma+9Yfyv-yKqqSKHgZ0-sA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2019 14:47:44 +0000
Message-ID: <CAJTo0Lb-WkzEcQ9DzWyKdiR1wo=vdRoQ2eUwanwAXULk8UeFYQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-minimal-initramfs: add libgcc into the initramfs image
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
X-List-Received-Date: Thu, 07 Mar 2019 14:47:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2019 at 14:46, Khem Raj <raj.khem@gmail.com> wrote:
> your suggestion about letting needing package rdep on it right, but
> adding a hardcoded dependency on libgcc is not. We have to consider
> a case where where there are alternatives to libgcc which can provide
> same functionality and is preferred.

Absolutely.

Ross

