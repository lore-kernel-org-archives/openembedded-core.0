Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1A871993
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:34:01 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id v202so26710599itb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=lQkZg51RfvKWIMVsTnH+76uEedzqebBSkk/NCsQmiVM=;
	b=nYu0SzO3DeX3bEoIBn4A8x7sz4eHdIJ5iPELhNs2IJa9eihg00QSwp3aDJlv+uD6Zw
	KKBV4nuOAj0R2+9GVG/oqmC7b+yO4yB2AJBJMhZMsl85udoKtD3xjGXyeJjIvRRjsILr
	w2kJH6YDJsYWwngiVt0UzEiiw0HBXNoLI+cOzS6zCT2UZRFYi0QAFOsd2sW8B1NzvP8Q
	JDgQf0fPdOcNWriSkPdQVwYNvWzLS2XTK4RdUXNYdNizxVf33x0uxaI27eb/leYBy9QI
	Y2b0ggPISBkYACFBEznfgNv2Jcs3/X6cD8kcqPdUx2evrDs7UFNUedqDzEFNuM8vsbmk
	rZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=lQkZg51RfvKWIMVsTnH+76uEedzqebBSkk/NCsQmiVM=;
	b=PBfBjuIUoI+lo4OjevL7d7TRIpFdAudZYWFmzXf40rhDPrSeMRE20SG+Lv+I6//YKv
	HFzmS+LNkYQXdkdSNoE6+CpCFPI9EpddSRghTkRIODlwyR6T+68ux88SxjBjDlJxxuQX
	DifGA5zO+Zn6+dNI9pIDgcgj92EOrTa8eCGYrRvlzXGq73bL0Q+lALIQSq7nTgtz9/0Y
	T1q9jhqZ7NDjEMGesUkvIVBQxYAJUm1oZWWHDHz5KiVkOTuKMh0Gsn8YZ6JNP9blaRfV
	Zk5vUKTMQuwbut4IDoi+KRfh8WxoiByB9IJatnahdOjRL1qANRyFisQXQe2LqLrBejOb
	6Jrg==
X-Gm-Message-State: AKS2vOyJ5zjk1ri2LES/RdLN0q8iDf5I02rHrJb8exa83qrvt/v8FuuW
	uOZb94NL44EipwA4
X-Received: by 10.36.248.4 with SMTP id a4mr7154641ith.69.1498642442610;
	Wed, 28 Jun 2017 02:34:02 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F1CD.dip0.t-ipconnect.de. [93.232.241.205])
	by smtp.gmail.com with ESMTPSA id
	p184sm2654818itp.10.2017.06.28.02.34.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 02:34:01 -0700 (PDT)
Message-ID: <1498642439.7464.115.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 28 Jun 2017 11:33:59 +0200
In-Reply-To: <628a4bc1-c5cb-a1f8-9e12-4cb305f96dbb@windriver.com>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
	<2312c1a18a7a4154d99028405f5f865be42fa7a5.1498577501.git-series.patrick.ohly@intel.com>
	<628a4bc1-c5cb-a1f8-9e12-4cb305f96dbb@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/6] yocto-compat-layer.py: apply test_signatures to all layers
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
X-List-Received-Date: Wed, 28 Jun 2017 09:34:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-28 at 11:08 +0200, Mark Hatle wrote:
> On 6/27/17 5:33 PM, Patrick Ohly wrote:
> > Software layers were previously allowed to change signatures, but
> > that's not desired for those layers either. The rule that a layer
> > which is "Yocto Compatible 2.0" must not change signatures unless
> > explicitly requested holds for all kinds of layers.
> > 
> > However, as this is something that software layers might not be able
> > to do right away, testing for signature changes in software layers can
> > be disabled. It's on by default, as that was Richard's
> > recommendation. Whether that should change needs further discussion as
> > part of finalizing "Yocto Compatible 2.0".
> > 
> > As it might still change, the tool now has both a with/without
> > parameter so that users of the tool can choose the desired behavior
> > without being affected by future changes to the default.
> 
> How would you regulate the behavior of a software layer that is doing bbappends
> or similar to a system provided component.

By adding a PACKAGECONFIG that is off by default?

But I haven't tried this and whether it influences task signatures. Do
you have a specific example?

Regarding these patches, is it okay to merge them as they are now?
Without them, we cannot test software layers for signature changes, so
won't know how much of a problem it would be.

The tool and "Yocto Compatible 2.0" are work in progress, so there's
still time to refine it after merging. My motivation for getting them
merged already now is a) to make the change available to others and b)
to use the strict version of the check in refkit (where we currently
satisfy the criteria).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




