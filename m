Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 23A6060684
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jan 2017 19:00:57 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id 192so32557881itl.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jan 2017 11:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=kMmiUbKIHFV7b1cJ4qTwvZ9WZz9OaNCFnf0j3MwAdP0=;
	b=ei01oceGdTD5zooIfIAZd/P5OcKAWhRDCuZs9y95LKaI1ocICOwiG9Iw77s/fGwc/W
	DDHaV3bugmdkYpGHtskSDyeu+xqjY7LK3jKb9XGIvKjHVatcy+fLX75Yxxx8mVSQHJDp
	cP4F1cVoXaXf+w/dhX8YyJZWaP0aoYf4QlRfO3T+5wG+aR/N7T5HZ6H+o+UyUZ+czrjN
	w01g1uDZEE30z8tBwvpAI+ks+Sz7VVlI5xbpsOwdtz2UtbmkqHvCR4zW4Bud9uf5uGlc
	+kphrlP/uKebqrShDsdxGmwDWvGB4I9I8bfJ3OwM2r8+rOdFmtUreSWCRXHaOmx11iXK
	W4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=kMmiUbKIHFV7b1cJ4qTwvZ9WZz9OaNCFnf0j3MwAdP0=;
	b=lIsQ3Tqu30LjtfqHTSPWXFZKjlGm+jDR9Q2VSb00ZhZQHaZbwVMHKO2y1zZ9E4ZvEE
	WD9nkjXgGVVBBHlF80Vt9S3Dkvo85xeae3uTQXkFsItWbWoCHWeSBhDIzun2h7fKc3jp
	2pDO7zPvrU/LHMNynmYYXN3QxpUbr2lagL3gPew8N08/epw78n7BJ8+o4CmMBmLocE03
	yrXbKpnokxT72Z/SXn/VeuRwJ4+G2QKmSf+ZJdh5+WZgebYT3/mTbK4A5GgHCm4G22so
	aQE/M7Qtd24TI5hwnDqZnP5mpfgZqO42nXaplqGz2fm1QTBBln2ujpXmU9Gja9pvy/PS
	9GJw==
X-Gm-Message-State: AIkVDXLSkrDibvcKAJhaX6avqHI0rGPCJXNUyWZ2t1CKfIuTvQ+w6AggIhMj+VOw21twKUV8
X-Received: by 10.36.47.197 with SMTP id j188mr3865027itj.68.1483815658050;
	Sat, 07 Jan 2017 11:00:58 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F82B.dip0.t-ipconnect.de. [93.232.248.43])
	by smtp.gmail.com with ESMTPSA id
	96sm27595700ioh.27.2017.01.07.11.00.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Jan 2017 11:00:56 -0800 (PST)
Message-ID: <1483815653.4383.28.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Sat, 07 Jan 2017 20:00:53 +0100
In-Reply-To: <1483783158.4360.182.camel@pbcl.net>
References: <1483630732-3560-1-git-send-email-patrick.ohly@intel.com>
	<1483737447.4360.180.camel@pbcl.net>
	<1483776414.4383.22.camel@intel.com>
	<1483783158.4360.182.camel@pbcl.net>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rootfs-postcommands.bbclass: sort passwd entries
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
X-List-Received-Date: Sat, 07 Jan 2017 19:00:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2017-01-07 at 09:59 +0000, Phil Blundell wrote:
> On Sat, 2017-01-07 at 09:06 +0100, Patrick Ohly wrote:
> > 
> Yes, but there's already a solution for that problem:
> > useradd-staticids.bbclass
> > 
> > I was assuming that someone who wants identical files is already
> > using
> > that. Should it be mentioned in a comment next to the new feature?
> 
> That sounds like a good idea.  And in that case, maybe it would be
> better to sort on uid rather than username?  That would preserve the
> "traditional" ordering in the file, i.e. root first.

I had thought about that, but then did not pursue that further because
it would have made sorting quite a bit more complex (needs to know about
line content, id not present in each file).

I can give it a try, though, if that's considered worth some additional
complexity.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




