Received: from mail-vc0-f176.google.com ([209.85.220.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPaMe-0007fy-Kj
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:21:54 +0200
Received: by mail-vc0-f176.google.com with SMTP id ib11so5847231vcb.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 08:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=clZsRvfeqKQDfe2TrhWR1iewJN2VKPy9ssKDAlM79uM=;
	b=L4g2+YXtiG19WrdjLqrjFPU5fKoHUbufa8R+q4mWNzViDYhNb/yVs8iu1Ob1cOIz5H
	tXiHMA+FNfu478tU+r1OdvEE+uOdNyJEb7LHSv7oJUefsYU0C2J++p3qGR9v8oO57aEj
	PGir86ZllHWrxdoa1rANzTG4JBgg/lMOUAhtxk5CoOL9upAUR0fVwXIXPIZRehRdFOBr
	f1KNPQJCrFvljQXsIkvvElTgM+R/eDe7djU1z42vGeavk9s1a9MSDk77i2u1reyx4wfG
	2vkT9D8iw1aJXFhOoOGdrQ7umlsjaMMOEAo9kECO42SU1/yttciRK8dg06a+USJsf1SW
	jP4g==
X-Received: by 10.52.23.115 with SMTP id l19mr16759107vdf.55.1365519860127;
	Tue, 09 Apr 2013 08:04:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 9 Apr 2013 08:04:00 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16220ADC@IRSMSX102.ger.corp.intel.com>
References: <1365425799-25357-1-git-send-email-alexandru.damian@intel.com>
	<51630510.7080105@linux.intel.com>
	<CAJ2CSBtXbDgz76Ryt8tqR+dbeLvLXsWL_F1W8WWVnJyDE=g8WA@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB16220ADC@IRSMSX102.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Apr 2013 16:04:00 +0100
Message-ID: <CAJTo0LYCixkUhvQDSKN4VEFZJwCfKfQ1AEKWsT=MML20C99kUw@mail.gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQmSwv0JPfKNuFR3oAMpKEujUQZeGSxPtNPCTU7ALvGuwsA1BHiGO88MynS4fjvekta3la51
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>, "Damian,
	Alexandru" <alexandru.damian@intel.com>
Subject: Re: [PATCH] bluez4: add readline dependency
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
X-List-Received-Date: Tue, 09 Apr 2013 15:22:09 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2013 15:58, Iorga, Cristian <cristian.iorga@intel.com> wrote:
> GATT seems to be related only to BT 4.0, Bluetooth Low Energy (LE).
>
> However, it will be useful once Bluez5 will be in place.
>
> I say we should add it.

As it's a tool that does introduce extra dependencies, we can easily
packageconfig it to let people chose.

Ross


