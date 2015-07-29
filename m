Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5C46B73D13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 16:28:24 +0000 (UTC)
Received: by padck2 with SMTP id ck2so8182427pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=byb04JiLlsMU2EOEN2L6noNIq/F7n31/DgTKdfWnicY=;
	b=MPKzQkJDVYpTNNPVrgav2cViG7/Q0RsSP30yDYkJ2jlXnr2p+2zAl/0OhNOG1fvwFu
	oJErcemWhwqXL6bne8hOtMvnMOW+oW0nGpGlM+gJVEBrFL9pZttvuB1quQTlVx5WHYje
	PS1zsspE3O4EIFsLu+NGQEMJmBgmuAoHYf0B79Sne8fCdfgvUs3qDOEkWWnRiJdRu4rW
	xzfkGMqT2L0fLhPwHj1rV1TI2zhK0owDsyYBW2dlQgyTVegwFQ0FNg+V6BvbBVr5xA2C
	7B5qSBhmRdTen6L0sy5HokEBP901aKKGRgSCPmRcWhkRHLcWb1GRkV2YPH07zGXecw7h
	xjjQ==
X-Gm-Message-State: ALoCoQnnTcSmhJs4CJRDpa1LaDtYgAT1oZojhZPGPFOgsKWox+AjjbeoTF56PaswTUOSFRtydvWj
X-Received: by 10.66.154.131 with SMTP id vo3mr16365774pab.135.1438187304766; 
	Wed, 29 Jul 2015 09:28:24 -0700 (PDT)
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com.
	[209.85.220.50]) by smtp.gmail.com with ESMTPSA id
	j3sm41614813pdf.76.2015.07.29.09.28.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 09:28:23 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padck2 with SMTP id ck2so8181877pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:28:22 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.116.81 with SMTP id ju17mr95588293pab.35.1438187302289;
	Wed, 29 Jul 2015 09:28:22 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 09:28:22 -0700 (PDT)
In-Reply-To: <CAJTo0LZP1wrXWFaOh4kRqDmY5cXqOACS54aZK0OqAzhtyz0Lzg@mail.gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
	<1438125665-14966-8-git-send-email-armccurdy@gmail.com>
	<CAJTo0LZP1wrXWFaOh4kRqDmY5cXqOACS54aZK0OqAzhtyz0Lzg@mail.gmail.com>
Date: Wed, 29 Jul 2015 13:28:22 -0300
Message-ID: <CAP9ODKpEdFGPMMSy2h82_Z0ozeS_ZQqAZ2o9vfi4Gzt7cvjbBA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] busybox: disable fstrim in defconfig
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
X-List-Received-Date: Wed, 29 Jul 2015 16:28:24 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 11:22 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 29 July 2015 at 00:21, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> The fstrim applet (to discard unused blocks on a mounted filesystem)
>> doesn't seem like core functionality, so disable by default.
>
>
> With SSDs being more common, is this really true?  What's the size impact of
> this?

I agree with Ross here and I think it should stay enabled.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

