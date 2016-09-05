Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4904F7725A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 06:58:24 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id l131so26564254lfl.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Sep 2016 23:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=P+AaLkuApLC3XqUA6d6XpltBCSVa6c8S8lltmKgJRLw=;
	b=ksqGtODdQu5aorAGFaG4DyasT94u/rfjgUSJgFy/bPmmHkTI7D6FzSI2AlI2OHh8MG
	eGwoO45M5eHdDyM22XUF90rA8uAVp0osH3gLj0lEnQgQtsBJYYxJYr1xhpJZsrtHtdMu
	OvRsj8fTA8Wm4oEYQCejfc6T742Ap9GOtm4HSwcu/4Zgy9HSjkSf1jh5hpyNZH36wIgs
	ZAFF6XbcWDx6l40OeIOpzkOwjmntu4EcLa5vE0paF5j8SquB0FcwG0q3pF/awG1dHAAF
	SyVTF3uFDd5fEWpy8vG0vKzOwAMTO4uWBAgyEIxQqHBBrJu34RTigRoj9qah44uZJ9hP
	BXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=P+AaLkuApLC3XqUA6d6XpltBCSVa6c8S8lltmKgJRLw=;
	b=M/JG592FZ8mBzgU4S443ozQF+uHKMQ7ByWJT8F77i1Fclgj/GKVw/1gSSY71Ucc5cm
	WD/vO0frcO8pxHw5JfMRlREqJMcFJvUq+tZnvsdNa8P80lIL2aiKtJu98Lk1Z3Tbaq2T
	wvGebciez+zo8mXGir9qwPX2slwHAhlW5rLtsi7h2otp7bZ7ulkeXAJeHeAjuiiwvTCQ
	VtUCMc4BOwdmFz2+WvVtpC2kpxzWQOgxGFFMbRVgpcUi4iNdmV1C2bDcIdnxoHncdl6a
	ByAj6y5MQwhG8uOn5oi6DAP8KOGmDxprdGpfTTHAuwQe+XPkTfDgq5EtKA0Vpct4BagA
	+8Tg==
X-Gm-Message-State: AE9vXwPjQ/rsl4Gs8FNh9khpmzeX+XNlI1t9sg75+C5w6o0DuvJEgv+ia0fP7XKja1XoYg==
X-Received: by 10.25.218.75 with SMTP id r72mr8156406lfg.131.1473058704572;
	Sun, 04 Sep 2016 23:58:24 -0700 (PDT)
Received: from ad.chargestorm.se (h83-209-191-235.cust.se.alltele.net.
	[83.209.191.235]) by smtp.gmail.com with ESMTPSA id
	s82sm4501735lja.14.2016.09.04.23.58.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 04 Sep 2016 23:58:23 -0700 (PDT)
Date: Mon, 5 Sep 2016 08:58:22 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160905065822.fivzxjjyotyzifgt@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
	<075b7a5f-14d8-5999-2fda-da8bae3d893e@windriver.com>
	<e83ab03a-ae9f-cf9a-2838-1b16b15a4e16@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <e83ab03a-ae9f-cf9a-2838-1b16b15a4e16@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/ (1.7.0)
Subject: Re: [PATCH 00/28] Enable gtk-doc
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
X-List-Received-Date: Mon, 05 Sep 2016 06:58:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Alexander Kanavin <alexander.kanavin@linux.intel.com> [160902 17:08]:

> On 09/02/2016 12:59 AM, Randy MacLeod wrote:
> > > Gtk-doc generation happens if 'api-documentation' distro feature is
> > > enabled
> > > (it is by default), and 'qemu-usermode' is in machine features.

> > Should this really be enabled by default?
> > What does it do to a typical build wrt time and space?

> The default distro feature list also includes all of the available
> communication stacks, full x11 stack, pulseaudio etc. It seems to me that
> the aim is to enable as many various features as possible by default.
> Distros can and should trim the list to their specific needs.

Sure, but as far as I remember, doc building is disabled in most cases.
And personally, I'd prefer to have the doc-generation disabled per
default. (As usually, most people I've met, won't use the doc's built
here anyway).

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

