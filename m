Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id CD29F77E7E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 19:35:04 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id t87so28929164ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 12:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Y7bs0nu1vzPqBHPkHMkhlwJbfma8A3NIDpnj8xwXD4I=;
	b=vgNT8g0dIpmJRQS4fV1qtDClEQb4vz07ETw4KUsH57Zq6qR3ZWpQ9Tznx93pEL2iAC
	hft1EDW1nJuPVGCluckJ8UkDrRBO1zHvDRdL3xR2MGB/5Tm/pBd6Pz3fN1FuMZUSRrSZ
	dGD79I77mXpM07VHZLSl0beJd12IxS5bb1Jr6oowd1sEMn62Av76oiuFcTyhFKPzhXXv
	waIh7mcVjnE4z70JjRxfdMdJhZa4xsAruR4+uB9nQfmRZn7tvjy7ud7whHtUgxsjmUYx
	/gBulvW+2Egrl8bow7tz5Ld/E0SWTyoP6X1H6kLkQoQgvpbpw1a9TrW5a5kdeAr03pdz
	xuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Y7bs0nu1vzPqBHPkHMkhlwJbfma8A3NIDpnj8xwXD4I=;
	b=Zr5OQj7pmrwjlLFT6BsS7NYV5TRAIqzvANsupBm0CFT42NfHN618B4/Gg9lfbLcXNo
	jnQbZFWzd8ryY0DiB6qR2gtPPmAJ5eFjqoole1CDxjRJ7HkvlRvB5SJh2M9DVwl2QR5q
	1ujUbAVNdDaRlAurAS90pdqpAJg57QtBXrK9a8VpUcZgAexfWKITCtXRI8aSwXW6gksT
	WvYuq2sMhT3tiIypm8gwUSYS80za6HzJJVTDNeqk8OLvt7oCbxZ1yjk6Rh9hZDDEqyLu
	th18/0ZsoyuEv9n9pEuAJlkfS/buP8V2roNdc+3AeVkIYABw62K3N1h2RJ+VwNa4Gnat
	T9HA==
X-Gm-Message-State: AKS2vOz9PclylrGFkVLLsJnpBX0uJXZcl8WJsWGvVg9PJr2U1DvjSnIg
	DFVzAOzRt4Qy6Ama
X-Received: by 10.107.160.1 with SMTP id j1mr4042672ioe.78.1498160105592;
	Thu, 22 Jun 2017 12:35:05 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EF96.dip0.t-ipconnect.de. [93.232.239.150])
	by smtp.gmail.com with ESMTPSA id 33sm1575535iog.26.2017.06.22.12.35.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jun 2017 12:35:04 -0700 (PDT)
Message-ID: <1498160101.22706.53.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 22 Jun 2017 21:35:01 +0200
In-Reply-To: <1498150775.24449.120.camel@linuxfoundation.org>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1498141053.22706.4.camel@intel.com>
	<1498143522.31575.41.camel@linux.intel.com>
	<1498144469.22706.10.camel@intel.com>
	<1498145851.31575.50.camel@linux.intel.com>
	<1498147164.22706.30.camel@intel.com>
	<1498150775.24449.120.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] commands: send stderr to a new pipe
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
X-List-Received-Date: Thu, 22 Jun 2017 19:35:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-22 at 17:59 +0100, Richard Purdie wrote:
> The problem here is that stdout and stderr are being mixed and that
> mixing is not accounting for newlines. bitbake itself does print
> different messages to both. The mixing depends on kernel page size and
> when the buffers are flushed.

It's a single process were stdout and stderr share the same pipe.
Caching outside of the kernel may be to blame, but kernel behavior
should not have an effect.

My guess is that "Parsing recipes..WARNING:
File /etc/selftest-replaceme-patched..." comes from printing "Parsing
recipes.." to stdout without newline and then printing "WARNING:
File ..." to stderr.

I don't know whether Python logging can coordinate two streams. The
logic would have to be that when stdout/stderr go to the same stream and
the last output to stdout did not end in a new line and there's a
message to be printed on stderr, a newline should be inserted first.

> The key thing I'm not sure about from reading the bug is whether this
> output is from the same bitbake process or different ones?

It's from a single "devtool" invocation, so whatever goes wrong with
output handling is in that process.

> I can think of three things we can do here:
> 
> a) Add some flush calls somewhere assuming this is different calls.
> That somehow seems unlikely
> b) Keep stdout and stderr separate as per Leo's change

That helps testing, but actual users will still see confusing output. So
I would prefer to enhance output handling. However, it's probably more
complicated than running tests with split output.

> c) Have a command version which merges stdout and stderr respecting
> newlines. I suspect this happens on a console but likely not on inter
> process pipes...

In this case it happens for a pipe.

> It does sound like we need to answer some questions on what exactly is
> happening before we can know which solution(s) might work.

Yes.

And please, whatever we do, let's not change oeqa in a way that breaks
existing tests, whether they are in OE-core or some other layer.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




