Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 66584778BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:49:47 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id m27so4444496iti.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 10:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Ek7D4ZU4CYun5ZH6O0XT3ggzlznUW42xDIJcYMSdJJ4=;
	b=u86myyNQYQc4QjIoVUWcU0AmTe8X28U680+PuHQMRiNvB922D0baLcFoanQv6KX1rN
	4ZntcT9W1GcSJ5E7mjeVnruQlfdz8Wty+kCAiyGUEPuAC+rEhRhka3oMWpeFRM2xrdJl
	7kJ1YWFUlcJOytYKfRyOY8Yqq5dUECcD54oAzvj6U+o0nJAab7YwKiVnhvTZQsxBYy3L
	RdZyDcNoblqbpuwaRMuet/lwZYIGF7hS/y9aRWMZdituTI0XpI+AfP/oS3jmkKGB1anH
	xD6aVSdAyI+YnSbLiCahkV98IxrFhJj4BFwMCeUYyI5Ts3ugpL6DbtdI8MWgTD4P1UJQ
	/ZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Ek7D4ZU4CYun5ZH6O0XT3ggzlznUW42xDIJcYMSdJJ4=;
	b=Afy1ZqYo2tCFdhOyNwe53+Fxzfejpj5GpQX6mh0hz3jrptbQKAs7jjswBiZPkmDznX
	PJ+e7tzSG/4FvPZN0b1Auqf7a1+uu6LK7w4OLulDCqnDQXPPNKrvfGJOu9O6awJGSs4x
	uTjMVDTDK8pbFCzundgAd8lOOHh+M3z9b/H9m1LMiafzMO8wqCfNIuISTc5LovxaAYpr
	Jb56f1YjYt3fm3TUpmwqQqoc7mhFO4LI+tcn2CInX2ylbKBEH22GZulCj02chy3Zn0Mp
	qfQhf9gwrG0p+r4+xAQ6mljtW7ViXRtmTx56pkcyL2pLZ36bwecYOP6eBpn/0tzO2uXb
	Eiqw==
X-Gm-Message-State: AFeK/H1CE7Z2avDhYGUOudZ+nVeONCIX9PEq5RfQlwsWVqtObW7euMQSMt8dFTCOA0ek0iZ3
X-Received: by 10.36.85.207 with SMTP id e198mr18269716itb.107.1489513789470; 
	Tue, 14 Mar 2017 10:49:49 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D70D.dip0.t-ipconnect.de. [93.232.215.13])
	by smtp.gmail.com with ESMTPSA id b25sm262617iod.32.2017.03.14.10.49.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 10:49:48 -0700 (PDT)
Message-ID: <1489513785.6396.83.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Tue, 14 Mar 2017 18:49:45 +0100
In-Reply-To: <20170314171147.GA28498@linux.intel.com>
References: <2791e915-9e22-a01a-ccb5-c629d250edb2@phytec.de>
	<20170308105729.GA22401@linux.intel.com>
	<7d4a770f-25c6-5747-5a5c-370c822f2efb@mlbassoc.com>
	<20170308134349.GA16099@linux.intel.com>
	<a0d78645-9670-f3a1-cd9d-d66370e89ef9@phytec.de>
	<20170314171147.GA28498@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Subject: Re: Create more than one image with WIC
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
X-List-Received-Date: Tue, 14 Mar 2017 17:49:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-03-14 at 19:11 +0200, Ed Bartosh wrote:
> On Mon, Mar 13, 2017 at 05:16:31PM +0100, Daniel Schultz wrote:
> > Do I have misunderstood the design of wic?
> >
> > I mean MMC and EMMC are very similar, but different in the
> > bootloader and it would be a overhead to create an extra image for
> > all EMMC images.
> 
> You don't need to create more than one rootfs with the same content. You
> can refer to the same rootfs in multiple .wks files, but the recipes
> have to be unique. In your example MMC and EMMC image recipes can create
> directories for boot partition and their .wks files can use those
> directories and common root directory produced by another recipe, e.g.
> by core-image-minimal.

But beware of interaction with rm_work.bbclass when doing that...

> It's not a big deal to run wic sequentially to produce multiple images,
> but it will create more problems than it solves I believe. It will be slower and
> will make a mess in image naming in deploy directory.

I personally would prefer to support generating more than one wic image
per image recipe. The different output files could be distinguished with
an additional suffix (".efi.wic", ".live.wiC", etc.) where the suffix is
either specified by the WKS file or the configuration where the WKS file
is selected - the latter might be a bit more flexible.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




