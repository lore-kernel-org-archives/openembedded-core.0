Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id DC1BD6BE3D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 14:19:30 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id db12so555647veb.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 07:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JFDAvLQUVDWlre8Wv4DUfbVeAHV0uyHWMB0i/LfzWeE=;
	b=KEn1ioJpCmRf2EP36vPDR3Oke96e/nC64EI7fZYhLYAfqT+Kmx5W6taf60E0zqn5e7
	9fsLbzvOSa+cqepueISnezbOefyNxrjfZu5/AUliFMVKQV1pVyq1TJh88AonvRN1q8gG
	mhFufjWfuLCL4nkz4+oxygVXYdiR20wsjPwCjqvWRb2xRD5/qE/7icUAIi7jS4OTPN2B
	HDcPwDijy9FcGUwMlNGVA85s+xEt+aevS4qRpd8O3DSm5Yim3maJ04Fvho9FtJf3UPwG
	+/4pgk4ObsUbVhMncD4sSOvbcYvWazZYXJbwvMLBx1hlhg+6dUD2vkGVGZza2unhviYw
	QQ2g==
X-Gm-Message-State: ALoCoQmQTuY2Dawd+8blzlwB/xeBBSRJGum8Wty5RoDl67JMXrXr6eZW4WKNMXxzPTuibVjRQ615
X-Received: by 10.220.199.5 with SMTP id eq5mr2358356vcb.16.1378390772459;
	Thu, 05 Sep 2013 07:19:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 07:19:12 -0700 (PDT)
In-Reply-To: <1378386554.27411.14.camel@firebird.rb.intel.com>
References: <1378311722-17752-1-git-send-email-ross.burton@intel.com>
	<1378332114.1059.260.camel@ted>
	<CADkTA4NbnmnQZXB2YLv5psJwA=gDAh9Bi4sGOr2dp30sTR0bJg@mail.gmail.com>
	<20130905071133.GG11500@jama>
	<CAJTo0LZ0vG0w24Wkr2KiwWoEF9bFwyJeBpg4xnfLpYe9ELd+mQ@mail.gmail.com>
	<CAJTo0LaPJjQqR80ZpowVBfjhYFLwqUvFF0wQm+S1VfKWeEDqdg@mail.gmail.com>
	<1378386554.27411.14.camel@firebird.rb.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 15:19:12 +0100
Message-ID: <CAJTo0LadXyEOszmBw=QR+AyQY9YeKpCNTX+zqQEGmXRm-9LChA@mail.gmail.com>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add recommend of kernel-modules for all qemu machines
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
X-List-Received-Date: Thu, 05 Sep 2013 14:19:31 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 14:09, Stanacar, StefanX <stefanx.stanacar@intel.com> wrote:
> I just tested that the third option can be done (for this case at least)
> by changing ConditionPathExists=/proc/sys/fs/binfmt_misc/ to
> ConditionDirectoryNotEmpty=/proc/sys/fs/binfmt_misc/ for
> proc-sys-fs-binfmt_misc.automount unit file and
> "df" doesn't complain as it doesn't attempt to automount anymore. On a
> system which does have that module loaded there are two files there so
> that's why the condition works.

Confirmed, patch incoming.

Ross

