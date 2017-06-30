Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id D53AC78237
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 17:33:07 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z45so39820874wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 10:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=P35nDu0OLH9XAuAdBKjXXAjKIv1xA4RTVZpAsKmJu4g=;
	b=opgCDLUfWQO3NxQNJ5JogQFkequZVAJC4n2ykSgbp/Z5eU3gVdwY5+4TXMiVa6Dhz8
	FXPMUZb6Blq9vDYY6y5TxsXL0Ip3oIM2+9oehkrtDi1Ka2EUiyJ0Sjv08i3hnH9Ah4/m
	UxdVlB2FlwsGSiRlMNSeDar5kbWHk8LrFpKLe0SLbCw01UB9MQsDBXzFbT86SYQhR634
	jLkZyFZoF5QA1feiPOXYOjD9VtrRx8jgfeWowsA7nHTZb9eN9VnbB5F2zkYsrYJhfE1N
	0Jee1RTtpKTTLj0MSZJYSnoL9zPO/m1vsEcUEPOI1TVPSQf8eGfWCdKuNtfzdMQBbrUW
	NoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=P35nDu0OLH9XAuAdBKjXXAjKIv1xA4RTVZpAsKmJu4g=;
	b=jD/5EZAFcDmXDbxi2P6rl4i5O74xnD6rmsrsh6dnI2u4oi0GuL/v8RfMbwFv9/qSsu
	OEei7C+4jIW/jqRxuTXfL3fOYNGpiYMTPDNxrmwT4Q912cwGJmDMPzWq9Gogs+em+OV5
	/YOtBy+ZKIDIXjXwU9xDLZ6FHao4/2ecG/eqN/WrvKDwF8I3XesJyeJ2CVBcfDtwasVD
	rfpO7kTxvLhEqbTVF0Qb1QcAtFPwM3/RIVSthy3rQIj2DsCRCiBhSPFCevhFv50U3SZE
	MsS71sVMWAvyJ9fYyWLUjKBa1HtladNWTPiRB6ciWZGFcvaHMD/67I9KhXT3Hj85qsJa
	itkA==
X-Gm-Message-State: AKS2vOzWKSevLZdh3Wn3Vw7hyD4YMtOFuJGquK1I94mCZp+lL6T9oqIe
	br3l705EAzL/R52TOu8=
X-Received: by 10.223.135.68 with SMTP id 4mr17978153wrz.141.1498843988231;
	Fri, 30 Jun 2017 10:33:08 -0700 (PDT)
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com.
	[74.125.82.45])
	by smtp.gmail.com with ESMTPSA id n14sm6082119wmd.1.2017.06.30.10.33.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 10:33:07 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f45.google.com with SMTP id w126so116055118wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 10:33:06 -0700 (PDT)
X-Received: by 10.28.63.66 with SMTP id m63mr1507133wma.118.1498843986675;
	Fri, 30 Jun 2017 10:33:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.209.14 with HTTP; Fri, 30 Jun 2017 10:33:05 -0700 (PDT)
In-Reply-To: <20170630154456.GB28177@linux.intel.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
	<823180ba-066d-747d-8112-a110633a03a8@ossystems.com.br>
	<20170628073121.GA11425@linux.intel.com>
	<CAP9ODKoxxaJv=QZXp5m=Qt14t36n1TPXS19D+Xs3eyrPDG79bg@mail.gmail.com>
	<20170629083942.GA14649@linux.intel.com>
	<20170630083717.GA788@linux.intel.com>
	<1498813333.5259.4.camel@intel.com>
	<20170630122330.GA17125@linux.intel.com>
	<1498828593.5259.7.camel@intel.com>
	<20170630154456.GB28177@linux.intel.com>
Date: Fri, 30 Jun 2017 14:33:05 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq3mB=0GBAZt21A3Ljw77TiNwBdCGZrSQt8L9rcr_i-Yw@mail.gmail.com>
Message-ID: <CAP9ODKq3mB=0GBAZt21A3Ljw77TiNwBdCGZrSQt8L9rcr_i-Yw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Fri, 30 Jun 2017 17:33:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 30, 2017 at 12:44 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> We're talking about different things here, I guess. For me if target
> rootfs content in the image is different from rootfs produced by bitbake
> it means it's modified.
>
> BTW, if this patchset is accepted wic will not be changing fstab in original rootfs anymore:
> http://lists.openembedded.org/pipermail/openembedded-core/2017-June/138803.html
> However, it would not mean that rootfs is not changed.

Honestly it is quite confusing to me that wic changes fstab content.
It is confusing as you add something on base-files for fstab and it
may, or not, be what is used.

As I mentioned before, our needs is to have a way to forbid this
behavior and we use standard wks files specially when doing
development so an option makes it easy to adopt one way or another in
a distro for example.

Other possible rootfs changes also should be possible to be disabled
but IMO it should be per-feature (one for fstab, one for exclude,
...).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

