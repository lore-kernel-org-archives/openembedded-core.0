Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2A5D573C5B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 May 2015 07:01:42 +0000 (UTC)
Received: by widdi4 with SMTP id di4so52280756wid.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 May 2015 00:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=EisQUgUmo5Y+MsTpiLD68vdX9L6KJBdmtWOu22dFtYA=;
	b=EIRBnOqrDykRAqsySjVnpBplW8gip3u+4U15tIlKN19un7o7QN28S3rNUI+ghbP09c
	dloUSvqkSXajsU5r4LbKDGHf298yEOK0jPhTVM49VS2/HZJnvlTF7FqzMyxdYWn02awX
	0lap6NkiL4qLIYd1c+lsgMhX5tWqdkjDzOsrW4vOtevEjbcNXBVZF8lEvr8fSmgmZG+G
	gBG+F4TBWWVivybkpRCsMVXvc/vrBh+IJnIWHI7CTZKA9/PlBMm4pY0GRpbcD0skD4kD
	+XtGUsfcRuV0Kf5NvxeS9VmCgg2vWhaul8SGaaoA3llXZq2HEq4dANK4s7dPfM/Er1Dj
	M4xQ==
X-Gm-Message-State: ALoCoQmPG2apcTcfQv6/KyYPuRRHUSve9ppPCyy0zOvx2hJPSG4IGRAnIk39DmP5X3PrK4iz3VlS
X-Received: by 10.194.90.106 with SMTP id bv10mr2928366wjb.122.1431154903802; 
	Sat, 09 May 2015 00:01:43 -0700 (PDT)
Received: from ?IPv6:2001:610:612::da:65d6:169b:31e9?
	([2001:610:612:0:da:65d6:169b:31e9]) by mx.google.com with ESMTPSA id
	ew10sm2339093wic.22.2015.05.09.00.01.41
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 May 2015 00:01:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <554707B3.70102@dresearch-fe.de>
Date: Sat, 9 May 2015 09:01:41 +0200
Message-Id: <580ECAFB-BCCF-441C-A492-C863385BA56B@dominion.thruhere.net>
References: <5541C69D.9040307@dresearch-fe.de> <554707B3.70102@dresearch-fe.de>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Mailer: Apple Mail (2.2098)
Cc: Koen Kooi <koen@openembedded.org>,
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [fido] orphaned bbappend in meta-angstrom
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
X-List-Received-Date: Sat, 09 May 2015 07:01:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 4 mei 2015, om 07:46 heeft Steffen Sledz <sledz@dresearch-fe.de> =
het volgende geschreven:
>=20
> On 30.04.2015 08:07, Steffen Sledz wrote:
>> The angstrom-v2015.06-yocto1.8 branch of meta-angstrom contains =
recipes-tweaks/linux/linux-yocto_3.10.bbappend. But the fido branch of =
openembedded-core does not have a recipe for linux-yocto_3.10 (just 3.14 =
and 3.19).
>>=20
>> So the bbappend should be removed or updated.
>=20
> Ping!


=
https://github.com/Angstrom-distribution/meta-angstrom/commit/4b2350b1fdcf=
fd31717c4ce256403fe2b391bb8d=

