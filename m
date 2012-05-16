Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SUi16-0000EH-Cp
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 19:28:04 +0200
Received: by wgbdr1 with SMTP id dr1so874315wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 10:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ixbivDq5krr1hiMhvb2erLnxdIT6u3C8w+85jNMCZys=;
	b=ccFtN4tDquCP19nibBR2QJ6FkflW748w2ixHbUWL1XKWIBync63B4Vy9Swrhzri47U
	E2dxff2lesoO5C0sR5TJRzm3Pf680xX0oft6s3IxmZFH1FHMcXrNFTiTuYHXun2SCJM0
	ApiTCew2usXeJm3fm9FgZe0OztufOU/EOrZIgP3MEQfysFsuu14fIvpu78db3g8YojGe
	58pYganMw7+J9/ppxCO9sQskCiKGsZuXQ/FrVp6YxSRNKhK/bzHdLacVJul85t4w0uXy
	eK37A0rPfjMrAERS8KUxBtjhK5gqhLgap0HGtrw/JWwd3zQkDTwVNN3BOpBmQpCQwu5a
	wfZw==
Received: by 10.216.208.151 with SMTP id q23mr2584848weo.20.1337188682526;
	Wed, 16 May 2012 10:18:02 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j3sm10937400wiw.1.2012.05.16.10.18.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 10:18:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1337187331-4945-1-git-send-email-obi@opendreambox.org>
Date: Wed, 16 May 2012 19:17:44 +0200
Message-Id: <89109968-DC24-477E-9E9D-2F255D1EB93B@dominion.thruhere.net>
References: <1337187331-4945-1-git-send-email-obi@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlS7tLWoMPTCm/drVIccXmHqhdQy0J1DBC7Vq4sbs053l5lnmbll7reTkJU7oh5AJ+bfVQJ
Subject: Re: [PATCH] avahi-systemd: drop postrm, use prerm instead
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
X-List-Received-Date: Wed, 16 May 2012 17:28:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mei 2012, om 18:55 heeft Andreas Oberritter het volgende =
geschreven:

> * Calling "systemctl disable" from postrm is too late and
>  causes the following error:
>=20
> | Failed to issue method call: No such file or directory
>=20
> * Fix indentation of prerm for resulting shell snippet.
> * Messing with $D is not needed in *rm scripts.

It very much is, you can offline remove scripts just like you can =
install them.=


