Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BDECE7E3B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 22:24:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t5so3780202wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 15:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rfFyeiHZnlohhtCJCSzUBOR3czXvvdkl3tvNDWn8xZI=;
	b=baoK2KtzMMzqBKS5Y2h+aGlyxYYhwhOhTp/HOdepdzWDzBXr5LrPd/8xL1dq2tHIDA
	qp4VHhmsZLfZPRhoiiu7Vs+PfaJk9AbxWht8cvyz+dIsVccygXcKmOtlwJtgrj3TxTmi
	J8ZMYAyVvi4PUdI97tCl/7FMMlmhmwgpae+No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rfFyeiHZnlohhtCJCSzUBOR3czXvvdkl3tvNDWn8xZI=;
	b=JnQQGWUrT5L2lzkMtnt5SqTj7zGKrEPoyfQdEk/t0ZSoocWOLQ5R+IN2a18t9Y/FeO
	VnPXIJsXDvTPCiUR/9qAzN6Jhi7fGhDyNPQ8ZzuB4XjisBwMN6yrS6jqGrqVWTC0Tuup
	BICEYLKj3HgIfp0/02EwmEOwySnE//MDLzeixkLVVYy8nCNdfW/70RkcTQvrxxvPOfus
	lJo+UKw3Z6lTkwpgi8YHDmMIprdF+q9sMFFf1KchoGAN6DuDVBMvxNpEGMMYt5zYaiC6
	VLohJgLM0W0frJBrxmA4he8NTTt/hqPVurndrkBeuma+MSKPvSvKfuSsDlyq/K+9dJ/H
	3yVA==
X-Gm-Message-State: APjAAAW1Na3GyiP9IjbeOIGTm5O0+K6wovTExVI/95aLbSoSj7vWRNH6
	n86yqXBNc0+4xKuTYNKRLqdm2g==
X-Google-Smtp-Source: APXvYqxnDmjgAl8j5qXISNZ+uqUgai87eY3JwHoTfnIUwxe6QteQYzMhuusDVT5VTbP9Wyk2eXw7+Q==
X-Received: by 2002:a1c:98cf:: with SMTP id a198mr9696951wme.51.1558563843543; 
	Wed, 22 May 2019 15:24:03 -0700 (PDT)
Received: from hex ([85.255.236.24]) by smtp.gmail.com with ESMTPSA id
	x187sm9985637wmb.33.2019.05.22.15.24.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 15:24:02 -0700 (PDT)
Message-ID: <e24b3dc06a6e7545cab9a5be19f2803df3f6f10b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@intel.com>
Date: Wed, 22 May 2019 23:23:59 +0100
In-Reply-To: <CA+chaQdQSk_WCyJC+beE7i+Y8fuqSZxA_-tR4yGXYfDVsRKQaA@mail.gmail.com>
References: <20190517233743.9646-1-ross.burton@intel.com>
	<CA+chaQdQSk_WCyJC+beE7i+Y8fuqSZxA_-tR4yGXYfDVsRKQaA@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] insane: add sanity checks to SRC_URI
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
X-List-Received-Date: Wed, 22 May 2019 22:24:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-22 at 17:48 +0200, Martin Jansa wrote:
> Can we add an option to skip this with INSANE_SKIP?
> 
> It looks like QARECIPETEST doesn't use INSANE_SKIP or I don't see
> how.
> 
> Removing src-uri-bad from ERROR_QA/WARN_QA for some recipes works as
> well, is it worth adding INSANE_SKIP for consistency with other
> checks or not?

Ultimately I'd say that all these checks should work with INSANE_SKIP.
I was just wondering about this issue myself for the chkconfig
autobuilder warnings...

Cheers,

Richard


