Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3586D1D0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 15:15:09 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id m20so1474975qcx.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 07:15:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=W5s2iKyNqqsx5L+Wz/47MjpL8UipQQIDcT+rjFXSkWY=;
	b=OsvDzBttS8wSQe2LoNaUXUGmqeBI7LtPFPEGmOfMExChYjF+TpkldeTfeIid0Lcj0/
	YgosYW3Vwr6p+5chQ+khqQNhw63T+iRV3EYXpFxxBP3OnSOcvthHBLApH0lPYvKDk0sD
	6OjEunCj3B8CuNaT2ThKNXppZYvaKSdyoV+/y9tqkKRwHfGI7pdzGazlwwXyAP8smuI/
	7jXhD7QDbpk9oG1JjhMupgXBW54DsGKJEF2mUDQhUjXzyiM7Fi1rkis1SViWGlNYuLuT
	lKg8XUphgH1OI2yJn0kNz5i2Um4VojwobFyBa3SBGWDNVqsueqmT9mThCUvNXsIpTgM9
	nFAg==
X-Gm-Message-State: ALoCoQmPdwsLznrxHtpkEyY04T82Pr//AVP8bJ7s+Wbq1UA7v9tAMslY3Y+1C93ae9S5KxJZxxPE
X-Received: by 10.49.127.205 with SMTP id ni13mr215000905qeb.40.1389194109722; 
	Wed, 08 Jan 2014 07:15:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Wed, 8 Jan 2014 07:14:49 -0800 (PST)
In-Reply-To: <52CD692A.80504@topic.nl>
References: <cover.1389186276.git.irina.patru@intel.com>
	<52CD5193.2060702@topic.nl>
	<52CD5795.8000005@balister.org> <52CD692A.80504@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Jan 2014 15:14:49 +0000
Message-ID: <CAJTo0LbOzXJYt-nRx+h-WUb=yg716Jr9R6nLVCZ+jR-9sqUUew@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: What package installs a C compiler on my target?
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
X-List-Received-Date: Wed, 08 Jan 2014 15:15:11 -0000
Content-Type: text/plain; charset=UTF-8

On 8 January 2014 15:05, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> $ bitbake tools-sdk
> ERROR: Nothing PROVIDES 'tools-sdk'

It's an image feature that core-image.bbclass transforms into package groups:

PACKAGE_GROUP_tools-sdk = "packagegroup-core-sdk
packagegroup-core-standalone-sdk-target"

Ross

