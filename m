Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
	[209.85.210.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9E1795AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 10:10:10 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id c12-v6so1373679otl.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 03:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g+8xFlc3jPtYx5UI927KU1GiCBRrAOA0gcMKjX0qH0s=;
	b=NuxmwUle4saHURj46EbZXYca5yi2azOpDfl9ZNx1I9tpVPhpYQIcvPpb6kx+lQos8+
	OsBhyprtkrdpoUca/THjC08vE6VvB3BNdjLzb4BWhRHHFsnp8OgrOxZjrL+TuDFJkexn
	nlj8ClQwJ0S3AlL2Cns2OVmzdPUuzgid5KAQ/tas6LQHgLaiIbTLYMLbkyKlgo9v5rmL
	Wrs7pjtdr+cLZl9a6159tO4QumXdgUloDdEL+rNu3WfHJkgeyPbFDopX6e7pqVl0ef3J
	/l30tsv73xHa0UDtjDksiu0jy7LloNxJgkdXFoTRYN8TxpW1MN6VjVfoEZc6eRpk6M5z
	WjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g+8xFlc3jPtYx5UI927KU1GiCBRrAOA0gcMKjX0qH0s=;
	b=N4Ubxvs5A4JAgKqNQZYo9XcEAjMh8bvZeYOvKXT5rLhOlOscjvgKU2W7V97/g2+I1e
	3fdxjv5TeJFvrUMnrxOL8VRoBjX9dMWyQvoHUYUJeCDHaSX/dvLalK2LJjCZVHYTAoPk
	QQB/hcFobKQRLl8rnpELX8PQyW65fQRh0MJOmc3VkZtg45WWZMz8P5oHdPekcoF0wl6f
	QQQKon1R97fl9HrfXjUZTwjYXzJMbtUUooshaF2RfjP6AvZg8d6gSXFVGREQAzR9ens4
	bPnxiMMp5NnTFCmrxu1kHjQe+uK37S9hf7AIJytxhQQPAGCVCTvN4L4EyZYgaVNn6iMt
	lsQQ==
X-Gm-Message-State: APzg51A0pGLSPJ5XvZUmg4Dl6T0GifyG6G/Uj4jazjNqIHeARJokTqzu
	xjwuYCXRuOhodsMtEKjO1XXjKm8hZP8FNxV6FVorK7sh3wQ=
X-Google-Smtp-Source: ANB0VdbK5RUuFopUrJUD9fLYSoq12YRiGYfa9UROInP+mtxdasZHm7GIyzXupEBieYE4zKiuZ0S0l6R49zI1uSM+1aM=
X-Received: by 2002:a9d:2253:: with SMTP id
	o77-v6mr16251955ota.204.1537265411987; 
	Tue, 18 Sep 2018 03:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20180918090009.69835-1-zhixiong.chi@windriver.com>
In-Reply-To: <20180918090009.69835-1-zhixiong.chi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Sep 2018 11:10:00 +0100
Message-ID: <CAJTo0LY66itRz8dbR_JS-8COmPvK7obA+PV3Po8q2GvmOARDAw@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: gdbserver: update ctrl-c handling
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
X-List-Received-Date: Tue, 18 Sep 2018 10:10:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Sep 2018 at 10:01, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:
> ++Upstream-Status: Pending
> ++cherry-picked patch from https://sourceware.org/bugzilla/show_bug.cgi?id=18945

Sounds like the status should be:

Upstream-Status: Submitted
[https://sourceware.org/bugzilla/show_bug.cgi?id=18945]

Ross

Ross

