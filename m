Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1IdG-0000ap-NT
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 16:34:31 +0100
Received: from mail-qc0-f199.google.com ([209.85.216.199])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 07:18:41 -0800
Received: by mail-qc0-f199.google.com with SMTP id b14so5517470qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 07:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=BMy4olAvgES6ox/YRNM7IS/ad2fndDGFHbmI1MM5ZAY=;
	b=CVGsrnWxvX/sjPy/Unv9jCUCA5Spa9t+8U/3K0ZwIfVBWJzvxadUEhCS4QHUp9FCjP
	bGC1ovifnn85pV08ijct6WqTEujWpyYUXM1bEKIInJf5sgVPDfu2GQNGZplTi9UAZjYl
	xlHYT4nqIewVgXkhwwnW0Oj0xyViQONMwavu00z/yZv7o2it7cVVMOZXABXqX3SInw3c
	vQVfr2Bh7Q4yYzaSHHEGkM5RFt9e8m0T/zP0NqrLS8k+jGbER/U2OHBTbgVg4soDL0y/
	C+Gr+uxeoQDho2297DBjeAVZOnBHByI3Ii82ruIFR7OjnIq2XqqllrheuAedjP5xarLE
	vMHQ==
X-Received: by 10.52.90.243 with SMTP id bz19mr5884564vdb.112.1359731920187;
	Fri, 01 Feb 2013 07:18:40 -0800 (PST)
X-Received: by 10.52.90.243 with SMTP id bz19mr5884560vdb.112.1359731920110;
	Fri, 01 Feb 2013 07:18:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 1 Feb 2013 07:18:20 -0800 (PST)
In-Reply-To: <CAJTo0LaaHc7Y9ZyFkuktBE02p9D4aeju0nOdFWAtMH8rdVXyZw@mail.gmail.com>
References: <510BD7AD.5090506@topic.nl>
	<CAJTo0LaaHc7Y9ZyFkuktBE02p9D4aeju0nOdFWAtMH8rdVXyZw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2013 15:18:20 +0000
Message-ID: <CAJTo0LYH+m=muuXsxMakcENq+DSfn6cTVtF9YPbRbJqWrdQuDQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQl6hg5/8yeQxG9+NVAxlBw5k0eBb4wK5YbUVDisrCJxjw0Vogl/NYjPleKdZmWt1n3bZ8NXj5C74YQzFrI0CtJ9KFpEj2cV4ELChAYJ3tCYJc5JPfHy3rTvrMzULyLN4RuZqGAhaLBvCcu7uRVBE40oX/7RS4JJiUoOb7Ku2u3JDDmtdpKHer5hfFiPL1F4e/zCeG9K
Cc: openembedded-core@lists.openembedded.org
Subject: Re: What's up with "fontconfig"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 15:34:34 -0000
Content-Type: text/plain; charset=UTF-8

On 1 February 2013 15:09, Burton, Ross <ross.burton@intel.com> wrote:
> Erm, yeah.  The git log that file stops in 2007 and they were present
> then too, so the appearance of them isn't easy.

Richard pointed out I didn't read the diff properly and it was me who
introduced this.

I have no idea what I was doing.

Ross


