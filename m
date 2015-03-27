Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 429E46013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 14:57:50 +0000 (UTC)
Received: by lbcmq2 with SMTP id mq2so65507205lbc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 07:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=knM55N2uzcFbzI7Q+y5jg4EGeAAqjWo5AEZQOhoTqWg=;
	b=YZn42DtkTWZ1aIvBVx3s9a1kW+KZ8tjlu/4DamXB3NRU4EQ9i8mu3bSUh9xQVlg8bh
	6paZUn8jqw6PTZwopJWsI+RYq3DSPSQeTnTrWRQs2qBchzi/LWVI2DCTBUVnLWy7WK5b
	ZtN0j5D1RDhI0iM2rxBmgqT7hE+V+1meHxTLSCHvmhMM22FL1NcUk6w5LXHjyv8khAPM
	9Ot693USY6M3kuLJl9XfjoIh3alng9wDmGftERVlhzlBtPBx0JSObtFftVQy5EGnCPAo
	XxYMv6wAHoJ2XdoHse5pNLMpsWYPVNZLv3N0uhT645J1eQWJeNdsfJHM2v7dL6xNi3nR
	bTfA==
X-Gm-Message-State: ALoCoQmnPkDiUxsJXuCNx5c/NU++blxZ8JnRGNB2GjOUq5cBqgJT51TObgmR2GIgdCUAn7KRQO+U
X-Received: by 10.112.26.134 with SMTP id l6mr17992768lbg.23.1427468270327;
	Fri, 27 Mar 2015 07:57:50 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id h10sm383711laa.41.2015.03.27.07.57.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Mar 2015 07:57:49 -0700 (PDT)
Date: Fri, 27 Mar 2015 15:57:47 +0100
From: Anders Darander <anders@chargestorm.se>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Message-ID: <20150327145747.GE21905@ad.chargestorm.se>
Mail-Followup-To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-4-git-send-email-bruno.bottazzini@intel.com>
	<20150326082923.GA7370@ad.chargestorm.se>
	<CAP9ODKr7QnmGCFfh+HnB1d_TE0CDCkqSgG75if11E_Z+CMq5sA@mail.gmail.com>
	<1427377220.2918.8.camel@bottazzini-ThinkPad-T430>
MIME-Version: 1.0
In-Reply-To: <1427377220.2918.8.camel@bottazzini-ThinkPad-T430>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: split modules into packages
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
X-List-Received-Date: Fri, 27 Mar 2015 14:57:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Bottazzini, Bruno <bruno.bottazzini@intel.com> [150326 14:40]:

> On Qui, 2015-03-26 at 08:56 -0300, Otavio Salvador wrote:
> > On Thu, Mar 26, 2015 at 5:29 AM, Anders Darander <anders@chargestorm.se> wrote:
> > > * Bruno Bottazzini <bruno.bottazzini@intel.com> [150325 22:50]:

> > >> if one wants to launch a simple deamon, most modules are not
> > >> required.
> > >> He will be able to save space and exclude unwanted packages
> > >> from the final image.

> > > I like this, though I've got a few questions that I just noticed.

> > >> -PACKAGECONFIG ??= "xz ldconfig \
> > >> +PACKAGECONFIG ??= " \
> > >> +                   gcrypt \
> > >> +                   kmod \
> > >> +                   ldconfig \
> > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
> > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
> > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
> > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'xz', 'xz', '', d)} \
> > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
> > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
> > >>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
> > >>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"

> > > It might be worth noting that xz has gone from being explicitly enabled,
> > > to depend on a DISTRO_FEATURES.

> > Agreed and we shouldn't explode the number of possible dsitro
> > features. I'd also prefer if xz were kept enable by default so we
> > don't make a behavior change under the hood.

> > ...
> > >>  PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
> > >> -PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"

> > > Why do you remove networkd as a PACKAGECONFIG?

> > If there is a real reason for this, it must be recorded in commit log as well.

> Guys, if you continue this patch you will see that networkd will always
> be enabled. Systemd will always configure/make it however, the package
> will not be installed if the user wants to.

> With PACKAGECONFIG, we may not get everything "for free" as some data
> files will be installed regardless as well as some components from
> systemd cannot be disabled by their build system but we can run without
> them, for instance we can run without journald.

The advantage of also keeping the PACKAGECONFIG for e.g. networkd (and
as much other things as possible) is that we're also reducing the build
time and size. Sure, it might not be by much, but all small bits are
valuable.

> The problem is understanding that although systemd is a single
> repository it contains multiple services and daemons in it that can run
> even without the core PID1, udev or the many helpers used to configure
> the system such as resolved, 
> timedated, localed... 

Yes, and as systemd have configure options for quite a lot of those
things, we should make use of those options, as long as possible.

> All of these components are runtime independent, we can install or
> remove them and they should not create problems.


That's right, but still, if we even can avoid to build them, it's
better...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

