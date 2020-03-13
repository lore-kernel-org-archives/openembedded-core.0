Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B086C61B90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 08:15:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48dz5f2KcHz4C;
	Fri, 13 Mar 2020 09:15:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584087318;
	bh=0NmJOd+WeI4smPfynHr+y4svhk7CmPJv0jc+SSkdBU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qe1s6IVTSLrT2msIYPTQuYVARoaOaY0LpTFcneql2Urqlq2a7MRDxyc6H1pe1UtFP
	s37UvODfhuq7GDvpEh++RD7zc5wdZtZ+r5UY4wjUOkZJqYEOrU/IhASAj2tlpRxuLp
	d4jXesLnffMsB6JpWO+01oeWWq1+MXa3e3RE/FB1cjI8yAZFt42yfjqKeU6/e5+Jt4
	lUmHXgZqr6QmhKMYSEebG/y0dDwjPcZTPi8B7bugdbfz3dlZj6kAYlaTBnq7q+f9fn
	TR58vkpoHfR2KGxP8c1UUIZu9ZKkZXIEoE2i69apCizzJ0CYkXaHqx1SIr6cW60T3q
	sWW/WUBqPHNMdKAI4r6TkY3nTikyzGk37/Ve2lHGdB6VsToEN1Dk1aSmv0yjlnSjCI
	pX2eQSOPiOzYbqguKdcTBbLvMViqHaYIM0VvRrt4lqN5SqHQ27KGF8grXahXXcY72k
	0e7oyAp1m2yWHvMu5M1uJvjohBUAWXVApsJ8dIloWqk03MeCNbSliQtrclUClWwC3l
	BVH69CQW+XWtyAMiUtGdMR+E2pd8jzzj6poNk23l2xqVlWkXvJuJ+RWR1f5R3L9CWS
	qONSu/sdMYsLBLnm0goFjggGf5xDGxwX35r5CFIsuQmBLAOhzVArhYzHytIpO7mV4I
	zpFr5IIZ50nqgugkRSHnfKp4=
Date: Fri, 13 Mar 2020 10:15:16 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200313081516.GA24555@localhost>
References: <20200312230840.751166-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200312230840.751166-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: Upgrade to 9.3 bugfix release
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
X-List-Received-Date: Fri, 13 Mar 2020 08:15:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 12, 2020 at 04:08:40PM -0700, Khem Raj wrote:
>...
>  ...le-sysroot-support-for-nativesdk-gcc.patch | 187 +------
>...

Why was part of this patch removed?

cu
Adrian

