Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id E3EA071482
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 15:12:13 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id v10so1964796qac.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 08:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0d/eU1MGQZ6D6m3tzF+dlkPfpk79/ltqWBD5E+GcTmc=;
	b=Mo3FGDtc48YxFUUYKW+O6+LNjvxZqmu7M+RVKj5dzWshc9mbI/Onx5ygeb2QprlxmH
	DKeB2Yyo/2oZV3aOJFY9PP4v6KjpZyasEA9OEB1SUSkofVP5XAw1jM2R0bwLPg83SrrK
	b29fdprFNt4gf3KgxaWPZ9NbimHMUmBbkB5vM4OXxt9/WcwPiGHONKFZfTB49RioNy3A
	ucuG0xvPinbvYxgmBLFQ3tnyImkDXT7k85TU0Cwex6kp3WBa2BHYRhY018KH5o3/jUeC
	JCPbVqvkVJb+Ftq97OAxXk83QNzFAC0r8E9S3iNRi/Yutqh06xCDX4mkagRgV2EH3tXc
	TBgQ==
X-Gm-Message-State: ALoCoQn/ETdjwVqRiLSM2EHajrqoq0nJGIoV+KV2RRHpfB8/gqL3CVJvlBl/dQOA4AwF36BwCy8k
X-Received: by 10.140.27.139 with SMTP id 11mr16979255qgx.59.1410966733647;
	Wed, 17 Sep 2014 08:12:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 17 Sep 2014 08:11:53 -0700 (PDT)
In-Reply-To: <cover.1410879378.git.kai.kang@windriver.com>
References: <cover.1410879378.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Sep 2014 16:11:53 +0100
Message-ID: <CAJTo0LYPVqG9pPrTeMLyzjGH2=2mb7W6av4dYHJq5+ZZk+3r2A@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>
Subject: Re: [PATCH 0/9] V2: Add machine qemuaarch64
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
X-List-Received-Date: Wed, 17 Sep 2014 15:12:19 -0000
Content-Type: text/plain; charset=UTF-8

On 16 September 2014 16:06, Kai Kang <kai.kang@windriver.com> wrote:
> V2:
> * fix kernel linux-yocto build faiure
> * redefine position of dynamic linker from /lib to /lib64
> * other fixes of userspace packages
>
> Test with Joe Slater's patches:
> * siteinfo: account for 32 and 64 bit arm
> * sysprof: add aarch64 support

So aarch64 support really needs qemuarm64 in oe-core to be tested, and
qemuarm64 is a new feature, and we froze for new features two weeks
ago.  Blindly merging aarch64 patches that we can't currently test
doesn't seem sensible.

Could someone who is actually testing and working on the aarch64
support (you?) manage a single branch that tracks master, so when 1.7
branches off we can do a merge straight away.

Ross

