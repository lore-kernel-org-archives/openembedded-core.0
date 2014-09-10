Return-Path: <koen@dominion.thruhere.net>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id C40C6605BD
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 02:19:04 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id rd3so6015318pab.32
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 19:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=MEK75i97/kvpLfVqGT7SbgeaSqM/xSSkSPc7ck4QR44=;
	b=V8ZbHanG+MBk0nS2DuVJfVZnB7fBgPhTwlJxVD0N/w0EXSc+ZHDAoBEOI43mOl0vv/
	3kDxa76txhIOBpycNtaU9cIoNE+0nOTFCG253QFHO1X0dA0fzfQed1fBloeYHerA8gBT
	XeZ8F8bIhvXwFQzwuEXdG+XllyprzdpY8PWO4QL4gY52A2ENDE4VQ+CPV1iuNMSlE0su
	AbkoE5W71ZmUmNeRFDWuKom8gIQ12srsm5RHWh2mdkNPnOJXmS2gNi2dKKnWN2MdrwR9
	tJL5WaNKJO3EFgdj3PMQwjFS/V24ymyS/SCkTMGizhHPU1/OOp5G0JcMJH1ZS4MkKkhJ
	sS8g==
X-Gm-Message-State: ALoCoQk29bFbjq5287aKhgKIarnI0lsnAN5sSzZ5l+vzZSmIKTkEA+qqxvnJT3W5EXgoVLpnk7x/
X-Received: by 10.66.146.35 with SMTP id sz3mr142664pab.148.1410315545151;
	Tue, 09 Sep 2014 19:19:05 -0700 (PDT)
Received: from [10.36.109.211] (71-93-46-235.static.snlo.ca.charter.com.
	[71.93.46.235]) by mx.google.com with ESMTPSA id
	mi4sm12944735pdb.80.2014.09.09.19.19.02 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Sep 2014 19:19:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <D034EC78.A7DD4%dvhart@linux.intel.com>
Date: Tue, 9 Sep 2014 19:18:58 -0700
Message-Id: <747E03C1-7C26-48EB-B457-828D1DE3C104@dominion.thruhere.net>
References: <D034EC78.A7DD4%dvhart@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: "Brandt, Todd E" <todd.e.brandt@intel.com>,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Packaging kernel sources
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
X-List-Received-Date: Wed, 10 Sep 2014 02:19:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 sep. 2014, om 17:42 heeft Darren Hart <dvhart@linux.intel.com> het =
volgende geschreven:

> Hi all,
>=20
> I'm working on a project which needs to have the full kernel sources
> installed on the target. The kernel-dev package as defined by
> kernel.bbclass is heavily pruned to minimize packaging time and size =
and
> is intended to enable building of external modules on the target.
>=20
> Is there an accepted best-practice for how to get the full source =
packaged
> and installed? I can easily write a new recipe,
> linux-custom-source_git.bb, to install the sources, for example, =
without
> impacting the packaging time of "virtual/kernel" package.
>=20
> It would be nice in some respects for it to all come from the same =
recipe
> though, but I suspect the impact to the common-case where this is not =
need
> would be far too great.
>=20
> Koen, I believe you had a solution for this with Angstrom?

I think I put it in linux.inc in meta-beagleboard, but it's been a few =
years since I looked at it. I'll have a look at it when I get back from =
vacation next week. Greetings from Pismo Beach :)=

