Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 12A156C3B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 12:34:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id a15so9073321wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 05:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=V9xqgbekJp1R9hogQ7eZe3c2gV6Pz9HKpSI3oV8cztA=;
	b=AXt8DBwHP4UxE3UkV9Istek16nlBKbb3MZnfaNpIeTrPrYlCeAfucaLo9x1/dE3drd
	aFko/ZOQ75uPeoXjdHV4hbZFcI/zIkCDNU/rE/bs+ltyqGGeDGqqAoel3riCt6TFxiAD
	NeH1ROnTbUrQSPEf+QDveQcZOvLTvI3G/7HCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=V9xqgbekJp1R9hogQ7eZe3c2gV6Pz9HKpSI3oV8cztA=;
	b=cHR04h7LzF1MKzc+faVlM8UH5lGxNws/EWAkVh3fhcICYp97oxAPspGYwQgtqt/dkL
	sTniTTEYflqTALujlmq6cA83R7x2TXvmSe+wsv6ofw/w2doX378VyHYHQTHVeYmAWzlK
	pWexVi3ZsgST71ZbSKop/bWznEOGiFgn/kqOzy4sDYW+NQY282QOtc+uPvRPEspidOmY
	EUtH9x8xl7gDhLY8o/ItMmt03c3aI9aBu0ir2HfIbRm+yujZtpeEDfKxrOp3e5jm6t7v
	x2Fg5auJ1Gd2KMps1ahaKbabIRhhwXswklSuXXLxev02tsvLXqQ0/5SRs89V+qYRduLh
	W/8Q==
X-Gm-Message-State: APjAAAWbZDwSylma61IKDNfSfcjL4lEWzywknK2p2whaBPmrOE/PghWF
	jZHr6ZtIu8DQiS5YYiaki2tV6A==
X-Google-Smtp-Source: APXvYqx5/6tUKoa6QwFIUkry3uv+ieKb83knm3GPc54CzVVqPVomn+xYXfV1Ugoc66jmMknXD2tqTA==
X-Received: by 2002:a7b:cae2:: with SMTP id t2mr17268918wml.157.1560774843807; 
	Mon, 17 Jun 2019 05:34:03 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w2sm10343658wrr.31.2019.06.17.05.34.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 05:34:03 -0700 (PDT)
Message-ID: <48329790d8a30441a45d5ca11d46f4e635f97938.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: auh@auh.yoctoproject.org, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jun 2019 13:34:02 +0100
In-Reply-To: <20190616215711.C0049440001@auh.yoctoproject.org>
References: <20190616215711.C0049440001@auh.yoctoproject.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] lttng-ust: upgrading to 2.10.4 FAILED
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
X-List-Received-Date: Mon, 17 Jun 2019 12:34:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-06-16 at 14:57 -0700, auh@auh.yoctoproject.org wrote:
> Hello,
> 
> You are receiving this email because you are the maintainer
> of *lttng-ust* recipe and this is to let you know that the automatic
> attempt
> to upgrade the recipe to *2.10.4* has Failed(get_env).
> 
> Detailed error information:
> 
> Empty environment returned
> ERROR: ParseError at /home/auh/build/workspace/recipes/libnewt-python/libnewt-python_0.52.21.bb:1: Could not include required file recipes-extended/newt/libnewt_0.52.21.bb
> WARNING: Layer workspacelayer should set LAYERSERIES_COMPAT_workspacelayer in its conf/layer.conf file to list the core layer names it is compatible with.
> NOTE: Bitbake server didn't start within 5 seconds, waiting for 90


A parse error in libnewt-python/libnewt-python_0.52.21.bb causes lttng-
ust upgrade to fail?

Sounds like something went a little wrong :(

Cheers,

Richard


