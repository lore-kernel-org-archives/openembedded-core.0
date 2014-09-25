Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9754B60144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 15:08:42 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id j7so4600507qaq.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 08:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=15E7e5FU8ok1InbnJx+vemzRVhh+JfFfiJlCLfHBHjg=;
	b=c/DNg+IQx1LUTjxd9w2/v94LGzHU7k26hCLPFzD3kOWb6gq6/doSDCAuMhMk9xDech
	DMKCbXGMamLlMZ3gR9NI7QpZVc5dGe1nMSL6j3vLoHS3ewTTXBQ/vMYslwhVyiIUCc8i
	DgxGQVkIwFVUC8Xl+UDT2Icd0kxAzVLGzUeIL/VCaUEiZKD+3SjQgmZGqrPau8zUwUTp
	Y3j7ca+lPZllDFwOfHgzZjt+bGTJwF6QxGNqPbCB4VDYR/cq2SnTGLsZEvc38zxWR6+/
	O5o5+Lxukk+oICdlzc/U0ayMC/fAaqVvag5l14D4l5Bq66RyN8TaW1rpomrZvI+roU3a
	DYOA==
X-Gm-Message-State: ALoCoQl2hRsiUWPx/0EcGtqdCIK/uKMT6K4aW5ctsuhuN648s/hBSAqmRMk5iD0FBTa+HGLkFZRG
X-Received: by 10.140.40.84 with SMTP id w78mr21184149qgw.87.1411657723190;
	Thu, 25 Sep 2014 08:08:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 25 Sep 2014 08:08:23 -0700 (PDT)
In-Reply-To: <1411644990-20122-1-git-send-email-maxin.john@enea.com>
References: <1411644990-20122-1-git-send-email-maxin.john@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Sep 2014 16:08:23 +0100
Message-ID: <CAJTo0LbhFF0g1swk1y250QOESwvjmJcuPcbZNvX_ESJTMt3GKA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: Security Advisory - CVE-2014-3613 & CVE-2014-3620
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
X-List-Received-Date: Thu, 25 Sep 2014 15:08:45 -0000
Content-Type: text/plain; charset=UTF-8

On 25 September 2014 12:36, Maxin B. John <maxin.john@enea.com> wrote:
> Details of vulnerabilities are available below:
> CVE-2014-3613: http://curl.haxx.se/docs/adv_20140910A.html
> CVE-2014-3620: http://curl.haxx.se/docs/adv_20140910B.html
>
> Signed-off-by: Maxin B. John <maxin.john@enea.com>

This fails to apply:

ERROR: Command Error: exit status: 1  Output:
Applying patch CVE-2014-3613.patch
patching file lib/cookie.c
patching file tests/data/test1105
patching file tests/data/test31
Hunk #1 FAILED at 49.
1 out of 2 hunks FAILED -- rejects in file tests/data/test31
patching file tests/data/test8
Patch CVE-2014-3613.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/data/poky-master/tmp/work/corei7-64-poky-linux/curl/7.37.1-r0/temp/log.do_patch.13247
ERROR: Task 1 (/home/ross/Yocto/poky/meta/recipes-support/curl/curl_7.37.1.bb,
do_patch) failed with exit code '1'

Ross

