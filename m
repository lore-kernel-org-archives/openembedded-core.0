Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sz7iu-00055J-CY
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 16:59:00 +0200
Received: by eaad12 with SMTP id d12so217195eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 07:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=d9FFgOcAExrcSNCGSaBa5ysgcotb5v1VLMSR+ZUa+S8=;
	b=kYTSiYjujXKyrLGID84PAWrmCIqhAzBJ95iUHtzs8dFOuHekTOwxMHqLmqSk6ST/sN
	fUVLQoMpERk+FKH7Sk//utdl0Xd3qxMY6o1ceHxw2wEIgHlGwAlGQjd1Bn/CPXQIAUJ2
	r/Yq2kCGgMtpddt0m7BQl2m7v9ar5Gyrt4wBw7GkYBQtZk638gT7w2eToBO8+MPwRjLG
	hhK5/+dD+KzU/fl3/PlvsyP4GBVXKePRyVFCxGudj4xBNb9s4zikDtFLpHmCJpug1nR9
	XCIi0KWNeX1EuS4p5WUMXiuxWzD54xLrnmZg7KLt+OYGjv/+/co7YcFqipfsSwNMmSU9
	tdgg==
Received: by 10.14.218.5 with SMTP id j5mr8979956eep.16.1344437233348;
	Wed, 08 Aug 2012 07:47:13 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id v5sm65297011eel.6.2012.08.08.07.47.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Aug 2012 07:47:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1434346.ITqeKT5PyT@helios>
Date: Wed, 8 Aug 2012 16:47:05 +0200
Message-Id: <FC8D60B3-17DE-4CEE-8A86-4BF201870280@dominion.thruhere.net>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<20120808123637.GA2854@jama.jama.net>
	<03E931F8-12B9-430C-826B-46211FC3EC90@dominion.thruhere.net>
	<1434346.ITqeKT5PyT@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnR6ypNuuWrl6w7PC/rwzcDrd7nRpuMV/ajLqNqDibI80+8JFZzAzCWQlarIcn9fuvmob6G
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 14:59:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 aug. 2012, om 16:03 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Wednesday 08 August 2012 15:56:33 Koen Kooi wrote:
>> There are a ton of recipes in oe-core that need extra layers to get =
properly
>> tested (QT comes to mind),
>=20
> What are you referring to? Qt should be perfectly testable within =
OE-Core.

What kind of big qt apps does oe-core have to test it? I had to enable =
meta-kde to find bugs in the qt recipes, so if the tests are in there, =
they aren't get run properly.=


