Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKuuT-0000pm-Eb
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 19:17:17 +0100
Received: by mail-pa0-f43.google.com with SMTP id hz11so1100493pad.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 11:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=CVd9DlVZCfj7RTng7AbnURASzFAiYQzATb4uzCJHxFg=;
	b=nGjh2I2PUFvCWxNGmqSH+XY/eVd5RLirY5zvXqLtpDbT7HxKNIsJgpNRMqdBR5k53/
	j0Eyhrd2u5k6MVi9Bm8K5xjjjbNdTkRUOEZ74O6sm6YPxwgQ0nSCu833Q6xCwACdIBGX
	1YHqUcY8Iqm513d8cuYchUKE4FTnDV6+F17XBrib6JRkkKALSleNC/s1Kk30esvwQE+Q
	/S0NJadti5K/mF+WeEJMByRootxhlMknrkpSHkflA+GDWDF+CcjRR24vNkoK0SL4MR3A
	JNjJ/b2DD7qpCXgWKp/IysyPGuJjYk4OkTzuMW8YgywkMFVsEz5/Olu3nYRVCo3guQNj
	pFCw==
X-Received: by 10.68.231.42 with SMTP id td10mr30391118pbc.174.1364407215419; 
	Wed, 27 Mar 2013 11:00:15 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id bs1sm11454707pbc.8.2013.03.27.11.00.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 11:00:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130327160752.GB3254@jama>
Date: Wed, 27 Mar 2013 11:00:16 -0700
Message-Id: <31125A2C-DACE-4F85-B454-EB652073C558@gmail.com>
References: <1364386111-1734-1-git-send-email-ross.burton@intel.com>
	<5695994C-BB2C-427C-A551-1EA6D4C2AD9D@dominion.thruhere.net>
	<20130327160752.GB3254@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Upgrade to 198
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
X-List-Received-Date: Wed, 27 Mar 2013 18:17:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 27, 2013, at 9:07 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Wed, Mar 27, 2013 at 04:03:31PM +0100, Koen Kooi wrote:
>>=20
>> Op 27 mrt. 2013, om 13:08 heeft Ross Burton <ross.burton@intel.com> =
het volgende geschreven:
>>=20
>>> From: Khem Raj <raj.khem@gmail.com>
>>>=20
>>> Tested on ppc and x86_64
>>> compile tested for uclibc
>>>=20
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>=20
>> Since 199 has been released a few days back, how about upgrading to =
that and drag in =
http://cgit.freedesktop.org/systemd/systemd/commit/?id=3D94243ef299425d6c7=
089a7a05c48c9bb8f6cf3da ?
>>=20
>=20
> also "systemd-journal" group should be created to get rid of
> systemd-journald[44]: Failed to resolve 'systemd-journal' group: No =
such process
>=20
> I guess that SIGUSR1 is expected (I got this even after creating that
> group):
> systemd-journald[44]: Received SIGUSR1
>=20

Martin

Do you have a patch for it ? if yes send my way I will add it to my =
updates

> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



