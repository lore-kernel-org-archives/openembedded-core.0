Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD396D2DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 12:34:49 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hv10so1360554vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 04:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VadKg0gCWCK50xFgeNtimsujmraPImyd9VmLXzMBtbQ=;
	b=gr+wT9htF/ngjh+9rpyEjk73BMaJXJijzBi/qSHnKLrTdfL94rwpufUf+Pnw/maj2G
	sNirhNs1aEcVUtPcE8v6SMR9+PzqpoMLLTkrZ46FtVnlCwXDpMpOjp/wEZ72+8Yd/H+7
	yI8esBF8V8XGoRmTJsDUUjkzSS9Y23TotYB5IhZ4b92ZO0HP00SD8jb0ZCl7mrScMAq6
	YnJGN7yTFkRnspBueyMfp8RPA1IV5bkR8d2kTbzq/5tJiCP64XLEUVXdsNCpXMNBtaZ+
	qDy/9aMAUb7WydgMIpjJcTtgVotKnib4ZVNmTTpLUQOYkvRrUceVStNTx9Li2gJYTbZJ
	y9hQ==
X-Gm-Message-State: ALoCoQm+x07Kk6MhOIiG9WQaOVWJ3cF/V+k9g6uZFPlxlau37zvh6F4wbrCTFKqXG37EDQsrNFYO
X-Received: by 10.58.232.228 with SMTP id tr4mr1121860vec.34.1383914090545;
	Fri, 08 Nov 2013 04:34:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 8 Nov 2013 04:34:30 -0800 (PST)
In-Reply-To: <1383913666.16718.97.camel@phil-desktop.brightsign>
References: <1383912990-12718-1-git-send-email-ross.burton@intel.com>
	<1383913666.16718.97.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Nov 2013 12:34:30 +0000
Message-ID: <CAJTo0Lbc5qwEKXyFjvev2uFgPP4O=qZ_Ldzg7ZGt_kcNkJe4Jg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] syslinux: add APPENDS to dependency list
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
X-List-Received-Date: Fri, 08 Nov 2013 12:34:51 -0000
Content-Type: text/plain; charset=UTF-8

On 8 November 2013 12:27, Phil Blundell <pb@pbcl.net> wrote:
> On Fri, 2013-11-08 at 12:16 +0000, Ross Burton wrote:
>> Changing APPENDS wasn't causing syslinux to re-run, so add a manual dependency.
>
> [...]
>
>> +build_syslinux_cfg[vardeps] += "APPEND"
>
> You mention APPENDS in the subject line and the commit message, but the
> patch is actually adding APPEND (no 's').  Which is correct?

Pedant. ;)

V2 incoming.

Ross

