Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 359CB7D40F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 19:14:47 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id m140so8135165itg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 12:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uOzC59CoYbs1SwRh6Vz5muKiNYhd2WHCEbUIOZbIWEQ=;
	b=vUfW82jRtvWVmVL6pPPhKy++Sl2DRisHuQK8+tS1OlqZNXb4JmOx9RZ9toj9mrt0Sg
	6FEAzEoyLpS3L4C9JG+AQtwWD4QSbGZjYp0HWWsxlUslNVp40q3A6jO6UnZeBjAinD5A
	0k0UP38e31N1W+YKFgCtH4LZcx5hVNmZbKxYqjh/I6aiXKFd21rVHRNRcG7o78iD+GKz
	mfwKb5I/UCYqTf1vuGYJZ6eakAGy0hKIpkGvCxqdw5QKqLBNZqaHQ+m12sRKDLyA+BAp
	O/CPBkSfpMvbPTEAb8SKGT5Rc8L9a6VUl4Lat3X3IPrs5T2QvnqmegU5kLwprXWtiOJ+
	KR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uOzC59CoYbs1SwRh6Vz5muKiNYhd2WHCEbUIOZbIWEQ=;
	b=CLyUgcFAmUUvVmAHwRqTjZ9VdQIlYicnvZLC7oqzI0bJUlfVQjMhP4qUC2yEMECmBz
	Jbn6FBCInXG5OIKCDRwXvHNAhUQVWZk3GYDVC5KBsYSJzMoRstG9o8+q4LCXayS8kEsg
	1dtd6NQdsqBOwnBU56u/Z4JVcrDmCD5sDuDJFv8aKTWrL5jrvygRNOTZDK83J4j3To5A
	GpGyEuUizKpenwfBUx5cAopwhz93UDB0E+JdCq0LT+vbkkimeiXcsGA5NOT9LfDYI9CB
	BMQB0Jo9gqRSwqYHQeEnUsv+H8p84DSwApheS8GXte6Sk2JUwJFK4ciiwamgdI0Ev19W
	2Bvw==
X-Gm-Message-State: APjAAAX1Y4uJAA46FnRRka7LsMG9ZXfSs2BMNEtjMqHykGZ8s/RWo57l
	G4lmc5Tr4kTdfDGptS7r+++cfho35KNl8JVUA3nnNeMx
X-Google-Smtp-Source: APXvYqw5TqoQosW2mpEjvCBXfXsfpnWWofwDnQqcG6KTKjhmvWpNp6Qy5rpxc2BfK5C7BaXoR0VK3eCcg6Fha4WJCgI=
X-Received: by 2002:a02:b088:: with SMTP id v8mr35054954jah.21.1558034088301; 
	Thu, 16 May 2019 12:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190516171611.13983-1-bunk@stusta.de>
In-Reply-To: <20190516171611.13983-1-bunk@stusta.de>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 16 May 2019 21:14:36 +0200
Message-ID: <CALbNGRRPz+UQKDu8+7_TVOK6EDAyocMHBqU0W7eOtmB+WQz1aQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Disable idn properly for musl instead of NI_IDN workarounds
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
X-List-Received-Date: Thu, 16 May 2019 19:14:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 16, 2019 at 7:16 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
Think I saw similar for other recipes. Your journey cleaning up musl
is highly appreciated!

Andreas

