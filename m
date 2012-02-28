Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S2Te1-0004XN-LV
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 21:27:33 +0100
Received: by wgbdr12 with SMTP id dr12so2903677wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 12:19:03 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.8.164 as permitted sender)
	client-ip=10.180.8.164; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.8.164 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.8.164])
	by 10.180.8.164 with SMTP id s4mr42133093wia.6.1330460343078 (num_hops
	= 1); Tue, 28 Feb 2012 12:19:03 -0800 (PST)
Received: by 10.180.8.164 with SMTP id s4mr33427946wia.6.1330460343031;
	Tue, 28 Feb 2012 12:19:03 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h19sm31066666wiw.9.2012.02.28.12.19.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 12:19:01 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330346629.4593.20.camel@ted>
Date: Tue, 28 Feb 2012 21:19:01 +0100
Message-Id: <D1E600DA-4C86-4459-8820-F8B2AE88AAEF@dominion.thruhere.net>
References: <1330346629.4593.20.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkwnQIdQyCzTdOrfsu5DbIAnHZDzHm2uPkle7fL3Tqv/AB6J+nupZBaawA1pHVPNGSvuc1H
Subject: Re: [PATCH] image_types: Refactor compression code into a generic compression solution
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
X-List-Received-Date: Tue, 28 Feb 2012 20:27:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 feb. 2012, om 13:43 heeft Richard Purdie het volgende geschreven:

> The current approach of adding each different compressed image type =
doesn't
> scale. This patch changes the code so compressed images for each form =
are
> automatically available using the form <type>.<compression type> in
> IMAGE_FSTYPES. This doesn't change any existing externally visible =
behaviour
> and the image generation process becomes more efficient as a result =
too.

There's a a few -f's missing in this patch, e.g. bz2 images now fail =
with:

bzip2: ERROR: Function failed: do_rootfs (see =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-li=
nux-gnueabi/systemd-image-1.0-r0/temp/log.do_rootfs.3174 for further =
information)
Output file =
Angstrom-systemd-image-eglibc-ipk-v2012.02-core-beagleboard.rootfs.tar.bz2=
 already exists.

A quick look suggests at least bz2 and xz images can't get rebuilt.

regards,

Koen=


