Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 99FB665DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 11:06:23 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id m20so1488353qcx.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 04:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zAlxP4VuQ57QjeKcIo8B3r1Wu52JQm0bTZ7q1kbNqOg=;
	b=Qestw6eeTcmLQAehmxsN+4WJy+n4Avio+oLoWw6/yZWMhEWGosIltN9UrGoUVbHUbb
	sRDdCI3eAcTaxkfv/GyQ3LaJLCEwhvFUDtLqfSzDSyquwJ1HE0SZL+xCcsg1WHHSI/Lx
	0VuTA/Lbwn2nQGs1K1T9CrVmEDOP7qKS3hYATfMQeYlYKd/097iC3W718xh0000Flqlq
	01+sRYZFonEeqah/xl2TCZcwBaldNL3sVtSnxewmPh5sdgICyfkSmFXDCCJ5kEAfRLcl
	E2f59c9oSjP5tU70wJrCt5ry+rzJeJXr/ZEuLZxyu90ZxbvqskZbp6zTCJ+5qG+B0UKy
	Rm9Q==
X-Gm-Message-State: ALoCoQkpnUcDNtbiHo8QFKS4bBUi95UCwhefoHuqDlfiQpjfP1JYCWkr5Y3EiKHI5a0hPsYdaPWD
X-Received: by 10.140.40.84 with SMTP id w78mr17607001qgw.87.1411470384432;
	Tue, 23 Sep 2014 04:06:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 23 Sep 2014 04:06:04 -0700 (PDT)
In-Reply-To: <1411464016-8068-1-git-send-email-ting.liu@freescale.com>
References: <1411464016-8068-1-git-send-email-ting.liu@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Sep 2014 12:06:04 +0100
Message-ID: <CAJTo0LZBA0+k4-4Wzh-nCwiZG5_hKo85eYuPgCxoeGtFrgjhvA@mail.gmail.com>
To: ting.liu@freescale.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: pass -maltivec only if it supported
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
X-List-Received-Date: Tue, 23 Sep 2014 11:06:29 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2014 10:20,  <ting.liu@freescale.com> wrote:
> +Upstream-status: pending

For machine-readability please use Upstream-Status: Pending, and this
is missing a Signed-off-by tag.

Ross

