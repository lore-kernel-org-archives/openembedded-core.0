Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Syoin-0002Xz-QH
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 20:41:37 +0200
Received: by eaad12 with SMTP id d12so1336965eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 11:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=NHFOFzMTWdCMjIbdGp4aeE7Hg8v+9EIBrrAVWXUIHUY=;
	b=RKfEMLQ7l49u9UTYGOIt6qBRjuv4otEUjRiM2sbOugeeFJojDCVXC2advudu9DSwqO
	3AaayvvCawqNJFw4ls9DVNsfl90ZfE/9HV9vGD5MQaxBwRLnT5wN8u02Rrwxf/UD+kw3
	dOoKl36NrfhxTO+2YUXgsroMo5Zq4H1+9xJmxFKmF9LSzF4oSB1lE7d+OlawSQHqP1he
	N20B8JB7hmKaOVpvmiOR126JalneMB4nqXCvKKrTisgnVZiPd1OKUyHE+h1t72LxLX1D
	aFONb5zkyK7SAEkR7ElADafSaNpnqa4fsXvF2Zb8CRD6tjBCwalRwjo4XrtzS2S55nlz
	9USA==
Received: by 10.14.209.129 with SMTP id s1mr9190994eeo.24.1344364191845;
	Tue, 07 Aug 2012 11:29:51 -0700 (PDT)
Received: from [172.20.0.2] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 9sm58260783eei.12.2012.08.07.11.29.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 11:29:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <50213ECA.7020903@linux.intel.com>
Date: Tue, 7 Aug 2012 20:29:52 +0200
Message-Id: <58157005-69A4-4FD2-AA5C-22B823AE7ACD@dominion.thruhere.net>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
	<1344182057-15981-18-git-send-email-javier@dowhile0.org>
	<50200899.7000500@linux.intel.com>
	<1344277316.4874.2.camel@x121e.pbcl.net>
	<50213ECA.7020903@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnEPQqodZDQ3cPjOkVffANZ+4YJiejoBuKVXBQHOnpEArGuSGVljeqfNYSJBOrlk79rCfBR
Subject: Re: [PATCH 17/30] linux-firware: use ${base_libdir} instead of /lib for packaging
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
X-List-Received-Date: Tue, 07 Aug 2012 18:41:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 aug. 2012, om 18:14 heeft Darren Hart <dvhart@linux.intel.com> het =
volgende geschreven:

>=20
>=20
> On 08/06/2012 11:21 AM, Phil Blundell wrote:
>> On Mon, 2012-08-06 at 11:10 -0700, Darren Hart wrote:
>>> On 08/05/2012 08:54 AM, Javier Martinez Canillas wrote:
>>>> It is considered good practice to use the build system provided
>>>> variables instead of directly specify hardcoded paths.
>>>=20
>>> The firmware location is explicitly set because this is where the =
Linux
>>> kernel requires it to be.=20
>>=20
>> Is that actually true?  I thought the kernel just supplied the =
leafname
>> that it wanted and the knowledge about what directory to search was
>> encoded in the hotplug helper scripts.
>=20
> I was sure it was true at the time, but trying to get a reference from
> the source suggests I was mistaken. According to
> Documentation/firmware_class/README, the hotplug script is responsible
> for locating the firmware by basename and catting it to a sysfs file =
for
> the kernel to then read.

That hasn't been the case for a long, long time. CONFIG_HOTPLUG should =
be "", the kernel can load it on its own now. Any reference to 'hotplug' =
as something executable is very outdated.

regards,

Koen=


