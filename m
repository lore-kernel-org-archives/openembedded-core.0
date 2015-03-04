Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7A99D7389D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 09:23:02 +0000 (UTC)
Received: by lbdu14 with SMTP id u14so21742439lbd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 01:23:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=4NStgAO6+pUxvrh3gQwWNU2Ce0Fi9qth/bnSQlk1gKM=;
	b=CAZPKJI5qg/vP9SyrEy2cM3DP7F3wk+EM0c8jqeU/mX/2lCLx3T0S+mpm1eOMJ3NFi
	xBqI+hpMg7bLEKq+ApZCl+a4dapDGucDsXv87+BMLF2W9sbtP9fYQCky8SvpNo7BoYx9
	Vhz5DKIVcfwwqOn1QnoxapBjR0PUWLcz4J3/YLbSegN5jXSQP8fqecIOGMEO5xKSN9C3
	rvnfuBYbIrKBUe0uEIe4v/6InPuOVWV+y1fogQMbGQxVTs+k5P2KfN/pldSxw0j/03mr
	dqZxnnNneIitEdDav5jSb5Ke8kYXZeWEycRv5iq4WTwwrIHU6AA8Us/Wvcek+jOuH1LQ
	oQ4w==
X-Gm-Message-State: ALoCoQkkKrRqHUdus1annE+SXRppIF9mMTmqOloS8XF/Q3P1O84Z62HfQDil+wuvRMJwm6+NrsFe
X-Received: by 10.152.87.134 with SMTP id ay6mr2387301lab.75.1425460983447;
	Wed, 04 Mar 2015 01:23:03 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id i13sm647127lab.38.2015.03.04.01.23.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 01:23:02 -0800 (PST)
Date: Wed, 4 Mar 2015 10:22:59 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150304092259.GB19788@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <bruno.bottazzini@intel.com>
	<1423069496-25819-1-git-send-email-bruno.bottazzini@intel.com>
	<1423069496-25819-3-git-send-email-bruno.bottazzini@intel.com>
	<54D50BD3.8020608@linux.intel.com>
	<1425327675.2707.24.camel@bottazzini-ThinkPad-T430>
MIME-Version: 1.0
In-Reply-To: <1425327675.2707.24.camel@bottazzini-ThinkPad-T430>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH v2 2/2] systemd: split modules into packages
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
X-List-Received-Date: Wed, 04 Mar 2015 09:23:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Bottazzini, Bruno <bruno.bottazzini@intel.com> [150302 21:22]:

> The problem is understanding that although systemd is a single repository 
> it contains multiple services and daemons in it that can run even without the 
> core PID1, udev or the many helpers used to configure the system such as resolved, 
> timedated, localed... 

> All of these components are runtime independent, we can install or remove them and 
> they should not create problems.

> Even Ubuntu is shipping with some of these daemons even if systemd is not used (yet).
> If they were different GIT repos then it would be clear that they are separate daemons, 
> but as they are all in a single repository people can make a confusion about it.

> I see that in the master branch it has already the version 219.

I look forward to your updated patch.

This is something I've been thinking about doing for a while, and it
feels more and more necessary, as the systemd repo grows with more
tools.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

