Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1STw4h-0003Sx-Nf
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 16:16:37 +0200
Received: by wibhm14 with SMTP id hm14so2943663wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 07:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=zCa35eWS4XwGMu0QONNKgdx8DgXraMkXxKkHiJu6Lj0=;
	b=UslGPSKwTnSUdn6SOiB480NahnqwHFa00JTFHAEfFgILtsNPd4K4Oqbo4UeuAb4wIj
	I9krPEgyUv/zdPsa67lN/vvfIaz+Hwjw+R0908G+0OBv1pNHEDajUlOwaln7H8YEDSZX
	MNuZ1VZXh9zK+eLze3KSn2hPsx/kFozTyQtgE+dNJut2MLatVCkcHDvndKhPOJOVIuNZ
	7/aMaZRSW5CsdndbN3bOD1pGPgEiT41gA0mcvdg0lX56jWsv0rVhym9SCYEv+kQkzAsn
	PPND2mQoS3W8tRcFHcVSRwVtRPB1spShw3x/aHnsrDUjvSsYPk4lGOoO4qUXV22NlNaY
	+49w==
Received: by 10.216.141.139 with SMTP id g11mr5167556wej.86.1337004396982;
	Mon, 14 May 2012 07:06:36 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e6sm35415231wix.8.2012.05.14.07.06.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 07:06:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <f1b02094a00615abfdee28e820c70e50c2ca9471.1337003246.git.otavio@ossystems.com.br>
Date: Mon, 14 May 2012 16:06:29 +0200
Message-Id: <FD8F6943-F6C7-4588-B5F6-BAA1BE723FF9@dominion.thruhere.net>
References: <cover.1337003246.git.otavio@ossystems.com.br>
	<f1b02094a00615abfdee28e820c70e50c2ca9471.1337003246.git.otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlWEHcOM860wLTXupPcAb2nrVbgvLCEH0MxbDN1hCEcqSEhfkuO4GtYJDKOVOAsXElI7HP6
Subject: Re: [PATCH 1/1] kmod: fix installation path of pkgconfig files
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
X-List-Received-Date: Mon, 14 May 2012 14:16:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 mei 2012, om 15:47 heeft Otavio Salvador het volgende geschreven:

> The pkgconfig files need to be installed in ${libdir} instead of
> ${base_libdir}.

Thanks for the patch, I was working on something similar :) I talked =
with the kmod and udev people and they asked why we want kmod libs in =
/lib instead of /usr/lib. I didn't have an answer to that, does anyone =
else have a decent one? If not, let's not mess with $prefix and remove =
all the do_install changes.

regards,

Koen=


