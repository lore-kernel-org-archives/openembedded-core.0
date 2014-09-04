Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id BDCEA71470
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 16:34:48 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id j7so9769783qaq.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 09:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=HU7OLAew7EZbFEelvALBWoi3rLISmYYlk7py0Zl2rKg=;
	b=OWFsfxmpoi/zKv9n5hbl9MlUGPzOGZ9/5YYKJiaa1Z6T+GI6GqoWMgtklGClYOt/Zr
	GUl9ubumLiHdjsTq+cl2EayIRgdNR1WIvEt95tPwZTmikgY/mWJopa4TQja3Q/80Hhwd
	Oblqdmg3fTljiyqA+sv2X8IzCzTECwTJH3c7WNtKmHjCNFF8yowES63LarIvB1tVFz2x
	m8jAx1C9kofDMOVPtY9mGsfcPcdZ2NJTIagDRNWXuyZkjzx9OJx2RuDYV9yB8x9HiZcr
	8keuCepZqxi0SU4MXKSjuXrzapCf+aW63kFnP3KBGu07Xp8SUWKtqTacb1b7F76ssRyF
	i1wA==
X-Gm-Message-State: ALoCoQnwgdHL2aWaYYu6+jxPLWKoDcIdE6RQgAlnShldVQCeEtGRiNblgSoSXyG0w0IA7BgxEbRW
X-Received: by 10.140.27.173 with SMTP id 42mr8280498qgx.59.1409848487255;
	Thu, 04 Sep 2014 09:34:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 09:34:26 -0700 (PDT)
In-Reply-To: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 17:34:26 +0100
Message-ID: <CAJTo0LYhvZHJEEQLWuCsfxqqbBCSXnxR3cxJZJt2Z0fgYgwEww@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 16:34:54 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2014 15:12, Burton, Ross <ross.burton@intel.com> wrote:
> Quick question of style for the community to bikeshed on:  in the
> general case should recipes be split into foo_1.2.bb and foo.inc, or
> should they only split to bb/inc if there are multiple versions and
> generally there should just be foo_1.2.bb.

Another argument against widespread inc files: they encourage the
impression that maintaining multiple versions is just a matter of
having a .inc file.  The moment you start having to put
version-specific statements into a .bb you've entered a world of pain
in keeping the .bb files in sync, moving options into the .inc as they
become used by all versions, and purging old version-specific
statements.

Ross

