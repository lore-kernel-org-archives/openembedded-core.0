Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2086E6AF43
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 12:05:21 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id pb11so1722905veb.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2013 05:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=6JcSEGYj8z1pZ3LnINrVSTvfgRU9glSNSgnMyPfbbtI=;
	b=Wev1fzGAiaFOAhyTwpm8VbF+fcWHixnD+IhbnBzav6xqpuZfXhuxyAH28uNIHzd80z
	F92Oq6NO7mMKc9qK+c8pYfmlq0CLC9WPSEc30LJs2usN61exst03nfw6pfbbHO0A8CtM
	2poW7ppfTxwc0sHOF/I/oRxnNWyztz9++IcMMwKOhxFzSkxVWx29LDSk4zQ6yjNBVy3K
	rm/U6a3TTaDd89vqJPEkurfn31w4o64yBEqVqmOzqTUtvWpFLi+pMCGncWjiHxWprc9B
	9rJTpay/CARlxY8NxGzpgHM1mdAevzbiluqzEdQIfyt2elTeRopBNm45ejpw05gWbPZV
	ddTg==
X-Received: by 10.220.1.9 with SMTP id 9mr6535427vcd.37.1373025921925; Fri, 05
	Jul 2013 05:05:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 5 Jul 2013 05:05:01 -0700 (PDT)
In-Reply-To: <51D6B3E2.1040608@intel.com>
References: <cover.1372950678.git.radu.moisan@intel.com>
	<CAJTo0LaQGPWUCjJ5=Lnm5DAhdjsA9rSoM0tx2Dp141UKfq7WcA@mail.gmail.com>
	<51D5B68D.40809@linux.intel.com> <51D6B3E2.1040608@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jul 2013 13:05:01 +0100
Message-ID: <CAJTo0LaU0HHXz3o2X7BEX3WHrxSifAp991hM7O6sR-hXXa5R3g@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQk3OxMW9jfL/GXjhIe+DGKMzzMAeBAr3uz3EIoyk/wwmkzgF+E2soLaXp7YnlRyI5HL4+s7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 00/10] Package Upgrades
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
X-List-Received-Date: Fri, 05 Jul 2013 12:05:21 -0000
Content-Type: text/plain; charset=UTF-8

On 5 July 2013 12:54, Radu Moisan <radu.moisan@intel.com> wrote:
>> Typically we keep the older version for the non-GPLv3 builds.
>>
>
> So no issues with this patch, right?

The V2 which doesn't delete the previous one looks good.

Ross

