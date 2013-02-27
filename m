Received: from mail-ve0-f177.google.com ([209.85.128.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAiXq-0004w4-0h
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 16:03:55 +0100
Received: by mail-ve0-f177.google.com with SMTP id m1so634977ves.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:47:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=cfWSkTOiVzYYsI3AFgXGKzlFjSS6W6xpk4DWiHOVWsQ=;
	b=ndc22HRnQIgfwxZ+ICGGnntP5L33qmTgw7GaRSYMd3cixfCaoBGt7mTvPqaSwf5FSb
	ph2vQuMhqb/HeGFX0hqFXtQNCveeGhgCtOaSKcU3MAF+OJ6BYkQ8/t2qqxHJYCyjsNTT
	MM31qbsVvRlbDk3pW06+4Kt0Cw8bGvyQiTMbzVq7ieBp/4SsaX4EUsNM+/l01O7An/HF
	ofNhi+yY0q6a3xZs0CtMdYgXLXDy3iXW63kAwhu3mgINvPFuYZGkl2M10rzL2lxVgYJj
	LfeT4K+ELl6uvBYWvTRoGfTolUQ3AUwmNgUj7lnfG+bsy2cLh/IRzRwbrmpKf2HdHNZ2
	od7g==
X-Received: by 10.58.220.229 with SMTP id pz5mr996346vec.30.1361976445004;
	Wed, 27 Feb 2013 06:47:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Wed, 27 Feb 2013 06:47:04 -0800 (PST)
In-Reply-To: <CAP9ODKr0MgSyi7_nAdenhuyyGkfRw-hTPy3mWoHLjaRCD4DHcw@mail.gmail.com>
References: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrv9kbMuhMK6OnEGNqNRn0ZHM1R7xZwYAFa=QjivCcigg@mail.gmail.com>
	<CAJTo0LYFL_-YuemRozDYKaGaa1+mKtv8YgHUJdGnnHqPRKzDQA@mail.gmail.com>
	<CAP9ODKrSYh2vxAotVRFmvy+JbP_yexyRqb6hftsR=FOde4AjZQ@mail.gmail.com>
	<CAJTo0Las-tCaN47Dz8Jn_W-YP6O__0Wqts3EBZDLbqAkv4F7FQ@mail.gmail.com>
	<1361907835.5119.57.camel@ted>
	<CAJTo0LbwqK6wxJoB8FwXx_eHuyy71QhUH-cFvcDGDTOCAkjPDQ@mail.gmail.com>
	<CAP9ODKr0MgSyi7_nAdenhuyyGkfRw-hTPy3mWoHLjaRCD4DHcw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 14:47:04 +0000
Message-ID: <CAJTo0LbO5WcNeCBQo+FMSAteiE5rG41zL7EDeSE0g-YMF5vjhg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQmdY3UKmVPivsaCgCfp9AzFhecdk60ZNWoLNz57xgop3I3l2spbIKw26QNkFAudrHpx/jcQ
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 15:03:58 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 20:52, Otavio Salvador <otavio@ossystems.com.br> wrote:
> I'd say to drop the AC_CANONICAL_HOST call and make it fake Linux as a
> fixed value.

Did that in xorg-macros as that's where the definition is, but
intltool's configure fragment links a program to set DATADIRNAME
(although that appears to be deprecated), so it's trying to find a C
compiler now.

How do I *properly* set allarch so sstate "works" but still allow a
compiler to run so it can identify distribution-specific values (that
have nothing to do with the architecture)?

Ross


