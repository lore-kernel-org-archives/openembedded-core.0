Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EBC6076167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 15:47:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2015 08:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,523,1432623600"; d="scan'208";a="767478116"
Received: from unknown (HELO [10.252.22.224]) ([10.252.22.224])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2015 08:47:00 -0700
Message-ID: <1437580018.11632.5.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Wed, 22 Jul 2015 18:46:58 +0300
In-Reply-To: <CAEGpDuY97Gx0qnEHcxBQ+udQgZXdQ3uksHtERZQLtB=KxZE7Bg@mail.gmail.com>
References: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
	<CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
	<CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
	<CABcZAN=z8xMuAABa54A8L2uFhC9fjRbZ36iszxSTJOpWcnFypw@mail.gmail.com>
	<CAEGpDubUdvEM=VHWzYqjBWoLz5Pz+2JP+j9oJLtdij-GSDamCg@mail.gmail.com>
	<CABcZANmfHHYLE=-9dP2-LfQ-uF8WJMxugbGOEEbR-9WQu67j=g@mail.gmail.com>
	<1437041956.16819.32.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<CABcZAN=G=izCZKV+2qL9TEBrtBqBiw74gPPZ0s=mkdmDeGY3pQ@mail.gmail.com>
	<1437070403.16819.47.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<CABcZANm3yiV98wDX0WtQdLEvpo9cV8PEqPJwjFQVLyJphFau6g@mail.gmail.com>
	<1437072252.16819.57.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<CAEGpDuY97Gx0qnEHcxBQ+udQgZXdQ3uksHtERZQLtB=KxZE7Bg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	Pau Espin Pedrol <pau.espin@aweurope.be>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 22 Jul 2015 15:47:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-07-22 at 17:31 +0200, Pau Espin Pedrol wrote:
> Hi,
> 
> 2015-07-16 20:44 GMT+02:00 Tanu Kaskinen <tanu.kaskinen@linux.intel.com>:
> > PulseAudio can run as a user service without being a *systemd* user
> > service, and that's actually how it's commonly set up. PulseAudio is
> > typically started on demand via its own autospawn feature. The autospawn
> > feature will be replaced by systemd's socket activation in the future,
> > but only on systems that use systemd (and pam).
> >
> 
> The "autospawning without using systemd" is not affected by the
> modification done in this patch afaik, because it is not enabling the
> systemd user service, only installing the service file.
> 
> So, If you agree, I will create a patch for bitbake.conf to
> 
> 1 - add:
> export systemd_system_unitdir = "${nonarch_libdir}/systemd/system"
> export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
> 
> 2 - Also change systemd_unitdir to use nonarch_libdir.
> 
> 3 - Then I will create v3 for this patch using systemd_user_unitdir.
> Maybe also modify the recipe a bit to use systemd_system_unitdir for
> the system service.

About that last point: PulseAudio doesn't currently ship a .service file
for running in the system mode, so I don't know what modification you
exactly mean.

Otherwise I see no problems in your plan.

-- 
Tanu


