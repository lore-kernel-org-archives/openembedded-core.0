Received: from dgate20.ts.fujitsu.com ([80.70.172.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RqQZe-00010z-G4
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 15:45:15 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding;
	b=IIgk8gy+xleJqHQtrIxY+oqpONA8g1ZeofImTIue1OpTSiuLQ86fLu8D
	XmJ3+//SLzkkKbOzLOLxCE9N0d4qT0CL5x4F/artPTwBI4N/UzaZ3a5j6
	uq17mltsmnGQnr/vQgpBX3eGFdXhIJm+hHSIDqbdZw4F0YhmWKlkgu02b
	6B3FZdl1zKSzlaEXKOS+pOMZNYnZDwl/h5IOfkp2nbWLeAzty9hxQwDMb
	96bYLlDUfvRs+LjjHxyJdrrlLxk/3;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1327588649; x=1359124649;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=IciSNK8JKvS3GDhwU1xCWKbIl/Ipx8qyoHeEtEtSyWw=;
	b=WMKcwz56g6z7pb5iwGRYqIIU+OAP6qE042HMaGPeSEfxdMClftNnPMqZ
	3YrbmC9tVMb7KHhCeT8RYkwbXF4jUmISl0Ua9NmnjtGw+y4qBVyqyeo8h
	vT1CK7Z/OQLWTy2DY0qUsii+QPFk1m4lrwkmE8GEcrvU970/ZeRODSklO
	jqITmlwtHJlmA5fu8qOBEq3tYgP1VbqMchudMwt7mJy934aaYwndaQuZk
	purFUCml45zN4MdbDIerslAqaR8GJ;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.71,574,1320620400"; d="scan'208";a="84589043"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate20u.abg.fsc.net with ESMTP; 26 Jan 2012 15:37:28 +0100
X-IronPort-AV: E=Sophos;i="4.71,573,1320620400"; d="scan'208";a="127800886"
Received: from abgvpn598v.abg.fsc.net (HELO [172.26.150.89]) ([172.26.150.89])
	by abgdgate40u.abg.fsc.net with ESMTP; 26 Jan 2012 15:37:27 +0100
Message-ID: <4F216527.5060608@ts.fujitsu.com>
Date: Thu, 26 Jan 2012 15:37:27 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111120 Icedove/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F214E8A.4030209@ts.fujitsu.com> <1327586109.19643.374.camel@ted>
In-Reply-To: <1327586109.19643.374.camel@ted>
Subject: Re: Avoid stripping of firmware files?
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
X-List-Received-Date: Thu, 26 Jan 2012 14:45:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Am 26.01.2012 14:55, schrieb Richard Purdie:

> INHIBIT_PACKAGE_STRIP = "1"

Thank you. I'll give that one a try.

Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Business Clients
Dept. TSP WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujitsu.com
Company Details  ts.fujitsu.com/imprint.html


