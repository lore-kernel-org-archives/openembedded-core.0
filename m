Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id C3EF86E5F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 13:03:33 +0000 (UTC)
Received: by lbzd8 with SMTP id d8so10300242lbz.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 06:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=b7+vjvP4zdhcc4C0fhi9qefXRG2/q9u4i2el8T0Mc5I=;
	b=JCGCSyl6p0rTPI2PN6a7hx1CTXAkAqX94/Pez3M3X1+4JgYxEK8EGG6/TGgHeiFhLs
	h2MLfWiikNESRvwMPTR7UKiEz2F9U8msUuhfcsDjwzqnrvBWP6XWU+D41HOjOd9oCPo7
	1nc1cXRuHu398xcq0NzDyE76WRO+gHn96NmOdwSMYQSnbwtR9HG/g4h0Yke6gFdFCtyf
	VfbI6HnnE+HheX/pzFYJFPCsJO5FZLuNpZ+e28UGJOEOspH/bVbn2Zqony1fWVqhzahz
	2CkNy8e1vQE4JAzu/Vvf7YBU5kqzjawl8ZTxirwewR/aw95MSH4dHNA11hT0+v9aiBKX
	w7lA==
X-Gm-Message-State: ALoCoQltWZliZjhe97PC0z/7Ic8LmR38V2cfhTT/fefqLCNUg4d6q50uesQSPzr3lt1HF9Kf3cfC
X-Received: by 10.152.30.34 with SMTP id p2mr9358195lah.89.1436360612131;
	Wed, 08 Jul 2015 06:03:32 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id sg8sm604977lbb.33.2015.07.08.06.03.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jul 2015 06:03:31 -0700 (PDT)
Date: Wed, 8 Jul 2015 15:03:29 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150708130329.GB22443@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
	<55956F2C.2040301@gmail.com>
	<20150707053411.GA17548@ad.chargestorm.se>
	<CAJTo0Lb87w=NO5o-0_vcz29UO0JrVTahEg5c1VhQnVDNCma2wQ@mail.gmail.com>
	<559C320F.4020707@gmail.com>
	<CAJTo0LYLzjMAWYJQH3g0sGzZgdPtPXjthJCAgVuh=ux1mgm5Kw@mail.gmail.com>
	<CAJ86T=Vb889E6fcJJyN93MRwUfbShLrSa1S-79sQyoSHChYnYg@mail.gmail.com>
	<1436310276.27597.198.camel@linuxfoundation.org>
	<CAJ86T=WDOYytxxtGDgTRj2wOTp4JqtcymC1bH9q69qyAfmDU9Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WDOYytxxtGDgTRj2wOTp4JqtcymC1bH9q69qyAfmDU9Q@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Wed, 08 Jul 2015 13:03:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Andre McCurdy <armccurdy@gmail.com> [150708 01:57]:
> There are two separate issues.

> Both GPLv3 and LGPLv3 block 'Tivoization', which rules out [L]GPLv3
> for anyone needing to create signed firmware images which can not be
> modified by the end user.

>   http://www.gnu.org/licenses/rms-why-gplv3.en.html

> Quite separate from that, linking an application with a GPL library
> (any version of the GPL) requires that the application be released
> under a GPL or GPL compatible license, so GPL libraries are generally
> considered to be incompatible with closed source applications.
> (Dynamically linking with an LGPL library is generally OK since the
> LGPL license doesn't transfer to the application).

>   http://www.gnu.org/licenses/gpl-faq.en.html#IfLibraryIsGPL
>   http://www.gnu.org/licenses/gpl-faq.en.html#GPLStaticVsDynamic

> So for someone with a proprietary application which links dynamically
> with nettle in a distro which can't use [L]GPLv3, the older version of
> nettle with an LGPLv2 license would be the only option.

Yep, that sounds correct to me and the sane thing for us to do.

Cheers,
Anders
-- 
Anders Darander
ChargeStorm AB / eStorm AB

