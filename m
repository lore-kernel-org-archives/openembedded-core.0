Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 30C1A71C7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 12:40:14 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id m27so18141477iti.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 05:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Yt3OtJ5UYz/DbgUPuXn+rfyjrWp2GBqQbJnNLVYf1KY=;
	b=fjORs24PlbG84sgfYR5SSk+M+0Fr7WqWaHqQELASf95u3eFUYwZlgxIGrvvDSIEb/g
	M4tPl5EXEYaPcdvVW1vWf56d6nW90PLuZZZ57HGUhmoidBT4yeHurZUwvInBZGQqOMuj
	bQAjiyMOkBhi0kJqLJAUFhpwCRh3JjCuaBg0V9pLTQbGsMEWnEUEFoUXnXwMYRFy0qr0
	4T1/Zqgp7b7hAZ3PzYAAmqhzPbPoskyCztoE73zb639JV1+s5UzbrQywYFJCgYhNMRFe
	BW1s5JxFBoT9gaPZUqn8BF+ySc09DmjOyaGH4mDzolHxslha52eF8N2Bljkp3KoJUspQ
	ldnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Yt3OtJ5UYz/DbgUPuXn+rfyjrWp2GBqQbJnNLVYf1KY=;
	b=PaG4nupObxasm3Fht0Cgv86HHIDEN4HKcy3XNPq4qhX4w2jCENB+Cqm5np6ysGvndj
	kARD3CSDyV4CzFs7Y2wzcRv+PKvsQo+HwMJQpp+zz9KjL1KHIJyJOtaOtA6fhZBNrxW7
	nWw3EG6tzvYn64Fj0B9sWL+ptl1nwnollQTYgPJcSZCam1MDvLpVoTQgy4vSS0hF1R9O
	H50e0i9OxgKHjXcxcqW6P+mamIac7atDMNz+Cfu9M1WQcwepzTHMiRp4hejb7yKL7n7H
	mjd2SsGaP9ImXpKpJwjLTHji2INc5kNTcMZbpF8jNFLt5EtILOzeWT0w/6EBQreV3ZSV
	CAjw==
X-Gm-Message-State: AFeK/H2HqiZSKvfeHZrpe/3XhQAG8N4JnYW/vhyvq6ZRxnkC/8rxE4zDmx6lJ5Y8bIgW9VgI
X-Received: by 10.36.52.8 with SMTP id z8mr2660951itz.42.1489581616139;
	Wed, 15 Mar 2017 05:40:16 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DCEB.dip0.t-ipconnect.de. [93.232.220.235])
	by smtp.gmail.com with ESMTPSA id k66sm109082itg.8.2017.03.15.05.40.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Mar 2017 05:40:14 -0700 (PDT)
Message-ID: <1489581612.6396.94.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Mar 2017 13:40:12 +0100
In-Reply-To: <CAJTo0LZm4zR2f+2Wgvab0=dhdP-Mu-cDGihqh2_hnVvuaOVGmg@mail.gmail.com>
References: <alpine.LFD.2.20.1703150639340.8646@localhost.localdomain>
	<CAJTo0LZm4zR2f+2Wgvab0=dhdP-Mu-cDGihqh2_hnVvuaOVGmg@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what shell programming constructs can we count on in .bbclass files?
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
X-List-Received-Date: Wed, 15 Mar 2017 12:40:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-15 at 11:05 +0000, Burton, Ross wrote:
> Our shell parser *should* be POSIX compliant.  There are a few places
> where it isn't, but I believe those should be considered bugs.  At the
> end of the day the shell is actually executed by /bin/sh or /bin/bash
> anyway, so as long as bitbake can parse it you can use anything.

Unfortunately bitbake has problems parsing useful things like $( ). Are
there open bugs about that and/or is it worth filing enhancement
requests?



-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




