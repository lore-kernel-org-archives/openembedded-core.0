Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5375872F70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:56:46 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id h10so79770720ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 07:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=I0i0UZrzA+SJxRkPPfmn14XV9q2ihvstKWSA4Vhm8p4=;
	b=HN/lPdG/PbkfCr2nYZU+bVnBZJJmRHzii4FqB9FiExnGmOwUCFNpj+QnX52GzT8q4C
	RakNoj32lcYzQb1DYGAEodDaUy79aePdSLMi1yxBFTu+K1NLPKi8CVnr3J4TGawhwFuW
	RAva551ddgxI4RRcFNYaBbce0OpCjFI5Il4n6ec4JNWro+Iq7Clo37Bf6H830aLYCGAL
	coOh+u21pBha76zqqMonM3aW5sDBa9nX+dTTWTcfimvO7gosgdFvCX561k8BN1f838H+
	axKbhQLBMBL28AP/O2P/wxJ4caCGJfCgu9q7yaFkL9NC+TaRZuItIHQVllNuf/2oKOVY
	m8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=I0i0UZrzA+SJxRkPPfmn14XV9q2ihvstKWSA4Vhm8p4=;
	b=kZ0XDt2GaO0P+/rrAr4DmmgxK06gukGfeSHGM03bB1rzS9lH7FrtsvSp5UWQRVLVQV
	OhrWUAs5zuLaRCf2hE8O41dHU7d3MFdhOIBkobFDITCJCglor5geQ1ih/doFEV2THqW0
	fSEL1dwFMEdy3aLV12V9E1rGuWAN31I5F+TqE2jf24hTwuw8xl9nK3Ug5rrWrIhWcDGC
	+qyE5JV8q9lPPC7A4J8e41mBHmmsxEjZPeBDeD/T6G2t8ghQ7j8yKq4suBcwSKwvseBp
	67qaob1ob4eZ7y6YpvZ3dwYtZMteEwpSmrNZbax/DW3LZ33ra1NRRLpgqID/UfrVMwnS
	0cjg==
X-Gm-Message-State: AMke39lSUM5ty1Rh36+jRhI4cfpZhiDR/nfHsO3ivTEcFLxEza0i1+z2kPV99Bwy0vxsXjQD
X-Received: by 10.36.115.145 with SMTP id y139mr3476345itb.123.1488297407967; 
	Tue, 28 Feb 2017 07:56:47 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D654.dip0.t-ipconnect.de. [93.232.214.84])
	by smtp.gmail.com with ESMTPSA id z5sm948352ita.6.2017.02.28.07.56.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 07:56:46 -0800 (PST)
Message-ID: <1488297404.7785.53.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Tue, 28 Feb 2017 16:56:44 +0100
In-Reply-To: <cover.1488288835.git.pkj@axis.com>
References: <cover.1488288835.git.pkj@axis.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Tue, 28 Feb 2017 15:56:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-28 at 14:35 +0100, Peter Kjellerstedt wrote:
> After the introduction of RSS, I still found it hard to get
> dependencies on some common tools that are typically installed on the
> build host correct. Using the wrong version of tools like pkg-config,
> gdbus-codegen and dbus-binding-tool can cause build failures.

This is indeed still a problem.

I had also discussed this briefly with Richard. We both had the same
idea: manipulate the PATH so that instead of the initial paths it only
contains a directory with symlinks to tools which are okay to inherit
from the build host. In other words, the basic approach would be to
whitelist acceptable tools.

> To circumvent this, I created dummy versions of the tools that always
> fail and placed them in the scripts directory. Thus, if the real tool
> has not been installed in the RSS, the dummy version is used and the
> build fails. For good measures I even output a message that says what
> needs to be corrected in the recipe.

This is the other approach: blacklisting tools which are known to be
problematic.

I suspect the blacklisting approach is going a long way towards solving
the problem, but it'll remain uncertain how complete it is. As it is
fairly simple, it's probably worth merging until someone has the time to
investigate the whitelisting approach further.

Richard had some code for it in some of his experimental branches.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




