Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6E862135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 17:53:14 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id u205so57970853itc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 09:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=+vEVNKYi6ZCrDiKJtXO9aQ7DGl7xkQT7W1Yfrz2dcto=;
	b=DkCOYnnk+DdIlY9dEyPwevPIQtPLu6kGN3vmkt72KDQG7dS5YXYuR1bT/TSbbGm9U2
	w0/jntYi+b/BKAVBQ7ktldM2EkmJPK26/YuWarvBUtCyZiMZ40JDUwGCyGtTlQhRJuw9
	bMK2MWtuSBUzFPkPqcEmnQmtQ+ZINJ7Q4RD7PYbPztlOGp/CSWEsap5ZQOrr0xS5QSYO
	GV0XsU0KjckGkud0R+QfKLhIi6blTBlvPUBnaaMMWpLd5xHSsfGhNpJYFNaKcckBczwR
	C1l2JDziatGYSFdB5Ec9g/B8Nx7/1PhRsYlNJ3SND2PYZVRAz7fcb+Ja2V7WwJ4EfPvP
	Q7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=+vEVNKYi6ZCrDiKJtXO9aQ7DGl7xkQT7W1Yfrz2dcto=;
	b=VprQrvlzLFcg6iGa5/m3+tDEa5WxsDO5UwInPq6IbnRgwCJR6MQHjbs3ttA6iBSdMr
	s9aIEE7L3kDMKLvPV7RUrgwPjhAsR21YqhMsc9LDf6wueByCtW5m86VX6L84+HdUck0x
	sEN/tXwLWjYFv6WaLV8SdjBAmHuLiZXGxTl8e+j6+p3Udg20uj2DWYVd4kuhHVT9/7ST
	PRaFgmFE3TZqQqVm5AIWAwbeTzby/gG1S8BMekYS1fN6lrb9dWRnHtlXzuDHr7FgwvVd
	LQoksfjcHfKFA/QmKs6KSj7OMOHOYIVIon+6vdCmYN7z2RN6xGlGf5xeSeP9fgfDgp01
	SNxg==
X-Gm-Message-State: ABUngvfu9YJxCe6Uvii4zsg2bJBFLyIAE0h1h3KoHxBtO+JBj27sx3PrNOV5IEFAyBC05IEG
X-Received: by 10.36.78.85 with SMTP id r82mr16039071ita.20.1478800396013;
	Thu, 10 Nov 2016 09:53:16 -0800 (PST)
Received: from pohly-mobl1 (p5DE8C632.dip0.t-ipconnect.de. [93.232.198.50])
	by smtp.gmail.com with ESMTPSA id
	u190sm2358790itc.21.2016.11.10.09.53.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 09:53:15 -0800 (PST)
Message-ID: <1478800392.3449.79.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Date: Thu, 10 Nov 2016 18:53:12 +0100
In-Reply-To: <1476389794-109684-1-git-send-email-jianxun.zhang@linux.intel.com>
References: <1476389794-109684-1-git-send-email-jianxun.zhang@linux.intel.com>
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
X-List-Received-Date: Thu, 10 Nov 2016 17:53:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-10-13 at 13:16 -0700, Jianxun Zhang wrote:
> It turns out this change between 3.12.2 and 3.13 introduces
> a 2% increase of build time based on statistic data in
> bz10367.

Let me add that this patch increased build performance in Ostro even
more: apparently one big impact of the sqlite performance issue is on
pseudo. Ostro depends fairly heavily on pseudo because of meta-swupd and
xattrs on all files.

When this patch and others recently landed in Ostro, total build times
dropped from 4:46h (build #508,
https://ostroproject.org/jenkins/job/build_intel-corei7-64/2763/console)
to 2:07h (build #510,
https://ostroproject.org/jenkins/job/build_intel-corei7-64/2831/console).

That could also be because of other improvements, perhaps even in our CI
hardware, so take those numbers with a large chunk of salt.

However, in local builds with and without this patch (i.e. everything
else the same) I also see big differences for pseudo-heavy operations:

$ buildstats-diff --diff-attr walltime --min-val 60 with-patch/ without-patch/
Ignoring tasks less than 01:00.0 (60.0s)
Ignoring differences less than 00:02.0 (2.0s)

  PKG                                     TASK                      ABSDIFF   RELDIFF  WALLTIME1 -> WALLTIME2
...
  bundle-ostro-image-swupd-qa-bundle-b    do_rootfs                   78.1s   +115.4%      67.7s -> 145.8s   
  bundle-ostro-image-swupd-qa-bundle-a    do_rootfs                   80.3s   +116.8%      68.8s -> 149.1s   
  bundle-ostro-image-swupd-qa-bundle-a    do_image                   106.8s   +291.9%      36.6s -> 143.3s   
  bundle-ostro-image-swupd-qa-bundle-b    do_image                   107.9s   +298.2%      36.2s -> 144.1s   
  bundle-ostro-image-swupd-mega           do_image                   244.4s    +74.2%     329.2s -> 573.6s   
  bundle-ostro-image-swupd-world-dev      do_rootfs                  246.7s   +207.2%     119.1s -> 365.8s   
  bundle-ostro-image-swupd-world-dev      do_image                   269.2s    +83.5%     322.6s -> 591.7s   
  bundle-ostro-image-swupd-mega           do_rootfs                  272.6s   +246.1%     110.8s -> 383.3s   
  ostro-image-swupd                       do_rootfs                  676.1s   +808.1%      83.7s -> 759.8s   
  bundle-ostro-image-swupd-world-dev      do_copy_bundle_contents   1339.5s  +2957.6%      45.3s -> 1384.8s  
  bundle-ostro-image-swupd-qa-bundle-b    do_copy_bundle_contents   1475.0s  +3147.8%      46.9s -> 1521.9s  
  bundle-ostro-image-swupd-qa-bundle-a    do_copy_bundle_contents   1503.9s  +3283.0%      45.8s -> 1549.8s  

Cumulative walltime:
  6070.9s    +326.9%    30:57.3 (1857.3s) -> 2:12:08.2 (7928.2s)

So it really seems that the sqlite change is a very relevant
improvement.

That leads me to a bigger question: has upstream been notified about
this?

Our observation may also be relevant to other sqlite users. Besides, not
getting this fixed upstream means that we'll have to do the same tricky
revert for the next upstream version update.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




