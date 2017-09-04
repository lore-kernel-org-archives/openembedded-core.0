Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9785A71ABC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 06:35:58 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id b9so3355150wra.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Sep 2017 23:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=FftkcYMxJHTkuTw9v/A0l+HKTvBnxT91/+rcbgH/qyo=;
	b=X5gW+8scNhYDUD2pnQoW3B2uue5Mx8ilJP1qQDpmi0ire2ByFVjWLclldKWC0Bdbd+
	aBA8ZDFek6/8rQfVkST7M/2Lll5ygnnzTiPdC3Zp3WQxECeIwgdwMHEay1/PuPNiR2f+
	Hf/8tPcb8O8jYftS9l+TNRQ6LtgM2r0l76jRWJ3DBgi7YbcopgRcfZM6tE0nchuD0j+2
	tDs8vc27Ie5KVvYJNyTkpbD+w8CjdssRmu5rXIyge6/SY4l90uxmBaDfLRwEyeR8N+WU
	2DLVQsiFizFdl/CtiFgjtIbTR6mOVDuXu38VuxspRaSwIks/6yF/YQIVyhIIGj80ouyh
	PVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=FftkcYMxJHTkuTw9v/A0l+HKTvBnxT91/+rcbgH/qyo=;
	b=rygBdSjKGqnvPpQILVn+pVcNbf8nI8zWkrDgpOI3FxUoWjmPz5TgV20tiNrsC/VuNB
	v11DUymUdhO3fTNOK0h5TNZoj0LX3LbmPCQZIXNddeqceihwK7nsqUtnOr9qVuNFyPrs
	HMWt72rUIXdBeNFFIhQZAY1NwKzuQxysmmi/mRMwLlhBv+XN3CHP83ioKxQPduWfNnQ5
	C0bjmN/UWPNLadfFBy7PJHIoKVi9EBZXaUdXe9UNMCizbilgiwY+Lkm/yKxHw2C5jXXC
	am5i+UJT6iZS64cZSPIBRKF0mGZ0RwO843ThSXVCYWJih9naR2d1xQng7vunUGICFVaG
	We5A==
X-Gm-Message-State: AHPjjUj0gkCFyxuSUuWDSdOzRatmh427TK3V/ixse1w16pXY/qMH75yf
	YCfiy21Ah69ATVe5
X-Google-Smtp-Source: ADKCNb7U1PAmpM5ABZKTpmA9xlKqG1hOYHFJHXGbgLkMOB7JOvMBFR5ij2YwQu45QxuJqZpQAypwaQ==
X-Received: by 10.223.193.14 with SMTP id r14mr5425083wre.64.1504506959331;
	Sun, 03 Sep 2017 23:35:59 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F21C.dip0.t-ipconnect.de. [93.232.242.28])
	by smtp.gmail.com with ESMTPSA id
	f65sm6395155wmd.41.2017.09.03.23.35.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 03 Sep 2017 23:35:57 -0700 (PDT)
Message-ID: <1504506956.12799.55.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, California Sullivan
	<california.l.sullivan@intel.com>
Date: Mon, 04 Sep 2017 08:35:56 +0200
In-Reply-To: <CAP9ODKpRT_BQGqzCd-fihZp-Dy4w0uiNr2bG_AYAvdta4wQPRg@mail.gmail.com>
References: <20170902000458.28655-1-california.l.sullivan@intel.com>
	<CAP9ODKpRT_BQGqzCd-fihZp-Dy4w0uiNr2bG_AYAvdta4wQPRg@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: split setup-live and install-efi into separate recipes
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
X-List-Received-Date: Mon, 04 Sep 2017 06:35:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2017-09-02 at 15:17 -0300, Otavio Salvador wrote:
> On Fri, Sep 1, 2017 at 9:04 PM, California Sullivan
> <california.l.sullivan@intel.com> wrote:
> > Having these the initramfs-framework recipe
> > forced initramfs-framework
> > users to build several tools they didn't need, and made it more
> > difficult to declare the recipe as allarch.
> > 
> > Fixes [YOCTO #12024].
> > 
> > Signed-off-by: California Sullivan <california.l.sullivan@intel.com
> > >
> 
> The patch should be based on the allarch patch I sent as it adds the
> dependencies on the whitelist. So you can also set them as allarch.

I would prefer to keep initramfs-framework-setup-live/install-efi as
arch-specific and only make initramfs-framework itself allarch. It's
just a gut feeling about the (minor) advantage of not having to rebuild
these two small recipes vs. the additional complexity of the layer.conf
and having to keep that up-to-date.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



