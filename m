Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 227C96C23A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 09:22:10 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e5so11065554iok.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SKr84z9jPNLgV2mjKPZrEpBJKEBnwqK+UlRZG9E5nkQ=;
	b=rlj6yoyJdDLVdOATmo/c97vqdqpjH1EbdhFPNcBerTlfSz1uq6i93xpM5AMGeYTHeu
	KH6YL+c+T4I82E/m7DGrGvaLFI+swpFUG1Ql8ii/3CmZyCJQ/BDWp970DvPUICSB39bE
	PpINrBOjhif6i3UlLvZfSWiHsNeOS4w05AVK86FbXwS18LjwZtjCIwpVGGuqWxtx8gUI
	/N4iiSKuguLiTkIa1lidodnbTCacYmU+WaG2Cpt9P9KfbUb4d+9ycCqIKDWxUFKS5bhj
	WrLqjyDNa23YMjpGTCofFbZNg+r87myzWgolyMiVl0zZarKSVqjbpkiO7pECeyxxB2af
	6URg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SKr84z9jPNLgV2mjKPZrEpBJKEBnwqK+UlRZG9E5nkQ=;
	b=WmyA6uy+CaIEMsa6Es9iIDh5AvmCBN7nrs8Qu9pvhmPnwg8BTL+vRkWyiKUWT4y/Z2
	oKefa/IjOSz0lnhoqqPsT1OY9VtbJcQ7SwbPgIPmHrJg6EXDWD9UvMoFjZ/U+Ej9yfC0
	bPh1tkyGQEW2qA0yg7nqeOSpue8IdmZYiUqkgzJkEAczHojwwA8YhNmOK9+pml+Ff1BJ
	nHZPnfnbTDcoL6A9gXzjYf5vGTv6Kgn1T0w+QXePwta+YMgbW01AEvzcdxP1pVFmCHdv
	5MatnTqiNDlmqKxMwGo96G2pCXZmFKXdy8i9+rYyhdes0qyiGIyvuNns9YGiHjV+QzMM
	CQtQ==
X-Gm-Message-State: APjAAAX1xe5BqDC2dN8LTFTfdy7ByNasgMiGlF4Az0eDenEhvfVvR2l4
	oiT/80zskhjzLFOGgvRYdcwDmNx7+l1rJ72Ry3T/vA==
X-Google-Smtp-Source: APXvYqxg3oqb7V0N244Pk9ZumDI0V+xwtUGeOPHyL74YY/lidTf+eT01yC8IBB3/d2Odxno3EaBVn5Wy2PIo5PWrRgY=
X-Received: by 2002:a02:b395:: with SMTP id p21mr10302886jan.31.1561713732106; 
	Fri, 28 Jun 2019 02:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <1561692176-19265-1-git-send-email-li.zhou@windriver.com>
In-Reply-To: <1561692176-19265-1-git-send-email-li.zhou@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Jun 2019 10:21:59 +0100
Message-ID: <CAJTo0LZs5eqGCSXsFZbOhSXBWryaTv7CE+fAPn-yd9ErjXavuw@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bc: dc: fix exit code of q command
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
X-List-Received-Date: Fri, 28 Jun 2019 09:22:11 -0000
Content-Type: text/plain; charset="UTF-8"

The maintainer said:

> The patch below fixes this
> (it is committed for whenever the next bc/dc release gets made).

So:

> +Upstream-Status: Pending [Got the solution from maintainer]

This should be Backport.

Ross

