Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB0C7199B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 14:54:55 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id x94so82868492ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 06:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=kODTLAh4rU3nE1Uw7+qN3KYLMVp/WVHd5CNT49M7EwE=;
	b=aaO/TgVxdHebR3YvsURzTM+SdH0G6vX0utknsXqO7oGWjhiSXcswC8VKXslEHkIO8m
	G2r2QKWoYIbNCqk8ICBJV/2HTPWdsylKDwKHtLcQKDfkQIxIOPM9SqWfzyJ59FykcP4E
	GxWRNtXzTkqTe4Jf4ZYZapnnobphaAm48L7GtcTmV6qzRFSSQvu0VAsTdqDocZ6EHXfb
	SGbM2eYYwlkHR9fh7lQJgrUapCH9K4uQWSr9SrIyt7I15MqISJ6jjR2WskIYY0w+MydR
	KSA6F+doaCzbd0RUx9BtV+l+zRi3rWdkNzDDZIjplZndF+84mUZTrwhEaY7MtdwxfuE8
	jIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=kODTLAh4rU3nE1Uw7+qN3KYLMVp/WVHd5CNT49M7EwE=;
	b=ltmv22oCPcDwPLSa+b2r2TI7ICSQwlElhVa5YETXLMFhpZh4faPmTE6EHeBNdACFuc
	eddOAHdFtRP0MCCMOFfxHsyQAmACtln7GUC9L3+e1FLS+XTiJLBqVWpmRYrCEF346xYk
	UgXjBxRTMhNH90V6+GzWaJliLHY+dk6e7Vx3zAtL9WrkTPyw5lEpAw3qfKf7CeO+TDw0
	c3EoDRVDujtanV83cMiYDYIbKnMOufC4KDNY4dOPyDN2NQVVSp9CpaWI+mtZj97T6Hin
	vRndAKGUJNjpovvhllmuSOfzwEtAhz3LVwC6UkhGMoAvXC9D/PUEaSPtwQU+OZZfXeAL
	g4MQ==
X-Gm-Message-State: AKaTC02sJA1eji9lvKMmEOB3jNxelD48h2lU3oWe4V6EjnKpSL5F5oBYjEPp3Y1xBdGDf8OZ
X-Received: by 10.36.103.200 with SMTP id u191mr2525477itc.8.1479999296338;
	Thu, 24 Nov 2016 06:54:56 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D035.dip0.t-ipconnect.de. [93.232.208.53])
	by smtp.gmail.com with ESMTPSA id j69sm2828375itb.4.2016.11.24.06.54.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Nov 2016 06:54:54 -0800 (PST)
Message-ID: <1479999290.6873.44.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Philip Balister <philip@balister.org>
Date: Thu, 24 Nov 2016 15:54:50 +0100
In-Reply-To: <d0a381df-850b-6a63-7f7e-47741618cf87@balister.org>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<1479899811.31880.37.camel@intel.com>
	<adc8effe-1856-560a-a7fb-0d92138e1990@windriver.com>
	<1525289.rQK3S6YPkZ@peggleto-mobl.ger.corp.intel.com>
	<27dbd493-5b76-657f-8a1d-57eabe9eebed@windriver.com>
	<1479973589.6873.15.camel@intel.com>
	<d0a381df-850b-6a63-7f7e-47741618cf87@balister.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Thu, 24 Nov 2016 14:54:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-11-24 at 09:09 -0500, Philip Balister wrote:
> On 11/24/2016 02:46 AM, Patrick Ohly wrote:
> > On Thu, 2016-11-24 at 11:38 +0800, Robert Yang wrote:
> >> Currently, debug-tweaks is in EXTRA_IMAGE_FEATURES by default for poky, and
> >> there is no passwd, so that user can login easily without a passwd, I think
> >> that current status is more unsafe ?
> > 
> > Both well-known password and no password are unsafe. User "root" with
> > password "root" is not even "more" safe already now, because tools that
> > brute-force logins try that. Choosing something else would be a bit
> > safer for a short while until the tools add it to their dictionary.
> > 
> > Poky is also targeting a different audience than OE-core. Poky can
> > assume to be used in a secure environment, OE-core can't (because it
> > might be used for all kinds of devices).
> > 
> 
> That is the first time I've heard Poky is targeting an audience assumed
> to be running in a secure environment.

At least the default local.conf seems to be meant for that (easy-of-use
for developers preferred over security in a hostile environment).

> Should we document what Poky this
> somewhere? From where I sit, this seems to be an odd limitation.

I'm not aware of a document explicitly documenting this either. I
wouldn't call it a limitation, though: a real product could be built
with a configuration that doesn't enable debug-tweaks.

As Paul said before, more documentation about first boot, login
mechanisms, security considerations, etc. certainly would be useful.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




