Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mail.openembedded.org (Postfix) with ESMTP id E6ACF6CBD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 09:29:43 +0000 (UTC)
Received: by mail-vb0-f49.google.com with SMTP id x14so2591573vbb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 01:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=H+OGGmXm+f1bAwGT6eRikhrGdB48jCCCoiJZ+qXeYaQ=;
	b=JtBACtmf2t5lkBYaynY80Ab3Sj29VppaMra3E4XEJNw4ONcdFfN1b/VjEqEy4oDCUD
	1yNC1PaqH6DQ6aGioFTuD45em9N+Hlhq3e6MPRPm40pgutr9YSYoY+Ub7lM3lFdHlZZr
	4oCp6+0jWUZe5TVMBKQ+b9Od/YoFmZaNXjmSVWGRrT6ZFaxg9EdZk2TrXhOCT1/4Lq7U
	SNgKlmwWZ7D1TYO58fBF/V7+XPUz1ouaUYQtXf+Fmels1FeAdF2+Nn+5jgsEfaBVhYkx
	oSfZVqDXvWflEYyYcv4ERW80U5mDxho4WH3q/K++1YlR44TgjiJRibynQzQKSUZTIM36
	eK6w==
X-Gm-Message-State: ALoCoQkME5HQzP2wim745LsrBawYElP7cSxg6np/qDYJrG1DiT104mZQXq08P/JXBPM4mV5LFCbO
X-Received: by 10.220.193.70 with SMTP id dt6mr9861449vcb.17.1390210184057;
	Mon, 20 Jan 2014 01:29:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Mon, 20 Jan 2014 01:29:23 -0800 (PST)
In-Reply-To: <52DCB309.4000603@windriver.com>
References: <1389255953-8202-1-git-send-email-ting.wang@windriver.com>
	<52DCB309.4000603@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jan 2014 09:29:23 +0000
Message-ID: <CAJTo0LZ5Pfndq1YMfoxaDFwgAsuZhq=QmWAD4333gmk0eQz7Og@mail.gmail.com>
To: wangting <ting.wang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oeqa][PATCH] lib/oeqa/runtime: add test for gzip
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
X-List-Received-Date: Mon, 20 Jan 2014 09:29:44 -0000
Content-Type: text/plain; charset=UTF-8

On 20 January 2014 05:24, wangting <ting.wang@windriver.com> wrote:
> Any issues about this case ?

Everything I said in my reply on 9th January.  I think it should be a
ptest instead, and it doesn't actually check that gzip is working
correctly.

Ross

