Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 72D4B6B7CA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 22:30:26 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id k15so2978390qaq.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 15:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QWCiKezOmGeG14vCXW35TgkNeDr5LI4tJSZtkpDFDXo=;
	b=EK1R90wsTTr/PFaXES96zQ14+2QD6V3v5trPzo09lVstGT8g8njhmAZhaK6tKbid2J
	r7dyzKEHHOPFP7GiVy1tKsRa8fjWsD/TQGrbhXbcnol0oO+/0UhN+rg8bS8GCUDMXMkZ
	1m2EqV8d2KnsZkZGWUX3QeTc1rG8fxm30KIwwTpkc6O1j/NnY7TdECLRg260JqWC1t++
	bVVXy3pGztLthTWI8k3zCtoHoCRjpTrA0OzSA7RdtHPYOk7UK5nxPPj6rp0kVNjuQzhx
	LSOOYixVuopbcThwbfaX4b5NZZlQ1TPpBVLatddOyZZFc7qRRpB9GkDtjiQiWCqcMZtY
	Ihag==
X-Gm-Message-State: ALoCoQkL27zJx3r5oe341vF72LMnjOXzZoglFikrbCm91kCdkKu4P8Vr3BwRP9lVaCVjxWRhE7IJ
X-Received: by 10.140.40.84 with SMTP id w78mr32245543qgw.87.1410733827690;
	Sun, 14 Sep 2014 15:30:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Sun, 14 Sep 2014 15:30:06 -0700 (PDT)
In-Reply-To: <1410467636-17638-1-git-send-email-soren.brinkmann@xilinx.com>
References: <1410467636-17638-1-git-send-email-soren.brinkmann@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 14 Sep 2014 23:30:06 +0100
Message-ID: <CAJTo0LbAQ38w=dUqTKEXpt=BRvMk5WG9UCVFkMnEE31w95Xvtg@mail.gmail.com>
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: Allow setting hostname through DISTRO_HOSTNAME
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
X-List-Received-Date: Sun, 14 Sep 2014 22:30:37 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2014 21:33, Soren Brinkmann <soren.brinkmann@xilinx.com> wrote:
> Add a distro variable to set the hostname. This allows easily assigning
> a hostname in local.conf.

It's already as easy as assigning a hostname in local.conf:

hostname_pn-base-files = "cuteembeddedhack"

Also your patch doesn't add a distro-level variable, it just adds
another package-level variable.

Patches like this tend to appear every 18 months or so, clearly we
need to ensure this is documented.

Ross

