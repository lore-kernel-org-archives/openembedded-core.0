Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 550C96A964
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 15:44:30 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id 15so1720581vea.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 08:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MxUw2Uje9UMSs7knYKd6pVEPf5wlQuq6w3eB/qMdcw8=;
	b=BEdZM4wbyd9NvbU35IltYhByQAZEYB/PHQYXnvHd0T17U/6PZ3xr5ogLY1uF9Gy2Ut
	+zbNpwjt9zzj1ICcVpHgkbb7p+CYBqZoJ41x/oELCZ9qzl6ajVK+oQ84nnq+wN376uWo
	sfmnwVf3AbEQMINxwQ0dm29REr+TFjh8p3vDxvMnFGgOWs7FWi7rddxIEtfNHQyKvIW8
	3IMxiOlyRmtIFG2efFIqxsIOVwaD6eBppol8pRnzPGn9BASYtxWWqEwPuLBFe9ES2OWt
	+S1jeEn1EO5Ps4GgEfJ+UHtMbqde+HXM7nYYfuEfyvx6cVtuA0mds1INloW9PUHwW4sD
	8IFw==
X-Gm-Message-State: ALoCoQm9dZ38Ci3h0LnWy8lmdywM5O9n25ki9S1xUgp4Fn7pD37uqgKaQvflLCyukMCqi0xfRjSo
X-Received: by 10.221.47.193 with SMTP id ut1mr12138501vcb.8.1377186270215;
	Thu, 22 Aug 2013 08:44:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 22 Aug 2013 08:44:10 -0700 (PDT)
In-Reply-To: <cover.1377150822.git.sgw@linux.intel.com>
References: <cover.1377150822.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Aug 2013 16:44:10 +0100
Message-ID: <CAJTo0LYJhy5Qxn2Mbom5vgyiM_d_H+TvU0mCyUHp01ZVoeYvMQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
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
X-List-Received-Date: Thu, 22 Aug 2013 15:44:30 -0000
Content-Type: text/plain; charset=UTF-8

On 22 August 2013 06:58, Saul Wold <sgw@linux.intel.com> wrote:
> Cristian Iorga (4):
>   packagegroup-self-hosted: pcmanfm integration

This also adds xprop.  Is that a dependency of something else, or
should it be removed?

>   build-appliance-image: changing the icon theme to sato

You'll want to keep hicolor-icon-theme installed, as it provides the
skeleton structure for icons.

Ross

