Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id B7FCA7D344
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 12:21:41 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id j5so92611761ioj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O8Fth5vXA+sp32wMlVLftuUTgAE6Z81FIfjwbfRT7rQ=;
	b=vjxdFucujB1lk2n2dGsRDwIf13RHT3hILj5KxSKjNGvgCD9pCs46r/1/GFLwFNKCFD
	H771dVlX+01JmcSvCE65kkSGO5SCPmFt2aXsk5THbQLGEDrvFOSjaom6kTCy/3b0AdCw
	Z99wzquvVDeemtw1tbwi6PmqRjbZ7/nM1R1EZn054Ua/yu1e8yEp66hd2e+jKIUY932k
	oCNMrQN34lCBV4Xzkoit2azdXXnGdchBnB4hfSDf3IhRIWHReTGYFccZqmIk5J61kPHB
	flb66WWmZjZxMuSUpQ7he3H3G9EQgBiUmoINoFgdcB/mu3Lm8DvHnoSC3sgWy2qxBVOk
	xKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O8Fth5vXA+sp32wMlVLftuUTgAE6Z81FIfjwbfRT7rQ=;
	b=Yxv7E6qJfyQk1zfyt/6iXe+/7WzJM9TlZnIDbFdaDhTZ5Gaua5f6g1LtR/Du7M6I8X
	LMrwrJXfm9zg+vqhBcxYsMzAgRg97/AFSH3RDbI0Ma3PqmdzxIxfoFjGgPGVHojPyQqN
	wItiVzjQUl6QHWKDyJtv1owGHBHUQfWFaPbklcPxG+UJ2YOG9nn35cueXOf/gF8sH/NY
	6Jxg6mC6GIUF/d6T7oW/4pqatau2jVNtMxS+fi3CbCQG/p2GmiuYpxDUafX16UPqOjcT
	dCyKlnuNGvZ7U7OBqXHJk1LEdD8KF/dsQpFYkoYdytSywrWIK7Zkg3TE+2SqmRlan24q
	txKQ==
X-Gm-Message-State: APjAAAXNDOUVJgnssGcVdGHH1TCyd1qNOcDggdqZyk54LxP5Q9K60pSO
	4g/eX0tqcuTtWhGVxchRAbe55gb760Zuzt84R0jTzg==
X-Google-Smtp-Source: APXvYqzpa9mU7Ie6T953+K0piKLBJvuVD4FEzRaG9121lxGTR1PnaW0FtA56/2shlwWy9fsh43HZd+xwMHtk1IaSbLc=
X-Received: by 2002:a02:b395:: with SMTP id p21mr92331326jan.31.1564057302495; 
	Thu, 25 Jul 2019 05:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <1564054891-8168-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1564054891-8168-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Jul 2019 13:21:30 +0100
Message-ID: <CAJTo0LZas-J9VBo1UyHOatWQXi0TKsSydBB21H=L3wEXCvk1Aw@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <ming.liu@toradex.com>, luka.pivk@toradex.com,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: change to use meson build system
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
X-List-Received-Date: Thu, 25 Jul 2019 12:21:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jul 2019 at 12:42, <liu.ming50@gmail.com> wrote:
> - Introduce remoting package config, without it meson would run into a
>   build error.

Did you tell upstream about this?

Ross

