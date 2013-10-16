Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB176D041
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 21:30:57 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id ik5so686364vcb.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 14:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wVHwBt+O2xtqRYUPQuxXVMgzPUe5sgqaLg28k9dG5E8=;
	b=e4wNfWiLZIVy9ajOGhlFL7ay7N9+oZ8oZH/evDuAHOvJ0nX/0IhZoDqAwvEgmUxrrQ
	sRP2XEIkyidr9H1Tv3n48fm9IX83ms0IL3LRWNuYhC9g5/N2myeXZBqtIsYb/jtfWBZ4
	iNRLxheheuR6KNG2Kq4b9fuHULbs/66wVz7BHcRLZbzdVTaNommpBfjjFQkw1PHuvhpk
	tRzJFNosmffafaEkn1YhWHVtWdWxDRXZOlJJfgJ5pt6SUwCwFrrhoNTU0fMIcUr1s7ba
	QeuIMD/C6g48AGJhDjRKluVX1NusUOpIghsZxsO/v/7q+BMSwbVHvmmV5Z0oLiDJSVnK
	0v9w==
X-Gm-Message-State: ALoCoQniNCJgMHgQYBD/EmacWZ9gD3wjoFnvd4SG3j5dG96WHFUSkdS7ULtIvQJmKjxVK0aWw61b
X-Received: by 10.52.119.228 with SMTP id kx4mr3440518vdb.12.1381959059067;
	Wed, 16 Oct 2013 14:30:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 16 Oct 2013 14:30:38 -0700 (PDT)
In-Reply-To: <cover.1381944889.git.sgw@linux.intel.com>
References: <cover.1381944889.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Oct 2013 22:30:38 +0100
Message-ID: <CAJTo0La76+TFUnog4hGx=pAC=hYf6dJy=FiON2a+FYQYnRPzVw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/30] Package Updated & Fixes
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
X-List-Received-Date: Wed, 16 Oct 2013 21:30:58 -0000
Content-Type: text/plain; charset=UTF-8

On 16 October 2013 18:54, Saul Wold <sgw@linux.intel.com> wrote:
>   wayland: upgrade to 1.3.0
>   weston: upgrade to 1.3.0
>   weston-init: start weston on a new VT

Extended testing revealed some problems that I couldn't root-cause
trivially, please don't pull these just yet.

Ross

