Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 95EEF60110
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 12:17:30 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id k91so10823624ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 05:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=jPjxuKHna0sD2E7rsPWFA7mFOphb5X4UgWQZAkr4P+U=;
	b=IGPild8YJNDVcJeX73aPdKRrxZU9Kn6EcDFqDYPHrspLAb4XE2+T0NQwl3xdqFxHs5
	2QhPxk3sg03OgEVC4B0mGQx1BSYsxBDDMMwZiXv6x4odJpxNCt29o10QAH8qdxtlEI5V
	WR0Tz5aR7He/tJE/lDbdrwPs2Ja2TglEAsn9rArLpej3AImksxmcPR/jr7QIVqN9EMfT
	UadBZKL3Eq2VX2K0fZy9GOYhJbk2GIiDxI0oNl3Kpd52vsa3DqOhw5gitGdVBvl3O7Ar
	ukCIv4y+rAXY+VdCmP3gGPnHG7bQqJQMtU98yaYR+D/FojUaYm6UERDhRFzRjUoRIGsN
	zgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=jPjxuKHna0sD2E7rsPWFA7mFOphb5X4UgWQZAkr4P+U=;
	b=OJNIX6ndujlhJsbN43R3xoc+GoLOgjJv/0FJtmLvETo9e5xzQOv/TIxes0Y12tipr3
	RVIZDd/3kNwSfE0m5UtNZBHsKElrGkuR1tx8EnFj2TpVpehV00XPgYSzwgfC1f34ZwVv
	mpowJJKiaxLOqGV89yVBgfwyclfUbdSFPq999XvczQFOmN6vKOud5VieyWv0jUDXuJ2m
	2Gvexl4xMATJrIAxji2xKFMvBBicKIOLGfyspJvoCsohrgHoPPHkU0nQx5yh2kjo1SNC
	Guf0/5wAKENrFwOyCo99A8wVIWXG3bDvmWxe293jry6vLOB+dpk5Mg4Ayp36MUsvXiUI
	+utg==
X-Gm-Message-State: AN3rC/7uPJswJ7+XOSAG1LRw3PerRBx6yRMZt8k9NViatn2cqUA4/rcK
	O7VQNPxXLOn6MW2C
X-Received: by 10.107.129.85 with SMTP id c82mr7197492iod.92.1493813851542;
	Wed, 03 May 2017 05:17:31 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CE40.dip0.t-ipconnect.de. [93.232.206.64])
	by smtp.gmail.com with ESMTPSA id j5sm2372552iti.20.2017.05.03.05.17.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 May 2017 05:17:30 -0700 (PDT)
Message-ID: <1493813847.4241.251.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 03 May 2017 14:17:27 +0200
In-Reply-To: <CAJTo0LaHhRHzxmUaaF8MCHgKTvJPqKa0Q+rOjAd1vx4Ps0RE2Q@mail.gmail.com>
References: <aec82a5d8c1b622749a12bea2c478a8ff7f363b1.1493808889.git-series.patrick.ohly@intel.com>
	<1493810039.23535.57.camel@linuxfoundation.org>
	<1493812409.4241.247.camel@intel.com>
	<CAJTo0LaHhRHzxmUaaF8MCHgKTvJPqKa0Q+rOjAd1vx4Ps0RE2Q@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] QemuRunner: avoid tainting os.environ
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
X-List-Received-Date: Wed, 03 May 2017 12:17:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-05-03 at 13:00 +0100, Burton, Ross wrote:
> 
> On 3 May 2017 at 12:53, Patrick Ohly <patrick.ohly@intel.com> wrote:
>         Then it wouldn't get logged. Not a particularly strong
>         argument, though.
>         If that's preferred, I can change the implementation.
>         
> 
> 
> I prefer the clarity of copying os.environ and adding to it over
> running env, especially as you have whitespace/quoting to deal with.
> The variables added to the environment could easily be logged
> separately, surely?

They could be logged in start(), but at the moment the logging is in
launch(), and if we keep the semantic the same as in subprocess.Popen()
(i.e. caller provides entire environment), then that logging doesn't
know which env variables might be worth logging.

Anyway, the variables weren't logged before either, so I'll just keep
that and change to passing an env dict.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




