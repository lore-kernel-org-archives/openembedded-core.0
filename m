Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SwaV3-0007wl-TF
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:06:13 +0200
Received: by eekb57 with SMTP id b57so1624349eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 07:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=MRLezjLhiogKvrZZM2c8vijLARVl7xqA70dG9PDYgpI=;
	b=dZa9B1lks458IAQ57LE3qBy41tbJl4CODOdnkaq5b9tOVQtzomUi7SxINvrSHt7Ooy
	8dVRu2KbJ1AOUiwrT4FiyXoT97+orOd2G8CpgGsSCZ4MaPRTgRqX/jgD4Jwo19wotFUq
	C0BrtAks4u5XXcLG1IUyaMXJM7yBj1fIoeK3tgXU45qPhWoQonj5seQBeC/KAU643yum
	yrCwBpKHcFZvJWjROnoHvXACRcpcl3uN0QKDuzwiDmmksFrxQKuzPS8JSb8Z3BIGXDVL
	zPpEvD0rVC/052PHnKfjBplbQx700dyfSZz46h9O+1iE6N4Q/4qMEnG9ibY2wI6WxGCE
	x7Jw==
Received: by 10.14.203.132 with SMTP id f4mr22752822eeo.24.1343832875703;
	Wed, 01 Aug 2012 07:54:35 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a1b9:594:e8d9:e8db?
	([2001:610:612:0:a1b9:594:e8d9:e8db])
	by mx.google.com with ESMTPS id t6sm9509084eeo.17.2012.08.01.07.54.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 07:54:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAGrt=7hVBjV+3de21AEHnC9ZuTBhAO6sdnt8krt=4kMxFuvFFA@mail.gmail.com>
Date: Wed, 1 Aug 2012 16:54:56 +0200
Message-Id: <88550BB7-DF17-4971-B7F3-EEA06C0C7A42@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
	<CAGrt=7hVBjV+3de21AEHnC9ZuTBhAO6sdnt8krt=4kMxFuvFFA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmsjbpY19O+cZQFUV6/Hy3YLyaASPnQb2kV6wzi1nPDLJhvEd/ZuIrOT3F18zeMVs2z2oTV
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
X-List-Received-Date: Wed, 01 Aug 2012 15:06:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 aug. 2012, om 16:38 heeft Damien Lespiau <damien.lespiau@gmail.com> =
het volgende geschreven:

> On 1 August 2012 14:32, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>=20
>> Op 1 aug. 2012, om 14:31 heeft Ross Burton <ross.burton@intel.com> =
het volgende geschreven:
>>=20
>>> This patch series upgrades mesa-dri to the latest upstream, enables =
GLES2 and
>>> EGL
>>=20
>> That will sadly break all the powervr based evil binaries (e.g. all =
cortex arm chips from TI) since there will be 2 providers of those libs.
>=20
> Why could one prefer providers of virtual/libgles2 and virtual/ligegl
> on a per-machine basis. This maps quite well with the reality.

Apart from the fact that both aren't machine specific. Making them =
machine specific would be a regression.=


