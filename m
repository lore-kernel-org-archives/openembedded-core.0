Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SwaAg-0008Lj-3x
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:45:10 +0200
Received: by eaad12 with SMTP id d12so655070eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 07:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Xr3iHPw8LJSfgM2bdBW3XU5YJ64FR5CUfHBYXwsfUFE=;
	b=c+NXIx4nLESfrL6cbZt0ck6JowvZdGWBr/qMoWxP4CbwT4T68AK0JFjhtYBP8sg7Ym
	0QuP8Roj7eL09UyIjGNwrtGfDHwqvMfMG62Z/3ECvO2e9vpHGOV95wrZGSRif8on1PG2
	gTGpRIMbBlnrug7Ch5qocyALCzGo3jITjH+pqZRIFjXFrPGu/jGCeW+sHOQTeOAYt/lZ
	IGik32rYKoYnixXpUFeVkmue7udyrAATGEhyoYeg3L7U8F4yyj+HEeoHfZdqGtEGO3iM
	q68G/tZYaURS6fkaoZ9swdJkhQlQHVrsmFoVqq0YmhieGLj7dVh5AFx4jj3Goa/5lRBb
	T/yA==
Received: by 10.14.225.68 with SMTP id y44mr14064425eep.5.1343831611560;
	Wed, 01 Aug 2012 07:33:31 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a1b9:594:e8d9:e8db?
	([2001:610:612:0:a1b9:594:e8d9:e8db])
	by mx.google.com with ESMTPS id u48sm9418023eep.7.2012.08.01.07.33.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 07:33:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LbVvVqDSPpUs36JTROeq6fWendJwaVQDataN_nD6O=+Ew@mail.gmail.com>
Date: Wed, 1 Aug 2012 16:33:50 +0200
Message-Id: <17FC0BB5-80B8-4AB8-A3E8-57261EB7D561@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
	<CAJTo0LbVvVqDSPpUs36JTROeq6fWendJwaVQDataN_nD6O=+Ew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnsxFZONVz3ba4aXp2xGncD+o0k8p2z9NN6u3Lghx7gcEZD29iH0VAYLqCY6wALNeAnxHME
Subject: Re: [PATCH 00/12] Mesa upgrade/improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 14:45:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 aug. 2012, om 15:41 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 1 August 2012 14:32, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> That will sadly break all the powervr based evil binaries (e.g. all =
cortex arm chips from TI) since there will be 2 providers of those libs. =
I looked at this a few years ago (when mesa gained libegl) and I =
couldn't come up with a  solution other than "don't build it" :( That =
solution also breaks a number of usecases but back then I had the =
liberty to not care about those.
>> Does anyone have suggestions on how to handle this?
>=20
> Rename the mesa ones to libegl-mesa (etc), and encourage TI to use =
libegl-ti?

Recipe names don't matter, the .so files in sysroots and shlibdeps do.=


