Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REjyA-0000pp-2a
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 17:46:46 +0200
Received: by gyc15 with SMTP id 15so1214182gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 08:41:00 -0700 (PDT)
Received: by 10.223.16.149 with SMTP id o21mr4637514faa.6.1318606860170;
	Fri, 14 Oct 2011 08:41:00 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id r16sm4326822fam.8.2011.10.14.08.40.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 08:40:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111014153034.GL3542@jama.jama.net>
Date: Fri, 14 Oct 2011 17:40:52 +0200
Message-Id: <15294ECC-0ED3-4634-BB2E-2150C3D36061@dominion.thruhere.net>
References: <1318603356.2342.20.camel@ted>
	<CAP9ODKod1GCk5gFPq0YkEPb0rZ3NHsD6YBu7cAQVDPLW0PN7xA@mail.gmail.com>
	<1318605925.2342.24.camel@ted>
	<20111014153034.GL3542@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] mesa-dri: Enable swrast only by default and intel drivers only on IA platform
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
X-List-Received-Date: Fri, 14 Oct 2011 15:46:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 14 okt. 2011, om 17:30 heeft Martin Jansa het volgende geschreven:

> On Fri, Oct 14, 2011 at 04:25:16PM +0100, Richard Purdie wrote:
>> On Fri, 2011-10-14 at 11:46 -0300, Otavio Salvador wrote:
>>> +1
>>> 
>>> Just another thing, I'd prefer to have DRIDRIVERS as ?= so machine can
>>> override it.
>> 
>> I really wouldn't recommend overriding this on a per machine basis, it
>> needs to be on a per arch basis. This is because the recipe is not
>> machine specific (nor should it be).
>> 
>> Configuration therefore falls to the distro, not machine.
> 
> Why not make it machine specific only when machine provides own module
> (like the case with glamo on om-gta02)?
> 
> Or recipe cannot change PACKAGE_ARCH in some special cases (like
> $MACHINE in path to some file in SRC_URI) anymore?

Kinda like the wpa-supplicant and mplayer trick in OE classic?


> 
> Regards,
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



