Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Svu8S-0005wk-V9
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 19:52:05 +0200
Received: by weyr6 with SMTP id r6so3438874wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 10:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=UBUHWl7ZQ9JEnNdknonnlQquVPundS6iEoMurCoNCY0=;
	b=ANeDJpRPLpQMFzBl7+6+CCtpHfUga8IZFJGSY1ixIAOcBhDqJaQECvEufI5CwVsnxI
	iP+YsmMXbhjMW6KqIk3JP6c+hDRzi6SF5LEh9j99Pb3IbAWy1eJhvtQXlRdxpl1FtxlI
	y/oOYOCgerbinoAbQtN3OhEBNFHQZADzWWhtlmbBYa3NgByubdofT2zLiny+B0DBDK+E
	1eykpRtbmGmkc0U39RCRodQafp6pNeYU35c27Z8ECCm0MoR4O+7WmvpSkwyb3DKb3sTJ
	CRCX7LDUWYHNnSm1Vc+tP/oGL/NxdmnsFo8uMvc5/2iKCOKp/gpFtU5Y5W7c+XFCEroi
	7TKw==
Received: by 10.180.98.69 with SMTP id eg5mr3063737wib.3.1343670029072;
	Mon, 30 Jul 2012 10:40:29 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id z11sm25744508wiv.10.2012.07.30.10.40.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 10:40:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0La9DXgEH-Yr-31=iCnegQhgHGxTdpnizEpG=OEHNk_veg@mail.gmail.com>
Date: Mon, 30 Jul 2012 19:40:47 +0200
Message-Id: <0CC5630B-DD3D-4AB2-834C-DE3B87743D52@dominion.thruhere.net>
References: <CAJTo0La9DXgEH-Yr-31=iCnegQhgHGxTdpnizEpG=OEHNk_veg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQloE4UZoadrJnvlsRtJ6wLrYXui/LqpzPLoqoNvm0w6uCD1V1ylcWmcGiSzVktUrA14Y1Th
Subject: Re: mesa-dri vs mesa-xlib
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
X-List-Received-Date: Mon, 30 Jul 2012 17:52:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 jul. 2012, om 19:15 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> Hi,
>=20
> I've recently been looking at the Mesa packaging (via the work that
> Damien Lespiau has been doing) and am confused as to why there are
> both mesa-dri and mesa-xlib packages.  I'm also no Mesa expert, so I
> thougth I should mail this list...
>=20
> The main difference appear to be that mesa-dri uses DRI to render,
> whilst mesa-xlib doesn't (so it uses indirect rendering).  As DRI
> support is hardware specific so surely this could and should be turned
> into a FEATURE of some sort, and then let mesa pick appropriately
> between DRI or indirect (xlib) rendering.  I can't think of a
> situation where you'd want to use indirect rendering when you have DRI
> available.
>=20
> Can anyone see any problems with merging the recipes into a single
> "mesa" recipe, and making DRI support conditional on a feature?

They produce 2 differently named shared libraries and currently some =
images need both. If that's a bug or not, I don't know :)

regards,

Koen=


