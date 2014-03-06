Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 191EE6E826
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 10:04:47 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id w5so2238341qac.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 02:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XCRLsO/IjHp+W7sStzumNjXwcXkMdalF3cS+3bdDUqo=;
	b=cgOS/4jNfag3H3azk+T+uodDHPcirB/F/Itz5WswX86PWD1Daxv6Hqt3PIcYZAuszc
	U7IDHoO1BH7+OKwgccF6RcYq3oTHimfLydSKBebNUvKsQ0091W1e9CdVj3ucssuUt/Us
	hW6Ja7yIzaUtQBueOX1+BA6JGS/cJYHi7J5EqXFO/D1H9QQiy4YUCKkSdCFe8qdazA9H
	Ifd4UnKzq0dFdBtOJPmnFiEMn1hxUFLvbm24KUkfgqnoV/tivZNAwFpYC9QfLVgcFjMy
	IHBzm7VE1ghxY6HuzNXoAvedp+scjVn5r7LFRGGPvXCRqRJ6P8X3BhnKokYHZEOZDbUr
	BsiA==
X-Gm-Message-State: ALoCoQncVcZSLYTZzLoHpCNPuEOdSKD9mcpiBOwPt+YG+/neDET4cwfq3HEDKxZDkbDuE2xpuocu
X-Received: by 10.229.193.136 with SMTP id du8mr6416436qcb.11.1394100288330;
	Thu, 06 Mar 2014 02:04:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 6 Mar 2014 02:04:28 -0800 (PST)
In-Reply-To: <9477177f82743adfab34256b7bc002a37dd61787.1394093112.git.Chong.Lu@windriver.com>
References: <cover.1394093112.git.Chong.Lu@windriver.com>
	<9477177f82743adfab34256b7bc002a37dd61787.1394093112.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Mar 2014 10:04:28 +0000
Message-ID: <CAJTo0LZ_OjXVhoNv6wk085=5vY=i64_8T6s=Tef5h7qgFC5Sfw@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Thu, 06 Mar 2014 10:04:50 -0000
Content-Type: text/plain; charset=UTF-8

On 6 March 2014 08:06, Chong Lu <Chong.Lu@windriver.com> wrote:
> +PACKAGES += "dbus-ptest"
> +ALLOW_EMPTY_${PN}-ptest = "1"
> +RDEPENDS_${PN}-ptest = "${@base_contains('IMAGE_FEATURES', 'ptest-pkgs', 'dbus-test-ptest', 'dbus-test', d)}"

Nice idea, but wouldn't a more correct solution be to have dbus-ptest
added to PACKAGES conditionally (instead of always generating
dbus-ptest and conditionally adding the dependency)?

Ross

