Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URhkE-0000s6-5o
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:39:07 +0200
Received: by mail-ee0-f53.google.com with SMTP id c13so2137206eek.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 04:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=pLxuCesXtninadE0MBjxOvHIL3t4UlpcLm1uZi+vfIQ=;
	b=UpmJUv6zGrsG8XHymR24/XMB4kNgiqKbfR899CwG9OXUySYICGHFdtaoJt7Cf5saar
	KWMdCkVEoV8fadD0beBofgW5aP5Xkbdll0IWqqfopzgSU93cPJfTuE3g4fyiTj6M+oDl
	OhNPjPVDyk/1TTRjbd8fOtGyRquqFLhHF4KNqsXxsFbo9dB+E4VwJHcPcIGZnnxJSc6t
	M1B2mwYoQwOVJHsySi2XDuPkuLrBw29yAinMR5EhXQJSmi/pI0vw2Bcu62mwPz42nrRX
	qEf+8qXSTQ+jFML8iZaw3mqc4vlleCdjk6lOodJeS0snt55YVwPEKbfxFvwxJ9StNs3e
	OBFA==
X-Received: by 10.15.34.199 with SMTP id e47mr60801891eev.35.1366024866266;
	Mon, 15 Apr 2013 04:21:06 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id j44sm16794134eeu.10.2013.04.15.04.21.04
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 04:21:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <lyli8k12k3.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Mon, 15 Apr 2013 13:21:05 +0200
Message-Id: <155F9D05-94DF-4B6B-8CC7-E75D22696C81@dominion.thruhere.net>
References: <cover.1365697555.git.ross.burton@intel.com>
	<lyli8k12k3.fsf@ensc-virt.intern.sigma-chemnitz.de>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkR2GjzIIdIJguu4V/pifARAJquXJKRzVoJiDMKfckSf/W6U57ujJ66xUj/E1myW6wOOGTD
Cc: Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Move systemd binaries to /sbin/systemd
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
X-List-Received-Date: Mon, 15 Apr 2013 11:39:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 13:00 heeft Enrico Scholz =
<enrico.scholz@sigma-chemnitz.de> het volgende geschreven:

> Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> writes:
>=20
>> Following the example set by udev, move the binaries to /sbin/systemd
>> and hardcode less paths in general.  Tested on atom-pc with a .hddimg
>> so the live boot/initrd paths were tested.
>=20
> At least the moving of udev breaks a lot of local recipes here which
> install e.g. local rules or keymaps in /lib/udev.  This is a silent =
break
> which is detected at device runtime only.  The global 'bitbake.conf' =
has
> not been updated for the new paths neither.
>=20
>=20
> There should be:
>=20
> 1. added some QA checks which detect this broken packaging
>=20
> 2. added some global variables (e.g. 'udev_basedir') which can be used
>   in the rules.

These patches can get NAK'd all you want, but they will go in. I still =
say: NAK, this is a bad, bad idea. It diverges from upstream and =
introduces silent breakage as you point out due to that.=


