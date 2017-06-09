Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1F887782AB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 14:24:20 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id m62so137527500itc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 07:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=pf9bSZiiPohy/DjLeMSGGtiPTpGU7xkEtKdrk2cprSY=;
	b=jsc224C97oQWPXK5T15UlxwiUgTqlJS+FO3LyKnb3sVzvaABONV2R1NYsrYIp3Bw1y
	xR/YPfMUj8wRk49gBfKtxRUvKyGuXRAZseNcGwGOhIcaaXWLUpv3pmX8matyF7KwY7sU
	UsSMprgb6r+dBQrR/C8Ln0MwVAetvj1owILRSHHvQULnKc9hrWlJ/BuIo16dR5SIpQ6P
	EGLWYNX8cR3Z93aPFl46cgLM9VUdji8JHMeN2dFOFXEJkpEpFnXiDf6XHrP8RsGe+U5W
	AhuTWHYZn3lssL+WsdAtnxceCJkIsDhLjpqn3UpOadJi4Go4IdFXy+C+wBKTnzzUNOVq
	qsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=pf9bSZiiPohy/DjLeMSGGtiPTpGU7xkEtKdrk2cprSY=;
	b=Ehdl9c8w27c+oPLnAtQxGkwAof+1g205F56D5tWu1Nuuir3T6XtFNhZfJk9t+lQbEG
	7g/PNPolk9duKPkHHHOwjttiRW8o0AHui+rDGQp9Npajo7MY7Ga+nxCb9Rz5fjpd4LZx
	rcWmZHLb7l7G01X6wDrzonN+k0p4hQMRNgpl7wK86smcmHtZYh9Ny3JMHRzMheSPmKgM
	QMhIxzp9puXqxugnn0gfKpCg8jqwQ66tQMXA/Lio0lAHC4ixFTljfCPPwvoqwVKYF+fw
	qzI3kOy1n3fotBQ2Ja16vfUz42U+xImk0ut9K55OwONYseIw92f7NuVYrDx0dDz7e4er
	Cngw==
X-Gm-Message-State: AODbwcCThNDyeKXXMrRt/t2w8wfoMZBfUG9NDPYMK4a88U04pTRSQ0iG
	pJIsAR5XAFFABsT1
X-Received: by 10.36.120.66 with SMTP id p63mr10812197itc.22.1497018262134;
	Fri, 09 Jun 2017 07:24:22 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C0DE.dip0.t-ipconnect.de. [93.232.192.222])
	by smtp.gmail.com with ESMTPSA id 11sm234900iou.39.2017.06.09.07.24.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 07:24:21 -0700 (PDT)
Message-ID: <1497018257.30163.200.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 09 Jun 2017 16:24:17 +0200
In-Reply-To: <1497017515.30163.193.camel@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
	<1496912216.6630.225.camel@linuxfoundation.org>
	<1496930142.8427.2.camel@gmail.com>
	<1496932400.6630.250.camel@linuxfoundation.org>
	<1496935714.8427.7.camel@gmail.com>
	<1496950316.30163.152.camel@intel.com>
	<1496995960.30163.175.camel@intel.com>
	<1497016077.3131.5.camel@gmail.com>
	<1497017515.30163.193.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Fri, 09 Jun 2017 14:24:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-09 at 16:11 +0200, Patrick Ohly wrote:
> On Fri, 2017-06-09 at 08:47 -0500, Joshua Watt wrote:
> > Is there a currently known valid use for such a thing?
> 
> Using LAYERDIR is one, although that particular example is probably
> better caught by looking for that particular variable instead of
> annotating all places where it gets used.
> 
> I'm unsure whether there are valid uses.

Perhaps this one is a valid one:

WARNING: .../libgcc-initial_6.3.bb:1: include/require/inherit "recipes-devtools/gcc/gcc-${PV}.inc" resulted in including "recipes-devtools/gcc/gcc-6.3.inc" while parsing. Variables effecting the parameter changed later such that "recipes-devtools/gcc/gcc-6.3.0.inc" would have been included at the end of the recipe.

PV changes, but that must have been anticipated as it clearly works as
intended.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




