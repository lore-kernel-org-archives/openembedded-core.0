Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ScFh0-0000LG-MX
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 14:50:31 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 06 Jun 2012 05:40:01 -0700
Received: by qaeb19 with SMTP id b19so2705635qae.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2012 05:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=/PzMxz7ZdZgpvKjVVvT+9SqCFsJM4vDn8v9axCb77gI=;
	b=QIQX5vzfm0fRCrgqle6gcDQ7gbNJwl2nuaKrM2+fTVVroGiVzLN1ApRRCWV8uck6xH
	TZauNWeMAcfv7Sj6AY/JWiRLJMxaY7hPEt5EBDZC3/XkUacmB/hcd8FXbClph1HH2C5b
	ffMj192tnI9hrw9HyumoFMvQyiOgyqy8rouV0AyMiIBj21jx82kK9smdWT9FAHzNqVpA
	A32Pk0j0iPlPLWspH2bQsM4S0F2tzttzig7Ei4h3KmuILHk8gO99v5rhJGzFKsbUouYy
	mzzfRM9t/ODPn8TDd0iw8EoKGADt/5/ipDwQi+lxw+PqXWuuH7sfyGs3GEBPIG8mGTNf
	ypHA==
Received: by 10.229.69.36 with SMTP id x36mr494368qci.48.1338986400424; Wed,
	06 Jun 2012 05:40:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.53.212 with HTTP; Wed, 6 Jun 2012 05:39:40 -0700 (PDT)
In-Reply-To: <4FCE71F6.3060001@linux.intel.com>
References: <4FCE71F6.3060001@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Jun 2012 13:39:40 +0100
Message-ID: <CAJTo0LawLH56WhV8KcXXKxzP6b4MnrpQHrkoQ2q2PJ3BR+-8OQ@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQn39E3UJk5xdqH/NDt6vU0ta49OF7THrkiWLGN1Wl4d7A7hyrUcozNbDrFlGJgKkALc50iX
Cc: damien.lespiau@intel.com, "Wold, Saul" <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Braindump on Bootloaders, Image Types, and Installers
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
X-List-Received-Date: Wed, 06 Jun 2012 12:50:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 5 June 2012 21:54, Darren Hart <dvhart@linux.intel.com> wrote:
> =C2=A0* Disk Image
> =C2=A0 =C2=A0- create partitioned images (not just volume images)
> =C2=A0 =C2=A0- intended to be written to USB sticks, MMC drives, or SATA =
disks
> =C2=A0 =C2=A0- may require a script to assemble the image for specific ta=
rget
> =C2=A0 =C2=A0 =C2=A0devices.

Can we get an option to specify the size of the target device?  I've a
4GB stick that I'm using with .hddimg (being the lucky owner of a box
that actually boots them!) and it's sad to see the rootfs being only a
little bigger than the contents when there is about 3.5G of empty disk
space available.

Ross


