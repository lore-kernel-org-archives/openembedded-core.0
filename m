Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 700AC77D28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 19:28:18 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 70so777702ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 12:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=pkVGQPnIC+YE9Cks/f8EMQRHrpui0GFTUfAnOfSFBFk=;
	b=GeGCLVXQmiqOo6gXyy4h+nkpjqvmDb0ynX99QwPCHk56mpK2Glq2uV016g/CMMaJ2b
	tfv1dY6CLVLqWa2+AXrta8wLTW8fTNnKFtX/vA0XsXgevo6W0IZZuoqh9Y5olJgG7QI5
	futBYGgz2DACWsEtL//jhVV/JREVF9ESoPbvq8br1sr6dH05SfpWXvuM7pTxYx045H3j
	qdvLWU6P1lv64YqlaAyQSJHBNHCQdPliIE1pS9eqJsntdy4uL1t01Qj7WJlNCGSz38C2
	mk9C1IbzMA/9utRkFRGa1z/krqMbhKstIA/dpws9pyLmttUWhdpdkyFVhZrliVdddIVy
	E0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=pkVGQPnIC+YE9Cks/f8EMQRHrpui0GFTUfAnOfSFBFk=;
	b=U8C7zrubTABfrMXVFtpzfcKd4V4dooVC5gpOat+b4cnovgIPQHK79I+8aBw3V4I5my
	oHPEyhyJpTWAltXQJv7HBqC+4dJCKM9e03svCCEBqqhhKcA6J3hk6FlWy4P7eak+2YCV
	LfKzYIUHmfEuJdcN0OqwA89lYPvuek9y50uangswoxOo0wOMUC/hiOUQ5jcYTf0BREP9
	cEqMppOfoJeX2DCimD4Nsavl+9dASNcf33nCMbdryu2sJRMm4WsPLeIEFolQ6aCvNSmo
	KIwEc0y5LAVvijulrMKVLUipDyH2jIvBW1bpAxoPe6RxyAg2j7UjE42bNeKxHWT2nU0X
	j6pg==
X-Gm-Message-State: AN3rC/6EsJX1/5fQYxXznyEmK8VZsj+GO8aurFzf0BfoEWYNtGNPzXxn
	5UvwC6emfafv9w==
X-Received: by 10.36.225.13 with SMTP id n13mr12319172ith.85.1493234899486;
	Wed, 26 Apr 2017 12:28:19 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	o67sm2405169ito.14.2017.04.26.12.28.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Apr 2017 12:28:18 -0700 (PDT)
Date: Wed, 26 Apr 2017 15:28:15 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Message-ID: <20170426192815.GA2366@linux-uys3>
References: <655290B7709079438B7932553958E60D16D23684@ESS-EX01.essvote.corp.local>
MIME-Version: 1.0
In-Reply-To: <655290B7709079438B7932553958E60D16D23684@ESS-EX01.essvote.corp.local>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: ilkka.myller@nodefield.com, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Broken NPM builds
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
X-List-Received-Date: Wed, 26 Apr 2017 19:28:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2017-04-26 @ 04:01:20 PM, Davis, Michael wrote:
> I have a simple grunt-cli recipe using inherit npm.
> On master branch it appears to be broken and unable to find the registry.  Same recipe on Morty branch works fine.
> I looked through the mailing list and didn't see anyone else seeing this issue.

There's been quite a bit of churn on master this cycle, it's not too
surprising master is struggling. Any chance you can share your recipe; or a
stripped-down, "example.com" version of your recipe so others can take a look?

> On a related side note I have recipes working for node 6.10.2.

You have a grunt-cli recipe working on master with node 6%?

> Is there a reason we are staying on the 4.x series now that 6 is LTS?

I'm guessing nobody got around to noticing the switch. I guess we could
cherry-pick node-6% from
https://layers.openembedded.org/layerindex/branch/master/layer/meta-nodejs/

Ideally we'd either merge all/most of
https://layers.openembedded.org/layerindex/branch/master/layer/meta-nodejs/
into oecore, or remove what's in oecore and tell people to use the external
layer. Why does oe-core have some, but not all, node support?

