Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4C977E39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 14:25:36 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id g126so88648908ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=6BVXk/JKbtH+nDe04Hhbz9mpHiM2Yy6d0UF2xRNIK5A=;
	b=NTMSyjK2SX+5HwIUCgTLhRf/cQvvCh1glNXvGcZdO6OkCulrNdO5PjimnmH0KAYfn7
	faPx5pAhNspf27lM7wwk01wyaIaWPAB8GvRX/T0wqKj9xn/Vradi9o3Ko8M3IDiwNz1j
	OrM3gajedaspB4F/1FzTon+qWa5b8Hn1V7KoIX/WGjrEgj/3ChZmZdhfu3L2vbkUlMJn
	Dl2X/nI5MIuAIaXzzfMQiAvc8+WnprBHnRMAD0lXyHVozjb5qo12J50asaggy3oNDfTz
	h/dO4sjJfA/qEGyTMdR68eMxsuOlrd+R0n//zU2AaciPo7ZVoIPJFR3XCk9LuSUQ2jod
	TdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=6BVXk/JKbtH+nDe04Hhbz9mpHiM2Yy6d0UF2xRNIK5A=;
	b=crDYplfF1V2vHyPP9a8WC/UKSGeuaTskF4QgZIh9d53QdcUbiyEMijDAVNMlpzvfPd
	CySOEZevpANEc6mu74fseBWWj2vWsb5SYDmD3MU7uUn2HX/e1Qkgx6KEOA598Lwd0Qic
	hqbfA2963njTU6qRNiFntzLK5j8gTjcy1u9P8sEYb8R8vz+qhc+j+qWWmUdN5LhwgeRt
	D7UQLOdWySr/8n8pxdjMuNf84V4Elzte1MmwvjtRWISV/SNq/IZSElsNyOPIljq1ewg4
	8iunhZSLjhUgvntrWrBVAW81RzpUi6z02GOkj7jVDsrHcD03UWi9fGW64DWuM+ijc6Ha
	mHgA==
X-Gm-Message-State: AODbwcCpnaqBSDVLq22ZyspEDaEOKlxvAFzwaougA98niMKAcs5kn3OF
	K3+RuADB6UHT+OgW
X-Received: by 10.36.78.200 with SMTP id r191mr10603039ita.84.1494944737492;
	Tue, 16 May 2017 07:25:37 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EB79.dip0.t-ipconnect.de. [93.232.235.121])
	by smtp.gmail.com with ESMTPSA id
	w79sm1051039itb.11.2017.05.16.07.25.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 May 2017 07:25:36 -0700 (PDT)
Message-ID: <1494944734.28624.19.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Tue, 16 May 2017 16:25:34 +0200
In-Reply-To: <4da20a5f-4d38-e3fb-b31e-f42ce8505564@linux.intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<79e18217-d4ed-8356-9532-7da63a420d6f@topic.nl>
	<1494922912.1179.306.camel@intel.com>
	<aaeaad51-6bd1-10c4-ce22-4381c07bd9a8@linux.intel.com>
	<1494942469.28624.10.camel@intel.com>
	<4da20a5f-4d38-e3fb-b31e-f42ce8505564@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/6] development vs. production builds
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
X-List-Received-Date: Tue, 16 May 2017 14:25:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-05-16 at 17:02 +0300, Alexander Kanavin wrote:
> On 05/16/2017 04:47 PM, Patrick Ohly wrote:
> 
> > Then why is not already done like that in practice? Is it just because
> > OE-core and Poky set such a bad precedence with teaching developers to
> > add EXTRA_IMAGE_FEATURES ?= "debug-tweaks" to make the images usable,
> > and then that approach gets copied?
> 
> It is done like that already, it's just not very consistent from what I 
> can see. For example, core-image-sato-dev.bb:
> =============
> require core-image-sato.bb
> 
> DESCRIPTION = "Image with Sato for development work. It includes 
> everything \
> within core-image-sato plus a native toolchain, application development 
> and \
> testing libraries, profiling and debug symbols."
> 
> IMAGE_FEATURES += "dev-pkgs"
> =============

That's different. Here an image recipe specifies what it is meant to
*contain*, not how it is meant to *behave*.

One would need core-image-sato-dev-production.bb (no debug-tweaks,
dev-pkgs), core-image-sato-dev-debug.bb (debug-tweaks, dev-pkgs),
core-image-sato-production.bb (no debug-tweaks, no dev-pkgs),
core-image-sato-debug.bb (debug-tweaks, no dev-pkgs).

Allowing EXTRA_IMAGE_FEATURES in local.conf.sample avoids that.

> I'm not a big fan of placing INHERIT into local.conf either, by the way. 
> I believe in functional programming principles, and this goes directly 
> against them.

It makes sense to me when the functionality is orthogonal to the
content, like enabling buildhistory.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




