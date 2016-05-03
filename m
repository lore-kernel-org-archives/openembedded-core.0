Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 554BF6FF4E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 09:11:45 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id u64so14427765lff.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=q4CQEO9jVUHuHmu0GNR8p9ojzVXmGFK6adBHkgmb6As=;
	b=gSJgGNHt/07wa5tCgH718l1tqzCXUd+YDU37y54e3M09pkCQtVu3TNW9oPNorwuquo
	NRrAHmUwNRnmC+WEbXWieCGBZCrnIHZlLDPT3fagOF+AbMI8xIs90KtDiSzsYnbIkzRy
	PYBm3AtYAdN2zcLqcmj21tCOk9+ZLNtrXGvm/5i/haUM8MMdMgKtDy2ecx+XcJD6zjuc
	retcxN3jZcmehnmeCFARKl71Cz4LAFe6G1Q8a3kpxylQi3HtVF5eBNPCH8uoUbm9ngJz
	DT0BP4M8WfcngRhK3PqmwdIA/eXZGrs83eVY2qsR4ZqkQzrcGn/XDwNyuaHqBrXs72h1
	hv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=q4CQEO9jVUHuHmu0GNR8p9ojzVXmGFK6adBHkgmb6As=;
	b=YoEhJ58BXflJB7qrxRTzVjwG1l9INHn+ryyNrsb/1DBFygpzl6FDfKQjDTf/0Kyxcb
	kWBkQLACY2lKtiK9kHf68dPVCWacpJTk9TOc0A4F9mfyya0fNP2/vxB+UYfVy2I0HaB6
	8GKkZPF2079QnP6euBg9abtIZcm/vfVjXdNXo4H+2ZwsEKY8r1ppQ7FNLzw+kLdCbcO5
	04DkNd4JJF9dy/q+Mr0OIkmK+1PtygvLr6rin1S6AQAc9t3RHSTwDArarpv9yxSdvrR+
	o/rmL4xKxMNo+RiKg9MMC1qouHZswQH/nner5Eza4TOHUl7f1V0Dy4wchzFl952BhDBY
	FWQQ==
X-Gm-Message-State: AOPr4FUTmkI+deb2026ZRI9O5/h73ocoiHxp/6aF+bj167UXantiAcXWab1XbelupK3vmQ==
X-Received: by 10.112.136.194 with SMTP id qc2mr726869lbb.60.1462266705036;
	Tue, 03 May 2016 02:11:45 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130])
	by smtp.gmail.com with ESMTPSA id q13sm363185lfi.21.2016.05.03.02.11.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 May 2016 02:11:44 -0700 (PDT)
Date: Tue, 3 May 2016 11:11:42 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160503091142.GA4828@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<B873B241-2AB0-4CDA-B4CF-7AEA166BEE68@gmail.com>
	<CABcZAN=ECJ15QzuHx-a2aovhS3hagRJuo3u-kazjZ4xnHjt=zA@mail.gmail.com>
	<A4EC8338-0993-408B-9D4C-2E388348B3B0@gmail.com>
	<20160503080913.GA2851@jama>
MIME-Version: 1.0
In-Reply-To: <20160503080913.GA2851@jama>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Tue, 03 May 2016 09:11:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Martin Jansa <martin.jansa@gmail.com> [160503 10:08]:

> It would be nice to really poison the value if possible
> --with-linker-hash-style=YOU_NEED_TO_RESPECT_LDFLAGS
> to cause linker call to fail when someone is using oe-core toolchain
> outside OE itself (so might ignore LDFLAGS, but without running the
> QA check).

This sounds like a nice idea; making it comparible to how the sysroot is
poisoned.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

