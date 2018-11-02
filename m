Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6492679DEA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 16:04:23 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id a23-v6so1724028iod.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 09:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U0X1ycEuerfrGYzjcQ30zUZfC24IcwNJVqM6zWpfduw=;
	b=Y1Lo0vnibZPsoavAdE2GdaU5EU3JGLf0aa7/6g2Ya5zGlX4eA0LoI39flg1E5xhHm4
	p7i3jDWwfUTrwdHN9yCedI5WJgALdtWa0r9zvWvJpAi32cl1e1/MGQ4CeVhkRGJkRkx3
	h53aoV7ctD80MosFUU8bBf44LMGjziRoMvxZDD/D8abqQ/hTAdPAwTo4Gzh795cvcftb
	4mpqGoaD8bX5G9mrnyuocYyojv8m4mijeD1oZl/OT3Ac1EpJrOw6EjjK8yfzQwpckxeb
	6nf5pMJX3M/1dqL2gtJxqm29e9CL9fwKJSxmyJzIAMGjQLm+eJRFrugMO+uxo3cTq0zZ
	meGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U0X1ycEuerfrGYzjcQ30zUZfC24IcwNJVqM6zWpfduw=;
	b=Sa6ePO3Vzhg1OgGmFtlyG733ssBnrsyPDXNRcs6S25BUnjVbCWsn5abVlrtRCr0R+L
	87GdnwC5bW/b8/jjqKl+FN3XjkwOeTJVhxi6bTxfRN7b65SJreNHJRv77/iy5i3OhfOW
	LRep/0FQKc/XGTgbtjKu76s+h1xtMEmHuhQI8c2LLY6gMNe05q3pX3NQwiPm6QHd4q6u
	aQPdSWzKr1zXmVU/zdV4zmSnOrSYebkekTMObEeiiqOIBzpMmZUTPtdaUxNfli30r89n
	b7ZKHBAuJrbDx5yiPtepsQ5wg+rSSjx2PHicY9bng5dssTRWRIYOgdBpTkkdzEh2J5ns
	VnLg==
X-Gm-Message-State: AGRZ1gLXZi5CqeW36dmxc5Cy7EP9aEK2g/GBviKS5DC4umg1ipvhrxIs
	RNQZAADzmoNR6FjTS+JePtLhQ7TcCzcmLocEhvS8eQ==
X-Google-Smtp-Source: AJdET5dvzBY1gB8cvm3VddEm+tramq8i8Wmvu66JViCxSIimnqg+d5SiISIYcF5FPLryldcUUhYisS+biR3R9DwyznU=
X-Received: by 2002:a6b:b9d5:: with SMTP id
	j204-v6mr9211461iof.20.1541174664428; 
	Fri, 02 Nov 2018 09:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <1541138944-68335-1-git-send-email-changqing.li@windriver.com>
	<f08c43f3-4834-45b7-82b7-50e0872e6064@gmail.com>
In-Reply-To: <f08c43f3-4834-45b7-82b7-50e0872e6064@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Nov 2018 16:04:13 +0000
Message-ID: <CAJTo0LYMCWt_jkjkyZ1_ptH7pfo=0vdKvAtBfOiK3OSD9JzV2A@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xorg: fix for CVE-2018-14665
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
X-List-Received-Date: Fri, 02 Nov 2018 16:04:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Nov 2018 at 16:02, akuster808 <akuster808@gmail.com> wrote:
> This should be in the update sitting in master-next. its good for Thud
> or we update thud to the later version

Thud is literally in QA for release, so it's way too late for an
update.  The CVE patch should be backported for thud, sumo, rocko.

Ross

