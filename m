Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2DA346079F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 14:46:29 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id e66so30719286iod.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=ttgmm5XvO16zvF1EO+D9oKYjf7yrC6kKZgdyMYBeZLs=;
	b=YknrsiFcG6DETXqElWksLwlMsIFCxj+joTsQk+7NZP02LNAVM+p4NwOAlzeRKkc4ht
	05RroTirq8BI74CAF/2Dr3vf/gXEL/F3W9trfTFcmzfsaZ24NfiRtTNhYJ0CFbiKuT6u
	oW1jEwT+i78H55v7Qv683DOSyQS5E/OMNKZOQb8VBGcORAKZlYWvUsBJtBKvlgG3LZo5
	0klMMP0pb/Nr2lPO/rIh+dlae5RcZETmxHU3gHuwLPuaPm4mqTauZxI+uR4eUIzHDoGD
	j6p3Ed4Ddp+p7+dPUbjyV7PfyyGdwLky39rllhIhBwKkBquleAWqout8pzp6iCXhqCF6
	7yEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=ttgmm5XvO16zvF1EO+D9oKYjf7yrC6kKZgdyMYBeZLs=;
	b=eMtEHxAFAOo7mXGonzDXobLmTWnSs2PUf8rImcf7zPWk71Ai8CfQrSAGJu5gZam87s
	2TrRrJfvEBn9Nfq2DP5FCYXNOfy20+evcxLySC8Gp+YXK0AqD7gTfMhtQFEFZNdqhg7L
	JXCIHjuxS2xsU4b8yRsBOOAq3tCIwkICVDE4IMD2tCG/xR6gTjnDNPgTKTzJK1xJs69t
	30pvCerZunvbbtEZSaP0H36koU72KGJsgQJKXTFV9leRPQyhXCAHO1Gf16X6FVPQq649
	hij66P1peXqzh9zuPMe3WXmqbi4l7J3dwmjgv3qWqrQWldvLFs7DnKXxJK5xrobhVXCZ
	YErA==
X-Gm-Message-State: AE9vXwMRyV0dHwIYliBaLHVmSoVYGk1L0i/QUve0nwJYjSiH70jOYeVxNFnzztkgwBFRpmly
X-Received: by 10.107.41.81 with SMTP id p78mr9443100iop.78.1474641990195;
	Fri, 23 Sep 2016 07:46:30 -0700 (PDT)
Received: from pohly-mobl1 (p57A56298.dip0.t-ipconnect.de. [87.165.98.152])
	by smtp.gmail.com with ESMTPSA id v7sm1309294itd.6.2016.09.23.07.46.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 07:46:28 -0700 (PDT)
Message-ID: <1474641986.8561.9.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 16:46:26 +0200
In-Reply-To: <1474637000-22802-1-git-send-email-patrick.ohly@intel.com>
References: <1474637000-22802-1-git-send-email-patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] openssl.inc: avoid random ptest failures
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
X-List-Received-Date: Fri, 23 Sep 2016 14:46:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

This patch can be applied stand-alone. I had it in a branch together
with the 1.0.2i update and then didn't export it independently, hence
the erroneous "PATCH 1/2" in the subject.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




