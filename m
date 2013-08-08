Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4D3C96B0D0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 20:26:27 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so3805057pbb.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 13:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=2m+NfApIT8MPoc4RDjrWKzkhbriSkxvFLfW+nNitR3E=;
	b=DH4VaejNSOO3JDI+ul9+mcPRM4kvEfmiJNBMUVrgqzA9Jh62hFxi5R2D6CPyjOSisv
	vWYLAtuJf7rJXwuL+tg2hqcucuMQA1geWsvzdb0ZT03LyUqXrPVIYEvRfHIZMGWFxMkR
	uOrn6R1Ooe5E42QgqO8sfr06RZPwn0JbEQ8kfdCLxSLKAKBbdtyUaPLBScNCVy46jCj3
	g78+MbmAbw56JbK2wI9vhxkn8cgTE0PS8dXIbQB9nYrrUTfQxQSl3z1YpJVRfa3+/IYU
	XwOvpHmXSMDsJ5jzvNxI9hi7H5paJhLQx7tIV1ohlMw1ZccTUXW+U9ZLFNFgj4uveJ6p
	pN5g==
X-Received: by 10.68.125.226 with SMTP id mt2mr7950627pbb.115.1375993587640;
	Thu, 08 Aug 2013 13:26:27 -0700 (PDT)
Received: from gourish-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id e7sm15984999pbc.11.2013.08.08.13.26.26
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 13:26:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1375973136-11264-1-git-send-email-ross.burton@intel.com>
Date: Thu, 8 Aug 2013 13:26:29 -0700
Message-Id: <4E6FE015-D994-457C-9219-C2010C795EBA@gmail.com>
References: <1375973136-11264-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][V2] oe-setup-builddir: substitute ##OEROOT## when using templates
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
X-List-Received-Date: Thu, 08 Aug 2013 20:26:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Aug 8, 2013, at 7:45 AM, Ross Burton <ross.burton@intel.com> wrote:

> -KBRANCH_genericx86  = "standard/common-pc/atom-pc"
> +KBRANCH_genericx86  = "standard/common-pc/genericx86"

This seems to be unrelated to what you are doing with this commit.
secondly this belongs to yocto mailing list not OE-Core

