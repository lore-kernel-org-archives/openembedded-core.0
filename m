Return-Path: <tkilbourn@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECD260290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 21:30:16 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 2so33209721ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 14:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=ih1sux5op6Xj6PAWHzqBE0IcmW5fdWG6tcWi+wc1dcg=;
	b=u3UNVtUym94tmf/XwtXEXWDANygTcki/Ad6zpSMucYFSZTMyXQVZ+i4kUHCLIpwo+8
	W459n2kuVLjQDFStGZ8K6PIaNZni5gCZ00Qh8f3PE2jA06BGDQr65xxSJoeThBYtmpU7
	Q9o7KKO6rYCoLbZNh+dMzOw58Qdc6k5BTPu6F4WdrwUHKm6uPgS/efuL1+pO2ULRKYTk
	yHE04mS6Gq1Y4KGoPVFFQharferleeFSKbRZQ/5gyjF7hNRlW3ckZpwtBkDneGdfCRr8
	vcYNlsCTKTvL8lqMU8yBwT/X3uy12suDCq7PcV0ELzaTaz5vT24dR3BzD5aUPvYqm6sz
	wC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ih1sux5op6Xj6PAWHzqBE0IcmW5fdWG6tcWi+wc1dcg=;
	b=PI/dOL0CQdkf6EYV6swKymRWYYS2Qng8tlTKzTDtJHggf54YeLoKb+HcRaSb5+wiaJ
	nMvzhhB5cpVmLRfg3U6xtcnbuz4iVGIQGllc2XWa10fYKRY4blf/5kKdQsU67IAnTGBv
	JPECEB7cM+FnbnYveCe4e9N62WNwuPPHubQoKawdEHKqUCHV+dUhHO7GOXtandaORx54
	4718mQXQIA5CBrW60m4NV9/G1ocN4fwBNvKhwyFUB+jBZpmKaBmXIApEyYjBLFCGRc0J
	EpGi4JrDOukkNB7Yk18WnPpPkLnOxm38feT16DPJ3nqWfHz1fcOoqgnrJ047Bkuh31Cp
	/WKA==
X-Gm-Message-State: AOPr4FXkmBydBo/akxA5m6VCRWRiOEVeDSleitJdKXqMY7FTcBQdUF0Z3eEwTglbIB7w42En/zt7S03xNifmvg==
X-Received: by 10.107.21.197 with SMTP id 188mr358778iov.59.1461101416690;
	Tue, 19 Apr 2016 14:30:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.6.144 with HTTP; Tue, 19 Apr 2016 14:29:47 -0700 (PDT)
From: Tim Kilbourn <tkilbourn@gmail.com>
Date: Tue, 19 Apr 2016 14:29:47 -0700
Message-ID: <CABAVd_HkmrR4AbO3h-WKbcnTGSgNva0mJmWP=mxTCXnahhbo-w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: backports for jethro
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
X-List-Received-Date: Tue, 19 Apr 2016 21:30:20 -0000
Content-Type: text/plain; charset=UTF-8

What is the policy for backporting changes to released branches like
jethro? I'm hitting an issue that was fixed in 2015 on master, but
didn't get included in jethro 2.0.1. Is there any chance of having
this cherrypicked so I can get the fix from the jethro branch in git?

---------
commit 9abcd309c098558360cde2bff65be840ead25f83
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Tue Nov 24 05:20:38 2015 -0800

    boot-directdisk.bbclass: remove HDDIMG before create

    Fixed when rebuild:
    mkdosfs: file /path/to/hdd.image already exists

    Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>

