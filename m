Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 61860719A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 07:10:28 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id l7so25253325ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 23:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=V8wGNNj0kzrFtofTJ4y8e7ap5v7t50eGWc6bippMrwA=;
	b=e2o8BWcq9rp9j+jJ7FXZmjdBvh7gNqbC/WEjsT40A6LHMB4IgjBbwcdhaTadS3rIeg
	4pbUzyxRnD5sK0EFsYBdRZT23dQTG1UysOXMAAuV5OpyVupA80GJPQCETYRwP/+sDU9u
	dZZd2MkyCBNOPPwQaAu8hMHoefkp/G5EQ5NEEy+rRAAA/VXju27P/LcL9DO8lrNNk5WB
	UAgCDDw/Eujsurdkkik7T34QDmlYPRysZju/8Ttsq/azNkbn3ZpwssQUg7byZu98Remg
	V3qgPqgVfbSAtT8WM1DTlHvC8fW1j9qP9XiKToJp6L/AORCRR/aF4ZhW+MH7rKaPfRnm
	VmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=V8wGNNj0kzrFtofTJ4y8e7ap5v7t50eGWc6bippMrwA=;
	b=de4FvjkpJLI37QmD+a3ZqE164AXvN2MyDVdz4tUSKK88EzVZDplOLPurrADpF/VbIK
	wLWJsQ4uMnKw9Fyga61b7NN1+RHk0gUcYKXkJfGLC1LUZQY0M7LM9WcAOd3Xun73a23v
	mrqkwPip5RR/ybBgyKR0zSACzeIFZupDC6dD0sVv2CqDwPCRFjSlsxh3znuYF9BYeDeL
	tABYLOsSOaKhrXbH4m4KwbnU1jMxupeoLZ+44uGFBB3VY3CX+LFigABuzUYWitDS/4Zn
	lqHC1rilsTf5SnIOLdKsCZQl9CJAb0gL5LTwyltvQJVq3GXDIoxRlLTQcGqjr/r5fovZ
	bMCA==
X-Gm-Message-State: AMke39k7peILgjJ+vPXOgkWizomXYca+G3Ck4cv07PXboyOCN4GXrmIAtKr5B6sVC1JkuFcM
X-Received: by 10.107.47.162 with SMTP id v34mr7035769iov.52.1488352230173;
	Tue, 28 Feb 2017 23:10:30 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E037.dip0.t-ipconnect.de. [93.232.224.55])
	by smtp.gmail.com with ESMTPSA id n2sm1822422ion.50.2017.02.28.23.10.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 23:10:28 -0800 (PST)
Message-ID: <1488352225.7785.83.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 01 Mar 2017 08:10:25 +0100
In-Reply-To: <1488340816.24526.26.camel@linuxfoundation.org>
References: <1487625169-22282-1-git-send-email-anibal.limon@linux.intel.com>
	<1488312568.7785.73.camel@intel.com>
	<1488340816.24526.26.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Wed, 01 Mar 2017 07:10:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-01 at 04:00 +0000, Richard Purdie wrote:
> On Tue, 2017-02-28 at 21:09 +0100, Patrick Ohly wrote:
> > On Mon, 2017-02-20 at 15:12 -0600, Aníbal Limón wrote:
> > > 
> > > common.test_signatures: Test executed in BSP and DISTRO layers to
> > > review
> > >     doesn't comes with recipes that changes the signatures.
> > I have a question about the goal for this test: is it meant to detect
> > layers which incorrectly change the signatures of allarch recipes or
> > recipes which share the same tune flags with other machines?
> > 
> > Let's take MACHINE=edison as an example.
> 
> The test is not for these things. Its using the sstate signatures for
> something different compared to those other tests.
> 
> The idea is that if you have a set of layers and generate the
> signatures for world, then you add say a BSP layer but do not select
> that MACHINE, the signatures should remain unchanged.

That's useful too, of course.

Is the "build single distro for different machines" scenario that I
described part of the Yocto Compliance 2.0? Should there be tests for
it?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




