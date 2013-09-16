Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7B7615CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 17:59:54 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id gd11so3100717vcb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 10:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jvLfV4wAgvcX4WYI8NQeC5UZUAGTWDLmGvJ8q1mpJ/4=;
	b=MaFsuX7+zuuvhWaWOu+yPNWUyaFHnoKi0YIsSpHG2xqU1hTl2O4OC2c7LbDzyYQVlb
	oAIZA7Mvhl+aGUYQffqYAI62uhhj4GpHH1jwxHt8vbTsNSMFENF/dqUb3RcdH4xX3hQu
	8XqqIy4ArqzMuOnfbM/HkLssc7kuy8lJDTRjqG1Wl/pfX5XDv5J8SIaeF/v9czsokEgS
	g54KFa0a+fM1rbo2/ME7wGtB1OAQXu49K+KZozvnH3XcUoAiFTkK18EVZoQpWaaQyg6K
	YPm3MjDVGUs73yMVQFgmNcv0H9D5Ig5x1iU924FT0Tkt/5X+psT24qwU9Mtc+EquEKgl
	kXQg==
X-Gm-Message-State: ALoCoQmFG3NVvMIgw7kKW5CKrbYWksNhg51ayJVcz3ksLSrKcISNUqL72nDOgIBHaTcCvFoYqYKB
X-Received: by 10.52.229.73 with SMTP id so9mr2182650vdc.27.1379354395580;
	Mon, 16 Sep 2013 10:59:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Sep 2013 10:59:35 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C704963FC@ORSMSX103.amr.corp.intel.com>
References: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbKD7_vPLK1qV5ZAUBB78GedUZ84SLTSTe9MULArzn4uA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C70492C1F@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbvTNA=YgA5APK55MtO2wS7QDqJUy4t4C_C0g14AYC=wQ@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C70495CFD@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LZucKPx8oG-v+JghEwQmcXhu5qz36bie_sgB9tWoN2tfw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C704963FC@ORSMSX103.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Sep 2013 18:59:35 +0100
Message-ID: <CAJTo0Lbgd0h3HVfmAb_2CUY8Atmj+9YtiCaRc=BX4p3ZSFi2ew@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
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
X-List-Received-Date: Mon, 16 Sep 2013 17:59:54 -0000
Content-Type: text/plain; charset=UTF-8

On 16 September 2013 17:16, Kamble, Nitin A <nitin.a.kamble@intel.com> wrote:
> The PROVIDES from mesa.inc is not what mesa-gl recipe provides. Mesa-gl is dropping
> gles & elg components, and that should be reflected in the PROVIDES. Right?

Urgh, yes.  That will teach me for grabbing an hour of work in between
being dad.  V2 incoming.

Ross

