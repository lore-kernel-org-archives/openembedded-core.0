Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id B3ABD72F74
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 13:38:15 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id m27so2651924iti.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 05:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=0z4VpadijmhoLTrT0XvRwcSZSvfk90QjVn1vs/NMBkk=;
	b=OR/uR0PIcqD+mMrXD8tI9XvbjMCO2ZbU75tbrl2iUrQFKwbEa1s9iWgqVWfG8vn20c
	MiwCuKCH+CjZ/DSl7UHBherS2sN2aISeP+fH8J0xa4f5EHLCBRkWCIYpuaH7DbBIcDOa
	l2i1j0P1kDZsglV19LvdPz+4DhJrfEvFo+92qmzoVDtmh1mSl2djR8abXz9yzEZpq1zX
	Xg+faF6PD76aT9H9kFNWmFD2hKCq4aNemtipPAIeaYpwmHw483f7vAnK0YhL8tQRsUrA
	hryj1nk8YzgB+5lC3tfJLndXOyK5lywm9sZqjoozARIa3iQ6iqHRFlnb2gx133uvNZeT
	dYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=0z4VpadijmhoLTrT0XvRwcSZSvfk90QjVn1vs/NMBkk=;
	b=fTpEAer9IsTcUz1BhnhZFOPmVHu3q+VRF/6te1LBzm4f2rOQPXus7TFrljpT2OE0MQ
	sMYgiMEKMlIOpoOBTqiqeGRUeavqliNaC3Wnq6/HCcOe0hYfVYNprM5xJQH0piwtxzwT
	hzx+xKo23dR6VKg83dbtIf5KlYIzOoA2di1rtOfyB/Z6DE3k65r4C2FZbUZ5qxh+7NnN
	oWD8fZimligRrUXRV2kcD3bcgEIY/XRP5CJCBT8m+kxCA7J6uBS/P8ZYXFcekEWeIWVJ
	D8MP+K85Xmb+OWcAn63IKXqUljJ4CMdZ76RDoDyvQFeuIvIWCHT/SdAW9Z3IH5xZP3AE
	kSjg==
X-Gm-Message-State: AFeK/H3IqtqebtbzkhIufA09rc9Log4PD6iKLd6BjZXVJ+gaqMjmT6UxH7sjIHgFUCAtPX/c
X-Received: by 10.36.154.69 with SMTP id l66mr1931513ite.18.1489153096566;
	Fri, 10 Mar 2017 05:38:16 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DCF9.dip0.t-ipconnect.de. [93.232.220.249])
	by smtp.gmail.com with ESMTPSA id
	p140sm971791itc.27.2017.03.10.05.38.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Mar 2017 05:38:15 -0800 (PST)
Message-ID: <1489153093.7785.443.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Joshua Lock <joshua.g.lock@linux.intel.com>
Date: Fri, 10 Mar 2017 14:38:13 +0100
In-Reply-To: <1489152420.3099.7.camel@linux.intel.com>
References: <20170308172417.15776-1-joshua.g.lock@intel.com>
	<20170308172417.15776-2-joshua.g.lock@intel.com>
	<1489089950.7785.374.camel@intel.com>
	<1489152420.3099.7.camel@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] meta-selftest: add selftest-ed recipes
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
X-List-Received-Date: Fri, 10 Mar 2017 13:38:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-03-10 at 13:27 +0000, Joshua Lock wrote:
> On Thu, 2017-03-09 at 21:05 +0100, Patrick Ohly wrote:
> > On Wed, 2017-03-08 at 17:24 +0000, Joshua Lock wrote:
> > > The oe-selftest oescripts.TestScripts.test_cleanup_workdir was
> > > using
> > > gzip and the GPLv2 variant to test cleanup of the workdir. This
> > > broke
> > > with the removal of GPLv2 recipes from OE-Core.
> > > 
> > > Instead of relying on recipes in OE-Core remaining static we should
> > > ensure that meta-selftest provides recipes required for the tests
> > > to pass.
> > > To that end we take a copy of the current GPLv2 and GPLv3 variants
> > > of ed
> > > and include them in meta-selftest as new recipes.
> > > We chose ed over gzip as gzip has dependencies which would require
> > > additional GPLv2 recipes to be included in meta-selftest.
> > 
> > Wouldn't the test become faster when using artificial recipes, i.e.
> > something which doesn't really need sources? Such an artificial
> > recipe
> > can use a local file as its "source", for example.
> 
> Indeed, that would make the test faster. I took a shorter route for
> this series in an attempt to unblock M3, however I realise that the
> bitbake targets used in oe-selftest could do with a consistent review.

Makes sense.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




