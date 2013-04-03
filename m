Received: from mail-pd0-f176.google.com ([209.85.192.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UNSKC-0002qN-Sx
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 20:22:21 +0200
Received: by mail-pd0-f176.google.com with SMTP id r11so976061pdi.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 11:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=c37ON0ARbTNr1XAoeQTVJwddVGWIR3ICT1GyUaxcX5E=;
	b=HUM9Z+LVcdNIrGeI7EnWUGVbQvwLDg9PTcYFLBa7H+C96Fx4ffZ/SSFzSPqsae/r9O
	l9o7Z8JNeSJavFPnVrlQsCM+Rb/8QukwjnCjdubb1Y5oPtrbyje6PNs1VsT44LwGuyHi
	pjTfimgsGDG9K2FNWvgN+wWBDSxQt7H/hlVlG/y1qbZ1oSeeWsrC5FOiXvi2lqocLbK8
	Iko40ZW7bovWHCbbHtFHg1uwNCGCs74xQf7Ndk98U35eQN/+ZBlvRcLL+23dK6xS2yw5
	7/fkV1l3AhUr2pk476T7j3vtvXOpM9pV6AGWfSX2GaHT/mAi7vuY2TiBCId1obSvMDhc
	A0Pg==
X-Received: by 10.66.154.164 with SMTP id vp4mr4789500pab.89.1365012308575;
	Wed, 03 Apr 2013 11:05:08 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id 1sm6827740pba.32.2013.04.03.11.05.06
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 11:05:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbiXC_qKszpNNy5crnpXeGx99Ff9vGzpcXNk4otXgp8GQ@mail.gmail.com>
Date: Wed, 3 Apr 2013 11:05:05 -0700
Message-Id: <05912539-775D-4AD0-A18E-1DC4E6213255@gmail.com>
References: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
	<1365006329-20964-3-git-send-email-radu.moisan@intel.com>
	<825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
	<CAJTo0LbiXC_qKszpNNy5crnpXeGx99Ff9vGzpcXNk4otXgp8GQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] udev: enable multilib support
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
X-List-Received-Date: Wed, 03 Apr 2013 18:22:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 3, 2013, at 11:02 AM, "Burton, Ross" <ross.burton@intel.com> =
wrote:

> On 3 April 2013 18:58, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> NACK! The udev maintainers have been clear that it is always =
/lib/udev, even on 64 bit systems, so you're not fixing a problem, =
you're creating an extra one.
>=20
> Radu, can you do a multilib udev build and see what continues to fall
> into /lib64, so we can fix it?  (and the same with systemd)
>=20


all my testing is always in multilib x86 and ppc env and as Koen =
mentioned there are paths for configs which always
remain /lib or /usr/lib even if base lib is /lib64 and we have to be =
careful about it.

> Ross
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



