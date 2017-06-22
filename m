Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2948277DB3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 15:59:26 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id e63so16766299iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=cnUJVTUUnOqYMuuGdnscOd6nDsUOXs4IbQZqgdQckZA=;
	b=hn+kC8wZUfE8Ebk1JUnm/C++BpzILDoJ2BI45LFUWnt+fVFJf6U41XzfBkVzFdhkGX
	PjSpYqIi8B0v2E8Ps1nb2moJNTRmDw9Q2eqaBBBLFAJab6zXi7rc1vDt7GxVTa3ZuiH6
	0pAENjuD1Mp8i+pkH3X49hBnq0IhKFLkgw+wuQ5kLKg/TLkHEMI4BZ5l+yRSF8IRJDb0
	+wFmte6m9d4Y5Esz74/y8mEamauj+M5HSpCyBNKhwrHCB8GYRkwvollxSFCWzUoTxafx
	1Z4z7GBOSnid62jdw2VoOFr5haGQbodrY+gE1YCgwQEzrsLydtDX13IS3tG4LCjJycvr
	2iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=cnUJVTUUnOqYMuuGdnscOd6nDsUOXs4IbQZqgdQckZA=;
	b=FSgGlI9VQiZ7BeH5Lw7ByiZzxOp4HYo+yAzJtEBc6mUpC3FDIHyUeDjOMOL4QBmGLf
	MHxKaYB3F4jpusn7Kvk+MOFKA7VMCDu4+QB/UX8R5PKcd6lL1hTIyOmjDaxxD9E54KDT
	FxN7NudZsuDOTbha7lLizyU0ekRn7igB7rABSCN3cKHLq5+66jM5SMx4DX748aJo+HCe
	c8u1vCaJSvxN39IqTRdkyCDKIK8v2XRyhZfN6vLEPPDSSgkA4iV+hqhEX0y9Buv3KAGh
	vCTRIJFVlhO7YP4jag2GkoIT95iwgVbbljopk1Y7s0HJ1w9X8wFq1P8O6/4waHBjUMii
	bA6A==
X-Gm-Message-State: AKS2vOx1YAXnpXP85SvAZmApklAvbculvm3n8avDjAvgjZI+vPpbyxW7
	f7DTGBA5ZchS9OfSUtA=
X-Received: by 10.107.50.12 with SMTP id y12mr1064120ioy.98.1498147168130;
	Thu, 22 Jun 2017 08:59:28 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EF96.dip0.t-ipconnect.de. [93.232.239.150])
	by smtp.gmail.com with ESMTPSA id
	v10sm1266177iod.36.2017.06.22.08.59.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jun 2017 08:59:26 -0700 (PDT)
Message-ID: <1498147164.22706.30.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Thu, 22 Jun 2017 17:59:24 +0200
In-Reply-To: <1498145851.31575.50.camel@linux.intel.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1498141053.22706.4.camel@intel.com>
	<1498143522.31575.41.camel@linux.intel.com>
	<1498144469.22706.10.camel@intel.com>
	<1498145851.31575.50.camel@linux.intel.com>
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
X-List-Received-Date: Thu, 22 Jun 2017 15:59:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-22 at 10:37 -0500, Leonardo Sandoval wrote:
> On Thu, 2017-06-22 at 17:14 +0200, Patrick Ohly wrote:
> > On Thu, 2017-06-22 at 09:58 -0500, Leonardo Sandoval wrote:
> > > On Thu, 2017-06-22 at 16:17 +0200, Patrick Ohly wrote:
> > > > On Mon, 2017-06-19 at 07:39 -0700,
> > > > leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > > > > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > > > > 
> > > > > Do not mix the stderr into stdout, allowing test cases to query
> > > > > the specific output.
> > > > 
> > > > This changes the behavior of functions that are also used outside of
> > > > OE-core in a way that won't be easy to notice. I also don't think that
> > > > it is the right default. For example, for bitbake it is easier to
> > > > understand where an error occurred when stderr goes to the same stream
> > > > as stdout.
> > > 
> > > how would that make it easier?
> > 
> > Because then output will be properly interleaved, as it would be on a
> > console.
> > 
> > Actually, the entire error reporting in runCmd() only prints
> > result.output, so with stderr going to result.error by default, you
> > won't get the actual errors reported anymore at all, will you? 
> > 
> 
> process stderr will go into result.error and process stdout into
> result.output. So when the process is executed ignoring the return
> status, then test must check result.error. I find the latter cleaner
> that checking errors into stdout.

It depends on how the result is used. That you prefer split output for
some tests does not mean that everyone wants the same in their tests. I
don't want it in my own usage of runCmd() or bitbake() because I don't
care about where a message was printed. I just want it in proper order.

If you change the default, then you will also have to enhance runCmd()'s
error handling to include results.error. That's currently missing in
your patch.

> > > > Can't you keep the current semantic and just override it explicitly in
> > > > those tests that need separate stdout/stderr?
> > > > 
> > > 
> > > My proposed patch was mainly based on a RP's comment [1], suggesting to
> > > split std[out|err].
> > 
> > He did not suggest to change the default behavior. I agree that using
> > split stdout/stderr in those specific tests which specifically want to
> > check for error messages makes sense, but only in those tests.
> 
> No tests require splitting the output (all tests pass with and without
> this series). The series is actually an enhancement and without it, we
> saw (specially when the python 2 to 3 was going on) past warnings going
> into stdout, so Chris and RP suggested the approach.

Richard, can you please comment on whether changing the default is
really what you meant?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




