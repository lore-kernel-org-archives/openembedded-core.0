Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7FEC565EC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 10:44:00 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id k48so674581wev.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 03:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=K8ArbyZVkgHt19/mnWqTPXHYtpsDDHWaVnYd/aOBT+k=;
	b=Ata3ufJHhB4k47Wy9khLAjBG4uqNCu+6bPTGJs1CEKmIGcyRDanz6XkNLy8rjNeAMM
	GHqDNFE7Axcubxt6en/NbQ1Az9VyVFslgRBJZjpDZzf5Jr73kIgVa56Z0s1Aub8t+rV+
	IvNHynTP7FIGRG3Kn8CTp/XUM+eCY20RzOOxklCol/7aQVmwz3gYHJrvG3AZWzRbumum
	Utu5XxG8lCUY/nH9er80rrJJmH4kZYTAUDKDwPqsdqALGG5ZYbnp0km0Ljxl0ajN0Bho
	ORfT9Yr0xSqICrl+SbGf7/nzf17Zmssy2n83Fgk5z8sdK/iOdiYsTWP4+xwbuM5f8GrF
	d1fg==
X-Gm-Message-State: ALoCoQnf0BgrjvVkDAmy5cocwym6AbwZ/dZPvBaNvk/CK4Gm7pbDqVad3wEQFzD7f/ifMfJpXSi0
X-Received: by 10.180.185.100 with SMTP id fb4mr14826564wic.11.1398681841056; 
	Mon, 28 Apr 2014 03:44:01 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a082:b032:6730:eb37?
	([2001:610:612:0:a082:b032:6730:eb37])
	by mx.google.com with ESMTPSA id
	fw13sm16953676wic.6.2014.04.28.03.43.59 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Apr 2014 03:44:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1874660.NNkBdmWv1O@peggleto-mobl5.ger.corp.intel.com>
Date: Mon, 28 Apr 2014 12:43:58 +0200
Message-Id: <0D39BCEC-9039-4A3F-9E65-85965061E698@dominion.thruhere.net>
References: <1874660.NNkBdmWv1O@peggleto-mobl5.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE Github repositories
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
X-List-Received-Date: Mon, 28 Apr 2014 10:44:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 apr. 2014, om 12:10 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> Hi folks,
>=20
> Could whoever has admin access for the OpenEmbedded repositories on =
github=20
> please do two things:
>=20
> 1) Stop having both "oe-core" and "openembedded-core" repositories - =
the=20
> latter is four months out-of-date. I'd suggest if we want to be =
consistent=20
> with our openembedded.org repos we should keep the "openembedded-core"=20=

> repository and make it so it is kept up-to-date.
>=20
> 2) Rename the "meta-oe" repository to "meta-openembedded", since =
meta-oe the=20
> layer is distinct from meta-openembedded the repository, and again =
this would=20
> be consistent with the primary repository naming.

Keep in mind that renaming/removing 'oe-core' and 'meta-oe' will breaks =
things which use those repos to pull from by default. Which the oe.org =
git server has improved a lot, it still can't beat githubs CDN.=

