Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 81E4460438
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 11:44:41 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id r5so950906qcx.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 04:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WCY/hRGPXWDbK5MieyKDNyncJkt1xwixlR1Q4e4HcBk=;
	b=QqNhG/yBnB2F3979Ceshr6K+OBshyxg1AeJlEVTtButzp5IC3QdI2ofmuJT8QN5CHG
	1RZ6c+7YuX36Xn5io7JIz+ceZvlubjYpt3rDkMaoSP9VJT67RLrlGWYC2Cfz4XkP9/aG
	vKinBcIVPH0T56y+WyBMBfEA0UF2x0SJ+KaXMLR8rwBRn11uM5yotzOeFNTfbHf+EWB3
	twM6T0aZmvRPAmJh22GJ84kgBLMCPeP/iF1a/Uzc6LY+5iLwJ4jESSvyjIkBkBzQGTM9
	aPaWiXiojdEhpvkvFBOoSGiyx6MlL7xHY9tDECiP19CU+PxzeQFCRcD97/IQONKz2CgP
	EMCA==
X-Gm-Message-State: ALoCoQnChABUiS/NIozlhNsUg5Co/jkhGIuZ/oDd0RHEJnK72Kr+dGdds3ZpwsxR6MnCR0uP0H/Y
X-Received: by 10.224.64.201 with SMTP id f9mr16623667qai.64.1408016682620;
	Thu, 14 Aug 2014 04:44:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.134 with HTTP; Thu, 14 Aug 2014 04:44:22 -0700 (PDT)
In-Reply-To: <15DEAD10-F7DC-44D3-8A6B-948FE9A42A0A@dominion.thruhere.net>
References: <cover.1407951966.git.pkj@axis.com>
	<452f76082d13b3d1c7f9930c8754553c336bd176.1407951966.git.pkj@axis.com>
	<CAJTo0LZy_BEMGRO4pcjaJYfdtmq24TJ3+iLAmWjYXDh9Bz4wRw@mail.gmail.com>
	<15DEAD10-F7DC-44D3-8A6B-948FE9A42A0A@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Aug 2014 12:44:22 +0100
Message-ID: <CAJTo0LbZ1xFLH4SdbrxNuPh1Pe9HBVGdedR5aZgh5CGU_8s2ag@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gstreamer1.0-plugins-good: Add a PACKAGECONFIG for udev
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
X-List-Received-Date: Thu, 14 Aug 2014 11:44:43 -0000
Content-Type: text/plain; charset=UTF-8

On 14 August 2014 12:27, Koen Kooi <koen@dominion.thruhere.net> wrote:
> gudev is part of udev, right? And as a shlib it will get picked up as RDEPEND automatically[1].

Yep, brainfart my end - confused it with another library.

Ross

