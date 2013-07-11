Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC0C6A465
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 11:14:58 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id gd11so6550825vcb.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 04:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=SYhm0TJuq2NNq+8b03hjGveCUuHyZ/VqZezK3lWM4Ck=;
	b=MAkBDXPCq0GyBY/FZ0UJ28+O9hvsgmUY5jFqlGhJpV1ifrMsoF7/ZMWt+e5L6a/zFu
	S3GvtS1DDz9ILxG136/vYpQ+Gj17v7zpY5s6GCc6sJQlKxwN39DV4EqM6UXcEP6pXE0m
	EkbCzD3S6vOJwCGEJsKAJ7GtDczqGuo4fFHRxgoR81wkt4UR+yqUU7YkQXxfPfFWYSyX
	eVBXeV+sowt5y5NPmxZx629YkJTIBFZndDKcm6W/HfwyD3bHxMV3fjADVfnu7GDnpxq0
	kXPq1qAFYONos0MU8OVJFTcEbpQlaMDdNb9felYWi4CEFP7Ax0VjeFBIUx+lwYGMLxq1
	re5Q==
X-Received: by 10.52.163.46 with SMTP id yf14mr17680943vdb.58.1373541298484;
	Thu, 11 Jul 2013 04:14:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 04:14:38 -0700 (PDT)
In-Reply-To: <1373539530.2389.320.camel@phil-desktop.brightsign>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
	<a546f2c5f8ecec522cb8087015359f433fb5c998.1373443071.git.hongxu.jia@windriver.com>
	<CAJTo0LZTHz5hE8jx+6qNtePXj-LcMpsXEJ3zbwN4jS9npDHpLg@mail.gmail.com>
	<CAJTo0LbGRLcbb_9J1AdDM1ZFX18SYQi_h6VPwxN3SESDdnN0gA@mail.gmail.com>
	<1373539530.2389.320.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 12:14:38 +0100
Message-ID: <CAJTo0La1Npg5YwJ8ihzfbZvepOvg2HdjkbK_ir6WOvBVHBBkcQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQm9sAax4+9rpLbzsqrodrAZ+M51CHDGdCwLT4xpczDMwCMFLlbGaP4cbBVr/DQ0fAucQkRS
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] nss: add version 3.15.1
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
X-List-Received-Date: Thu, 11 Jul 2013 11:14:58 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2013 11:45, Phil Blundell <pb@pbcl.net> wrote:
> I think you could still legitimately question whether having recipes in
> oe-core that are "just for LSB" is sensible and/or desirable, not least
> because dangling libraries that don't have any users are hard to test.

I was just pondering the idea of a "meta-lsb"...

Ross

