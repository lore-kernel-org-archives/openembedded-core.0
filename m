Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB086013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 10:19:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2015 03:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,487,1432623600"; d="scan'208";a="729965280"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.4.22])
	([10.252.4.22])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2015 03:19:18 -0700
Message-ID: <1437041956.16819.32.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Thu, 16 Jul 2015 13:19:16 +0300
In-Reply-To: <CABcZANmfHHYLE=-9dP2-LfQ-uF8WJMxugbGOEEbR-9WQu67j=g@mail.gmail.com>
References: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
	<CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
	<CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
	<CABcZAN=z8xMuAABa54A8L2uFhC9fjRbZ36iszxSTJOpWcnFypw@mail.gmail.com>
	<CAEGpDubUdvEM=VHWzYqjBWoLz5Pz+2JP+j9oJLtdij-GSDamCg@mail.gmail.com>
	<CABcZANmfHHYLE=-9dP2-LfQ-uF8WJMxugbGOEEbR-9WQu67j=g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Pau Espin Pedrol <pau.espin@aweurope.be>
Subject: Re: [PATCH v2] pulseaudio: add systemd to PACKAGECONFIG if enabled in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 16 Jul 2015 10:19:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-07-13 at 09:22 -0700, Christopher Larson wrote:
> 
> On Mon, Jul 13, 2015 at 9:17 AM, Pau Espin Pedrol
> <pespin.shar@gmail.com> wrote:

>         So, pulseaudio is intended to be used as a systemd user
>         service, not
>         as a systemd system service, and that means it needs to end up
>         in
>         /usr/lib/systemd/user and not in /lib/systemd/system/.
>         
>         All these changes are part of my efforts to improve systemd
>         user
>         service support in OE, which is kind of bad nowadays imho.
> 
> Fair enough, thanks for the clarification. Given that systemd user
> services require pam, and most embedded distros disable pam, I wonder
> if we shouldn’t have an option, at least for daemons in recipes that
> can handle it, to switch from user to system via a PACKAGECONFIG, and
> possibly default that for the non-pam case.. Hmm.

Do you mean that there are many distros that have systemd but don't have
pam, and that the lack of pam strongly suggests that the system won't
have any regular users? If so, then your proposal sounds good.

-- 
Tanu


