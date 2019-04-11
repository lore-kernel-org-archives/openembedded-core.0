Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CAD417D9A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 20:21:25 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n25so8206984wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 13:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=xvNZFGWRPi7ABSt84dfuB5fjPjyTQN24qdxc1QLO4MQ=;
	b=JyioOoVwJcsBWFTr4jyNW96n1jUg1NQqXwNkt8UEFW9twyiIZrhOVktVMMxsnbQC7f
	nNj3B7z1Ngb9/aHCdyMfmE3qIZTZ4F3Q0OQ7ttJ2UFQk0zpAeWhVjgjAbBCxcGKHr7dw
	2PL/exP5aZ56eeflVqrP7me3Fbwcxhi8ajPuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xvNZFGWRPi7ABSt84dfuB5fjPjyTQN24qdxc1QLO4MQ=;
	b=rVaFTg3stmKhfOm670Z0dj4YkRfzi4W8qGEcY/wGEkqWq1i6ZxUM1JKakD/t3sbxyM
	mHwfS7dAaGPVX2NNC4C8fENwbTQnyu9Y/pbYHMKULNNR4YzUV8RptppSdWG7EboRnjNH
	rTM0uC3+FRW3jagZNiAWYZqCQU6nhM9TCGgFQhSffKe3KfPzxqsapD5V28wJTlPtMSRT
	PpZUZa+hsHHtE988VQd1aVnvyyA4+JD5DW2FF/ERy53zXTjX9pJ/SaCg4C63PxIjCHug
	ZT7TthyypC4L+kGSR7GWyYMpq96MZ9DNMMhQQLJhmUAU3dpdB/FWhYH2YWDobD4Yzxjk
	cJgA==
X-Gm-Message-State: APjAAAWaF+FMYVukikZclOuVwmGW5IV+ODooR7dy98bwzWgQFWwJLQx8
	ec4bWMctrLXEPLsDdutTWQ7coA==
X-Google-Smtp-Source: APXvYqx57+6PVEBz+Lt7No1jr/MWvxfNOd1F5wTHawfzngYW14VVtSe0rMO+Ttuk4VLJg1foIP/YMA==
X-Received: by 2002:a7b:cd08:: with SMTP id f8mr8203997wmj.86.1555014086679;
	Thu, 11 Apr 2019 13:21:26 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d14sm60202806wro.79.2019.04.11.13.21.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Apr 2019 13:21:25 -0700 (PDT)
Message-ID: <25407247d6bb76c46ae21654b005358d72b09b6f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Beniamin Sandu
	<beniaminsandu@gmail.com>
Date: Thu, 11 Apr 2019 21:21:24 +0100
In-Reply-To: <CADkTA4PQm-kcEh_XzrWxNeHo5OFXn0B2pt8af39PT1PZJ=0_Pw@mail.gmail.com>
References: <20190411072854.31885-1-beniamin.sandu@gmail.com>
	<CADkTA4PQm-kcEh_XzrWxNeHo5OFXn0B2pt8af39PT1PZJ=0_Pw@mail.gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [[PATCH v2] kernel-devsrc: check for localversion files in the kernel source tree
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
X-List-Received-Date: Thu, 11 Apr 2019 20:21:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-11 at 08:38 -0400, Bruce Ashfield wrote:
> Looks good to me.
> 
> Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard, I assume you'll pick this up directly and don't want to wait
> for me to queue and send it along with my next pull request.

Correct, I've picked it up.

Cheers,

Richard


