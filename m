Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8DCBC60745
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 14:51:00 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id t15so53162852igr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 06:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=20tSB09bqkHNQ6kHXvz706QUq2fkx49jy7IFKGjNh+Y=;
	b=hDLkNwG3YgknYxq63DP1nM4kjixf3B+7Zbg0jszzyBmQSS3u0nJT7cSN0is+m8mGAz
	GC/jhynCoDEXfm1ul+wLin86BV8rMib/HK+bfsJw6D/hf2NOGd3u4dpA7JlaLLxcTUHu
	JFBrSFymJ1nk2jrEuZ6Pr+GJW25Hlo6mpyLBtT4HqhwQoJZrFlHbxcydJF03VMrFQO65
	FfeY1i5LGBgrTPExAYKhwxgC25jlO7u4nm60nylH9Inn/koIN8/XxJmHsrUgsoPTSU5A
	BZR7ZrAOUgwye0mZfCHY78h6JvlbH7HrKzgUuqzwue+DjHtVMSTv6X5zIQwGiE0WIEcy
	f7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=20tSB09bqkHNQ6kHXvz706QUq2fkx49jy7IFKGjNh+Y=;
	b=jUhgC+n7eTdQi8CU4gC6MRxy9pBo9TumHPqjuNlt9fc6cLTGJvUlly2uLXQyNJQGEY
	2APq1QOA/AZZsXlXNpJvvJrZPUSAZMtwwyFjNxTD+yuE8yLIQBvXCm9Ne+r2RrAk5AMA
	iYDaWh+AqxyaH1noxznJfP3zJhTmzcbuHL+4NNK0F7LQQsIqAEM4/DvJWQ/8GlGZvul0
	qXBCKv1CKO7zK2f4LB7MQIw8CKPvk2U0dA1sHcsA1KFTUHAuxQ42XKLdH87MmAZGj6Df
	0KRgxWhaqX0lFO7FK5mM7t8CvOkbw3Ze0qhOQbK4wYDtWkFxeBsdbSQyMZofL11lb53K
	B8Mw==
X-Gm-Message-State: ALoCoQm76454lPVEUFOra34Lnrha1fIJUHkZgfU3Gsy7LBpHjdWzpK8jv4Yj+CaACsKskJhW5d/UmQWWUdnfrQBfSKqNsU4Qyw==
X-Received: by 10.50.109.167 with SMTP id ht7mr22276175igb.38.1452264661281;
	Fri, 08 Jan 2016 06:51:01 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F2CE.dip0.t-ipconnect.de. [93.232.242.206])
	by smtp.gmail.com with ESMTPSA id jc1sm6877751igb.7.2016.01.08.06.50.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jan 2016 06:51:00 -0800 (PST)
Message-ID: <1452264658.17716.21.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>, Ross Burton
	<ross.burton@intel.com>
Date: Fri, 08 Jan 2016 15:50:58 +0100
In-Reply-To: <5b0777dd5f120c6235dad62bab0dd8972a7c54be.1448029554.git.andrew.shadura@collabora.co.uk>
References: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
	<5b0777dd5f120c6235dad62bab0dd8972a7c54be.1448029554.git.andrew.shadura@collabora.co.uk>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] dbus: update the recipes to 1.10.2
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
X-List-Received-Date: Fri, 08 Jan 2016 14:51:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

I've tried this together with the user session patches on top of poky
0f3ad7c77a (almost the latest), without problems (except the checksum
problem that Ross already noticed). My local.conf had:

DISTRO_FEATURES_append = " systemd pam"
VIRTUAL-RUNTIME_init_manager = "systemd"
VIRTUAL-RUNTIME_initscripts = ""
DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
PACKAGECONFIG_append_pn-dbus = " user-session"

I also tried without pam and without user-session, again without
problems.

https://github.com/pohly/poky/tree/dbus

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




