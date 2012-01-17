Received: from dgate20.ts.fujitsu.com ([80.70.172.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1Rn8KT-0004Pq-69
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 13:39:57 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:References:In-Reply-To:X-Enigmail-Version:
	Content-Type:Content-Transfer-Encoding;
	b=tpNf+ZbJe+Qz7jOsxiEoBq6UNL/+PakyDLdnKSdQ2iUSQ3bAZbPUhegM
	MvI3M3HbX/TphakYLxA3HIvzIDcwoqWrdtmnGvsOCNPFk3UDb+9X1J3eZ
	mb8kCHMHuNAmc0duVfn6gxP5zGJB8TEWUxc5S7KVXtPEi0OdRIN9aRaPs
	jXxjxXBpTMS/7MBf5xHuUgjjhyWn3HQr5/LtZE3MBTlp3G/NvD4ZEN4sO
	9TiCUb+lOiGq8iGmH1g+6EOCqikfY;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1326803543; x=1358339543;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=k9q5n57PuMNyYLPbprimIDOyqIg33U4ng78E9U5cG6I=;
	b=kqqEH23V7JRugBF/wiczaxD+WcqiXfdML25s+T1SOfAFFyUsVgnxW+xT
	W8fokw+UZsC9SnCOBbDgACNfN6NJzJqw5Kg+N1bQ4Ha8SxUUAfCX4/j/H
	QAJDUrdbu6GQUV7a+2XccTP5SwOP6vebX4uM60zCwVcmUOq9fe4UAkmCu
	5bgOjM5owmBtEUGMSkofigAgrO3aLPfpM6W0hDRIFCnuMFCpma+34Uqig
	+tpsKQZIBjEkRISpamnsvM60JyE1G;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.71,522,1320620400"; d="scan'208";a="83790830"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate20u.abg.fsc.net with ESMTP; 17 Jan 2012 13:32:21 +0100
X-IronPort-AV: E=Sophos;i="4.71,522,1320620400"; d="scan'208";a="127233683"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 17 Jan 2012 13:32:21 +0100
Message-ID: <4F156A55.9010806@ts.fujitsu.com>
Date: Tue, 17 Jan 2012 13:32:21 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F15660D.7000802@ts.fujitsu.com>
	<C9CF2B6B-E153-48FE-897F-4AAA94938119@dominion.thruhere.net>
In-Reply-To: <C9CF2B6B-E153-48FE-897F-4AAA94938119@dominion.thruhere.net>
X-Enigmail-Version: 1.0.1
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
X-List-Received-Date: Tue, 17 Jan 2012 12:39:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Am 17.01.2012 13:29, schrieb Koen Kooi:
> 
> Op 17 jan. 2012, om 13:14 heeft Rainer Koenig het volgende geschreven:
> 
>> Hi,
>>
>> actually I tried to fork the angstrom distro into an own distro that
>> comes again with System V init and less packages. 
> 
> So you actually mean a custom image, not a custom distro?

Both. :-)

Idea is to get a slim custom image with a distro that comes with RPM for
package management and System V init instead of systemd.

Regards
Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Clients
Dept. PDG WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujtsu.com
Company Details  ts.fujitsu.com/imprint.html


