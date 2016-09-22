Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id EAE946059E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 12:53:21 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id m186so84158683ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 05:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=7AYHoL4o6wHK9F81IQXT4hvh6hzjwIiZSYY3nJmuXsc=;
	b=y7BbwfoznOvAUGBH1j0oFZ/B8hbVI4pZHW0jr/mYtCVCYX6vzK/TL3akUhSoIDzkbw
	4SfnJ/5CST3IDayhFVD4uhsN3e5LAHQzOaZau9zBJDdw/CgkQhvsox1MvieYtwy69U3T
	lya682oNrFWNcWlI1NAfNhMUxrzkiCxFyvKlLE4oxE/NHuzNsRMUP0oBiHeMwbBKwIDK
	KvXMoiR4ejwxbLzjg0dB5xJD6zXscARPk+K4fjvfUseTjtd0YCYK/8EM3x66x7Afrsak
	MV1NQEA4t5Bkd0aw6DGr/gckfXqEdvQ545GXV3M6etbIliiWIhMksU1U3KbOMGfa6rJd
	YaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=7AYHoL4o6wHK9F81IQXT4hvh6hzjwIiZSYY3nJmuXsc=;
	b=mifQdUV+CdkN/1G7tGAroJebEcqSSRWK4jZlitM13aoihWKaXTwjfJU+ftkpsiK+ak
	euUu8HnhLLIVioGJgN77GQYkTrzRznrOSuWBp1ku/zX8e/ZF78jS7PkLQyMRJlO9H90m
	slQ6nTdHY0VniHphxAcTVgLJldWWFssJ/9F68oFoDK3O8xxuwx7kxJlsaS/9mHtoUhIa
	m1O2mZ8HJmtyGcDP+nQQOub/EyDkgJMr3iFkdQGnuAbKRbi1sMmpEJsxkrIAnL0V4MYm
	8LpxDxAzvvOvuo6koReidw63+zbwiHJp1+ojOHJZSmb1Y1zG33PGxNxkqA9VtMbFCYTJ
	vXSQ==
X-Gm-Message-State: AA6/9RkXkkDJbpNuB80fu9XlK9bVl6vyi2wSmOHRod6FTjHOzyfh9JaKzkwXH7yrOnI4TdxT
X-Received: by 10.107.142.77 with SMTP id q74mr2652263iod.0.1474548802503;
	Thu, 22 Sep 2016 05:53:22 -0700 (PDT)
Received: from pohly-mobl1 (p57A56555.dip0.t-ipconnect.de. [87.165.101.85])
	by smtp.gmail.com with ESMTPSA id
	w185sm790237iod.13.2016.09.22.05.52.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Sep 2016 05:53:00 -0700 (PDT)
Message-ID: <1474548771.16834.100.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Sep 2016 14:52:51 +0200
In-Reply-To: <20160921160854.GB2633@jama>
References: <1474472342.16834.96.camel@intel.com> <20160921160854.GB2633@jama>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: rm_work + pybootchart enhancements
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
X-List-Received-Date: Thu, 22 Sep 2016 12:53:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-09-21 at 18:08 +0200, Martin Jansa wrote:
> On Wed, Sep 21, 2016 at 05:39:02PM +0200, Patrick Ohly wrote:
> > Test script attached. I only ran this once, so I can't vouch that the
> > numbers are stable. I remember reading about a benchmark wrapper which
> > can run such a test script multiple times and then will automatically
> > merge the output of all runs together, adding min/max/average/deviation,
> > but couldn't find the tool again. Does anyone know which tool does that?
> 
> it's in oe-core:
> ./scripts/contrib/bb-perf/bb-matrix-plot.sh
> ./scripts/contrib/bb-perf/bb-matrix.sh
> 
> ...

That's bitbake specific. What I was remembering is something generic
that works for anything that prints test results on stdout. Perhaps I
was dreaming ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




