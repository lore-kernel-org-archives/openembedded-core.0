Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URgg3-0001iJ-Fh
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:30:23 +0200
Received: by mail-ea0-f176.google.com with SMTP id h10so2150590eaj.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=mr0KdDG2oI2YwaPMr4NJqXPWJNm2p45EwCS+tCKZeaU=;
	b=Upa7DVqjLRBfJhQj6lQHdOE6ZBFJLXkhsIo28KL0Xs5oj4gm2Toknx5OoQhz4JVcJT
	YgcPsETpHwoTtP/zsqGk4ACWzF4hpa8H6vEPFQFzmokvJUCHk27YQ0teBaMbaFSmm0bg
	iBLthVV2o7gYnkh7UEyYLvLU1w1Zm7UKvT470DLvH3wHaVqgGHgz3f2xDNmRyLuZf1Cn
	j1i3acjH2bOOKIat5Pi/mvUwPiYhWu4RlFYfAZv4Vnc7C6reSHbtO+8LGoRITziUNLvK
	qPM4ndBd7Cie5Do3ULy2L+px/xvVdrIAYWP339UvfRORSVlhDGO6I8DzsVAcqkg6h5Be
	Fn4A==
X-Received: by 10.15.31.197 with SMTP id y45mr60479876eeu.18.1366020775073;
	Mon, 15 Apr 2013 03:12:55 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id j44sm16486642eeu.10.2013.04.15.03.12.53
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 03:12:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZ7xQbg_5kKyNpir4CL53Xo5EfrhebuzpMMu-+wE1EVzQ@mail.gmail.com>
Date: Mon, 15 Apr 2013 12:12:53 +0200
Message-Id: <2714D65C-AE49-4B45-A7C8-3966F703651A@dominion.thruhere.net>
References: <1365947722-16267-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LZ7xQbg_5kKyNpir4CL53Xo5EfrhebuzpMMu-+wE1EVzQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQld1LfURCYFDe7Vp6evy8ba6N3R5HFfFmy9n8CDbjfqy+5ijUWgQaKY/GZ1jKDPBx14jXh1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] systemd: remove udev-extraconf from RRECOMMENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 10:30:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 12:03 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 14 April 2013 14:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> In the original udev and systemd updates these extra conf rules and =
scripts where removed and moved to a different recipe to avoid pulling =
them in by default, making them opt-in. The systemd merge into oe-core =
regressed this into making it impossible to opt out of it when using =
package feeds for upgrades.
>=20
>=20
> If this is a concern then you should do it for udev too, as udev.inc =
has:
>=20
> RRECOMMENDS_${PN} +=3D "udev-extraconf usbutils-ids pciutils-ids"

I haven't run into that, because I don't use standalone udev :) Good =
catch, seperate patch sent for that.

regards,

Koen=


