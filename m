Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id B9E446B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 11:35:24 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id f12so2217089vbg.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 04:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=5SkW8CbdW+i+LfEL0USocA+hu1tO5Povq08cpcInKME=;
	b=aEdy8aQl52EEfZV8sNx4wEioyOjQDDnPFhVXuNSzElQKd/JFWwpFl2iz/mbWa6XXbE
	LCPgnpT2pKIpPdI0xMSVHEV4Y5X7z3xEk3o1nysK3d9UdC+yhz0s7NWA1NSf2J1Xhkfr
	HSC/yI2637vTp54JGZivXBZmxJ7Y2laY9ELv/aq1EgeO6bRsWWE/VKmxpd4NjmcTXi2V
	XU6BwP298Qq2pfPD7VL5Gb1MNGLzTSkSr2SHwOPFzOGHZPKf42pkE00kKAn5E4O/1YEk
	stpxwDK4WPP3jkva2XGsFvnFbxiZYHkbEwhL0Z4BfP+Ig/iyRQcnjz/2V3G5BMimDxom
	ARWA==
X-Received: by 10.52.29.106 with SMTP id j10mr3086618vdh.77.1374147325258;
	Thu, 18 Jul 2013 04:35:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 18 Jul 2013 04:35:04 -0700 (PDT)
In-Reply-To: <1374146123.6324.5.camel@phil-desktop.brightsign>
References: <cover.1374128654.git.sgw@linux.intel.com>
	<CAJTo0LbSnT2ejbJCjCBUoxVEhjoCPtKMrzt8NMHFEVYb9LGHYw@mail.gmail.com>
	<1400703.GdJurTDMZr@helios>
	<1374146123.6324.5.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2013 12:35:04 +0100
Message-ID: <CAJTo0La1=YTa2rXasY2LhRkA0O4-uV0UDUUGUc-0kNrLasX83A@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQn26V3UNmrXyxq79bMybLgIoaUajXhWw23f3zY1TVH4iLhnnOL/eXH2gC9mbq+kxbGEuObb
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/40] Review and ACK
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
X-List-Received-Date: Thu, 18 Jul 2013 11:35:25 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2013 12:15, Phil Blundell <pb@pbcl.net> wrote:
> Seeing this discussion makes me wonder: if the target perl hasn't
> actually been built at this point, how does rpmdeps know what package to
> add a dependency on in the first place?  Does it just have some random
> hard-coded list somewhere?

It adds a dependency on /usr/bin/perl as a file, not perl itself, as
the error is "no package provides /usr/bin/perl".

Ross

