Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id C5B2571994
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 07:53:34 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id v202so15727382itb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 00:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=DvPWA69LT27URIch5h9Rl43VZ3YE4OMxfBz7ekLuSWA=;
	b=gAHRrzL8XwEezkFWDMVJePqZ51zBgrUrb5LW40bj9qlMGUQVh5yWN/r1Dez+b/l3lg
	dcnhT/S2LXhvXAC5Za+hkqhwZt5l2zOmdRwbRe7vkOGGaYF8iUL5VOvSi2HQQKDJQw7S
	hVASFVZF1vLP0SAfdnrwLMa+D7wtRxWBnljb1+rqt/DEfT6YyNRlHDUS3bkaOw38ZjD6
	0kiAXXiV/yJA0mFHuglZlBVAp8QWxNaz3wbiR+/klslysGStEWaPokSbytyf2FuxIDO2
	+VlCG1vAL3JZ1gU/RqFJEgfyZvaJzs+sHTiqahV316ZLVQRWV7N4+c9rp6HSsh+UUTzc
	AM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=DvPWA69LT27URIch5h9Rl43VZ3YE4OMxfBz7ekLuSWA=;
	b=RIsnt7fd4uL3cKnHQMrNkqVKg3ieSbsftZEZDyb+8k3r5a5vUQ4MjF0JF6JwxChMCU
	43rpNeADH5wFjk/tRnh1mwdxhYjr62K7KzQJoR8MZ2HH5ioRqGgH0FAzTTN26LD2WvXm
	8mC8V7KH90lrcQgiYDk1IgI3k5lGyR4Fcz2WIyfwNa32Z8+siSh3fF4xeZvjNBklZKzi
	TUIhAjgSSk4nXMAlAgH2oJhm1gsg68G0KMo7yC+WD1NUdcu2RrCn/SwPO04hqZ8iepzN
	MLki9Oiep/9tGBwLPIuIfBgKZfSnkS+Yx5NKeRnZHKz5LtTbFXToPwhY+QiDxjfp5+19
	iTZw==
X-Gm-Message-State: AKS2vOyEekabr4pL8fwGOW3UEF8KlfMIgxOxjL14NgY8qgJEMWuQ5xSn
	EMbnaCQyj9pi1zdW
X-Received: by 10.36.18.74 with SMTP id 71mr29189966itp.71.1499068415862;
	Mon, 03 Jul 2017 00:53:35 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EF7A.dip0.t-ipconnect.de. [93.232.239.122])
	by smtp.gmail.com with ESMTPSA id
	c198sm8087885ioe.48.2017.07.03.00.53.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 00:53:34 -0700 (PDT)
Message-ID: <1499068412.5259.71.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Mon, 03 Jul 2017 09:53:32 +0200
In-Reply-To: <20170703073115.GA5380@linux.intel.com>
References: <20170628073121.GA11425@linux.intel.com>
	<CAP9ODKoxxaJv=QZXp5m=Qt14t36n1TPXS19D+Xs3eyrPDG79bg@mail.gmail.com>
	<20170629083942.GA14649@linux.intel.com>
	<20170630083717.GA788@linux.intel.com>
	<1498813333.5259.4.camel@intel.com>
	<20170630122330.GA17125@linux.intel.com>
	<1498828593.5259.7.camel@intel.com>
	<20170630154456.GB28177@linux.intel.com>
	<CAP9ODKq3mB=0GBAZt21A3Ljw77TiNwBdCGZrSQt8L9rcr_i-Yw@mail.gmail.com>
	<1498847670.5259.9.camel@intel.com>
	<20170703073115.GA5380@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Mon, 03 Jul 2017 07:53:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-07-03 at 10:31 +0300, Ed Bartosh wrote:
> On Fri, Jun 30, 2017 at 08:34:30PM +0200, Patrick Ohly wrote:
> > then I don't see a need for any additional flags. Just
> > don't use the features which result in a rootfs modification.
> 
> I also didn't see it till last message from Otavio. Now I do - they
> don't want to change .wks files. They're using standard wks from
> scripts/lib/wic/canned-wks or from standard layers and they don't want
> to duplicate them when they don't want rootfs modifications.
> 
> It could be a valid reason to have --no-fstab-update option I think.
> However, I'm still not 100% convinced I'm ok with this if nobody else
> objects.

Okay, now I see what the purpose is.

I prefer a --no-fstab-update over a general --no-rootfs-update because
for each case where wic would normally modify the rootfs, some other
mechanism must be in place which makes that modification redundant (like
using PARTUUID). Having separate parameters forces the developers to
think about it. Just my 2 cents...

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




