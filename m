Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 30F1A65CC6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 14:17:35 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id x12so2845554itb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 07:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Dy+s/YV/aRKNMFEooForhKOlvS5cgewuOxUMKIedkHo=;
	b=jCd7tQp+OyWc8BpmutGh+2+OfDvslfJDgVZWOBxrC2Pei8EuLG8t2+vzBM4MMv0Oyu
	1gcsaI1hzVX9RAMXHNopEmDuy6jHo9T3sEvh7J5e1oc60AeVV+IdwMYZmrkXpvqAEPFC
	ys0eBVGL+boUr3vBN6Cj4CUVhT40DE9DDkeXzv7CG+r8EZNxtC62XZ6ATLxCbAMKDWWr
	lycl8ETy/HzOAunugqeCu60omvZyHdCTuphINqWExbaGuRnDH+yYG+7gEsx4Qn5KLjtd
	1w9aWF8M+y3za+VfYQT7HzeKlCh8hHPCFbH/NAtWy+ouGInNkvS6nLgHCJcaa/Fngwp8
	A6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Dy+s/YV/aRKNMFEooForhKOlvS5cgewuOxUMKIedkHo=;
	b=ntegEsdKPx+bnTYGO2FK5xembSEhmsXuBay65xwkwTZvSSAseVF6+SOAZ+TW5ld/4B
	qZycRwEp0TkYrnKGu0lys1DN7kETCCGa5241gxxvYN8pMDEh+UAWW6vv6g8Iw5fWZ4NX
	wWApEDyenGpnLyifaD9oEoEyOdGiiqQ6w/YdA2x1MBoEP186GOamL+9xXqCTSd4cGe/B
	xv+fZSbkZZFrjt9V/OAj8BSSHQUJ8Qn2C5CN7XX3RTMmCnm6hBgO8PfUhMK5ScgkYq1Z
	B5Hn6vgAzCvRzS9Z7SK/iGSOS19XiaH20kKTxV7/Zpsg8/iSeX0/OGfXUaoXRCdRNNeB
	fM/A==
X-Gm-Message-State: AKS2vOy0AwqoLPfDxVkZQHbZUijciLdIl7rZj+VjzSIl9zlKqVh53QBJ
	ekwX9qciO5THhpNe
X-Received: by 10.36.47.143 with SMTP id j137mr2209273itj.62.1498141056924;
	Thu, 22 Jun 2017 07:17:36 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EF96.dip0.t-ipconnect.de. [93.232.239.150])
	by smtp.gmail.com with ESMTPSA id
	m141sm1058126itb.4.2017.06.22.07.17.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jun 2017 07:17:35 -0700 (PDT)
Message-ID: <1498141053.22706.4.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Date: Thu, 22 Jun 2017 16:17:33 +0200
In-Reply-To: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] commands: send stderr to a new pipe
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
X-List-Received-Date: Thu, 22 Jun 2017 14:17:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-06-19 at 07:39 -0700,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Do not mix the stderr into stdout, allowing test cases to query
> the specific output.

This changes the behavior of functions that are also used outside of
OE-core in a way that won't be easy to notice. I also don't think that
it is the right default. For example, for bitbake it is easier to
understand where an error occurred when stderr goes to the same stream
as stdout.

Can't you keep the current semantic and just override it explicitly in
those tests that need separate stdout/stderr?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




