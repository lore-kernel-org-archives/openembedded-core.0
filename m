Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 609F36F7D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 17:00:52 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id w5so2544766qac.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 10:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=baNfYARp7OIkS3W7Exky9bxX7vf0PPG42cZ95ungiWY=;
	b=Lgy5Wki0FrShD5oJLEPzB/eWNGvMjsoOiBsAgP+OCC6TrXuYPkw2EJ/a8Kyu61ukLk
	3v4mAAo4wPPxIMuDWo4EX97JU1YY6HTAOB/+yrIP0M82CUklMyq4Rr3e7kNaSdpoxtGU
	C2Qc5Ub0Nriq/OMwhla7E73fTcImJvk/VBw2YYWZZJkwnj15o4zjcK28qhQ6wIWzikDf
	P+/ctEWKAOeqU4JxYV7HKo1YApONU/K41hnUZm7Go4DVfLc4e59+FV5jNMAMuE0gWkfB
	fYh4KbNY0HRalEO0WN56UOrRpw1d5CcQjAdQAYZHgvoCTVDL6apY2MlhQoyOxsJH5Urf
	f4BA==
X-Gm-Message-State: ALoCoQl9B4pDuL23fcKr+/GH3WZ1kuSM9VSjSgoLGtpAuxEJfOVMMRXjDPeD53z1cJWmvU31Wdsn
X-Received: by 10.140.42.9 with SMTP id b9mr17264319qga.87.1395853253973; Wed,
	26 Mar 2014 10:00:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Wed, 26 Mar 2014 10:00:33 -0700 (PDT)
In-Reply-To: <1395844085-9929-11-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<1395844085-9929-11-git-send-email-lauren.post@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Mar 2014 17:00:33 +0000
Message-ID: <CAJTo0LaYpYNTwFGoqCh=PHJ=Zo2cqvFVNryLpyeShCG3MY6rZA@mail.gmail.com>
To: Lauren Post <lauren.post@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/11] default-providers: Add virtual/bluez PROVIDER support to bluez4
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
X-List-Received-Date: Wed, 26 Mar 2014 17:00:55 -0000
Content-Type: text/plain; charset=UTF-8

On 26 March 2014 14:28, Lauren Post <lauren.post@freescale.com> wrote:
>  # There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
>  # on this rather strange entry.
> -PREFERRED_PROVIDER_bluez4 ?= "bluez4"
> +PREFERRED_PROVIDER_virtual/bluez ?= "bluez4"

Pretty sure you'll want to keep this as it is due to the bug referred to.

Ross

