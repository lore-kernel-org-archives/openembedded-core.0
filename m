Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id DB70173198
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:12:42 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id n128so30658781pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 04:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=6m+Dgy/6/pTXppdZKpiXTnCtcSvO3WGNH63zqoj6QHU=;
	b=OnuupivkdvhfaefQrprxx16Ngcijf5ttUnrAtC2Tfm3baLde/JH6NUvSvs0iE4lp71
	lhNd8Z5df584NhyI7RRH+EEIFbSBTQFAVx5v2X2ttkxjMXUdzdOpSrYM3zs+GtcknojK
	Clio8tf4hJNJx9G8m8hsa1CtMS7ZfWVqQCGzndEfLmJk8l5O55KsF0rfF5h7T8nndin4
	aTkcAJqh45/Weem/k8yQ/WnyHh+PwI6+UmIQy9aTFKOr8UmY+KHhxz/USUu0nIiQKZhx
	ttXEn+ic6qJMNG1a6B2632+CFSknRZ+oeiWPUiJa6QOTRpXZyIYzkrjZ69bJGI1/46uw
	nGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=6m+Dgy/6/pTXppdZKpiXTnCtcSvO3WGNH63zqoj6QHU=;
	b=c4qzTUqH3PzdSIe4+dibOIA5flGzusPTEEqP1MpwF13iORoMWTHBqLXuHIsf65CzYC
	drU0+DcGyQcof/A2oobKXyDgoOKWY0S5dyihS6V3rh+EhiLEx/Lv7l8bVEZFc2aBKRNS
	/oUJ5MU57dYbpjyfIfsqFm8jU81hYabHPoxpppcA2gXq38JYA+gza9vuvxsL3LnC12nK
	DcIYHWmrinPbsMNhBuNFEGBD02E09Wb1vxSORyKx4pwf7noPYKdlg0+YXWsAEsc0bcrd
	TtIKWWpSGXnKw4E7gbChPrxNTOSLVIL81tPiPJ4IynrxVMBSJ2mrdA/PjZqHbNZ3hCZU
	5uig==
X-Gm-Message-State: ALoCoQlYvU8N+d8bIijhuhwqQrNClfbxGhwpzGZS0LKPcbMJt4nqgCD9uyNVes3og9m/b/PsU4C17h8cBDKN3JBekv+d0cIG5A==
X-Received: by 10.98.71.20 with SMTP id u20mr4722449pfa.16.1450440763827;
	Fri, 18 Dec 2015 04:12:43 -0800 (PST)
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com.
	[209.85.192.171]) by smtp.gmail.com with ESMTPSA id
	l66sm17684366pfi.76.2015.12.18.04.12.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 04:12:42 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f171.google.com with SMTP id u7so1891255pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 04:12:42 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.7.210 with SMTP id 79mr4653691pfh.98.1450440761901; Fri,
	18 Dec 2015 04:12:41 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Fri, 18 Dec 2015 04:12:41 -0800 (PST)
In-Reply-To: <cover.1450434192.git.costin.c.constantin@intel.com>
References: <cover.1450434192.git.costin.c.constantin@intel.com>
Date: Fri, 18 Dec 2015 10:12:41 -0200
X-Gmail-Original-Message-ID: <CAP9ODKowf_dvxoPjqV87GX7st=4VgpViq4eimcBE+oUOAm+Uqg@mail.gmail.com>
Message-ID: <CAP9ODKowf_dvxoPjqV87GX7st=4VgpViq4eimcBE+oUOAm+Uqg@mail.gmail.com>
To: Costin Constantin <costin.c.constantin@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 000/502] Include binaries in test cases and update runexported.py
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
X-List-Received-Date: Fri, 18 Dec 2015 12:12:45 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 18, 2015 at 10:22 AM, Costin Constantin
<costin.c.constantin@intel.com> wrote:
> The set of patches addresses Yocto binararies inclusion related features and
> updates to the runexported.py test launcher script for machines where poky
> environment is not available.
> As a result runtime test cases can be written to include native and target
> specific binaries, both packed as .rpm files or pre-unpacked for the situation
> where the remote target has no package manager. runexported.py includes new
> functionality.
>
> For all the above, enhancements are described in:
> [YOCTO #7850], [YOCTO #8478], [YOCTO #8479], [YOCTO #8481], [YOCTO #8530]
> [YOCTO #8534], [YOCTO #8535], [YOCTO #8536]
>
>
> The following changes since commit 1b25a70991589ed1f123015c16ee4806c46e3199:

This seems wrong; please check the way you called the pull request
script as it seems to have included other changes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

