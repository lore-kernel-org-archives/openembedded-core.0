Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id ABD316A9D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 10:47:18 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id j5so4941657qga.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 03:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6VFXTLiS7Qu6oWX/9vko3ltKLpfyFiAO8uRb+E2RqZ4=;
	b=SRE8KU1/K8h2uiZEGC8M96qEannYiDgw/Or1vRwVN7UN+IF03LI0RCmhnniS5U8Po4
	O5jrhS84Q36PcwEHcfqIiRsTw+eEwF6r4HRSAjcfG3rzH4rDzM0EFGujaRq0rd7+9NDa
	fN2pZ63sL2yyr9ReJXv9nEDCdgR46CmFwEYjqUI5FpuVIB8/gew0lEDpLoWq2+il33i3
	kB/uquwoRattUtcDiVrREBmbE3fhLHj+/exvVE9xgrttLpzUotFOJVpVfoJ3S2G+kxWN
	yM1z9UCJ/dxhqsj9AOR5CmMsPq+Mu5q6yDCKIV823bgaQxvZs2KREn7XkvAtScqPbGNS
	F36A==
X-Gm-Message-State: ALoCoQlOhg3VzCluVbkS3/5KSjbahzvBEteHszWDYCvgAjDSPnxzpiV8PMU9PgGkrxgBIXHrB0ft
X-Received: by 10.229.236.8 with SMTP id ki8mr7781380qcb.12.1411555639529;
	Wed, 24 Sep 2014 03:47:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 24 Sep 2014 03:46:59 -0700 (PDT)
In-Reply-To: <54221EBB.8070606@windriver.com>
References: <cover.1410257258.git.liezhi.yang@windriver.com>
	<4e8cdaffb79ea56a3644ede8af0cacbefd167197.1410257258.git.liezhi.yang@windriver.com>
	<54221EBB.8070606@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 11:46:59 +0100
Message-ID: <CAJTo0LbYoQRbtKT_o7OLGn7d=YPu9AKv2vRAQzHsd-H19ZySnQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] rootfs.py: fix PRE/POSTPROCESS_COMMANDS for rpm and deb
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
X-List-Received-Date: Wed, 24 Sep 2014 10:47:24 -0000
Content-Type: text/plain; charset=UTF-8

On 24 September 2014 02:30, Robert Yang <liezhi.yang@windriver.com> wrote:
> Ping, I think that we need it since it is a function lost.

If we're going to unify the behaviour - which is a good thing - then
ROOTFS_POSTPROCESS_COMMAND needs to be unified too.

Ross

