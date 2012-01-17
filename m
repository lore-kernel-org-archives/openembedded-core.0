Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rn8fM-0005U6-5W
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 14:01:32 +0100
Received: by wibhi8 with SMTP id hi8so331676wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 04:53:55 -0800 (PST)
Received: by 10.180.99.225 with SMTP id et1mr28097167wib.2.1326804835331;
	Tue, 17 Jan 2012 04:53:55 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n3sm43743870wiz.9.2012.01.17.04.53.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 04:53:54 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F156A55.9010806@ts.fujitsu.com>
Date: Tue, 17 Jan 2012 13:53:49 +0100
Message-Id: <176A2629-37E3-4079-B640-36465F374BBA@dominion.thruhere.net>
References: <4F15660D.7000802@ts.fujitsu.com>
	<C9CF2B6B-E153-48FE-897F-4AAA94938119@dominion.thruhere.net>
	<4F156A55.9010806@ts.fujitsu.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Image build problem with own distro fork
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
X-List-Received-Date: Tue, 17 Jan 2012 13:01:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit


Op 17 jan. 2012, om 13:32 heeft Rainer Koenig het volgende geschreven:

> Am 17.01.2012 13:29, schrieb Koen Kooi:
>> 
>> Op 17 jan. 2012, om 13:14 heeft Rainer Koenig het volgende geschreven:
>> 
>>> Hi,
>>> 
>>> actually I tried to fork the angstrom distro into an own distro that
>>> comes again with System V init and less packages. 
>> 
>> So you actually mean a custom image, not a custom distro?
> 
> Both. :-)
> 
> Idea is to get a slim custom image with a distro that comes with RPM for

set ANGSTROM_PKG_FORMAT = "rpm" in local.conf

> package management and System V init instead of systemd.

And add your own image, no need to fork things.


