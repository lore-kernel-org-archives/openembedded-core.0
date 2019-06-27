Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B556F7E8E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 12:30:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v14so2364019wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=voi1EAoJORhSJZIxjAoytufP/ZU4pyxgY9a4sV+wZ7M=;
	b=AbEDbHzhoIaZZAnevnGMYWuNf96e9OCSQitSd9hZz4m/rXTX/tAMc/7Zsuw0GpjmYn
	ITaWHVajJfxGXt2lCkeDBJ1Uxf9lH/4nJ915s8tsY3+ohIoAVAJFj65jza0csnwAC3y1
	UUzJ7kSSeyRIOwFs1lXbiNdlth3N3P/dCtK9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=voi1EAoJORhSJZIxjAoytufP/ZU4pyxgY9a4sV+wZ7M=;
	b=sw7B9OU+pMZ7IhnpRvEIl/M19LXpJAULA+aSo5WlAc59uGL9RMK3eNMgR4VsIpN8ds
	1vzyMxncq+2TGJXRLuwrnTwEL+9IxTDkJ8vSAlh0VJD29BmgLXmxOSoDFU1FO/bq9jkH
	bLO07Oa4uk5ZjR/GumRfEiMLq8c/v7c97moAWa3WLyfAkWGq3jhZ7kbyayZO43f7GKcf
	wmgkU3xyXKGxaPAsA+ZukWl2JHHb8xifFvvtCbXcfPkzFSMZg3bNkc2GnZ1QZ8KyXNJx
	FNT78XjkbkQ3ivjg63GeIYu0KBG7lbOs+LizVnnzhFj5DSJPDZnmyLkqZvjVsR99irbB
	RgbA==
X-Gm-Message-State: APjAAAV5Qjt2R4guZHI1pt/iZUbDQFqowtyS9xajNAr59GtwUYfVBJYa
	uelOHRudMWvwGXCz2uSbkgpGLg==
X-Google-Smtp-Source: APXvYqzLAZmtBr8oeSjQDOfAmqEF3svxfJMI5R0HxemXLQGBcfRZmkS0ai3OajHZmkumft/1WReRgw==
X-Received: by 2002:a5d:4489:: with SMTP id j9mr3193324wrq.15.1561638641574;
	Thu, 27 Jun 2019 05:30:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i25sm2892022wrc.91.2019.06.27.05.30.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 05:30:41 -0700 (PDT)
Message-ID: <0cac6cf6cad2694434b3c3f38f3458d6c9b80cc1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pierre Le Magourou <lemagoup@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 13:30:39 +0100
In-Reply-To: <20190627091115.5801-1-lemagoup@gmail.com>
References: <20190627091115.5801-1-lemagoup@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2] cve-update-db: do_populate_cve_db depends on do_fetch
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
X-List-Received-Date: Thu, 27 Jun 2019 12:30:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-06-27 at 11:11 +0200, Pierre Le Magourou wrote:
> From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> 
> To be able to populate NVD database on a fetchall
> (bitbake <image> --run-all=fetch), set the do_populate_cve_db task to
> be
> executed before do_fetch.
> 
> Signed-off-by: Pierre Le Magourou <
> pierre.lemagourou@softbankrobotics.com>
> ---
>  meta/recipes-core/meta/cve-update-db.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
Thanks for the fast turnaround on the patch. This seems to move the
problem to:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/990/steps/7/logs/step1b

:(

Perhaps we need to skip the recipe if the class isn't enabled? Is that
the reason its failing like this?

Cheers,

Richard


