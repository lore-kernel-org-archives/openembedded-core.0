Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id BDD3277AB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 08:31:14 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id y77so69058037ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=jaL9jryNU5m6W6XdyG285g2u9jgr0uNF8hc6jAzrbJs=;
	b=atPGBKJqxlD4UUD3+XDNEGyXZ1oSVpuaFwuCfZHARxxXIipjPAh6PEr6xyncP6572z
	Z9SYEnzR2H7UOoSelToOL4pB+JUts7p9a1+KAmyi/3YmslQPDk/epZgAQP5svv9UhV66
	ZbGLn0iaxCaPiPfdrtn8U0fvGjpjCUmZ+Psb5t9Pa7z3Hz3XUTG1Pkpt8xolLLo2UTiR
	bXSk4DuD6tDHTj9HFrkEpQg+6wIdniH4xFtJLlrcrD5YjxIkxy3KN+EtlohCbn74F3vX
	+HvCsld4aZrDzIFP4UxwHdbbUY3svtQxNv181WxtvEC0xnxeaK+XrFu9He1/KpZ1jr7C
	bcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=jaL9jryNU5m6W6XdyG285g2u9jgr0uNF8hc6jAzrbJs=;
	b=HjhWD2NHEp2m57zuXyeuNdrfJkERWvMGChM4fSClZfPuBocjUY1hvzgLSswCcqnhhQ
	ms3K2REDL7tmN5CDiCs54gSS0G4c4nOHlJSLpWeW1MJanpE0Gyg2J3nQiB8DjvymOYYE
	Q+eYNww1bK2R24/9eZqG9a8azzyx5DflKTWKzKv28mCHk9Uv6n6Z/xZuoi6Ba0kZS8Fk
	MKqtWZWUFCdrdVgMRzmUvmxQU4RfULQVZHGVyn62qzKXlyBt92YXlhss8WjhFU3UgiJJ
	zgTXDSQCcevcfGni7j1Z7JXOM3fhhUKaBCGWR1HOAOIWo/3c6s0VpnP3VnWyXP7Ceqou
	IAyA==
X-Gm-Message-State: AODbwcCSDvtdk5opPuagRklFXtR6rP2nyot8YGOFAh7dvw3lzqIAUxVR
	p0pFvJkggdzd9Pls
X-Received: by 10.107.20.150 with SMTP id 144mr42463275iou.25.1497342675551;
	Tue, 13 Jun 2017 01:31:15 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D5A8.dip0.t-ipconnect.de. [93.232.213.168])
	by smtp.gmail.com with ESMTPSA id 10sm4804860ioz.20.2017.06.13.01.31.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jun 2017 01:31:14 -0700 (PDT)
Message-ID: <1497342671.30163.346.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Tue, 13 Jun 2017 10:31:11 +0200
In-Reply-To: <1497338044.30163.324.camel@intel.com>
References: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
	<9dfd9eff13b3831c7e88c97318f97d2daeac9a78.1497013310.git-series.patrick.ohly@intel.com>
	<20170612194635.GX28053@denix.org>
	<1497301519.30163.288.camel@intel.com>
	<20170612232345.GA28053@denix.org>
	<1497338044.30163.324.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Tue, 13 Jun 2017 08:31:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-13 at 09:14 +0200, Patrick Ohly wrote:
> Let me also point out that the approach below completely sidesteps
> potential vardeps problems, because the dependency of OVERRIDES on
> DISTRO_FEATURES_OVERRIDES and DISTRO_FEATURES is hidden. My expectation
> is that OVERRIDES are part of the base hash and that thus tracking of
> how it gets computed isn't necessary. It seems to work in practice for
> me:
> 
> DISTRO_FEATURES_append = " systemd"
> DISTRO_FEATURES_OVERRIDES += "bar"
> DISTRO_FEATURES_append = " bar"
> PACKAGECONFIG_append_pn-systemd_df-bar = " gcrypt"
> 
> Changing either DISTRO_FEATURES_OVERRIDES or the DISTRO_FEATURES_append
> changes the signature of systemd:do_configure as expected.
> 
> We are currently having a problem with the yocto-compat-layer.py
> signature check in refkit where it complains about:
>         List of dependencies for variable DISTROOVERRIDES changed from
>         '{'DISTRO'}' to '{'DISTRO_FEATURES', 'DISTRO',
>         'DISTROFEATURES2OVERRIDES'}'
> 
> That's for a slightly older OE-core and the distrooverrides.bbclass
> approach. I don't know yet why that is now failing (it was working for
> OE-core 2.3), but my expectation is that the approach below would avoid
> it.

I've not figured out why it started failing. Because it's using the
custom distrooverrides.bbclass approach I've not investigated further.

What I was able to test now is the
refkit_poky.TestRefkitPoky.test_refkit_conf_signature selftest in
combination with OE-core/bitbake master (it wasn't working until
recently because of the OEQA selftest changes that we hadn't adapted to
yet).

That test checks that activating the refkit distro configuration without
using any of the refkit distro features doesn't change signatures.
That's a slightly stronger guarantee than required by Yocto Compatible
2.0; it's useful because it makes it possible to add the refkit distro
configuration without causing side effects when the developer doesn't
use the features.

When using the current bitbake.conf DISTRO_FEATURES_OVERRIDES support
from OE-core master, that test fails because adding the refkit distro
configuration needs to extend that variable, which shows up as (picking
one example):
   zlib:do_package_qa: a124d530af2a0531e4c18780f9c75c15 -> 56da5c6a55996ec5a4817d1d4003e5ed
      bitbake-diffsigs --task zlib do_package_qa --signature a124d530af2a0531e4c18780f9c75c15 56da5c6a55996ec5a4817d1d4003e5ed
      basehash changed from 870d9161cf8d10dfae610cf55b54612b to 528a46f1120a679282ff8e55bf2791cb
      Variable DISTRO_FEATURES_OVERRIDES value changed from '' to '      refkit-config     refkit-firewall     refkit-computervision     refkit-gateway '

This does not occur with the patch below.

On IRC Richard corrected me and explained that it isn't OVERRIDES which
gets tracked. My systemd example was working because variable values get
recorded after applying overrides, so indirectly OVERRIDES and thus
DISTRO_FEATURES_OVERRIDES+DISTRO_FEATURES change signatures.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




