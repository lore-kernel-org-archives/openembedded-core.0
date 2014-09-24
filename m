Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6623765D59
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 14:45:26 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id x13so3447593qcv.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 07:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Qi30lF9USCitC8Y782xHzwj7RJbeozcBt6vIfLhTjtY=;
	b=aUENphU3y6PcOolqhSXetXaN/AffxiDcAcBdcdK7iOxXMpVbJFQsN7xDjCzTNVdLoo
	ddCU5OipWFdzV6ShxHY72O+mN4aUPHX4C1/EeaBeKzhNLyYFVE9VIb9eTLY+p9TM+6tj
	rZDBWT2ie3ogYnwEW3ef7AdBfIrKQLdtGFhtocJbWnX6pBNxmKIUmmzTsNMVITZwAx6C
	gCd2OLXkHeTdJOc885iKNkN94TgDZ3PWkT2B5VupbLhhkkTEjIj3pEhNbASf+rjrmqty
	rLQ9qoF+SEP0PoAjGQDw2f6fjtuqmlW63JACr2kRNE5EO4JuB9zZT+P4g17n2PzUzjD4
	JlEg==
X-Gm-Message-State: ALoCoQmDbl1YO1cUwfx9ZRM8hYD5GgFd6pQYlevJ1ajKqDwkEMlyLxQs0LF4q4SDy5meVbiPopZk
X-Received: by 10.140.40.84 with SMTP id w78mr9966502qgw.87.1411569927954;
	Wed, 24 Sep 2014 07:45:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 24 Sep 2014 07:45:07 -0700 (PDT)
In-Reply-To: <7e7372c19a7505befddeb7f5ce6edcba6109515c.1411558039.git.hongxu.jia@windriver.com>
References: <cover.1411558039.git.hongxu.jia@windriver.com>
	<7e7372c19a7505befddeb7f5ce6edcba6109515c.1411558039.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 15:45:07 +0100
Message-ID: <CAJTo0Lb1YrBdRkRZ+_KpEaNvdbef0bAtRDJoLMw1RA=qGyrG9Q@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] man/texinfo: conditionally add gzip/bzip2/xz to RDEPENDS
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
X-List-Received-Date: Wed, 24 Sep 2014 14:45:31 -0000
Content-Type: text/plain; charset=UTF-8

On 24 September 2014 12:38, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> +    if "compress_doc" in d.getVar("INHERIT", True):

You'll want to split() the INHERIT variable so you're searching for a
member and not a substring:

if "compress_doc" in d.getVar("INHERIT", True).split()

Without splitting, an inherited class called decompress_docker will
trigger your code.

Ross

