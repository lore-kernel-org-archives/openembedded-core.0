Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5AA60809
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 15:03:23 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id v10so3969216qac.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 08:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=P9Gn2wY8HoNsdaU9pSXEd3YfZwlez5xGTFipJ6CX0oI=;
	b=aoZxq59iQV+9MRm0Gcca3nu3O0NxiKZAMz5zPlYV9CDdpc6kzH8Oz9k4VHEdqsOilM
	z/ntK+ABIvydGBjrrfw2bUPUz0mh3gwarcCvbdEetAJutB1kbrflr90UHeP/mt7ghdAS
	+Ad+z69RXq+CC7/3pKavmvRa3dM1beahNbN7oir8yb0pZLbOi3kjbBa8VWJ5GCKaPBsr
	6lgxPlgb8iRJIqDJuW7tjsKXR8pobjM0Q/3rw47Jpn+vaj6K7lcPWSV12blo362ccNVb
	3b+lkqGfr/iR/zbjtFDI7ClD+n1DOM85uoFBNth7jcG9ikK0LIJuuXTXZXvooKKIyIr+
	+Y7w==
X-Gm-Message-State: ALoCoQlXFlFNtvHh/RDuqojRMPVxFGuy4d8jdYLbV0thWYU6fh63uXqJEKvMzIfvL5kjcVBaeCpH
X-Received: by 10.140.40.84 with SMTP id w78mr38262333qgw.87.1410793403688;
	Mon, 15 Sep 2014 08:03:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 08:03:03 -0700 (PDT)
In-Reply-To: <5416FBFD.9070406@topic.nl>
References: <1410536389.14624.1.camel@ted> <5416F0A0.80000@topic.nl>
	<1410790333.14624.45.camel@ted> <5416FBFD.9070406@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 16:03:03 +0100
Message-ID: <CAJTo0Laq_U-2txJrN2jcw=0+JznCh7C4TU9Md+aKg5h-n9GaVw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license: Improve disk usage
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
X-List-Received-Date: Mon, 15 Sep 2014 15:03:25 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 15:47, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> It's just that the try/except version will always work on any system,
> whereas the device comparison may fail on some setups. And given the habit
> of programmers to copy these things from other locations, chances are that a
> device comparison will some day be used on the "downloads" directory which
> is FAT on my system.
>
> Also, when the copy fails, the resulting message should be clearer, as the
> "copyfile" call will be in the stacktrace.

I believe this is called the "try and ask forgiveness" pattern.  It's
race-free, too.

Ross

