Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB0A600BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 17:24:44 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id f7so3668872wrs.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 10:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=s7J1I9wjkCkThO9Vfge5hPnyFzL2+SGIqQU867HmLtc=;
	b=TVrfNMyzpwFWJt7eri5REVZ2WQQJa5JiH9EeFhooOtXmJ9OAYO+NX/HhK1UnPAm9bc
	e2E9yVO0eVD2npysgM3l1IhKSQnmsMf3FElNitZTnjPOKHI9WRvCJ8jprnhSOnZaLOb8
	lPBD2a/lYsmqyMkZTDwp11RmWak0W6tpxKmF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=s7J1I9wjkCkThO9Vfge5hPnyFzL2+SGIqQU867HmLtc=;
	b=Br7KbvlbBalAGPEZo7FCFnwIv07MgtJp1Ubrf60zl3solmYd0XrPb6oa6QL1FBoMRC
	tQm0e6tIY5OddxBXTdPnMYKH/93phwT9aGbPdusIeqtUn/MfE6Dp5ecO6vory8syZJBa
	OWWstHISCkOz54KAxrDZCIbFCVRkzRksdZgaUUMPll56xIlAl4uEGdcU2pat9oxLhC6y
	ACK0RYMnMHheAGCK48NYIl6y3UK3814Og8va+iZ+KfWsfmwjdzpJZJh9RVldeNHcWjVR
	ulDUG1jSDBJK3KdUK2w/uej09ABIMeI5tOmq7keNMU3ixAauKFsMHWZuPulIztCSSF6Y
	5/pQ==
X-Gm-Message-State: APjAAAVT8OS53AsqhCjIsS7e+D1Ysi9pYKxorLlNdSITqJe9Ke34Vyvb
	sOf6nNud8HVvDdLDrtLOl/f8Qg==
X-Google-Smtp-Source: APXvYqyYBwvE5rNJMp7UE9wLh03XtRY/cCq4znIUT5ZTq7nRkJhROkMSBzYkBtTlSM0lCyvrLamSqw==
X-Received: by 2002:adf:f68c:: with SMTP id v12mr5975379wrp.40.1556126685822; 
	Wed, 24 Apr 2019 10:24:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x192sm30179421wmf.48.2019.04.24.10.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 10:24:44 -0700 (PDT)
Message-ID: <43646bdfb4aaa197d156f5ee8f195ad3128d74e5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Mardegan, Alberto" <AMardegan@luxoft.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 24 Apr 2019 18:24:43 +0100
In-Reply-To: <20190424141215.11624-1-amardegan@luxoft.com>
References: <20190424141215.11624-1-amardegan@luxoft.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa/core/runner: dump stdout and stderr of each test case
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
X-List-Received-Date: Wed, 24 Apr 2019 17:24:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-24 at 14:12 +0000, Mardegan, Alberto wrote:
> Some CI pipelines might perform further processing of the test output
> (for instance, to plot some metrics into a chart). However, Since
> `thud`
> we switched away from the XML-based jUnit reporting, and at the same
> time we lost the ability of collecting the stdout and stderr of the
> various tests.
> 
> We now restore this functionality by adding `stdout` and `stderr`
> keys to the JSON reports.

This is nearly there, thanks!

I think we need a better name than "TEST_WRITE_OUTPUT". That variable
could be about enabling some tests of writing output or several other
things. How about TESTREPORT_FULLLOGS?

The variable name needs to be mentioned in the commit message and we
should cc: Scott so we can add to the manual.

Cheers,

Richard




