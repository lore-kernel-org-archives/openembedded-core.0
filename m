Received: from mail-vc0-f173.google.com ([209.85.220.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UB1Zv-0002Wo-7V
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 12:23:30 +0100
Received: by mail-vc0-f173.google.com with SMTP id fy27so1110171vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 03:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=LgKeBEr8YVAoGxcKdLJhcWHHK7mbDT2pHAKODsv4Mn4=;
	b=avr4PNUYWN0z1lmjbZqxMs+6zqGlfH4TZZWPMCWkrbXiZ+tpKNsHXB8bdI8evTX2pI
	tiUymWilQhf2KR3sL7aLuRe/DedvZ2CVWvmmI9MyUlW8xOF0uYo/AcXHXKC5jDr9L+Ga
	Yr/5Mgf3pO+Fb7tSvNaIlZh8URBMxUAAL7yAYkRn8wSG8cszpXb8wB+k21wPX9dBZyUL
	+vYqfvts0MH+LknStv9pwZXI7tn6pNcg3VZqtRoCBk8EqgIeP+wHjkZPc1Vfb/TY5PT5
	n12s73ZcWr1NEe4M8sAanPjvpcsUmOZnwYQc+8/AoBgHpkJX3Gwwd7uKCoyP6xfp/hyN
	R/lg==
X-Received: by 10.52.92.225 with SMTP id cp1mr2068380vdb.41.1362049608683;
	Thu, 28 Feb 2013 03:06:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Thu, 28 Feb 2013 03:06:28 -0800 (PST)
In-Reply-To: <cover.1362033854.git.hongxu.jia@windriver.com>
References: <cover.1362033854.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Feb 2013 11:06:28 +0000
Message-ID: <CAJTo0LaFN=Q7kJQoJGTqrZamC=OT_pRD9qYrsO2854TWcG9Q0w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQnO372XW1vr3w/MJ7WbjE2ekb3uirVTGxz2ZnIc1UlaKxSInNGMfgd58sg6XWItVLf7kSof
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/2]fix native package compile error with gcc 4.3.4 on x86 host
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
X-List-Received-Date: Thu, 28 Feb 2013 11:24:06 -0000
Content-Type: text/plain; charset=UTF-8

On 28 February 2013 07:09, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Change from V2: as Khem Raj suggested, use `-march=native' to cause the
> compiler to auto-detect the architecture of the build computer, if the
> auto-detect is unsuccessful the option has no effect.

What happens if you're in an environment where you're sharing sstate
between multiple developers, and the build machine is an i7 but
another developer's machine is a Core2?    These machines have
different sets of extensions available

Using the architecture as determined by bitbake seems like a better
idea (which was V1, right?) as that's embedded in the sstate hash.

Ross


