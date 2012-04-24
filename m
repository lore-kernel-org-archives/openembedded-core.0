Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SMole-0005EN-PC
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 01:03:30 +0200
Received: by qcso7 with SMTP id o7so721974qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 15:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=75mseeQvyd3G0rxo7fs0WJM8u9jrJzWsBzLKHea5pmI=;
	b=FRiW+pCsyP9lvSnFXyLK18DJT31nQp/IKTI/X62avDRxIYWc9A/yGpbdnPy15xgTgp
	ldt1fMW/81uQba16hJb696lDINAqhFPMqKDhtNyVPtNH/KZNZgDCCw6KApvOvE2R5gEh
	BNy5yusi567855+8HmIALbsk3wfzFYrmMi6Nwukb7tf0+VkbK64NsRof7DZdtmhibDku
	Q9Th4vdEd9kDe/F8Obgq+iZBPz8FWFxlwbrG6LiPjPr+MpMKQ56IQ4R4lVGelC5rLW9X
	Y4uFWLnU/L6OdtdcqNsRw41EyfQY4PCI7yu8yoP08d98Vtp0h9LV4cnBht4gEX8yTm4n
	gADQ==
Received: by 10.229.137.139 with SMTP id w11mr42629qct.99.1335308035302; Tue,
	24 Apr 2012 15:53:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Tue, 24 Apr 2012 15:53:34 -0700 (PDT)
In-Reply-To: <CAPhnLPCWAKLiLUfKVaguN_cFA=PAgRhW4vZ-pa1XDtW=Wugvpg@mail.gmail.com>
References: <CAK18fxFXyj7U1RgBSigrED+H6BjJjx3uCcWY2nVONCOULxL+iw@mail.gmail.com>
	<CAPhnLPDr2epHUeCjDaeg473mv8cR9jf6gA-BpxT=jU_BDcq3sg@mail.gmail.com>
	<CAK18fxG0_-aQDuPMA5drMAA8Kk-bnAPw-THrxafAOM6amvE2hA@mail.gmail.com>
	<CAPhnLPCWAKLiLUfKVaguN_cFA=PAgRhW4vZ-pa1XDtW=Wugvpg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 24 Apr 2012 15:53:34 -0700
X-Google-Sender-Auth: y0x2duQ0Jz9aHIIbN-lxP7GialQ
Message-ID: <CABcZANnyFDurr+B6nW5nJz+3kq2RXp4403Eqhcahkt53ififeA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: LICENSE_{X}-xxx is parsed?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2012 23:03:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 24, 2012 at 3:38 PM, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
> The rest of the packages in the bb should be inheriting LICENSE if no
> PN level license is set. Which obviously causes problems for the above
> example.
>
> In a case like above you'd want to do either of the following:
>
> a. Call out each package's license individually (better but can be
> painful for recipes with lots of packages)
> b. Leave GPLv3 out of LICENSE (easier but not technically accurate) so
> undefined package level licensing inherits the correct LICENSE.

I wonder if a partially specified set of individual package settings
should be identified by some sanity check (an explicit, rather than
implicit, one, like recipe_sanity) as a potential bug / source of
confusion. I suspect most of the time it should be one or the other,
either no individual package LICENSEs are defined, or they all should
be.
-- 
Christopher Larson


