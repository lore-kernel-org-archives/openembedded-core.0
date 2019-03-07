Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB6D7CE89
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 12:39:34 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x9so13301452iog.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 04:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gkPe2j53d92DgTHh31apR3ACaRCPjzCFvs5oYJpabz0=;
	b=znfIUSuzTavh7XvPG9RVEjXQheaORasDHPRmyc++xuFM8h2v7Gv4dZ5feVPzU29igQ
	8uqqHlGXJ0WWFuAl+tJ03ra8JcRSXjAxsKoTNqC4Ec6QU6jcMGcZC3X1kQrszxX8pCec
	wEjCRs436bjzCzxp/5KdpyQ0bCtD8TmG5je1YBAjLOJEfKBJY7Od2ebB2LDOqSUNMiAq
	x9LMDHjtL4v4knsS5Byii6NUkdDSkhi50CxAXix8xEEMT5zAevitaA8agdLb4KiHpkFW
	iT7DW3ic/XGHehCYMWAAPLHE+qmwvPYG2cW/RKH9AROTbLX2sSWRHru3NLDT8gSKsfBr
	VGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gkPe2j53d92DgTHh31apR3ACaRCPjzCFvs5oYJpabz0=;
	b=RbgnzLB7b57OGJczBpWr01m/S471PXEeW+wTTpsoeL9DmKiG/vWXvL5h9+2YmuV0M9
	ozapU7DBuYU/Q2zHxG4zAKTIuNv2u0z14RSOYBdT2hLro0/NxGuCxk06d5fW3SX8p94E
	J9b1o8c7gGPqSU1HJwNL09Ss7oN/rj+OphIloZ3YqMioj3L4uD9ceDgAWk4in0L4SWpN
	OfPwhLjmoQXijLUn0ziYMnnDYWvl0BuNe5zGoWYqjlZAw1bIdDEdQ+9Nni85vOF/Qpqs
	FDztaUj2vKkUQBbC4NLu7lcC8vVOsPMHRq5qIiacqRdVsEvpo2JSBynq80VQGKMytHaH
	mL/Q==
X-Gm-Message-State: APjAAAXVYYp2WofATpNd0B2wT01esv861lboyWOwjPVB512j9PGD6oA4
	DhW0+w9JNaYZygsS5WVMRGFwBdNiZtIaUSxRwBSV1K/D
X-Google-Smtp-Source: APXvYqz8cCRpgLCkV73PqyXLirbyfdY7psATPEMMJMo+WQSxVW1Zn3uV0NU1i8NIuKGvOGgRp5IKWphfCFhw4LfS5co=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr6055268ion.20.1551962375578; 
	Thu, 07 Mar 2019 04:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20190307065138.54589-1-zhixiong.chi@windriver.com>
	<CAJTo0LbsGET5t6AyfgfQ2L=jR01g+uM8Ec0FA5L5nxpchGd49g@mail.gmail.com>
	<eadbbfcd-6dd6-929e-1fbc-8aee74b5961b@windriver.com>
	<8d5794a8bfe5ac118a77efbdb4b8f712d53116c6.camel@linuxfoundation.org>
In-Reply-To: <8d5794a8bfe5ac118a77efbdb4b8f712d53116c6.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2019 12:39:23 +0000
Message-ID: <CAJTo0LZCbH6XyQrWevL0g0f1OsCV3MmvcPme6Qf8VR17uUYVNA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Thu, 07 Mar 2019 12:39:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2019 at 12:34, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The customer needs to depend on libgcc in their app, or their
> initramfs, we're not adding random dependencies to the initramfs "just
> in case".

Part of the goal of my ELF parser rewrite was to make it easy to add
libgcc dependencies on binaries that use pthread_cancel automatically.

Ross

