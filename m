Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB196007C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 18:11:59 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id jz10so2133424veb.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 11:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=CsUzdZF5uiTc3ISdyEg5/Ums7LHisrHMyVyXsEBhghI=;
	b=c7E294d/rC0aVcC8mrJNg4cWpehsk+ES5nOb3g3UY8jKh8aS2onjzeLPwhSTRWmpgO
	NK2DAOhJqr8YGqa4oCkivLzH1FYtSKut+0Ztad35KkUW125nnTwT0LlTZvK08pFeurrE
	YCHwrJIOvRyIla0GMqLV01qj3vQoW5TDvPjsSGxn5JL0JizuM7wcvIkyyKWnaSC7jdQ7
	pf14tRdW+rYX+hN+aBGPpPcNiqNahLtMQXNQs4UVXaeXEd2yxYOx+buYLL8cD+ptf63f
	M7o4gDIPlgGvnVUxmycZ/dEZ72Ai/BuxqH4LaU2GxR148My90pErArYz8CYQRzUFmzm+
	zzuA==
X-Received: by 10.58.255.229 with SMTP id at5mr5904023ved.44.1372443120179;
	Fri, 28 Jun 2013 11:12:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 28 Jun 2013 11:11:40 -0700 (PDT)
In-Reply-To: <51CDCAC7.50202@linux.intel.com>
References: <cover.1372381458.git.rongqing.li@windriver.com>
	<391d4b34129e491a4ee0c6737369e8470c3b98ca.1372381458.git.rongqing.li@windriver.com>
	<51CDCAC7.50202@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Jun 2013 19:11:40 +0100
Message-ID: <CAJTo0LYtenYOhJwhn7mwNfU45wVeR2NaN3--=puPf_RHYg8ZKA@mail.gmail.com>
To: rongqing.li@windriver.com
X-Gm-Message-State: ALoCoQnFQMJmQgbBFAb1AWclX8QOBaPC2q0p48zVtcRCv675sF3FJO4ue3woXLLNRCjPB9A4I145
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xf86-video-intel: backport a patch to fix a compile failure
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
X-List-Received-Date: Fri, 28 Jun 2013 18:11:59 -0000
Content-Type: text/plain; charset=UTF-8

On 28 June 2013 18:41, Saul Wold <sgw@linux.intel.com> wrote:
>> backport a patch to fix a compile failure when xorg-xserver's version
>> is less than 1.10
>>
> I am not understanding why we need this patch, our xorg-xserver version is
> at 1.14, why would we need to have patch for an older version of the server?

Agreed.

meta-intel contains 1.9.3 but that's for the EMGD driver - I presume
this is a case of Wind River using an older X server for some reason,
and needing this patch?  In this case I'd say thanks for the
submission, but if this is purely for WR then we shouldn't merge it.

Ross

