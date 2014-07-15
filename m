Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3369570589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:50:02 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id a108so4756006qge.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 06:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FqnmOJai0l4tFYetD0KokyYTgyQqsEamTgPfvjpn+eo=;
	b=aljyBtb7Yq7V8A+zdiL3AudjQd1vXwRZkCuBKnF2LFQDsNJdPcjcZLeVXVsVsEFXCw
	Sysj1F/nxQyMRV66vwQ/SdKgR7fm54SeDFX/CY++bWR3EO05JCyjV0x6tm1bCgOfiHvL
	ZyhkEimu650yHCJBeKeaUi71HelSJ576zuEyfwdP6ZrFoDHUi/U1QtZQRL/XWtOLEMGk
	UPUEnKwtA+Z4yFwABC/sjh/M43AiaGBrejaqdpL4ry14JiMZ6RPh/ZlbrZ1myId2Qda1
	YuXKD4u4CrK99IPjgXn6fegyMzFbqYlBze6ooW0pwoIJbtNBdmEr2CuMDZuQlwxD1H1T
	QRqg==
X-Gm-Message-State: ALoCoQlIyEYaCQAccQew5V/jb/hzYfEk9BuQPEVr+4XRpzThYAX8HmQ/NoH0lgIXLpg/fBT3nqBt
X-Received: by 10.140.91.164 with SMTP id z33mr33490289qgd.65.1405432203022;
	Tue, 15 Jul 2014 06:50:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Tue, 15 Jul 2014 06:49:42 -0700 (PDT)
In-Reply-To: <1405430855-12398-1-git-send-email-akuster@mvista.com>
References: <1405430855-12398-1-git-send-email-akuster@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Jul 2014 14:49:42 +0100
Message-ID: <CAJTo0LYfG4kCxWHbKK9rM7YScB2NAqVqmTVmMKpGb7UD7WE0Bg@mail.gmail.com>
To: Armin Kuster <akuster@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nettle: update to version 3.0
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
X-List-Received-Date: Tue, 15 Jul 2014 13:50:06 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2014 14:27, Armin Kuster <akuster@mvista.com> wrote:
> Add GNUv3 license

If nettle 3 contains GPLv3 code then we probably don't want to remove
nettle 2.1, for people building without any v3 code in the images.

Ross

