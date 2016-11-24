Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2B37371B58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 11:13:42 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id j65so74192686iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 03:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=9bej04XnLbkKDkPcTG8IBtUe5EleIMwNhyi6oQIQY8g=;
	b=AAz8anAWJxG3HtApjPeV7c/q+ooRvorPAzeIzecSGSLbSKWtp/ORLE8GD3czc+8qeG
	C5fZoJgQ83CdEeUjvjdFje+y+WLOjISlfhbEXTQBjdSoEfUxqC4+Zx5d7QtdMRwcIxyI
	fSr3YM5PwV0A82JPV8mRC+CUQ12sny4Et4uD5gAllDEyQ4L9K5pUS1glReKsLqTPY1n3
	Fg0buOXE4wEgKVPsb7lCFYZNG9zxUKLTQnbCELQ0+6dGhjLm1fetTMnScA6tY2CjlNEj
	z0/ckIxId3m/FDq0j9iOg/hJ6WWHel4nt6sBhCCcz1S/v/OhKt0sobGawa0WSulsMxj6
	At8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=9bej04XnLbkKDkPcTG8IBtUe5EleIMwNhyi6oQIQY8g=;
	b=LegeXX7o3IyrG+mpI8F0Vjq2S0G+ToBGaG1aQ8BG++fIssIA9vKm8M+F7m+qHLETy4
	bRrteselvsKDL1wI9Ew8d3wU3khli8OV/5LFxoSFqZunyhzI6WDvPBwuI6UBUwNxW9/X
	RXQUPZz65+faI8Cc387i5WS6Y+G1oH3bkjNUZDAPsEhyfSOuyy+Oagm+1MagUq0hU8YN
	4BSB6XRLIc7VaMbnSVwr0b4eohRcl0BCbEOUQlu5XgBBUXp+wLwVKNxCZvW4aIpPamBG
	5Guojgy4pxdq1ahBI9X+srUw/AfIPQZ4cdRXOMihxRm4EuuOZmpr+Q64ac8tRcttiVCM
	1Z/Q==
X-Gm-Message-State: AKaTC00AS1+7DtwxDwbHdYqls5mWh1dGoj/AHgLXLZxWsYZAPsfZ3f4ArdiNGgqPXUznptyC
X-Received: by 10.36.40.139 with SMTP id h133mr1560890ith.40.1479986024302;
	Thu, 24 Nov 2016 03:13:44 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D6D7.dip0.t-ipconnect.de. [93.232.214.215])
	by smtp.gmail.com with ESMTPSA id
	e68sm13192095ioj.39.2016.11.24.03.13.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Nov 2016 03:13:43 -0800 (PST)
Message-ID: <1479986020.6873.36.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 24 Nov 2016 12:13:40 +0100
In-Reply-To: <f2e7d5d6-7094-10b6-16bc-9398c8bb828e@windriver.com>
References: <20161123174209.211349-1-mark.hatle@windriver.com>
	<20161123174209.211349-2-mark.hatle@windriver.com>
	<20161123181039.GF3265@jama>
	<c06ab920-517b-b6b8-f2c8-e9ec8ae8714c@windriver.com>
	<20161123185617.GH3265@jama>
	<f2e7d5d6-7094-10b6-16bc-9398c8bb828e@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta/conf/layer.conf: Add recommended download layer
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
X-List-Received-Date: Thu, 24 Nov 2016 11:13:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-11-23 at 13:42 -0600, Mark Hatle wrote:
> On 11/23/16 12:56 PM, Martin Jansa wrote:
> > "Have all patches applied to BitBake and OpenEmbedded-Core (if present)
> > been submitted to the open source community?"
> > 
> > Shouldn't the wording be change to something like "all applicable
> > patches" or "all generally useful patches"?
> > 
> > It seems strange to send project specific patches together with cover
> > saying that they aren't generally applicable and shouldn't be merged,
> > just because of this requirement.
> 
> It was done this way to prevent people from cheating and claiming something was
> (effectively) not useful/applicable/etc when it some special secret sauce.

Perhaps one could use [FYI] instead of [PATCH] in the mail subject to
make the intention even clearer, and patchwork could get configured to
not track such patches or at least not show them as new? Just a thought.

As it stands now, there's an entry for this patch that someone
(Richard?) will have to close:
https://patchwork.openembedded.org/series/4056/

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




