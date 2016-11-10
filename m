Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 438BA6FEF3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 19:39:05 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id e187so282186981itc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 11:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Kl8Zinw/oeTNZ/Q4zOnS9gyPsNMr3EezJ6HT68l6vd8=;
	b=sUzxsTc6r8pgtHtdCQsqRs/3D0l7lwjY49HAIciXo/ES+DLmsvmREs3WbKUJctYAmM
	fPdhUfLi0GPJ5kpmoOzkZpEPXdXA3v5hP/VLBj8kTPnYV14TB1SR35Wn8AwM+w3+0BUl
	x+wGDe0PhV4Md3C/gFvILI0InmUGHzeoP8S6DP1S9akzMDqfxUj4+hV5jpqEIGY7T7I5
	lOXG5wiFjiGJysDjMlI8ZIem/i93CXr03FowoGRs9zc84Ng97Gl4D3rnRL9tD0JrJ27Z
	RWJbRz/G5YA4UJdhfBIXNXpRgi9LPTUfDzqXcPnfdWFxy34qrjbUWBT0sYi1II4P+NYQ
	oggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Kl8Zinw/oeTNZ/Q4zOnS9gyPsNMr3EezJ6HT68l6vd8=;
	b=Wq2xlbQ+d+b1YYKSL3vNAmGB3wF2zqsbABBtw6D48Pixv3L7Twdzhe31ZSx7Qo0Lk8
	XO77Z7Px005XBUCWrPHFWpeqT/2ae19yKwTemu3nCocJErxKqBZO2sFn3Z0Ns5vNwXk3
	PoJHG0bXmmIMbgbAOnfgb8IgSI4l2Atgso7KNlWSUyLjjjxgvzB8vTYuunEkPJzFrpt/
	zBRTwXe/FqAdAMDq7tJ9EYnlqIPcHXHUInfqgrz+r4rU7srO3/wR1xST7OVuXRGdhffE
	F8oEDUMz8BOCPg2P6ocTSWv7RUZ1h2QVyIv/Zrxi+8L14Qw8lx4fkekYwTG1/3KsxOuK
	UlNg==
X-Gm-Message-State: ABUngvcwUfcoKnPQiJJWyT4F0jSKeU56Olemdh0C2vI9nSf6nCQ93RDd4FTsrGz/3YQdDBvf
X-Received: by 10.36.233.66 with SMTP id f63mr14403653ith.55.1478806743851;
	Thu, 10 Nov 2016 11:39:03 -0800 (PST)
Received: from pohly-mobl1 (p5DE8C632.dip0.t-ipconnect.de. [93.232.198.50])
	by smtp.gmail.com with ESMTPSA id
	u19sm2520897iou.31.2016.11.10.11.39.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 11:39:02 -0800 (PST)
Message-ID: <1478806739.3449.82.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Date: Thu, 10 Nov 2016 20:38:59 +0100
In-Reply-To: <1478800392.3449.79.camel@intel.com>
References: <1476389794-109684-1-git-send-email-jianxun.zhang@linux.intel.com>
	<1478800392.3449.79.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Olev Kartau <olev.kartau@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] sqlite3: Revert ad601c7962 from 3.14.1 amalgamation package
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
X-List-Received-Date: Thu, 10 Nov 2016 19:39:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-11-10 at 18:53 +0100, Patrick Ohly wrote:
> On Thu, 2016-10-13 at 13:16 -0700, Jianxun Zhang wrote:
> > It turns out this change between 3.12.2 and 3.13 introduces
> > a 2% increase of build time based on statistic data in
> > bz10367.
> 
> Let me add that this patch increased build performance in Ostro even
> more: apparently one big impact of the sqlite performance issue is on
> pseudo. Ostro depends fairly heavily on pseudo because of meta-swupd and
> xattrs on all files.
> 
> When this patch and others recently landed in Ostro, total build times
> dropped from 4:46h (build #508,
> https://ostroproject.org/jenkins/job/build_intel-corei7-64/2763/console)
> to 2:07h (build #510,
> https://ostroproject.org/jenkins/job/build_intel-corei7-64/2831/console).

In case that someone wonders: in addition to that enhancement, we can
still do even better by also reducing the work that meta-swupd causes. A
build with my recent meta-swupd enhancements takes the build time down
to 1:05h.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




