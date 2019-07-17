Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 921157ECF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 13:27:06 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k20so45660484ios.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 06:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oIh/iNXXj+scEf/rEzQyextAcFXllfotY/7ZKbSEN1A=;
	b=Q2nrxvsOb2b5KCkthomSGjp2hB35BEOjm04pFqDzW4pSMelgR324uMXP1p0zl0nqDF
	QsEnzEHZLQeBd278QY5HVpeIGvZAVQdr+8Q1U7ehB/9BrrsX2EsGnEIBmjQvrpzOXtDR
	hvAVsvf53wTBqISEYTj5giBcOf/yQRWqhhi7HMnRfaLCDM3CGoWH+xyjRvSySuIXYqGP
	VIfzG0rzo6RnFeNsNK88AxcMLPmpdg3Z3K1uA6CTqHPQzg7cC+h0shN6RT7h5v70+MQZ
	ZSet/eauzcDRuTTAODKJsMRm+h4pMYjOgNWYAdZA6ClYf4d/0LYA7hN4d9PeqA8dpMM+
	s2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oIh/iNXXj+scEf/rEzQyextAcFXllfotY/7ZKbSEN1A=;
	b=bqLnNocRNCon0UnqZ4npIsomLtqOdxyRwkDzu+PjRNUAl11GYc5MOs11IMok//tkPd
	0iBZIVUonfngyXbbb3pccaxbIeVmqK/zAHi7WKZ2/aIMH02wa6myzpDQHpZzlmkU+nDL
	fO3CHtuGUSkGvPV4OHlnnpJhuA6amVVCs+gNR9PvvE1kZqTqJP3u7uTNhXIRSLY27XT0
	0aIHDvVSWaQYIeY3t294tSWXWeQntLqPbbpinoyDajbpUXb79xrQPX6s+SKW1oZKSI9W
	UInqIC7U+KWGUFFt0MW2KjB+IFP3HNmYpmghz32lRkdPZC+RdCMuK+AQcnVgBYp19Zku
	9WMQ==
X-Gm-Message-State: APjAAAWp+sD6dVhfImR9z2S1YtQT4ljvzYHu72L2Y0hnRcI9PtNPwGqR
	PK3AViSz8CXDI7FyAiGCXiUm0W/dVjng+j0dwfqKcg==
X-Google-Smtp-Source: APXvYqzc6W9DO+d/NB44DpSz1IgN09Q7bAKj2Sz/M2ZDfDzc/bkwVUgZnj1fG8LI5fd1kRSkaxNGyRNGegCm48XEgxY=
X-Received: by 2002:a6b:6611:: with SMTP id a17mr14684690ioc.179.1563370027704;
	Wed, 17 Jul 2019 06:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <1563354517-31850-1-git-send-email-mikko.rapeli@bmw.de>
	<a098852b41fcdb4adcda5060a3fd87694391e0ea.camel@linuxfoundation.org>
	<20190717122439.GD3459@hiutale>
In-Reply-To: <20190717122439.GD3459@hiutale>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Jul 2019 14:26:56 +0100
Message-ID: <CAJTo0LaMz=pzH0rGv0jPcCXxS+hVqGK4Qq0jX8au9GfM3Z1xFg@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox: enable unicode support
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
X-List-Received-Date: Wed, 17 Jul 2019 13:27:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2019 at 13:25, <Mikko.Rapeli@bmw.de> wrote:

> buildhistory shows that busybox-dbg PKGSIZE increases from 4523596 to 4546396,
> busybox-ptest PKGSIZE decreases from 458949 to 458908 even when
> /usr/lib/busybox/ptest/testsuite/tar.utf8.tar.bz2 is added, busybox-src
> PKGSIZE increases from 4130952 to 4163274.

For me:

busybox-dbg:
-PKGSIZE = 5212120
+PKGSIZE = 5239440

busybox-ptest:
-PKGSIZE = 458881
+PKGSIZE = 458840

busybox-src:
-PKGSIZE = 4130692
+PKGSIZE = 4163014

busybox:
-PKGSIZE = 687247
+PKGSIZE = 691343

Oddly files-in-package doesn't appear to have been touched in the
repo.  I wonder if my sysroot changes broke that part of
buildhistory...

Ross

