Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 426D671B04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 08:38:08 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id p24so5027991ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=smXLCJKukmSVlyQBQLwoZa1gvOTj5ke9VQ7VslJctXE=;
	b=BUvX+ULtx4uz1Cg1IUeWkkILU/TGEn1sbLmXS6Z6hmQAR1IceK4QS7OlyAGeq4K5jH
	ap/AuWkT+1cJOsKsWBldYWMT+Og4EgImFpDvCFgrFapWrCxq1ms+s/a0In4eqwRLm6Px
	wtznXik/w0wnkwx4A79soT2YJjHZd2qJY23tG3tXX0F/TYJxaQtlG/PaLkIM8Nl7ylGA
	DpbSpGeuk5qc0pJyb0Ck5KeOvZG3ZR9OwVcPcv7kuq5dwkjYU4iQihQ9AGMRQ6mPkuZ9
	2TQ8eya3NtESiHEYj0iGJBiqYIr2OywkQIFnEGKq3pXffOc8o/c78IAtvVDjjSHRKgtU
	278w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=smXLCJKukmSVlyQBQLwoZa1gvOTj5ke9VQ7VslJctXE=;
	b=My+NV0QZgbpQ0GO0cC1VpupQT9ryZ0TRsogpI+fQxv8IJMlUaShdq72lHTjYs/izPt
	FuAEeeWZTspxqIwjiEoIVGuutRm8qqFlLfL4nLaP7weyHVLJik3dXpwaZtRYIA8Zp/FI
	TzoBYG6mWNnu+JTHdBj1qP8uTnTy1RhYhd6qLTsrR1wN/513KjDujrboAkFrOzwyNvvc
	y5BIgQ3uLr80bkiItfk85IFGt7QtEDEXhMj8gqZyj80Ply2rVPrekGiUDVPI5INU/SVj
	UtAYzAlv+tVtKW0IkbtpJt2NNKGJ0imsmC3rT7cuS1NxyoWyXYIajRVR9p09QZjd1c6n
	h7eg==
X-Gm-Message-State: AODbwcC7qbru1jyQk+QNNc6NdZTDfCZp7xqHuasw3Wh5p3AQQy1oeQG3
	dE1mu5OsbHFEewl2C7c=
X-Received: by 10.107.157.67 with SMTP id g64mr1953450ioe.48.1495010289890;
	Wed, 17 May 2017 01:38:09 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F2FD.dip0.t-ipconnect.de. [93.232.242.253])
	by smtp.gmail.com with ESMTPSA id d35sm675537ioj.5.2017.05.17.01.38.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 May 2017 01:38:09 -0700 (PDT)
Message-ID: <1495010286.28624.30.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 10:38:06 +0200
In-Reply-To: <8810a4bbb1c67b438a7320df810db02099fcb5a0.1495007905.git-series.patrick.ohly@intel.com>
References: <cover.eea09064b94ca036ef2177896c19070d316ee965.1495007905.git-series.patrick.ohly@intel.com>
	<8810a4bbb1c67b438a7320df810db02099fcb5a0.1495007905.git-series.patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/1] image-mode.bbclass: common infrastructure for choosing image defaults
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
X-List-Received-Date: Wed, 17 May 2017 08:38:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-05-17 at 09:58 +0200, Patrick Ohly wrote:
[...]
> +    valid = d.getVar('IMAGE_MODE_VALID') or ''
> +    if mode not in valid.split():
> +        bb.fatal('Invalid image mode: IMAGE_MODE=%s (not in %s)' % (image_mode, valid))
> +}

A dedicated error message for the "IMAGE_MODE_VALID is empty" case is
needed. But let me wait for reactions before posting a v3.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




