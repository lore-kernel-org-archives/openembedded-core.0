Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2346116C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 11:41:52 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id q108so7200659qgd.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 04:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rdzSuGq4RInERv3gpz8JTuGBY/GDR08jH7J//mkFWd8=;
	b=OaHp8juO/Kz8fWeExVCwKhDNjyo1ojxMm/eEP4GQfu0+3BZkcUninKQmxPTAWwUMxR
	jzfE/LqDYl8mI+mOfeuutieuYiMQzhuOl5TN1aPZG99eKjf4VhncMZL+5dY/G1MH0w9J
	KHv6poe0yp5uHs7LygNxyXGs5XIxGIV96K3DbnA1kW85E5PPU5TeCOnRcwoAB2u5t8CU
	63d4SXleOZriOV2kjLQkq3rTnOITaddKGdvIMo0jeSj7I/TAPhSHPDI+/eyTudebN3+r
	ACyXkQTagHj9RxOtG5SuEdmoopwonzkk2FQBV7FZ2ZvTdkuUfmeLX/N3Opp6GdlbkmVK
	hgtg==
X-Gm-Message-State: ALoCoQnV4TE9F/C4vzA97EBHXbqKjVZ9LnNXAp1ZXTtDwcm/C2Cv+mIjnB25zTzwFbAw1W5uxS6f
X-Received: by 10.140.97.247 with SMTP id m110mr6790145qge.80.1411645313174;
	Thu, 25 Sep 2014 04:41:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 25 Sep 2014 04:41:33 -0700 (PDT)
In-Reply-To: <5423FE09.6020002@pabigot.com>
References: <1411148655-5500-1-git-send-email-pab@pabigot.com>
	<CAJTo0LY0a9_Rb5Eyq3b20ML89YcVkNS0N=NnXL-zkUQescGu3Q@mail.gmail.com>
	<5423F97B.6020705@pabigot.com>
	<1761684.on3aH1HNt7@peggleto-mobl5.ger.corp.intel.com>
	<5423FE09.6020002@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Sep 2014 12:41:33 +0100
Message-ID: <CAJTo0LaK_Mzpnm32MzVS=iWS-uddYuVVK8=dxEzmqtd_LzedcA@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] git: add Git perl module to perltools package
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
X-List-Received-Date: Thu, 25 Sep 2014 11:42:00 -0000
Content-Type: text/plain; charset=UTF-8

On 25 September 2014 12:35, Peter A. Bigot <pab@pabigot.com> wrote:
> Shouldn't I have gotten the nothing PROVIDES warning for git-nativesdk even
> with git-native in ASSUME_PROVIDED?  I'm smelling a missing end-of-line
> anchor in a regex somewhere.

Yes, me too.

Ross

