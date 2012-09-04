Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T8opi-0001T3-UE
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 10:50:06 +0200
Received: by wgbdr1 with SMTP id dr1so4148706wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 01:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=MAWRAyA1ZHJhW+hK21C2IgripUCKxZ2SiV0w+/gGR9w=;
	b=btqqoyVm7dKcY3vYq36wf2vIUA8wOs6AkI9HBLcfhYlJ7elDxs/rK6MJPm1CyMbrzq
	DoGd7NdoiM3GxCvfZAp1cXQcBeQv5phiVE9zdUv59PxYV4cLu/2ZKwUF5l3Jujymz+y7
	64Ia0cC4KsKLIgLUgiO4kafeTHfAr5zsC6OepD2atTnFtNAjmGQqMW3UnCRN5XJuzLKv
	vDsKHYzTOmJkPPvxg79rARkXFWfu0/Zx0Em1B244YPPOhOEz2QcjLySO9FTbAXalOS9J
	2ORf2TEiDatkUdhgdkvBUmSQRqhCmEI7Aj2zxL7DdlXh3JusH/d5SD7HipoCwZYV5xq3
	wt1g==
Received: by 10.216.71.135 with SMTP id r7mr10756799wed.41.1346747865526;
	Tue, 04 Sep 2012 01:37:45 -0700 (PDT)
Received: from [172.20.0.49] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id o2sm34743924wiz.11.2012.09.04.01.37.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 01:37:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6771659.ZmALF9uaXJ@helios>
Date: Tue, 4 Sep 2012 10:38:03 +0200
Message-Id: <81163693-909A-48E2-A67C-2F753F31B815@dominion.thruhere.net>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<EF3FD8E5-333E-49FD-A190-5243A9A9BCCC@dominion.thruhere.net>
	<6771659.ZmALF9uaXJ@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQkCzQKp7bDdLaEg1UxiIehyJsVw9jgHatZmjJmgjfANtgPsi5G+DPakCtKdmrykhbEAshbs
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28] Package group fixes
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
X-List-Received-Date: Tue, 04 Sep 2012 08:50:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 sep. 2012, om 18:35 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Monday 03 September 2012 18:26:14 Koen Kooi wrote:
>> Op 3 sep. 2012, om 12:30 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com>=20
> het volgende geschreven:
>>> This rather large set of changes renames "task" to "packagegroup" =
and
>>> attempts to clean up a number of package group related issues [1]. =
It
>>> doesn't go quite as far as I had hoped - I wanted to tidy up the =
base,
>>> core-lsb and core-basic recipes even further, but unfortunately I =
ran
>>> out of time for this cycle.
>>=20
>> Instead of replying to a ton of patches, I'll reply to the cover =
letter :)
>>=20
>> Missing PR bumps
>=20
> Why would you need a PR bump when renaming the entire recipe?

Take 15/28 for example, it changes the output package and doens't do a =
PR bump.=20=


