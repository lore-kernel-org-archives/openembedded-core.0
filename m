Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBA0745DE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 23:03:19 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id y4-v6so7584019pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 16:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=o+PHfvziRBATziGEToTrJaZovw5X7JyGzyo+3ZNK3lo=;
	b=GjZg5uSH3yaSPM/bo0Tgzl/w/OzY9iwUOTkjEREWiJ/5XcGahD+70Gxagu7ufjQ6cB
	cjGbd8aL3lnlk7bVA52BVVudgEut4JwVIjNBrVIsc05i+kL9C0WErlP9GIFKoQbG8BzG
	Lk6ztyywbJ4N8rifecxvycP67wThYOssTjSVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=o+PHfvziRBATziGEToTrJaZovw5X7JyGzyo+3ZNK3lo=;
	b=LQLwkWXb/gvUrnCVYHcKhOO6AoO109vxBxdcM6dzWECxKGplVKsbSsslvALPgGQ3Nc
	x9zQ+VEkco/NPAlW1d8wFUvrD5Ul5Disb0wJxW07NNUr+Ra4IC+lTVi6COl/YbLSQCzx
	ruskALLV6TvyZBwvJ1bW0eUz/47wMpbzjh0dmfAPHNuMsuQQdoTDOCpa16I4vLLandW/
	VcYWMN1agEqKc7GsBeKRe8Gur6c7Y92aXAXzf75FqGkqEYF6R8pAJ5joYDwliw/hYtZL
	MxIhhgFwB96qeRb3R9OL67PvGH19fDDy4rh6ago7g6pRHq/L/t4hXtK1boFxYWmEFi8J
	IzDQ==
X-Gm-Message-State: ABuFfoi7v5pC6XYeSUuKvaQwnnBejrwE2ekJ08SJewBUAlt4XWIsL+Rr
	oer5at2dN8srozOfS6PEiNxHAw==
X-Google-Smtp-Source: ACcGV62y5YqE45+BlRzomxrvbMQv4sbbZKp1PTAruTFvmLJBs08s3oL+gl6u6lnOS8+Sw9fzWO041Q==
X-Received: by 2002:a63:65c7:: with SMTP id
	z190-v6mr3636278pgb.146.1537657401095; 
	Sat, 22 Sep 2018 16:03:21 -0700 (PDT)
Received: from hex ([204.239.253.216]) by smtp.gmail.com with ESMTPSA id
	r18-v6sm37410184pgj.51.2018.09.22.16.03.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 22 Sep 2018 16:03:20 -0700 (PDT)
Message-ID: <c0cf1393d4199d00527feddd3cbb4d433e8facc8.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Kevin Hao
	<kexin.hao@windriver.com>, "Mittal, Anuj" <anuj.mittal@intel.com>
Date: Sat, 22 Sep 2018 16:03:18 -0700
In-Reply-To: <cover.1537636541.git.bruce.ashfield@windriver.com>
References: <cover.1537636541.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 22 Sep 2018 23:03:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-09-22 at 13:18 -0400, Bruce Ashfield wrote:
> Hi all,
> 
> Here is the consolidated pull request for the active linux-yocto
> kernels.
> 
> It is -stable updates, configuration audit warning fixes as well
> as a fix for the qemuarm64 boot hang with the ssl update.
> 
> Nothing to major here, and I've boot tested on all architectures,
> but you never know what the autobuilder may dig out.

The tests passed so its in, thanks! 

We could now just do with the corresponding meta-yocto updates to fix
the warnings in the BSPs (cc Kevin and Anuj)...

Cheers,

Richard

